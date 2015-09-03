package com.suascamera.data;

import java.util.ArrayList;

import android.annotation.SuppressLint;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

@SuppressLint("NewApi")
public class Orientation implements SensorEventListener
{	
	final float[] magnet      = new float[3];
    final float[] accel       = new float[3];
    final float[] orientation = new float[3];
    final float[] R    = new float[9];
    
    boolean firstPressure = true;
    float pZero = 0;
    float altitude = 0; 
    
    ArrayList<Float[]> accelave = new ArrayList<Float[]>();//low pass filter for accelerometer
	ArrayList<Float[]> fieldave = new ArrayList<Float[]>();//low pass filter for magnetometer
    
    public boolean running = true;
	
	public Orientation()
	{
		
	}
	
	public float[] getAngles()
	{
		SensorManager.getRotationMatrix(R, null, accel, magnet);
        SensorManager.getOrientation(R, orientation);
        
        return orientation;
	}
	
	public float getAltitude()
	{
		return altitude;
	}

	@Override
	public void onAccuracyChanged(Sensor sensor, int accuracy) 
	{
		
	}

	@Override
	public void onSensorChanged(SensorEvent s) 
	{
		if(s.sensor.getType() == Sensor.TYPE_ACCELEROMETER)
		{//update running average and low pass filter for accelerometer
			Float[] tfa = new Float[3];
			tfa[0] = s.values[0];
			tfa[1] = s.values[1];
			tfa[2] = s.values[2];
			accelave.add(tfa);
			if(accelave.size()>10)
				accelave.remove(0);
			for(int i = 0; i < accelave.size();i++)
			{
				accel[0] += accelave.get(i)[0];
				accel[1] += accelave.get(i)[1];
				accel[2] += accelave.get(i)[2];
			}
			accel[0] = accel[0]/accelave.size();
			accel[1] = accel[1]/accelave.size();
			accel[2] = accel[2]/accelave.size();
		}
		else if(s.sensor.getType() == Sensor.TYPE_MAGNETIC_FIELD)
		{//update running average and low pass filter for magnetometer
			Float[] tfa = new Float[3];
			tfa[0] = s.values[0];
			tfa[1] = s.values[1];
			tfa[2] = s.values[2];
			fieldave.add(tfa);
			if(fieldave.size()>10)
				fieldave.remove(0);
			for(int i = 0; i < fieldave.size();i++)
			{
				magnet[0] += fieldave.get(i)[0];
				magnet[1] += fieldave.get(i)[1];
				magnet[2] += fieldave.get(i)[2];
			}
			magnet[0] = magnet[0]/fieldave.size();
			magnet[1] = magnet[1]/fieldave.size();
			magnet[2] = magnet[2]/fieldave.size();
		}
		else if(s.sensor.getType() == Sensor.TYPE_PRESSURE)
		{
			if(firstPressure)
			{
				pZero = s.values[0];
				firstPressure = false;
			}
			altitude = SensorManager.getAltitude(pZero, s.values[0]);
		}
	}
}
