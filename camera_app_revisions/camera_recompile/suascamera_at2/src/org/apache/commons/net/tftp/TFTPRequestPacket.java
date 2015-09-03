// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;
import java.util.Locale;

// Referenced classes of package org.apache.commons.net.tftp:
//            TFTPPacket, TFTPPacketException

public abstract class TFTPRequestPacket extends TFTPPacket
{

    private static final byte _modeBytes[][];
    static final String _modeStrings[] = {
        "netascii", "octet"
    };
    private final String _filename;
    private final int _mode;

    TFTPRequestPacket(int i, DatagramPacket datagrampacket)
        throws TFTPPacketException
    {
        super(i, datagrampacket.getAddress(), datagrampacket.getPort());
        byte abyte0[] = datagrampacket.getData();
        if (getType() != abyte0[1])
        {
            throw new TFTPPacketException("TFTP operator code does not match type.");
        }
        StringBuilder stringbuilder = new StringBuilder();
        i = 2;
        int j;
        for (j = datagrampacket.getLength(); i < j && abyte0[i] != 0; i++)
        {
            stringbuilder.append((char)abyte0[i]);
        }

        _filename = stringbuilder.toString();
        if (i >= j)
        {
            throw new TFTPPacketException("Bad filename and mode format.");
        }
        stringbuilder.setLength(0);
        for (i++; i < j && abyte0[i] != 0; i++)
        {
            stringbuilder.append((char)abyte0[i]);
        }

        datagrampacket = stringbuilder.toString().toLowerCase(Locale.ENGLISH);
        int l = _modeStrings.length;
        boolean flag = false;
        i = 0;
        do
        {
label0:
            {
                int k = ((flag) ? 1 : 0);
                if (i < l)
                {
                    if (!datagrampacket.equals(_modeStrings[i]))
                    {
                        break label0;
                    }
                    k = i;
                }
                _mode = k;
                if (i >= l)
                {
                    throw new TFTPPacketException((new StringBuilder()).append("Unrecognized TFTP transfer mode: ").append(datagrampacket).toString());
                } else
                {
                    return;
                }
            }
            i++;
        } while (true);
    }

    TFTPRequestPacket(InetAddress inetaddress, int i, int j, String s, int k)
    {
        super(j, inetaddress, i);
        _filename = s;
        _mode = k;
    }

    final DatagramPacket _newDatagram(DatagramPacket datagrampacket, byte abyte0[])
    {
        int i = _filename.length();
        int j = _modeBytes[_mode].length;
        abyte0[0] = 0;
        abyte0[1] = (byte)_type;
        System.arraycopy(_filename.getBytes(), 0, abyte0, 2, i);
        abyte0[i + 2] = 0;
        System.arraycopy(_modeBytes[_mode], 0, abyte0, i + 3, j);
        datagrampacket.setAddress(_address);
        datagrampacket.setPort(_port);
        datagrampacket.setData(abyte0);
        datagrampacket.setLength(i + j + 3);
        return datagrampacket;
    }

    public final String getFilename()
    {
        return _filename;
    }

    public final int getMode()
    {
        return _mode;
    }

    public final DatagramPacket newDatagram()
    {
        int i = _filename.length();
        int j = _modeBytes[_mode].length;
        byte abyte0[] = new byte[i + j + 4];
        abyte0[0] = 0;
        abyte0[1] = (byte)_type;
        System.arraycopy(_filename.getBytes(), 0, abyte0, 2, i);
        abyte0[i + 2] = 0;
        System.arraycopy(_modeBytes[_mode], 0, abyte0, i + 3, j);
        return new DatagramPacket(abyte0, abyte0.length, _address, _port);
    }

    static 
    {
        byte abyte0[] = {
            111, 99, 116, 101, 116, 0
        };
        _modeBytes = (new byte[][] {
            new byte[] {
                110, 101, 116, 97, 115, 99, 105, 105, 0
            }, abyte0
        });
    }
}
