package com.suascamera.data;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Bitmap.CompressFormat;
import android.location.Location;

import com.suascamera.app.Backend;

public class Picture 
{
	public float[] rpy;
	public Location location;
	public byte[] image;
	public int imageNumber;
	public float pressureAlt;
	
	static int windowSize = 10000;
	
	public Picture(float[] rpy, float pressureAlt, Location location, byte[] image, int imageNumber)
	{
		this.rpy = rpy;
		this.location = location;
		this.image = image;
		this.imageNumber = imageNumber;
		this.pressureAlt = pressureAlt;
	}
	
	public void save()
	{		
		File pictureFile = new File(Backend.currentDirectory.getPath() + File.separator + imageNumber + ".jpg");
		File logFile = new File(Backend.currentDirectory.getPath() + File.separator + imageNumber + ".txt");
		
        try 
        {        	
        	String data = getDataString();
        	
        	//reduce image quality for size things
        	InputStream is = new ByteArrayInputStream(this.image);
        	Bitmap bm2 = BitmapFactory.decodeStream(is);
        	
            FileOutputStream pos = new FileOutputStream(pictureFile);
            bm2.compress(CompressFormat.JPEG, 80, pos);
            pos.close();
            
            FileOutputStream dos = new FileOutputStream(logFile);
            dos.write(data.getBytes());
            dos.close();
        } 
        catch (FileNotFoundException e) 
        {

        } 
        catch (IOException e) 
        {
        	
        }
	}
	
	public String getDataString()
	{
		double lat, lon, alt;
    	if(location == null)
    	{
    		lat = 0;
    		lon = 0;
    		alt = 0;
    	}
    	else
    	{
    		lat = location.getLatitude();
    		lon = location.getLongitude();
    		alt = location.getAltitude();
    	}
    	
    	String data = "" + imageNumber + "\t" + lat + "," + lon + "," + alt + "," +
    			rpy[0] + "," + rpy[1] + "," + rpy[2] + "\n";
    	
    	return data;
	}
	
	public static ArrayList<byte[]> messageMaker(int imageNumber) throws IOException
	{
		
		File pf = new File(Backend.currentDirectory.getPath() + File.separator + imageNumber + ".jpg");
		byte[] picBuffer = new byte[(int) pf.length()];
		
		FileInputStream pis = new FileInputStream(pf);
		pis.read(picBuffer);
		
		File tf = new File(Backend.currentDirectory.getPath() + File.separator + imageNumber + ".txt");
		byte[] textBuffer = new byte[(int) tf.length()];
		FileInputStream tis = new FileInputStream(tf);
		tis.read(textBuffer);
		
		byte[] c;
		c = new byte[textBuffer.length + picBuffer.length];
		System.arraycopy(textBuffer, 0, c, 0, textBuffer.length);
		System.arraycopy(picBuffer, 0, c, textBuffer.length, picBuffer.length);
		
		return messageHelper(c, imageNumber);
	}
	
	@SuppressLint("NewApi") public ArrayList<byte[]> messageMaker()
	{
		byte[] data = getDataString().getBytes();
		
		byte[] byteData = new byte[data.length + image.length];
		System.arraycopy(data, 0, byteData, 0, data.length);
		System.arraycopy(image, 0, byteData, data.length, image.length);
		
		return messageHelper(byteData, this.imageNumber);
	}
	
	@SuppressLint("NewApi") private static ArrayList<byte[]> messageHelper(byte[] byteData, int imageNumber)
	{
		ArrayList<byte[]> messages = new ArrayList<byte[]>();
		
		int numMessages = (int) Math.ceil(((double)byteData.length/windowSize));
		
		byte[] a = {(byte) 0xF0, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
		byte[] b;
		byte[] c;
		
		int offset = 0;
		int lengthJawn = windowSize;
		
		for(int i=0; i<numMessages; i++)
		{
			if(i == numMessages-1)
			{
				offset = (byteData.length - (i*windowSize)) - windowSize;
				lengthJawn = (byteData.length - (i*windowSize));
			}
			
			b = Arrays.copyOfRange(byteData, i*windowSize, ((i*windowSize)+windowSize+offset));
			
			a[2] = (byte) (0xFF&(imageNumber>>8));
			a[3] = (byte) (0xFF&imageNumber);
			a[4] = (byte) (0xFF&(i>>8));
			a[5] = (byte) (0xFF&i);
			a[6] = (byte) (0xFF&(numMessages>>8));
			a[7] = (byte) (0xFF&numMessages);
			a[8] = (byte) ((lengthJawn)>>8);
			a[9] = (byte) ((lengthJawn)&0xFF);
			
			System.out.println("" + a.length);
			
			c = new byte[a.length + b.length];
			System.arraycopy(a, 0, c, 0, a.length);
			System.arraycopy(b, 0, c, a.length, b.length);
			
			messages.add(c);
		}
		
		return messages;
	}
}
