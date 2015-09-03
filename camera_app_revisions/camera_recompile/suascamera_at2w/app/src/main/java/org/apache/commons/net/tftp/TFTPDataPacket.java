// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

// Referenced classes of package org.apache.commons.net.tftp:
//            TFTPPacket, TFTPPacketException

public final class TFTPDataPacket extends TFTPPacket
{

    public static final int MAX_DATA_LENGTH = 512;
    public static final int MIN_DATA_LENGTH = 0;
    int _blockNumber;
    byte _data[];
    int _length;
    int _offset;

    TFTPDataPacket(DatagramPacket datagrampacket)
        throws TFTPPacketException
    {
        super(3, datagrampacket.getAddress(), datagrampacket.getPort());
        _data = datagrampacket.getData();
        _offset = 4;
        if (getType() != _data[1])
        {
            throw new TFTPPacketException("TFTP operator code does not match type.");
        }
        _blockNumber = (_data[2] & 0xff) << 8 | _data[3] & 0xff;
        _length = datagrampacket.getLength() - 4;
        if (_length > 512)
        {
            _length = 512;
        }
    }

    public TFTPDataPacket(InetAddress inetaddress, int i, int j, byte abyte0[])
    {
        this(inetaddress, i, j, abyte0, 0, abyte0.length);
    }

    public TFTPDataPacket(InetAddress inetaddress, int i, int j, byte abyte0[], int k, int l)
    {
        super(3, inetaddress, i);
        _blockNumber = j;
        _data = abyte0;
        _offset = k;
        if (l > 512)
        {
            _length = 512;
            return;
        } else
        {
            _length = l;
            return;
        }
    }

    DatagramPacket _newDatagram(DatagramPacket datagrampacket, byte abyte0[])
    {
        abyte0[0] = 0;
        abyte0[1] = (byte)_type;
        abyte0[2] = (byte)((_blockNumber & 0xffff) >> 8);
        abyte0[3] = (byte)(_blockNumber & 0xff);
        if (abyte0 != _data)
        {
            System.arraycopy(_data, _offset, abyte0, 4, _length);
        }
        datagrampacket.setAddress(_address);
        datagrampacket.setPort(_port);
        datagrampacket.setData(abyte0);
        datagrampacket.setLength(_length + 4);
        return datagrampacket;
    }

    public int getBlockNumber()
    {
        return _blockNumber;
    }

    public byte[] getData()
    {
        return _data;
    }

    public int getDataLength()
    {
        return _length;
    }

    public int getDataOffset()
    {
        return _offset;
    }

    public DatagramPacket newDatagram()
    {
        byte abyte0[] = new byte[_length + 4];
        abyte0[0] = 0;
        abyte0[1] = (byte)_type;
        abyte0[2] = (byte)((_blockNumber & 0xffff) >> 8);
        abyte0[3] = (byte)(_blockNumber & 0xff);
        System.arraycopy(_data, _offset, abyte0, 4, _length);
        return new DatagramPacket(abyte0, _length + 4, _address, _port);
    }

    public void setBlockNumber(int i)
    {
        _blockNumber = i;
    }

    public void setData(byte abyte0[], int i, int j)
    {
        _data = abyte0;
        _offset = i;
        _length = j;
        if (j > 512)
        {
            _length = 512;
            return;
        } else
        {
            _length = j;
            return;
        }
    }
}
