package com.raer.suas.suaspayload.utils;


import android.os.AsyncTask;

import com.MAVLink.Parser;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

/**
 * Created by Brian on 2/8/16.
 * RAER Androne 2016
 */
public class AndroneDebug extends AsyncTask<Void, Void, Void> {


    private Socket socket;
    private Exception exception;
    private String msg;


    public AndroneDebug(String msg){

        this.msg = msg;
    }


    //Port to output debug data
    public void debugToTCP(String data) {


        System.out.println("tcpDb Msg Sent: " + data);


        try {
            socket = new Socket(Constants.COMMCONST.PY_IP_ADDRESS, Constants.COMMCONST.PORT_NUM);

            OutputStream out = socket.getOutputStream();
            PrintWriter output = new PrintWriter(out);

            output.println(data);
            out.flush();
            out.close();


        } catch (IOException e) {
            e.printStackTrace();

        }

    }


        @Override
        protected Void doInBackground(Void... voids) {


            try{

                debugToTCP(msg);


                return null;

            }catch(Exception e){
                this.exception = e;
                return null;
            }
        }


        //Create a new parser variable
        //Parser mavlinkComm = new Parser();

    }


