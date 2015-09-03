// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

// Referenced classes of package org.apache.commons.net.tftp:
//            TFTPPacketException, TFTPReadRequestPacket, TFTPWriteRequestPacket, TFTPDataPacket, 
//            TFTPAckPacket, TFTPErrorPacket

public abstract class TFTPPacket
{

    public static final int ACKNOWLEDGEMENT = 4;
    public static final int DATA = 3;
    public static final int ERROR = 5;
    static final int MIN_PACKET_SIZE = 4;
    public static final int READ_REQUEST = 1;
    public static final int SEGMENT_SIZE = 512;
    public static final int WRITE_REQUEST = 2;
    InetAddress _address;
    int _port;
    int _type;

    TFTPPacket(int i, InetAddress inetaddress, int j)
    {
        _type = i;
        _address = inetaddress;
        _port = j;
    }

    public static final TFTPPacket newTFTPPacket(DatagramPacket datagrampacket)
        throws TFTPPacketException
    {
        if (datagrampacket.getLength() < 4)
        {
            throw new TFTPPacketException("Bad packet. Datagram data length is too short.");
        }
        switch (datagrampacket.getData()[1])
        {
        default:
            throw new TFTPPacketException("Bad packet.  Invalid TFTP operator code.");

        case 1: // '\001'
            return new TFTPReadRequestPacket(datagrampacket);

        case 2: // '\002'
            return new TFTPWriteRequestPacket(datagrampacket);

        case 3: // '\003'
            return new TFTPDataPacket(datagrampacket);

        case 4: // '\004'
            return new TFTPAckPacket(datagrampacket);

        case 5: // '\005'
            return new TFTPErrorPacket(datagrampacket);
        }
    }

    abstract DatagramPacket _newDatagram(DatagramPacket datagrampacket, byte abyte0[]);

    public final InetAddress getAddress()
    {
        return _address;
    }

    public final int getPort()
    {
        return _port;
    }

    public final int getType()
    {
        return _type;
    }

    public abstract DatagramPacket newDatagram();

    public final void setAddress(InetAddress inetaddress)
    {
        _address = inetaddress;
    }

    public final void setPort(int i)
    {
        _port = i;
    }
}
