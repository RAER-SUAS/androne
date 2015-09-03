// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

// Referenced classes of package org.apache.commons.net.tftp:
//            TFTPRequestPacket, TFTPPacketException

public final class TFTPReadRequestPacket extends TFTPRequestPacket
{

    TFTPReadRequestPacket(DatagramPacket datagrampacket)
        throws TFTPPacketException
    {
        super(1, datagrampacket);
    }

    public TFTPReadRequestPacket(InetAddress inetaddress, int i, String s, int j)
    {
        super(inetaddress, i, 1, s, j);
    }
}
