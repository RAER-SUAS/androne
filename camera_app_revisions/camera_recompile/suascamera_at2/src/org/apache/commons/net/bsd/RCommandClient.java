// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.bsd;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.BindException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import javax.net.ServerSocketFactory;
import javax.net.SocketFactory;
import org.apache.commons.net.io.SocketInputStream;

// Referenced classes of package org.apache.commons.net.bsd:
//            RExecClient

public class RCommandClient extends RExecClient
{

    public static final int DEFAULT_PORT = 514;
    public static final int MAX_CLIENT_PORT = 1023;
    public static final int MIN_CLIENT_PORT = 512;

    public RCommandClient()
    {
        setDefaultPort(514);
    }

    InputStream _createErrorStream()
        throws IOException
    {
        Object obj1;
        int i;
        obj1 = null;
        i = 1023;
_L2:
        Object obj;
        obj = obj1;
        if (i < '\u0200')
        {
            break MISSING_BLOCK_LABEL_29;
        }
        obj = _serverSocketFactory_.createServerSocket(i, 1, getLocalAddress());
        if (obj == null)
        {
            throw new BindException("All ports in use.");
        }
        break; /* Loop/switch isn't completed */
        obj;
        i--;
        if (true) goto _L2; else goto _L1
_L1:
        _output_.write(Integer.toString(((ServerSocket) (obj)).getLocalPort()).getBytes("UTF-8"));
        _output_.write(0);
        _output_.flush();
        Socket socket = ((ServerSocket) (obj)).accept();
        ((ServerSocket) (obj)).close();
        if (isRemoteVerificationEnabled() && !verifyRemote(socket))
        {
            socket.close();
            throw new IOException((new StringBuilder()).append("Security violation: unexpected connection attempt by ").append(socket.getInetAddress().getHostAddress()).toString());
        } else
        {
            return new SocketInputStream(socket, socket.getInputStream());
        }
    }

    public void connect(String s, int i)
        throws SocketException, IOException, UnknownHostException
    {
        connect(InetAddress.getByName(s), i, InetAddress.getLocalHost());
    }

    public void connect(String s, int i, InetAddress inetaddress)
        throws SocketException, IOException
    {
        connect(InetAddress.getByName(s), i, inetaddress);
    }

    public void connect(String s, int i, InetAddress inetaddress, int j)
        throws SocketException, IOException, IllegalArgumentException, UnknownHostException
    {
        if (j < 512 || j > 1023)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Invalid port number ").append(j).toString());
        } else
        {
            super.connect(s, i, inetaddress, j);
            return;
        }
    }

    public void connect(InetAddress inetaddress, int i)
        throws SocketException, IOException
    {
        connect(inetaddress, i, InetAddress.getLocalHost());
    }

    public void connect(InetAddress inetaddress, int i, InetAddress inetaddress1)
        throws SocketException, BindException, IOException
    {
        int j = 1023;
_L1:
        if (j < '\u0200')
        {
            break MISSING_BLOCK_LABEL_29;
        }
        _socket_ = _socketFactory_.createSocket(inetaddress, i, inetaddress1, j);
        Object obj;
        if (j < '\u0200')
        {
            throw new BindException("All ports in use or insufficient permssion.");
        } else
        {
            _connectAction_();
            return;
        }
        obj;
_L2:
        j--;
          goto _L1
        obj;
          goto _L2
    }

    public void connect(InetAddress inetaddress, int i, InetAddress inetaddress1, int j)
        throws SocketException, IOException, IllegalArgumentException
    {
        if (j < 512 || j > 1023)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Invalid port number ").append(j).toString());
        } else
        {
            super.connect(inetaddress, i, inetaddress1, j);
            return;
        }
    }

    public void rcommand(String s, String s1, String s2)
        throws IOException
    {
        rcommand(s, s1, s2, false);
    }

    public void rcommand(String s, String s1, String s2, boolean flag)
        throws IOException
    {
        rexec(s, s1, s2, flag);
    }
}
