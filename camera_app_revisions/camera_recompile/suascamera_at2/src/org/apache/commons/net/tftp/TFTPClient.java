// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.tftp;

import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import org.apache.commons.net.io.FromNetASCIIOutputStream;
import org.apache.commons.net.io.ToNetASCIIInputStream;

// Referenced classes of package org.apache.commons.net.tftp:
//            TFTP, TFTPPacketException, TFTPAckPacket, TFTPReadRequestPacket, 
//            TFTPPacket, TFTPErrorPacket, TFTPDataPacket, TFTPWriteRequestPacket

public class TFTPClient extends TFTP
{

    public static final int DEFAULT_MAX_TIMEOUTS = 5;
    private int __maxTimeouts;

    public TFTPClient()
    {
        __maxTimeouts = 5;
    }

    public int getMaxTimeouts()
    {
        return __maxTimeouts;
    }

    public int receiveFile(String s, int i, OutputStream outputstream, String s1)
        throws UnknownHostException, IOException
    {
        return receiveFile(s, i, outputstream, InetAddress.getByName(s1), 69);
    }

    public int receiveFile(String s, int i, OutputStream outputstream, String s1, int j)
        throws UnknownHostException, IOException
    {
        return receiveFile(s, i, outputstream, InetAddress.getByName(s1), j);
    }

    public int receiveFile(String s, int i, OutputStream outputstream, InetAddress inetaddress)
        throws IOException
    {
        return receiveFile(s, i, outputstream, inetaddress, 69);
    }

    public int receiveFile(String s, int i, OutputStream outputstream, InetAddress inetaddress, int j)
        throws IOException
    {
        Object obj;
        TFTPAckPacket tftpackpacket;
        int l;
        int i1;
        int j1;
        tftpackpacket = new TFTPAckPacket(inetaddress, j, 0);
        beginBufferedOps();
        j1 = 0;
        l = 0;
        boolean flag1 = false;
        boolean flag = false;
        i1 = 1;
        obj = outputstream;
        if (i == 0)
        {
            obj = new FromNetASCIIOutputStream(outputstream);
        }
        s = new TFTPReadRequestPacket(inetaddress, j, s, i);
        outputstream = inetaddress;
        inetaddress = s;
        j = ((flag1) ? 1 : 0);
        i = ((flag) ? 1 : 0);
_L5:
        int k;
        bufferedSend(inetaddress);
        k = i;
_L7:
        Object obj1 = bufferedReceive();
        int k1;
        int l1;
        int i2;
        i = l;
        s = outputstream;
        if (j == 0)
        {
            l = ((TFTPPacket) (obj1)).getPort();
            tftpackpacket.setPort(l);
            i = l;
            s = outputstream;
            if (!outputstream.equals(((TFTPPacket) (obj1)).getAddress()))
            {
                s = ((TFTPPacket) (obj1)).getAddress();
                tftpackpacket.setAddress(s);
                inetaddress.setAddress(s);
                i = l;
            }
        }
        if (!s.equals(((TFTPPacket) (obj1)).getAddress()) || ((TFTPPacket) (obj1)).getPort() != i)
        {
            break MISSING_BLOCK_LABEL_589;
        }
        switch (((TFTPPacket) (obj1)).getType())
        {
        case 4: // '\004'
        default:
            endBufferedOps();
            throw new IOException("Received unexpected packet type.");

        case 5: // '\005'
            s = (TFTPErrorPacket)obj1;
            endBufferedOps();
            throw new IOException((new StringBuilder()).append("Error code ").append(s.getError()).append(" received: ").append(s.getMessage()).toString());

        case 3: // '\003'
            outputstream = (TFTPDataPacket)obj1;
            k1 = outputstream.getDataLength();
            l1 = outputstream.getBlockNumber();
            break;
        }
          goto _L1
        s;
        i2 = j1;
        obj1 = inetaddress;
        s = outputstream;
        if (0 + 1 >= __maxTimeouts)
        {
            endBufferedOps();
            throw new IOException("Connection timed out.");
        }
          goto _L2
        s;
        i2 = j1;
        obj1 = inetaddress;
        s = outputstream;
        if (0 + 1 >= __maxTimeouts)
        {
            endBufferedOps();
            throw new IOException("Connection timed out.");
        }
          goto _L2
        s;
        endBufferedOps();
        throw new IOException((new StringBuilder()).append("Bad packet: ").append(s.getMessage()).toString());
_L1:
        if (l1 != i1) goto _L4; else goto _L3
_L3:
        try
        {
            ((OutputStream) (obj)).write(outputstream.getData(), outputstream.getDataOffset(), k1);
        }
        // Misplaced declaration of an exception variable
        catch (OutputStream outputstream)
        {
            bufferedSend(new TFTPErrorPacket(s, i, 3, "File write failed."));
            endBufferedOps();
            throw outputstream;
        }
        j = i1 + 1;
        i1 = j;
        if (j > 65535)
        {
            i1 = 0;
        }
        tftpackpacket.setBlockNumber(l1);
        obj1 = tftpackpacket;
        i2 = j1 + k1;
        j = l1;
        l = i;
        k = k1;
_L2:
        j1 = i2;
        i = k;
        inetaddress = ((InetAddress) (obj1));
        outputstream = s;
        if (k != 512)
        {
            bufferedSend(((TFTPPacket) (obj1)));
            endBufferedOps();
            return i2;
        }
          goto _L5
_L4:
        discardPackets();
        if (i1 == 0)
        {
            i2 = 65535;
        } else
        {
            i2 = i1 - 1;
        }
        k = k1;
        l = i;
        j = l1;
        outputstream = s;
        if (l1 != i2) goto _L7; else goto _L6
_L6:
        i2 = j1;
        k = k1;
        l = i;
        j = l1;
        obj1 = inetaddress;
          goto _L2
        bufferedSend(new TFTPErrorPacket(((TFTPPacket) (obj1)).getAddress(), ((TFTPPacket) (obj1)).getPort(), 5, "Unexpected host or port."));
        i2 = j1;
        l = i;
        obj1 = inetaddress;
          goto _L2
    }

