// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.IOIOConnection;
import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.spi.Log;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;

public class SocketIOIOConnection
    implements IOIOConnection
{

    private static final String TAG = "SocketIOIOConnection";
    private boolean disconnect_;
    private final int port_;
    private ServerSocket server_;
    private boolean server_owned_by_connect_;
    private Socket socket_;
    private boolean socket_owned_by_connect_;

    public SocketIOIOConnection(int i)
    {
        server_ = null;
        socket_ = null;
        disconnect_ = false;
        server_owned_by_connect_ = true;
        socket_owned_by_connect_ = true;
        port_ = i;
    }

    public boolean canClose()
    {
        return true;
    }

    public void disconnect()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag = disconnect_;
        if (!flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        Log.v("SocketIOIOConnection", "Client initiated disconnect");
        disconnect_ = true;
        flag = server_owned_by_connect_;
        if (flag)
        {
            break MISSING_BLOCK_LABEL_42;
        }
        server_.close();
_L4:
        flag = socket_owned_by_connect_;
        Object obj;
        if (!flag)
        {
            try
            {
                socket_.shutdownOutput();
            }
            catch (IOException ioexception) { }
            finally
            {
                this;
            }
        }
        continue; /* Loop/switch isn't completed */
        obj;
        Log.e("SocketIOIOConnection", "Unexpected exception", ((Throwable) (obj)));
        if (true) goto _L4; else goto _L3
_L3:
        JVM INSTR monitorexit ;
        throw obj;
        if (true) goto _L1; else goto _L5
_L5:
    }

    public InputStream getInputStream()
        throws ConnectionLostException
    {
        InputStream inputstream;
        try
        {
            inputstream = socket_.getInputStream();
        }
        catch (IOException ioexception)
        {
            throw new ConnectionLostException(ioexception);
        }
        return inputstream;
    }

    public OutputStream getOutputStream()
        throws ConnectionLostException
    {
        OutputStream outputstream;
        try
        {
            outputstream = socket_.getOutputStream();
        }
        catch (IOException ioexception)
        {
            throw new ConnectionLostException(ioexception);
        }
        return outputstream;
    }

    public void waitForConnect()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        if (disconnect_)
        {
            throw new ConnectionLostException();
        }
          goto _L1
        Object obj;
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        obj;
        this;
        JVM INSTR monitorenter ;
        Object obj1;
        disconnect_ = true;
        if (!server_owned_by_connect_)
        {
            break MISSING_BLOCK_LABEL_53;
        }
        obj1 = server_;
        if (obj1 == null)
        {
            break MISSING_BLOCK_LABEL_53;
        }
        server_.close();
_L5:
        if (!socket_owned_by_connect_) goto _L3; else goto _L2
_L2:
        obj1 = socket_;
        if (obj1 == null) goto _L3; else goto _L4
_L4:
        socket_.close();
_L3:
        if ((obj instanceof SocketException) && ((IOException) (obj)).getMessage().equals("Permission denied"))
        {
            Log.e("SocketIOIOConnection", "Did you forget to declare uses-permission of android.permission.INTERNET?");
        }
        throw new ConnectionLostException(((Exception) (obj)));
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
_L1:
        Log.v("SocketIOIOConnection", "Creating server socket");
        server_ = new ServerSocket(port_);
        server_owned_by_connect_ = false;
        this;
        JVM INSTR monitorexit ;
        Log.v("SocketIOIOConnection", "Waiting for TCP connection");
        socket_ = server_.accept();
        Log.v("SocketIOIOConnection", "TCP connected");
        this;
        JVM INSTR monitorenter ;
        if (disconnect_)
        {
            socket_.close();
            throw new ConnectionLostException();
        }
        break MISSING_BLOCK_LABEL_199;
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        socket_owned_by_connect_ = false;
        this;
        JVM INSTR monitorexit ;
        return;
        IOException ioexception;
        ioexception;
        Log.e("SocketIOIOConnection", "Unexpected exception", ioexception);
          goto _L5
        ioexception;
        Log.e("SocketIOIOConnection", "Unexpected exception", ioexception);
          goto _L3
    }
}
