// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

// Referenced classes of package org.apache.commons.net.tftp:
//            TFTPPacket, TFTPPacketException

public final class TFTPErrorPacket extends TFTPPacket
{

    public static final int ACCESS_VIOLATION = 2;
    public static final int FILE_EXISTS = 6;
    public static final int FILE_NOT_FOUND = 1;
    public static final int ILLEGAL_OPERATION = 4;
    public static final int NO_SUCH_USER = 7;
    public static final int OUT_OF_SPACE = 3;
    public static final int UNDEFINED = 0;
    public static final int UNKNOWN_TID = 5;
    int _error;
    String _message;

    TFTPErrorPacket(DatagramPacket datagrampacket)
        throws TFTPPacketException
    {
        super(5, datagrampacket.getAddress(), datagrampacket.getPort());
        byte abyte0[] = datagrampacket.getData();
        int j = datagrampacket.getLength();
        if (getType() != abyte0[1])
        {
            throw new TFTPPacketException("TFTP operator code does not match type.");
        }
        _error = (abyte0[2] & 0xff) << 8 | abyte0[3] & 0xff;
        if (j < 5)
        {
            throw new TFTPPacketException("Bad error packet. No message.");
        }
        int i = 4;
        datagrampacket = new StringBuilder();
        for (; i < j && abyte0[i] != 0; i++)
        {
            datagrampacket.append((char)abyte0[i]);
        }

        _message = datagrampacket.toString();
    }

    public TFTPErrorPacket(InetAddress inetaddress, int i, int j, String s)
    {
        super(5, inetaddress, i);
        _error = j;
        _message = s;
    }

    DatagramPacket _newDatagram(DatagramPacket datagrampacket, byte abyte0[])
    {
        int i = _message.length();
        abyte0[0] = 0;
        abyte0[1] = (byte)_type;
        abyte0[2] = (byte)((_error & 0xffff) >> 8);
        abyte0[3] = (byte)(_error & 0xff);
        System.arraycopy(_message.getBytes(), 0, abyte0, 4, i);
        abyte0[i + 4] = 0;
        datagrampacket.setAddress(_address);
        datagrampacket.setPort(_port);
        datagrampacket.setData(abyte0);
        datagrampacket.setLength(i + 4);
        return datagrampacket;
    }

    public int getError()
    {
        return _error;
    }

    public String getMessage()
    {
        return _message;
    }

    public DatagramPacket newDatagram()
    {
        int i = _message.length();
        byte abyte0[] = new byte[i + 5];
        abyte0[0] = 0;
        abyte0[1] = (byte)_type;
        abyte0[2] = (byte)((_error & 0xffff) >> 8);
        abyte0[3] = (byte)(_error & 0xff);
        System.arraycopy(_message.getBytes(), 0, abyte0, 4, i);
        abyte0[i + 4] = 0;
        return new DatagramPacket(abyte0, abyte0.length, _address, _port);
    }
}