    public void sendFile(String s, int i, InputStream inputstream, String s1)
        throws UnknownHostException, IOException
    {
        sendFile(s, i, inputstream, InetAddress.getByName(s1), 69);
    }

    public void sendFile(String s, int i, InputStream inputstream, String s1, int j)
        throws UnknownHostException, IOException
    {
        sendFile(s, i, inputstream, InetAddress.getByName(s1), j);
    }

    public void sendFile(String s, int i, InputStream inputstream, InetAddress inetaddress)
        throws IOException
    {
        sendFile(s, i, inputstream, inetaddress, 69);
    }

    public void sendFile(String s, int i, InputStream inputstream, InetAddress inetaddress, int j)
        throws IOException
    {
        Object obj;
        TFTPDataPacket tftpdatapacket;
        int l;
        int j1;
        int k1;
        int i2;
        tftpdatapacket = new TFTPDataPacket(inetaddress, j, 0, _sendBuffer, 4, 0);
        j1 = 1;
        beginBufferedOps();
        k1 = 0;
        l = 0;
        i2 = 0;
        boolean flag = false;
        obj = inputstream;
        if (i == 0)
        {
            obj = new ToNetASCIIInputStream(inputstream);
        }
        inputstream = new TFTPWriteRequestPacket(inetaddress, j, s, i);
        s = inetaddress;
        inetaddress = inputstream;
        i = ((flag) ? 1 : 0);
_L10:
        int k;
        bufferedSend(inetaddress);
        k = l;
_L9:
        Object obj1 = bufferedReceive();
        j = j1;
        inputstream = s;
        if (j1 != 0)
        {
            l = 0;
            j1 = ((TFTPPacket) (obj1)).getPort();
            tftpdatapacket.setPort(j1);
            k = j1;
            j = l;
            inputstream = s;
            if (!s.equals(((TFTPPacket) (obj1)).getAddress()))
            {
                inputstream = ((TFTPPacket) (obj1)).getAddress();
                tftpdatapacket.setAddress(inputstream);
                inetaddress.setAddress(inputstream);
                j = l;
                k = j1;
            }
        }
        if (!inputstream.equals(((TFTPPacket) (obj1)).getAddress()) || ((TFTPPacket) (obj1)).getPort() != k) goto _L2; else goto _L1
_L1:
        int k2;
        int l2;
        int i3;
        switch (((TFTPPacket) (obj1)).getType())
        {
        default:
            endBufferedOps();
            throw new IOException("Received unexpected packet type.");

        case 5: // '\005'
            s = (TFTPErrorPacket)obj1;
            endBufferedOps();
            throw new IOException((new StringBuilder()).append("Error code ").append(s.getError()).append(" received: ").append(s.getMessage()).toString());

        case 4: // '\004'
            break;
        }
          goto _L3
        inputstream;
        k2 = i2;
        j = j1;
        l2 = i;
        obj1 = inetaddress;
        i3 = k1;
        inputstream = s;
        if (0 + 1 >= __maxTimeouts)
        {
            endBufferedOps();
            throw new IOException("Connection timed out.");
        }
          goto _L4
        inputstream;
        k2 = i2;
        j = j1;
        l2 = i;
        obj1 = inetaddress;
        i3 = k1;
        inputstream = s;
        if (0 + 1 >= __maxTimeouts)
        {
            endBufferedOps();
            throw new IOException("Connection timed out.");
        }
          goto _L4
        s;
        endBufferedOps();
        throw new IOException((new StringBuilder()).append("Bad packet: ").append(s.getMessage()).toString());
_L3:
        if (((TFTPAckPacket)obj1).getBlockNumber() != i2) goto _L6; else goto _L5
_L5:
        l = i2 + 1;
        j1 = l;
        if (l > 65535)
        {
            j1 = 0;
        }
        if (i == 0) goto _L8; else goto _L7
_L7:
        endBufferedOps();
        return;
_L6:
        discardPackets();
        j1 = j;
        s = inputstream;
          goto _L9
_L2:
        bufferedSend(new TFTPErrorPacket(((TFTPPacket) (obj1)).getAddress(), ((TFTPPacket) (obj1)).getPort(), 5, "Unexpected host or port."));
        i3 = k1;
        obj1 = inetaddress;
        l2 = i;
        k2 = i2;
_L4:
        i2 = k2;
        l = k;
        j1 = j;
        i = l2;
        inetaddress = ((InetAddress) (obj1));
        k1 = i3;
        s = inputstream;
        if (i3 > 0)
        {
            break; /* Loop/switch isn't completed */
        }
        i2 = k2;
        l = k;
        j1 = j;
        i = l2;
        inetaddress = ((InetAddress) (obj1));
        k1 = i3;
        s = inputstream;
        if (l2 != 0) goto _L10; else goto _L7
_L8:
        int l1 = 512;
        int j2 = 4;
        int i1 = 0;
        do
        {
            if (l1 <= 0)
            {
                break;
            }
            k2 = ((InputStream) (obj)).read(_sendBuffer, j2, l1);
            if (k2 <= 0)
            {
                break;
            }
            j2 += k2;
            l1 -= k2;
            i1 += k2;
        } while (true);
        if (i1 < 512)
        {
            i = 1;
        }
        tftpdatapacket.setBlockNumber(j1);
        tftpdatapacket.setData(_sendBuffer, 4, i1);
        obj1 = tftpdatapacket;
        k2 = j1;
        l2 = i;
        i3 = i1;
          goto _L4
    }

    public void setMaxTimeouts(int i)
    {
        if (i < 1)
        {
            __maxTimeouts = 1;
            return;
        } else
        {
            __maxTimeouts = i;
            return;
        }
    }
}
