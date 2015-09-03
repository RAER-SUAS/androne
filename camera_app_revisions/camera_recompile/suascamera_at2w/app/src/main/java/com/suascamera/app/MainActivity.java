package com.suascamera.app;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.location.LocationManager;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.os.PowerManager;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.widget.EditText;
import android.widget.TextView;

import com.suascamera.camera.CameraThread;
import com.suascamera.camera.Preview;
import com.suascamera.communication.Comm;
import com.suascamera.data.LocationThread;
import com.suascamera.data.Orientation;

public class MainActivity extends Activity
{
	//Threads
	CameraThread ct;
	Orientation ot;
	Comm comm;
	PowerManager.WakeLock wl;
	
	int state;
	
	static String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
	
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        state = 0;
        
        Backend.currentDirectory = getPicutreDirectory();
        
        //create and start threads
        ct = new CameraThread((Preview)findViewById(R.id.surfaceview));
        ct.start();
        Backend.ct = ct;
        
        //start communication manager
        comm = new Comm();
        comm.start();
        
        ot = new Orientation();
        
        //register Orientation class to listen for the accelerometer and magnetometer sensor updates
        SensorManager sensMgr = ((SensorManager)getSystemService(SENSOR_SERVICE));
        sensMgr.registerListener(ot, sensMgr.getDefaultSensor(Sensor.TYPE_ACCELEROMETER), SensorManager.SENSOR_DELAY_NORMAL);
        sensMgr.registerListener(ot, sensMgr.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD), SensorManager.SENSOR_DELAY_NORMAL);
        sensMgr.registerListener(ot, sensMgr.getDefaultSensor(Sensor.TYPE_PRESSURE), SensorManager.SENSOR_DELAY_NORMAL);
        
        //Set up location listeners for GPS updates
        Backend.lt = new LocationThread();
        LocationManager locationManager = (LocationManager) this.getSystemService(Context.LOCATION_SERVICE);
        locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0, Backend.lt);
        
        //give the Jpeg callback all of the references that it needs
        //could do this through backend, but I don't. No reason.
        ((Preview)findViewById(R.id.surfaceview)).jCallback.setLocation((LocationManager)getSystemService(Context.LOCATION_SERVICE));
        ((Preview)findViewById(R.id.surfaceview)).jCallback.setOrientation(ot);
        
        //put things in backend for other threads to reference
        Backend.preview = (Preview)findViewById(R.id.surfaceview);
        Backend.text = (TextView)findViewById(R.id.textView1);
        
        //create new screen handler and send it to backend so the brightness can be changed
	    Backend.screenHandler = new ScreenHandler(this);
	    
	    //do wifi business
	    Backend.wifi = (WifiManager) getSystemService(Context.WIFI_SERVICE);
	    Backend.wifi.createWifiLock(WifiManager.WIFI_MODE_FULL_HIGH_PERF, "What Goes here?");
	    Backend.wifi.startScan();
	    
	    Backend.prefs = getPreferences(MODE_PRIVATE);
    }
    
    public void onDestroy()
    {
    	System.out.println("Ending App");
    	super.onDestroy();
    	SensorManager sensMgr = ((SensorManager)getSystemService(SENSOR_SERVICE));
    	sensMgr.unregisterListener(ot);
    	ct.end();
    	comm.end();
    }
    
    public class ScreenHandler extends Handler
    {
    	private MainActivity parent;
    	
    	public ScreenHandler(MainActivity parent)
    	{
    		this.parent = parent;
    	}
    	
    	public void handleMessage(Message msg) {
            parent.handleMessage(msg);
        }
    }
    
    public void screenOff()
    {
    	WindowManager.LayoutParams params = getWindow().getAttributes(); 
    	params.flags |= LayoutParams.FLAG_KEEP_SCREEN_ON;
    	params.screenBrightness = 0;
    	getWindow().setAttributes(params);
    }
    
    public void handleMessage(Message msg) {
    	switch(msg.what) {
        case 0:
            screenOff();
            break;
        case 1:
        	screenOn();
        	break;
        }		
	}

	public void screenOn()
    {
    	WindowManager.LayoutParams params = getWindow().getAttributes();
    	params.flags |= LayoutParams.FLAG_KEEP_SCREEN_ON;
    	params.screenBrightness = 1;
    	getWindow().setAttributes(params);
    }
    
    public void takePicture(View view)
    {    			
    	((Preview)findViewById(R.id.surfaceview)).takePicture();
    }
    
    public void rebalance(View view)
    {
    	((Preview)findViewById(R.id.surfaceview)).rebalance();
    }
    
    public void exposureUp(View view)
    {
    	((Preview)findViewById(R.id.surfaceview)).increaseExposureCompensation();
    }
    
    public void exposureDown(View view)
    {
    	((Preview)findViewById(R.id.surfaceview)).decreaseExposureCompensation();
    }
    
    public void continuous(View view)
    {
    	Backend.continuous = !Backend.continuous;
    }
    
	private File getPicutreDirectory()
	{
		File mediaStorageDir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES),timeStamp);
        
        if (!mediaStorageDir.exists()) 
        {
            if (!mediaStorageDir.mkdirs())
            {
                Log.e("SUASCameraApp", "failed to create directory");
                return null;
            }
        }
		return mediaStorageDir;
	}
	
	//set up menu on the action bar
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu items for use in the action bar
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.activity_menu, menu);
        return super.onCreateOptionsMenu(menu);
    }
    
    @Override
    public void onBackPressed() 
    {
        if(state == 1)
        {
        	setContentView(R.layout.activity_main);
    		state = 0;
        }
        else
        {
        	super.onBackPressed();
        }
    }
    
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle presses on the action bar items
        switch (item.getItemId()) {
        	//when the settings option is clicked: change the view, and set the default values 
            case R.id.settings:
            	if(state == 0)
            	{
            		setContentView(R.layout.sric_options);
            		state = 1;
            		
            		EditText editText1 = (EditText)findViewById(R.id.sric_ssid);
                	editText1.setText(Backend.prefs.getString("sric_ssid", ""), TextView.BufferType.EDITABLE);
                	
                	EditText editText2 = (EditText)findViewById(R.id.sric_key);
                	editText2.setText(Backend.prefs.getString("sric_key", ""), TextView.BufferType.EDITABLE);
                	
                	EditText editText3 = (EditText)findViewById(R.id.sric_remoteip);
                	editText3.setText(Backend.prefs.getString("sric_remoteip", ""), TextView.BufferType.EDITABLE);
                	
                	EditText editText4 = (EditText)findViewById(R.id.sric_remotedir);
                	editText4.setText(Backend.prefs.getString("sric_remotedir", ""), TextView.BufferType.EDITABLE);
                	
                	EditText editText5 = (EditText)findViewById(R.id.sric_remotefile);
                	editText5.setText(Backend.prefs.getString("sric_remotefile", ""), TextView.BufferType.EDITABLE);
                	
                	EditText editText6 = (EditText)findViewById(R.id.sric_reconnectnet);
                	editText6.setText(Backend.prefs.getString("sric_reconnectnet", ""), TextView.BufferType.EDITABLE);
            	}
            	else if(state == 1)
            	{
            		setContentView(R.layout.activity_main);
            		state = 0;
            	}
            	
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    
    public void saveSRICOptions(View view)
    {
    	SharedPreferences.Editor editor = Backend.prefs.edit();
    	
    	EditText editText1 = (EditText)findViewById(R.id.sric_ssid);
    	editor.putString("sric_ssid", editText1.getText().toString());
    	
    	EditText editText2 = (EditText)findViewById(R.id.sric_key);
    	editor.putString("sric_key", editText2.getText().toString());
    	
    	EditText editText3 = (EditText)findViewById(R.id.sric_remoteip);
    	editor.putString("sric_remoteip", editText3.getText().toString());
    	
    	EditText editText4 = (EditText)findViewById(R.id.sric_remotedir);
    	editor.putString("sric_remotedir", editText4.getText().toString());
    	
    	EditText editText5 = (EditText)findViewById(R.id.sric_remotefile);
    	editor.putString("sric_remotefile", editText5.getText().toString());
    	
    	EditText editText6 = (EditText)findViewById(R.id.sric_reconnectnet);
    	editor.putString("sric_reconnectnet", editText6.getText().toString());
    	
    	editor.commit();
    	
    	setContentView(R.layout.activity_main);
    }
}
