package com.suascamera.communication;



import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;

import android.content.SharedPreferences;
import android.util.Log;
import android.view.ViewDebug;
import android.widget.EditText;

import com.suascamera.app.Backend;
import com.suascamera.sric.SRIC;
import com.suascamera.sric.SRICPush;
import com.suascamera.sric.SRICScan;

public class Recv extends Thread
{
	public boolean running = true;

	public boolean oot = true;

	int pictureNumber = -1;
	ArrayList<byte[]> imageData = null;

	long startTime;

	Comm parent;

	public Recv(Comm c)
	{
		super();

		parent = c;

		startTime = new Date().getTime();
	}

	@Override
	public void run()
	{
		while(running)
		{
			try {
				//Socket configSocket = Backend.sock;
/*
				try {
					char[] buffer = new char[2048];
					int charsRead = 0;
					BufferedReader bReader = new BufferedReader(new InputStreamReader(Backend.sock.getInputStream()));
					while ((charsRead = bReader.read(buffer)) != -1) {
						String message = new String(buffer).substring(0, charsRead);
						System.out.println("msg :" + message);
					}

				}
				catch (IOException e)
				{

				}
				catch(NullPointerException e)
				{

				}

*/




				if(Backend.tcpIn.available() > 0)
				{
					int data = Backend.tcpIn.read();
					if(data == 127)
					{
						startTime = new Date().getTime();
					}
					else if(data == 249)
					{
						SRIC sric = new SRIC();
						sric.start();

					}
					else if(data == 241)
					{
						SRICScan sricscan = new SRICScan();
						sricscan.start();

					}
					else if(data == 242)
					{
						SRICPush sricpush = new SRICPush();
						sricpush.start();

					}
					else if(data == 250) //set picture interval
					{
						Backend.picDelay = Backend.tcpIn.read();
					}
					else if(data == 251) //request change continuous state
					{
						Backend.continuous = !Backend.continuous;
					}
					else if(data == 252) //request rebalance
					{
						Backend.preview.rebalance();
					}
					else if(data == 253)
					{
						System.out.println("Wake Lock");
						if(oot)
						{
							Backend.screenHandler.sendEmptyMessage(0);
						}
						else
						{
							Backend.screenHandler.sendEmptyMessage(1);
						}
						oot = !oot;
					}
					else if(data == 254)
					{
						//exposure up
						Backend.preview.increaseExposureCompensation();
					}
					else if(data == 255)
					{
						//exposure down
						Backend.preview.decreaseExposureCompensation();
					}
					else if(data == 240)
					{
						//try {
						Socket configSocket = new Socket("192.168.1.90", 10001);
							char[] buffer = new char[2048];
							int charsRead = 0;
							BufferedReader bReader = new BufferedReader(new InputStreamReader(configSocket.getInputStream()));

							while ((charsRead = bReader.read(buffer)) != -1) {
								String params = new String(buffer).substring(0, charsRead);

								configSocket.close();

								String[] configSeperated = params.split(";");

								//StringTokenizer prms = new StringTokenizer(params, ";");

								String sric_ssid = configSeperated[0];
								String sric_key = configSeperated[1];
								String sric_remoteip  = configSeperated[2];
								String sric_remotedir = configSeperated[3];
								String sric_remotefile = configSeperated[4];
								String sric_reconnectnet = configSeperated[5];
								String sric_ftpUsername = configSeperated[6];
								String sric_ftpPassword = configSeperated[7];
								String sric_reconnectTimer = configSeperated[8];


								SharedPreferences.Editor editor = Backend.prefs.edit();
								editor.putString("sric_ssid", sric_ssid);
								editor.putString("sric_key", sric_key);
								editor.putString("sric_remoteip", sric_remoteip);
								editor.putString("sric_remotedir",sric_remotedir);
								editor.putString("sric_remotefile",sric_remotefile);
								editor.putString("sric_reconnectnet",sric_reconnectnet);
								editor.putString("sric_ftpUsername",sric_ftpUsername);
								editor.putString("sric_ftpPassword",sric_ftpPassword);
								editor.putString("sric_reconnectTimer",sric_reconnectTimer);
								editor.commit();

								//System.out.println("SSID:" + sric_reconnectTimer);
								System.out.println("sric_ssid: " + sric_ssid);
								System.out.println("sric_key: " + sric_key);
								System.out.println("sric_remoteip: " + sric_remoteip);
								System.out.println("sric_remotedir: " + sric_remotedir);
								System.out.println("sric_remotefile: " + sric_remotefile);
								System.out.println("sric_reconnectnet: " + sric_reconnectnet);
								System.out.println("sric_ftpUsername: " + sric_ftpUsername);
								System.out.println("sric_ftpPassword: " + sric_ftpPassword);
								System.out.println("sric_reconnectTimer: " + sric_reconnectTimer);
							}

						}


						/*catch (IOException e)
						{

						}
						catch(NullPointerException e)
						{

						}
								}
*/				}
			}
			catch (IOException e)
			{

			}
			catch(NullPointerException e)
			{

			}
			if(((new Date().getTime()) - startTime > 3000) && (parent.firstConnect == false))
			{
				Log.w("Comm", "Link dead");
				parent.connected = false;
				startTime = new Date().getTime();
			}
		}
	}

	public void end() {
		running = false;
	}
}
