// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.tftp;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import org.apache.commons.net.DatagramSocketClient;

// Referenced classes of package org.apache.commons.net.tftp:
//            TFTPRequestPacket, TFTPPacketException, TFTPPacket

public class TFTP extends DatagramSocketClient
{

    public static final int ASCII_MODE = 0;
    public static final int BINARY_MODE = 1;
    public static final int DEFAULT_PORT = 69;
    public static final int DEFAULT_TIMEOUT = 5000;
    public static final int IMAGE_MODE = 1;
    public static final int NETASCII_MODE = 0;
    public static final int OCTET_MODE = 1;
    static final int PACKET_SIZE = 516;
    private byte __receiveBuffer[];
    private DatagramPacket __receiveDatagram;
    private DatagramPacket __sendDatagram;
    byte _sendBuffer[];

    public TFTP()
    {
        setDefaultTimeout(5000);
        __receiveBuffer = null;
        __receiveDatagram = null;
    }

    public static final String getModeName(int i)
    {
        return TFTPRequestPacket._modeStrings[i];
    }

    public final void beginBufferedOps()
    {
        __receiveBuffer = new byte[516];
        __receiveDatagram = new DatagramPacket(__receiveBuffer, __receiveBuffer.length);
        _sendBuffer = new byte[516];
        __sendDatagram = new DatagramPacket(_sendBuffer, _sendBuffer.length);
    }

    public final TFTPPacket bufferedReceive()
        throws IOException, InterruptedIOException, SocketException, TFTPPacketException
    {
        __receiveDatagram.setData(__receiveBuffer);
        __receiveDatagram.setLength(__receiveBuffer.length);
        _socket_.receive(__receiveDatagram);
        return TFTPPacket.newTFTPPacket(__receiveDatagram);
    }

    public final void bufferedSend(TFTPPacket tftppacket)
        throws IOException
    {
        _socket_.send(tftppacket._newDatagram(__sendDatagram, _sendBuffer));
    }

    public final void discardPackets()
        throws IOException
    {
        DatagramPacket datagrampacket = new DatagramPacket(new byte[516], 516);
        int i = getSoTimeout();
        setSoTimeout(1);
        try
        {
            do
            {
                _socket_.receive(datagrampacket);
            } while (true);
        }
        catch (SocketException socketexception) { }
        catch (InterruptedIOException interruptedioexception) { }
        setSoTimeout(i);
    }

    public final void endBufferedOps()
    {
        __receiveBuffer = null;
        __receiveDatagram = null;
        _sendBuffer = null;
        __sendDatagram = null;
    }

    public final TFTPPacket receive()
        throws IOException, InterruptedIOException, SocketException, TFTPPacketException
    {
        DatagramPacket datagrampacket = new DatagramPacket(new byte[516], 516);
        _socket_.receive(datagrampacket);
        return TFTPPacket.newTFTPPacket(datagrampacket);
    }

    public final void send(TFTPPacket tftppacket)
        throws IOException
    {
        _socket_.send(tftppacket.newDatagram());
    }
}
