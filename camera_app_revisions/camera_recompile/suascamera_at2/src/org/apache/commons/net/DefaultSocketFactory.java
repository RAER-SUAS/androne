// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import javax.net.SocketFactory;

public class DefaultSocketFactory extends SocketFactory
{

    private final Proxy connProxy;

    public DefaultSocketFactory()
    {
        this(null);
    }

    public DefaultSocketFactory(Proxy proxy)
    {
        connProxy = proxy;
    }

    public ServerSocket createServerSocket(int i)
        throws IOException
    {
        return new ServerSocket(i);
    }

    public ServerSocket createServerSocket(int i, int j)
        throws IOException
    {
        return new ServerSocket(i, j);
    }

    public ServerSocket createServerSocket(int i, int j, InetAddress inetaddress)
        throws IOException
    {
        return new ServerSocket(i, j, inetaddress);
    }

    public Socket createSocket()
        throws IOException
    {
        if (connProxy != null)
        {
            return new Socket(connProxy);
        } else
        {
            return new Socket();
        }
    }

    public Socket createSocket(String s, int i)
        throws UnknownHostException, IOException
    {
        if (connProxy != null)
        {
            Socket socket = new Socket(connProxy);
            socket.connect(new InetSocketAddress(s, i));
            return socket;
        } else
        {
            return new Socket(s, i);
        }
    }

    public Socket createSocket(String s, int i, InetAddress inetaddress, int j)
        throws UnknownHostException, IOException
    {
        if (connProxy != null)
        {
            Socket socket = new Socket(connProxy);
            socket.bind(new InetSocketAddress(inetaddress, j));
            socket.connect(new InetSocketAddress(s, i));
            return socket;
        } else
        {
            return new Socket(s, i, inetaddress, j);
        }
    }

    public Socket createSocket(InetAddress inetaddress, int i)
        throws IOException
    {
        if (connProxy != null)
        {
            Socket socket = new Socket(connProxy);
            socket.connect(new InetSocketAddress(inetaddress, i));
            return socket;
        } else
        {
            return new Socket(inetaddress, i);
        }
    }

    public Socket createSocket(InetAddress inetaddress, int i, InetAddress inetaddress1, int j)
        throws IOException
    {
        if (connProxy != null)
        {
            Socket socket = new Socket(connProxy);
            socket.bind(new InetSocketAddress(inetaddress1, j));
            socket.connect(new InetSocketAddress(inetaddress, i));
            return socket;
        } else
        {
            return new Socket(inetaddress, i, inetaddress1, j);
        }
    }
}
