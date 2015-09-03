package com.suascamera.communication;



import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import android.util.Log;

import com.suascamera.app.Backend;
import com.suascamera.sric.SRIC;

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
			try
			{
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
/*					else if(data == 240)
					{
						Backend.eggDropArmed = !Backend.eggDropArmed;
						System.out.println("RECEIVED EGG DROP COMMAND");
					}*/
				}
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
