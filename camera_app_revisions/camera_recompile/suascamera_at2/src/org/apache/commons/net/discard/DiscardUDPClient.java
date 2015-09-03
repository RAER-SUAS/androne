// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.discard;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import org.apache.commons.net.DatagramSocketClient;

public class DiscardUDPClient extends DatagramSocketClient
{

    public static final int DEFAULT_PORT = 9;
    DatagramPacket _sendPacket;

    public DiscardUDPClient()
    {
        _sendPacket = new DatagramPacket(new byte[0], 0);
    }

    public void send(byte abyte0[], int i, InetAddress inetaddress)
        throws IOException
    {
        send(abyte0, i, inetaddress, 9);
    }

    public void send(byte abyte0[], int i, InetAddress inetaddress, int j)
        throws IOException
    {
        _sendPacket.setData(abyte0);
        _sendPacket.setLength(i);
        _sendPacket.setAddress(inetaddress);
        _sendPacket.setPort(j);
        _socket_.send(_sendPacket);
    }

    public void send(byte abyte0[], InetAddress inetaddress)
        throws IOException
    {
        send(abyte0, abyte0.length, inetaddress, 9);
    }
}
