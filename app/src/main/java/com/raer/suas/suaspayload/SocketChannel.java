package com.raer.suas.suaspayload;

import android.app.Service;
import android.content.Intent;
import android.media.Image;
import android.os.IBinder;
import android.support.annotation.Nullable;

import java.io.IOException;
import java.net.Socket;

/**
 * Created by Brian on 2/1/16.
 * RAER Androne 2016
 *
 * This class will define a generic socket Channel
 */
public class SocketChannel extends Service{

    //Stores tcp Port
    private int tcpPortNum;

    //Stores ipAddress
    private String ipAddress;

    //Stores Image
    private Image imgToSend;

    //Socket to send out data
    private Socket socket;



    //Constructor for SocketChannel Class
    public SocketChannel(String ipAddress, int tcpPortNum, Image imgToSend){

        this.ipAddress = ipAddress;
        this.tcpPortNum = tcpPortNum;
        this.imgToSend = imgToSend;

        try {
            socket = new Socket(ipAddress, tcpPortNum);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //Sends data down to GCS
    //WIP
    public void SocketChannel(){

//        try {
//
//            InputStream in = new FileInputStream(param[0]);
//            OutputStream out = socket.getOutputStream();
//            byte[] buffer = new byte[(int)param[0].length()];
//            int temp;
//            while ((temp=in.read(buffer)) !=-1){
//                out.write(buffer,0,temp);
//          }
//            out.flush();
//            socket.close();
//        }catch (IOException e){
//            e.printStackTrace();
//      }
    }


    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        // Used only in case of bound services.
        return null;
    }
}
