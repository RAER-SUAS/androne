package com.raer.suas.suaspayload;

import com.raer.suas.suaspayload.utils.AndroneDebug;
import com.raer.suas.suaspayload.utils.Constants;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.IBinder;
import android.support.annotation.Nullable;
import android.support.v4.app.NotificationCompat;
import android.util.Log;
import android.widget.Toast;

import com.MAVLink.*;

import java.util.concurrent.TimeUnit;

/**
 * Created by Brian on 2/6/16.
 * RAER Androne 2016
 *
 * This class will define the Watch Dog Service on the Payload.
 *
 * The purpose of the Watch Dog service is to communicate with
 * the Watch Dog on the GCS, open socket channels, and send requested
 * Data to the GCS.
 */

public class PayloadWD extends Service{

    private static final String LOG_TAG = "Androne WD Service";
    public static boolean IS_SERVICE_RUNNING = false;


    @Override
    public void onCreate() {
        super.onCreate();

    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent.getAction().equals(Constants.ACTION.STARTFOREGROUND_ACTION)) {
            Log.i(LOG_TAG, "Received Start Foreground Intent ");
            showNotification();
            Toast.makeText(this, "Service Started!", Toast.LENGTH_SHORT).show();

            /************************************************************/
            //Insert code to run in foreground
            /************************************************************/


            new AndroneDebug("Hello from the foreground Task!").execute();
            new CameraTask(100).execute();




            /************************************************************/
            //End of code to run in foreground
            /************************************************************/
//        } else if (intent.getAction().equals(Constants.ACTION.PREV_ACTION)) {
//            Log.i(LOG_TAG, "Clicked Previous");
//
//            Toast.makeText(this, "Clicked Previous!", Toast.LENGTH_SHORT)
//                    .show();
//        } else if (intent.getAction().equals(Constants.ACTION.PLAY_ACTION)) {
//            Log.i(LOG_TAG, "Clicked Play");
//
//            Toast.makeText(this, "Clicked Play!", Toast.LENGTH_SHORT).show();
//        } else if (intent.getAction().equals(Constants.ACTION.NEXT_ACTION)) {
//            Log.i(LOG_TAG, "Clicked Next");

            Toast.makeText(this, "Clicked Next!", Toast.LENGTH_SHORT).show();
        } else if (intent.getAction().equals(
                Constants.ACTION.STOPFOREGROUND_ACTION)) {
            Log.i(LOG_TAG, "Received Stop Foreground Intent");
            stopForeground(true);
            stopSelf();
        }
        return START_STICKY;
    }


    //Defines how the persistent notification will look like.
    private void showNotification() {
        Intent notificationIntent = new Intent(this, MainActivity.class);
        notificationIntent.setAction(Constants.ACTION.MAIN_ACTION);
        notificationIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK
                | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0,
                notificationIntent, 0);

        Intent previousIntent = new Intent(this, PayloadWD.class);
        previousIntent.setAction(Constants.ACTION.PREV_ACTION);
        PendingIntent ppreviousIntent = PendingIntent.getService(this, 0,
                previousIntent, 0);

        Intent playIntent = new Intent(this, PayloadWD.class);
        playIntent.setAction(Constants.ACTION.PLAY_ACTION);
        PendingIntent pplayIntent = PendingIntent.getService(this, 0,
                playIntent, 0);

        Intent nextIntent = new Intent(this, PayloadWD.class);
        nextIntent.setAction(Constants.ACTION.NEXT_ACTION);
        PendingIntent pnextIntent = PendingIntent.getService(this, 0,
                nextIntent, 0);


        Bitmap icon = BitmapFactory.decodeResource(getResources(), R.drawable.ic_launcher);

        Notification notification = new NotificationCompat.Builder(this)
                .setContentTitle("SUAS Payload")
                .setTicker("SUAS Payload")
                .setContentText("WD Service Running")
                .setSmallIcon(R.drawable.ic_launcher)
                //.setLargeIcon(Bitmap.createScaledBitmap(icon, 128, 128, false))

                .setContentIntent(pendingIntent)
                .setOngoing(true)
                /*.addAction(android.R.drawable.ic_media_previous, "Previous",
                        ppreviousIntent)
                .addAction(android.R.drawable.ic_media_play, "Play",
                        pplayIntent)
                .addAction(android.R.drawable.ic_media_next, "Next",
                        pnextIntent)*/.build();
        startForeground(Constants.NOTIFICATION_ID.FOREGROUND_SERVICE,
                notification);

    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        Log.i(LOG_TAG, "In onDestroy");
        Toast.makeText(this, "Service Detroyed!", Toast.LENGTH_SHORT).show();
    }

    @Override
    public IBinder onBind(Intent intent) {
        // Used only in case if services are bound (Bound Services).
        return null;
    }
}
