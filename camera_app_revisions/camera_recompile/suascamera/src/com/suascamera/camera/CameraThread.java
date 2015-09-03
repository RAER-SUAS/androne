package com.suascamera.camera;

import com.suascamera.app.Backend;

import android.os.SystemClock;

public class CameraThread extends Thread 
{
	private Preview p;
	public boolean running = true;
	public boolean takePictures = false;
	
	long oldTime = 0;
	
	public CameraThread(Preview p)
	{
		super();
		this.p = p;
	}
	
	@Override
	public void run()
	{
		oldTime = System.currentTimeMillis();
		while(running)
		{
			if(Backend.continuous)
			{
				if((System.currentTimeMillis() - oldTime) > (Backend.picDelay*1000))
				{
					try
					{
						p.takePicture();
						oldTime = System.currentTimeMillis();
					}
					catch (Exception e)
					{
						
					}
				}
			}
			SystemClock.sleep(100);
			Thread.yield();
		}
	}

	public void end() {
		running = false;		
	}
}
