// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import javax.net.ServerSocketFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLServerSocketFactory;

public class FTPSServerSocketFactory extends ServerSocketFactory
{

    private final SSLContext context;

    public FTPSServerSocketFactory(SSLContext sslcontext)
    {
        context = sslcontext;
    }

    public ServerSocket createServerSocket()
        throws IOException
    {
        return init(context.getServerSocketFactory().createServerSocket());
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

    public ServerSocket init(ServerSocket serversocket)
    {
        ((SSLServerSocket)serversocket).setUseClientMode(true);
        return serversocket;
    }
}
