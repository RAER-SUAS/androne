package com.suascamera.app;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.net.Socket;
import java.util.concurrent.ConcurrentLinkedQueue;

import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.wifi.WifiManager;
import android.os.PowerManager;
import android.widget.Button;
import android.widget.TextView;

import com.suascamera.app.MainActivity.ScreenHandler;
import com.suascamera.camera.CameraThread;
import com.suascamera.camera.Preview;
import com.suascamera.data.LocationThread;
import com.suascamera.data.NmeaLocation;

public class Backend 
{
	public static File currentDirectory;
	
	public static int imageCount = 0;
	
	public static Socket sock;
//	public static Socket sock2;
	public static BufferedInputStream tcpIn;
//	public static BufferedInputStream tcpInConfig;
	public static BufferedOutputStream tcpOut;
	
	public static ConcurrentLinkedQueue<Integer> qOne;
	public static ConcurrentLinkedQueue<byte[]> altQ;
	
	public static boolean whichQueue = true;
	
	public static CameraThread ct;
	
	public static Preview preview;
	
	public static NmeaLocation nmea;
	
	public static TextView text;
	
	public static boolean continuous;

	public static Button continuousButton;

	public static PowerManager manager;

	public static MainActivity main;

	public static ScreenHandler screenHandler;

	public static LocationThread lt;

	public static WifiManager wifi;
	public static ConnectivityManager cm;

	public static int picDelay = 3;
	
	public static SharedPreferences prefs;
	
	public static boolean eggDropArmed;
}
