package com.suascamera.data;

import android.location.Location;
import android.os.Bundle;

public class LocationThread implements android.location.LocationListener
{
	public Location currentLocation;
	
	public LocationThread()
	{
		super();
	}
	
	@Override
	public void onLocationChanged(Location location) {
		this.currentLocation = location;
	}

	@Override
	public void onProviderDisabled(String provider) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onProviderEnabled(String provider) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onStatusChanged(String provider, int status, Bundle extras) {
		// TODO Auto-generated method stub
		
	}

}
