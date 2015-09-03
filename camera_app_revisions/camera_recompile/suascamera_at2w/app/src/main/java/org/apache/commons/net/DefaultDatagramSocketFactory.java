// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

// Referenced classes of package org.apache.commons.net:
//            DatagramSocketFactory

public class DefaultDatagramSocketFactory
    implements DatagramSocketFactory
{

    public DefaultDatagramSocketFactory()
    {
    }

    public DatagramSocket createDatagramSocket()
        throws SocketException
    {
        return new DatagramSocket();
    }

    public DatagramSocket createDatagramSocket(int i)
        throws SocketException
    {
        return new DatagramSocket(i);
    }

    public DatagramSocket createDatagramSocket(int i, InetAddress inetaddress)
        throws SocketException
    {
        return new DatagramSocket(i, inetaddress);
    }
}
