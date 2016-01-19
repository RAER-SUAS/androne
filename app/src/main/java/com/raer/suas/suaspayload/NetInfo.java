package com.raer.suas.suaspayload;

import android.net.NetworkInfo;

import java.net.InetAddress;


/**
 * Created by cchap on 1/8/2016.
 */
public class NetInfo {
    String networkState = NetworkInfo.State.CONNECTED.toString();
   // String ipv4Address = Inet4Address.getLocalHost().getHostName();
    InetAddress ipv4Address = java.net.InetAddress.getLoopbackAddress();
    String sipv4Address = ipv4Address.toString();

}
