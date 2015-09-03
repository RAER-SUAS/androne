package com.suascamera.camera;

import android.hardware.Camera;
import android.location.Location;
import android.location.LocationManager;

import com.suascamera.app.Backend;
import com.suascamera.data.Orientation;
import com.suascamera.data.Picture;

public class JpegCallback implements Camera.PictureCallback
{
	Orientation ot;
	LocationManager lm;
	
	Picture pic;
	
	public JpegCallback()
	{
		super();
	}
	
	@Override
	public void onPictureTaken(byte[] data, Camera cam)
	{
		float[] orientation = ot.getAngles();
		float alt = ot.getAltitude();

		Location loc = Backend.lt.currentLocation;

		Picture pic = new Picture(orientation, alt, loc, data, Backend.imageCount);
		pic.save();
		if(Backend.whichQueue)
		{
			Backend.qOne.add(pic.imageNumber);
		}
		else
		{
			
		}
		//Backend.whichQueue =!Backend.whichQueue;
		
		Backend.text.setText("" + Backend.imageCount);
		Backend.imageCount = Backend.imageCount + 1;
		
		cam.startPreview();
	}
	
	public void setOrientation(Orientation ot)
	{
		this.ot = ot;
	}
	
	public void setLocation(LocationManager lm)
	{
		this.lm = lm;
	}
}
