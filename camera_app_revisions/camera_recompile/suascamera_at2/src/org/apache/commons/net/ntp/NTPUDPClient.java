// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ntp;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import org.apache.commons.net.DatagramSocketClient;

// Referenced classes of package org.apache.commons.net.ntp:
//            NtpV3Impl, NtpV3Packet, TimeStamp, TimeInfo

public final class NTPUDPClient extends DatagramSocketClient
{

    public static final int DEFAULT_PORT = 123;
    private int _version;

    public NTPUDPClient()
    {
        _version = 3;
    }

    public TimeInfo getTime(InetAddress inetaddress)
        throws IOException
    {
        return getTime(inetaddress, 123);
    }

    public TimeInfo getTime(InetAddress inetaddress, int i)
        throws IOException
    {
        if (!isOpen())
        {
            open();
        }
        NtpV3Impl ntpv3impl = new NtpV3Impl();
        ntpv3impl.setMode(3);
        ntpv3impl.setVersion(_version);
        DatagramPacket datagrampacket = ntpv3impl.getDatagramPacket();
        datagrampacket.setAddress(inetaddress);
        datagrampacket.setPort(i);
        inetaddress = new NtpV3Impl();
        DatagramPacket datagrampacket1 = inetaddress.getDatagramPacket();
        ntpv3impl.setTransmitTime(TimeStamp.getCurrentTime());
        _socket_.send(datagrampacket);
        _socket_.receive(datagrampacket1);
        return new TimeInfo(inetaddress, System.currentTimeMillis(), false);
    }

    public int getVersion()
    {
        return _version;
    }

    public void setVersion(int i)
    {
        _version = i;
    }
}
