// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.daytime;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import org.apache.commons.net.DatagramSocketClient;

public final class DaytimeUDPClient extends DatagramSocketClient
{

    public static final int DEFAULT_PORT = 13;
    private final byte __dummyData[] = new byte[1];
    private final byte __timeData[] = new byte[256];

    public DaytimeUDPClient()
    {
    }

    public String getTime(InetAddress inetaddress)
        throws IOException
    {
        return getTime(inetaddress, 13);
    }

    public String getTime(InetAddress inetaddress, int i)
        throws IOException
    {
        inetaddress = new DatagramPacket(__dummyData, __dummyData.length, inetaddress, i);
        DatagramPacket datagrampacket = new DatagramPacket(__timeData, __timeData.length);
        _socket_.send(inetaddress);
        _socket_.receive(datagrampacket);
        return new String(datagrampacket.getData(), 0, datagrampacket.getLength(), getCharsetName());
    }
}
