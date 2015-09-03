// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

// Referenced classes of package org.apache.commons.net.tftp:
//            TFTPPacket, TFTPPacketException

public final class TFTPAckPacket extends TFTPPacket
{

    int _blockNumber;

    TFTPAckPacket(DatagramPacket datagrampacket)
        throws TFTPPacketException
    {
        super(4, datagrampacket.getAddress(), datagrampacket.getPort());
        datagrampacket = datagrampacket.getData();
        if (getType() != datagrampacket[1])
        {
            throw new TFTPPacketException("TFTP operator code does not match type.");
        } else
        {
            _blockNumber = (datagrampacket[2] & 0xff) << 8 | datagrampacket[3] & 0xff;
            return;
        }
    }

    public TFTPAckPacket(InetAddress inetaddress, int i, int j)
    {
        super(4, inetaddress, i);
        _blockNumber = j;
    }

    DatagramPacket _newDatagram(DatagramPacket datagrampacket, byte abyte0[])
    {
        abyte0[0] = 0;
        abyte0[1] = (byte)_type;
        abyte0[2] = (byte)((_blockNumber & 0xffff) >> 8);
        abyte0[3] = (byte)(_blockNumber & 0xff);
        datagrampacket.setAddress(_address);
        datagrampacket.setPort(_port);
        datagrampacket.setData(abyte0);
        datagrampacket.setLength(4);
        return datagrampacket;
    }

    public int getBlockNumber()
    {
        return _blockNumber;
    }

    public DatagramPacket newDatagram()
    {
        byte abyte0[] = new byte[4];
        abyte0[0] = 0;
        abyte0[1] = (byte)_type;
        abyte0[2] = (byte)((_blockNumber & 0xffff) >> 8);
        abyte0[3] = (byte)(_blockNumber & 0xff);
        return new DatagramPacket(abyte0, abyte0.length, _address, _port);
    }

    public void setBlockNumber(int i)
    {
        _blockNumber = i;
    }
}
