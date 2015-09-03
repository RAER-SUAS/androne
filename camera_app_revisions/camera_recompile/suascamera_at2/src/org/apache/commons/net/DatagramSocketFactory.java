// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public interface DatagramSocketFactory
{

    public abstract DatagramSocket createDatagramSocket()
        throws SocketException;

    public abstract DatagramSocket createDatagramSocket(int i)
        throws SocketException;

    public abstract DatagramSocket createDatagramSocket(int i, InetAddress inetaddress)
        throws SocketException;
}
