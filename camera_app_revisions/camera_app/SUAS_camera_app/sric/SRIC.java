package com.suascamera.sric;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

import android.net.wifi.ScanResult;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.util.Log;

import com.suascamera.app.Backend;

public class SRIC extends Thread
{
	String ssid = Backend.prefs.getString("sric_ssid", ""); //"Sauce";
	String key = Backend.prefs.getString("sric_key", ""); //"E1D80C5637";
	
	String remoteIP = Backend.prefs.getString("sric_remoteip", ""); //"192.168.1.111";
	
	String remoteDirectory = Backend.prefs.getString("sric_remotedir", ""); //"/auvsi/team1";
	String remoteFilename = Backend.prefs.getString("sric_remotefile", ""); //"test.txt";
	
	String reconnectNetwork = Backend.prefs.getString("sric_reconnectnet", ""); //"ubnt";
	
	String message;
	
	ByteArrayOutputStream out;
	
	File sricFile = new File(Backend.currentDirectory.getPath() + File.separator + "sric.txt");
	
	long timeoutTime = 120000;

	public SRIC()
	{
		
	}

	@Override
	public void run()
	{
		System.out.println("Starting SRIC attempt");
		long startTime = System.currentTimeMillis();
		//change wifi network to SRIC network
		Backend.wifi.disconnect();
		Backend.wifi.startScan();
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e2) {
			Log.e("SRIC", "Error on thread.sleep");
		}
		List<ScanResult> scan = new ArrayList<ScanResult>();
		scan = Backend.wifi.getScanResults();
		
		WifiConfiguration sric;
		int sric_netID = -1;

		for(int i = 0; i < scan.size(); i++)
		{
			ScanResult s = scan.get(i);
			if(s.SSID.equals(ssid))
			{
				sric = new WifiConfiguration();
				sric.SSID = "\""+s.SSID+"\"";
				String[] keys = new String[4];
				keys[0] = key;
				sric.wepKeys = keys;
				sric.wepTxKeyIndex = 0;
				sric.status = WifiConfiguration.Status.ENABLED;
				sric.allowedKeyManagement.set(WifiConfiguration.KeyMgmt.NONE);
				sric_netID = Backend.wifi.addNetwork(sric);
				Backend.wifi.enableNetwork(sric_netID,true);
				Log.d("SRIC","SRIC found");
			}
		}
		
		System.out.println("Connected to network");
		
		//read file to SD card
		boolean b = true;
		int breakCount = 0;
		while(b && breakCount < 10 && ((System.currentTimeMillis() - startTime) < timeoutTime))/**/
		{
				System.out.println("TRYING TO GRAB FILE");
				try
				{

					FTPClient ftp = new FTPClient();
					ftp.connect(InetAddress.getByName(remoteIP));
					ftp.login("anonymous", "");
					ftp.changeWorkingDirectory(remoteDirectory);
					ftp.setFileType(FTP.BINARY_FILE_TYPE);
					out = new ByteArrayOutputStream();
					ftp.enterLocalPassiveMode();
					ftp.retrieveFile(remoteFilename, out);
					out.close();
					ftp.disconnect();
					b = false;
					Log.d("SRIC", ftp.getStatus());
				}
				catch (IOException e) {
					Log.e("SRIC","Error: "+e.getMessage());
					try {
						Thread.sleep(1000);
					} catch (InterruptedException e1) {
						e.printStackTrace();
					}
				}
			breakCount++;
		}

		long endTime = System.currentTimeMillis();
		System.out.println("File retrieved and took " + (endTime - startTime) + "ms to complete.");
		
		//Reconnect to Androne network
		Backend.wifi.disconnect();
		Backend.wifi.createWifiLock(WifiManager.WIFI_MODE_FULL_HIGH_PERF, "WifiHighPerf");
		scan = new ArrayList<ScanResult>();
		scan = Backend.wifi.getScanResults();
		for(int i = 0; i < scan.size(); i++)
		{
			ScanResult s = scan.get(i);
			if(s.SSID.equals(reconnectNetwork))
			{
				WifiConfiguration baseNetwork = new WifiConfiguration();
				baseNetwork.SSID = "\"" + s.SSID + "\"";
				baseNetwork.status = WifiConfiguration.Status.ENABLED;
				Backend.wifi.enableNetwork(Backend.wifi.addNetwork(baseNetwork), true);
			}
		}
		
		Backend.wifi.removeNetwork(sric_netID);
		
		System.out.println("Reconnected to Androne");
		System.out.println("out: " + out);   //Prints out the stolen file to logcat
		
		//send SRIC message to ground
		//String message;
		if(out != null && !b)
		{
			message = out.toString();
			if(message.compareTo("") == 1)
			{
				message = "No message retrieved!";
			}
		}
		else 
		{
			message = "Could not connect to server =( ";
		}

//		//TEST THIS SECTION
//			 try {
//				 FileOutputStream sricOUT = new FileOutputStream(sricFile);
//				 sricOUT.write(message.getBytes());
//		         sricOUT.close();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}

		
		System.out.println("Message: " + message);
		
		int len = message.length();
		byte[] header = {(byte) 0xAA, (byte)((len>>8)&0xff),(byte)((len)&0xff)};
		byte[] c = new byte[header.length + message.length()];
		System.arraycopy(header, 0, c, 0, header.length);
		System.arraycopy(message.getBytes(), 0, c, header.length, message.length());
		Backend.altQ.add(c);
	}
}

