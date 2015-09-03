// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.chargen;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import org.apache.commons.net.DatagramSocketClient;

public final class CharGenUDPClient extends DatagramSocketClient
{

    public static final int CHARGEN_PORT = 19;
    public static final int DEFAULT_PORT = 19;
    public static final int NETSTAT_PORT = 15;
    public static final int QUOTE_OF_DAY_PORT = 17;
    public static final int SYSTAT_PORT = 11;
    private final byte __receiveData[] = new byte[512];
    private final DatagramPacket __receivePacket;
    private final DatagramPacket __sendPacket = new DatagramPacket(new byte[0], 0);

    public CharGenUDPClient()
    {
        __receivePacket = new DatagramPacket(__receiveData, __receiveData.length);
    }

    public byte[] receive()
        throws IOException
    {
        _socket_.receive(__receivePacket);
        int i = __receivePacket.getLength();
        byte abyte0[] = new byte[i];
        System.arraycopy(__receiveData, 0, abyte0, 0, i);
        return abyte0;
    }

    public void send(InetAddress inetaddress)
        throws IOException
    {
        send(inetaddress, 19);
    }

    public void send(InetAddress inetaddress, int i)
        throws IOException
    {
        __sendPacket.setAddress(inetaddress);
        __sendPacket.setPort(i);
        _socket_.send(__sendPacket);
    }
}
