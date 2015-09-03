package com.suascamera.communication;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.ConcurrentLinkedQueue;

import android.os.SystemClock;
import android.util.Log;

import com.suascamera.app.Backend;
import com.suascamera.app.MainActivity;
import com.suascamera.data.Picture;

public class Comm extends Thread 
{	
	public boolean running = true;

	//UDP variables
	byte[] receiveData = new byte[16000];
	byte[] sendData = new byte[16000];

	long startTime;

	boolean connected = false;

	boolean firstConnect = false;

	Recv recv;

	public Comm()
	{
		super();

		Backend.qOne = new ConcurrentLinkedQueue<Integer>();

		Backend.altQ = new ConcurrentLinkedQueue<byte[]>();

		recv = new Recv(this);
		recv.start();

		startTime = new Date().getTime();
	}

	public void end()
	{
		running = false;
		recv.end();
	}

	public boolean connect()
	{
		try {
			Log.d("com.suascamera.com", "connecting");
			Backend.sock = new Socket("192.168.1.90", 10000);
			Backend.tcpOut = new BufferedOutputStream(Backend.sock.getOutputStream());
			Backend.sock.setSendBufferSize(5000000);
			Backend.tcpIn = new BufferedInputStream(Backend.sock.getInputStream());
			return true;
		} catch (UnknownHostException e) {
			return false;
		} catch (IOException e) {
			return false;
		}
	}

	@Override
	public void run()
	{
		byte[] failedMessage = null;
		while(!connected)
		{
			connected = connect();
		}

		Log.w("Comm", "Connected");
		firstConnect = true;

		int picNumber = -1;
		ArrayList<byte[]> data;
		byte continuousStatus = 0x01;
		while(running)
		{


			//see if there are any images in the queue
			try 
			{
				if(!Backend.qOne.isEmpty() && connected)
				{
					picNumber = Backend.qOne.poll();
					data = Picture.messageMaker(picNumber);
					for(int i=0; i< data.size(); i++)
					{
						Backend.tcpOut.write(data.get(i));
						Backend.tcpOut.flush();
						SystemClock.sleep(2);
					}
				}
			} 
			catch (IOException e) 
			{
				Log.d("Comm", "Socket Broken");
				connected = false;
			}
			// end image queue section


			//if one second has passed, send a status update
			try
			{
				if(((new Date().getTime()) - startTime) > 1000 && connected)
				{
					byte[] status = {(byte) 0xA9, 0x00, 0x00, continuousStatus};
					status[1] = (byte)((Backend.imageCount-1)>>8);
					status[2] = (byte)((Backend.imageCount-1)&0xff);
					if (Backend.continuous)
					{
						continuousStatus = 0x0F;
					}
					else
					{
						continuousStatus = 0x01;
					}
					status[3] = continuousStatus;

					Backend.tcpOut.write(status);
					Backend.tcpOut.flush();
					startTime = new Date().getTime();
				}
			}
			catch (IOException e)
			{
				Log.w("Comm", "Socket Broken");
				connected = false;
			}
			//end status update section

			//check for any other types of messages that need to be sent
			byte[] message = null;
			try 
			{
				if(!Backend.altQ.isEmpty() && connected)
				{
					message = Backend.altQ.poll();
					Log.i("SRIC Message", new String(message));
					Backend.tcpOut.write(message);
					Backend.tcpOut.flush();
					SystemClock.sleep(2);
				}
			}
			catch (IOException e) 
			{
				Log.d("Comm", "Socket Broken");
				connected = false;
				failedMessage = message;
			}
			//end alt messages section
			
			
			//if the socket is not sonnected, try to reconnect
			while(!connected)
			{
				try 
				{
					Backend.sock.close();
				} 
				catch (IOException e)
				{

				}
				connected = connect();
				SystemClock.sleep(500);
				if(connected && failedMessage != null)
				{
					try
					{
						Backend.tcpOut.write(failedMessage);
						Backend.tcpOut.flush();
					}
					catch(Exception ex)
					{
						
					}
					failedMessage = null;
				}
			}
			//end socket reconnect
			
			SystemClock.sleep(2);
		}
	}
}
