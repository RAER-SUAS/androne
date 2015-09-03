// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.bsd;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import javax.net.ServerSocketFactory;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.SocketInputStream;

public class RExecClient extends SocketClient
{

    public static final int DEFAULT_PORT = 512;
    protected static final char NULL_CHAR = 0;
    private boolean __remoteVerificationEnabled;
    protected InputStream _errorStream_;

    public RExecClient()
    {
        _errorStream_ = null;
        setDefaultPort(512);
    }

    InputStream _createErrorStream()
        throws IOException
    {
        ServerSocket serversocket = _serverSocketFactory_.createServerSocket(0, 1, getLocalAddress());
        _output_.write(Integer.toString(serversocket.getLocalPort()).getBytes("UTF-8"));
        _output_.write(0);
        _output_.flush();
        Socket socket = serversocket.accept();
        serversocket.close();
        if (__remoteVerificationEnabled && !verifyRemote(socket))
        {
            socket.close();
            throw new IOException((new StringBuilder()).append("Security violation: unexpected connection attempt by ").append(socket.getInetAddress().getHostAddress()).toString());
        } else
        {
            return new SocketInputStream(socket, socket.getInputStream());
        }
    }

    public void disconnect()
        throws IOException
    {
        if (_errorStream_ != null)
        {
            _errorStream_.close();
        }
        _errorStream_ = null;
        super.disconnect();
    }

    public InputStream getErrorStream()
    {
        return _errorStream_;
    }

    public InputStream getInputStream()
    {
        return _input_;
    }

    public OutputStream getOutputStream()
    {
        return _output_;
    }

    public final boolean isRemoteVerificationEnabled()
    {
        return __remoteVerificationEnabled;
    }

    public void rexec(String s, String s1, String s2)
        throws IOException
    {
        rexec(s, s1, s2, false);
    }

    public void rexec(String s, String s1, String s2, boolean flag)
        throws IOException
    {
        int i;
        if (flag)
        {
            _errorStream_ = _createErrorStream();
        } else
        {
            _output_.write(0);
        }
        _output_.write(s.getBytes(getCharsetName()));
        _output_.write(0);
        _output_.write(s1.getBytes(getCharsetName()));
        _output_.write(0);
        _output_.write(s2.getBytes(getCharsetName()));
        _output_.write(0);
        _output_.flush();
        i = _input_.read();
        if (i > 0)
        {
            s = new StringBuilder();
            do
            {
                i = _input_.read();
                if (i != -1 && i != 10)
                {
                    s.append((char)i);
                } else
                {
                    throw new IOException(s.toString());
                }
            } while (true);
        }
        if (i < 0)
        {
            throw new IOException("Server closed connection.");
        } else
        {
            return;
        }
    }

    public final void setRemoteVerificationEnabled(boolean flag)
    {
        __remoteVerificationEnabled = flag;
    }
}
