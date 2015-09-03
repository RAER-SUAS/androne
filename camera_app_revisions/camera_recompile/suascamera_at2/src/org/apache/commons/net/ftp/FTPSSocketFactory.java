// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import javax.net.SocketFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLServerSocketFactory;
import javax.net.ssl.SSLSocketFactory;

public class FTPSSocketFactory extends SocketFactory
{

    private final SSLContext context;

    public FTPSSocketFactory(SSLContext sslcontext)
    {
        context = sslcontext;
    }

    public ServerSocket createServerSocket(int i)
        throws IOException
    {
        return init(context.getServerSocketFactory().createServerSocket(i));
    }

    public ServerSocket createServerSocket(int i, int j)
        throws IOException
    {
        return init(context.getServerSocketFactory().createServerSocket(i, j));
    }

    public ServerSocket createServerSocket(int i, int j, InetAddress inetaddress)
        throws IOException
    {
        return init(context.getServerSocketFactory().createServerSocket(i, j, inetaddress));
    }

    public Socket createSocket()
        throws IOException
    {
        return context.getSocketFactory().createSocket();
    }

    public Socket createSocket(String s, int i)
        throws UnknownHostException, IOException
    {
        return context.getSocketFactory().createSocket(s, i);
    }

    public Socket createSocket(String s, int i, InetAddress inetaddress, int j)
        throws UnknownHostException, IOException
    {
        return context.getSocketFactory().createSocket(s, i, inetaddress, j);
    }

    public Socket createSocket(InetAddress inetaddress, int i)
        throws IOException
    {
        return context.getSocketFactory().createSocket(inetaddress, i);
    }

    public Socket createSocket(InetAddress inetaddress, int i, InetAddress inetaddress1, int j)
        throws IOException
    {
        return context.getSocketFactory().createSocket(inetaddress, i, inetaddress1, j);
    }

    public ServerSocket init(ServerSocket serversocket)
        throws IOException
    {
        ((SSLServerSocket)serversocket).setUseClientMode(true);
        return serversocket;
    }
}
