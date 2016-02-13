package com.raer.suas.suaspayload;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.os.AsyncTask;
import android.os.Environment;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by Shawn_ on 1/22/2016.
 */
public class CameraTask extends AsyncTask<Void,Void,Void> {
    private Camera myCamera;
    private int pictureNumber;
    private long time;

    public CameraTask(int number){
        new File(Environment.getExternalStorageDirectory()+"/SUAS").mkdir();
        new File(Environment.getExternalStorageDirectory()+"/SUAS/Processed").mkdir();
        this.pictureNumber = number;
    }

    public boolean isCameraOpen() {
        Camera camera = null;
        try {
            camera = Camera.open();
        } catch (RuntimeException e) {
            return true;
        } finally {
            if (camera != null) camera.release();
        }
        return false;
    }


    @Override
    protected Void doInBackground(Void ... param){
        while(isCameraOpen()){}
        time =  System.currentTimeMillis();
        myCamera = Camera.open();
        try{
            myCamera.setPreviewTexture(new SurfaceTexture(10));
        } catch (IOException e) {
            e.printStackTrace();
        }
        myCamera.startPreview();
        myCamera.takePicture(null, null, mPicture);

        time = System.currentTimeMillis() - time;
        File file = new File(Environment.getExternalStorageDirectory() + "/SUAS", pictureNumber + ".txt");
        try {
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(Long.toString(time).getBytes());
            fos.close();
        } catch (IOException e) {}
        return null;
    }


    private Camera.PictureCallback mPicture = new Camera.PictureCallback() {
        @Override
        public void onPictureTaken(byte[] data, Camera camera) {
            myCamera.release();
            Bitmap bitmap = BitmapFactory.decodeByteArray(data, 0, data.length);
            File file = new File(Environment.getExternalStorageDirectory() + "/SUAS",pictureNumber +".jpg");
            try {
                FileOutputStream fos = new FileOutputStream(file);
                bitmap.compress(Bitmap.CompressFormat.JPEG, 100, fos);
                fos.flush();
                fos.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    };
}