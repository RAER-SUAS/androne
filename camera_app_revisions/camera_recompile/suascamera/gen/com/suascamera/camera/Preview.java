package com.suascamera.camera;

import java.io.IOException;
import java.util.List;

import android.annotation.SuppressLint;
import android.content.Context;
import android.hardware.Camera;
import android.hardware.Camera.AutoFocusCallback;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

@SuppressLint("NewApi")
public class Preview extends SurfaceView implements SurfaceHolder.Callback 
{	
    public SurfaceHolder mHolder;
    public Camera mCamera;
    public JpegCallback jCallback;
    
    public int exposureCompensation = 0;
    public int exposureMax;
    public int exposureMin;
    
    public boolean useFocus = false;
    public boolean focused = false;
    
    private AutoFocusCallback focusCallback = new AutoFocusCallback() 
    {
        @Override
        public void onAutoFocus(boolean success, Camera camera) 
        {
            focused = success;
        }
    };
    
    public Preview(Context context) {
        super(context);
        create();
    }
    public Preview(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        create();
    }

    public Preview(Context context, AttributeSet attrs) {
        super(context, attrs);
        create();
    }

    public void create()
    {
    	// Install a SurfaceHolder.Callback so we get notified when the
        // underlying surface is created and destroyed.
        mHolder = getHolder();
        mHolder.addCallback(this);
        mHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
        
        jCallback = new JpegCallback();
    }
    
    @Override
	public void surfaceCreated(SurfaceHolder holder) {
        // The Surface has been created, acquire the camera and tell it where
        // to draw.
        mCamera = Camera.open();
        try {
			mCamera.setPreviewDisplay(holder);
		} catch (IOException e) {
			e.printStackTrace();
		}
        exposureMax = mCamera.getParameters().getMaxExposureCompensation();
        exposureMin = mCamera.getParameters().getMinExposureCompensation();
    }

    @Override
	public void surfaceDestroyed(SurfaceHolder holder) 
    {
        // Surface will be destroyed when we return, so stop the preview.
        // Because the CameraDevice object is not a shared resource, it's very
        // important to release it when the activity is paused.
        mCamera.stopPreview();
        mCamera = null;
    }

    @Override
	public void surfaceChanged(SurfaceHolder holder, int format, int w, int h) 
    {
        // Now that the size is known, set up the camera parameters and begin
        // the preview.
    	Camera.Parameters parameters = mCamera.getParameters();
        List<Camera.Size> previewSizes = parameters.getSupportedPreviewSizes();

        // You need to choose the most appropriate previewSize for your app
        Camera.Size previewSize = previewSizes.get(0);
        
        exposureMax = parameters.getMaxExposureCompensation();
        exposureMin = parameters.getMinExposureCompensation();
        
        parameters.setExposureCompensation(exposureCompensation);
        parameters.setFocusMode(Camera.Parameters.FOCUS_MODE_AUTO);
        parameters.setWhiteBalance(Camera.Parameters.WHITE_BALANCE_AUTO);
        parameters.setFlashMode(Camera.Parameters.FLASH_MODE_OFF);
        parameters.setSceneMode(Camera.Parameters.SCENE_MODE_LANDSCAPE);
        parameters.setPreviewSize(previewSize.width, previewSize.height);
        
        //parameters.setAutoExposureLock(true);
        //parameters.setAutoWhiteBalanceLock(true);
        mCamera.setParameters(parameters);
        mCamera.startPreview();
    }
    
    public void rebalance()
    {
    	Camera.Parameters parameters = mCamera.getParameters();
    	parameters.setAutoExposureLock(false);
        //parameters.setAutoWhiteBalanceLock(false);
        mCamera.setParameters(parameters);
        SystemClock.sleep(500);
        //parameters.setAutoExposureLock(true);
        //parameters.setAutoWhiteBalanceLock(true);
        mCamera.setParameters(parameters);
    }
    
    public void increaseExposureCompensation()
    {
    	if(exposureCompensation+1 < exposureMax)
    	{
    		exposureCompensation = exposureCompensation + 1;
    	}	
    }
    
    public void decreaseExposureCompensation()
    {
    	if(exposureCompensation-1 > exposureMin)
    	{
    		exposureCompensation = exposureCompensation - 1;
    	}	
    }

    public void takePicture()
    {   
    	if(useFocus)
    	{
    		focus();
    	}
    	
    	if(focused || !useFocus)
    	{
    		mCamera.takePicture(null, null, jCallback);
    	}
    }
    
    public boolean focus()
    {
    	mCamera.autoFocus(focusCallback);
    	return focused;
    }
    
}