package com.suascamera.data;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import com.suascamera.app.Backend;

import android.location.GpsStatus.NmeaListener;

public class NmeaLocation implements NmeaListener
{
	File logFile = new File(Backend.currentDirectory.getPath() + File.separator + "nmea.txt");
	FileOutputStream dos;
	
	@Override
	public void onNmeaReceived(long arg0, String arg1) 
	{
		try 
		{
			dos = new FileOutputStream(logFile);
			dos.write(arg1.getBytes());
			dos.write("\n".getBytes());
		    dos.close();
		} 
		catch (FileNotFoundException e) 
		{
			e.printStackTrace();
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}
       
		System.out.println("NMEA: " + arg1);
	}

}
