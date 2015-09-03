// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.echo;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import org.apache.commons.net.discard.DiscardUDPClient;

public final class EchoUDPClient extends DiscardUDPClient
{

    public static final int DEFAULT_PORT = 7;
    private final DatagramPacket __receivePacket = new DatagramPacket(new byte[0], 0);

    public EchoUDPClient()
    {
    }

    public int receive(byte abyte0[])
        throws IOException
    {
        return receive(abyte0, abyte0.length);
    }

    public int receive(byte abyte0[], int i)
        throws IOException
    {
        __receivePacket.setData(abyte0);
        __receivePacket.setLength(i);
        _socket_.receive(__receivePacket);
        return __receivePacket.getLength();
    }

    public void send(byte abyte0[], int i, InetAddress inetaddress)
        throws IOException
    {
        send(abyte0, i, inetaddress, 7);
    }

    public void send(byte abyte0[], InetAddress inetaddress)
        throws IOException
    {
        send(abyte0, abyte0.length, inetaddress, 7);
    }
}
