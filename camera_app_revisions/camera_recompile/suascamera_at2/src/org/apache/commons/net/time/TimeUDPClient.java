// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.time;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Date;
import org.apache.commons.net.DatagramSocketClient;

public final class TimeUDPClient extends DatagramSocketClient
{

    public static final int DEFAULT_PORT = 37;
    public static final long SECONDS_1900_TO_1970 = 0x83aa7e80L;
    private final byte __dummyData[] = new byte[1];
    private final byte __timeData[] = new byte[4];

    public TimeUDPClient()
    {
    }

    public Date getDate(InetAddress inetaddress)
        throws IOException
    {
        return new Date((getTime(inetaddress, 37) - 0x83aa7e80L) * 1000L);
    }

    public Date getDate(InetAddress inetaddress, int i)
        throws IOException
    {
        return new Date((getTime(inetaddress, i) - 0x83aa7e80L) * 1000L);
    }

    public long getTime(InetAddress inetaddress)
        throws IOException
    {
        return getTime(inetaddress, 37);
    }

    public long getTime(InetAddress inetaddress, int i)
        throws IOException
    {
        inetaddress = new DatagramPacket(__dummyData, __dummyData.length, inetaddress, i);
        DatagramPacket datagrampacket = new DatagramPacket(__timeData, __timeData.length);
        _socket_.send(inetaddress);
        _socket_.receive(datagrampacket);
        return 0L | (long)((__timeData[0] & 0xff) << 24) & 0xffffffffL | (long)((__timeData[1] & 0xff) << 16) & 0xffffffffL | (long)((__timeData[2] & 0xff) << 8) & 0xffffffffL | (long)(__timeData[3] & 0xff) & 0xffffffffL;
    }
}
