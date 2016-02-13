package com.raer.suas.suaspayload.utils;

import android.os.AsyncTask;

/**
 * Created by Brian on 2/12/16.
 * RAER Androne 2016
 */
public class NetworkAsyncTask extends AsyncTask<Void, Void, Void> {

    private Exception exception;

    @Override
    protected Void doInBackground(Void... voids) {


        try{

            //new AndroneNetworking().runTcpClient(preferences.getInt(groundstation_min_port_num, 0));
            //new AndroneNetworking().runTcpClient(21111);

            return null;

        }catch(Exception e){
            this.exception = e;
            return null;
        }
    }

}
