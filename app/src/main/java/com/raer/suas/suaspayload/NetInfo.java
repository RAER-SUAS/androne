package com.raer.suas.suaspayload;

import android.content.Context;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.text.format.Formatter;

import java.net.InetAddress;


/**
 * Created by cchap on 1/8/2016.
 */
public class NetInfo {



    public static String ipAddress(Context context) {




//        String networkState = NetworkInfo.State.CONNECTED.toString();
////   // String ipv4Address = Inet4Address.getLocalHost().getHostName();
//        InetAddress ipv4Address = java.net.InetAddress.getLoopbackAddress();
//        String sipv4Address = ipv4Address.toString();


        WifiManager myWifiManager = (WifiManager) context.getSystemService(context.WIFI_SERVICE);
        WifiInfo myWifiInfo = myWifiManager.getConnectionInfo();
        String myIp = Formatter.formatIpAddress(myWifiInfo.getIpAddress());



        if(myIp.equals("0.0.0.0"))
            return "N/A";
        else
            return myIp;

    }

}
