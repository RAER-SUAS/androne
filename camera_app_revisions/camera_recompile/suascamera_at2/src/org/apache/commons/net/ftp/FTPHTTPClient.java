// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.Inet6Address;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.net.util.Base64;

// Referenced classes of package org.apache.commons.net.ftp:
//            FTPClient, FTPReply

public class FTPHTTPClient extends FTPClient
{

    private static final byte CRLF[] = {
        13, 10
    };
    private final Base64 base64;
    private final String proxyHost;
    private final String proxyPassword;
    private final int proxyPort;
    private final String proxyUsername;
    private String tunnelHost;

    public FTPHTTPClient(String s, int i)
    {
        this(s, i, null, null);
    }

    public FTPHTTPClient(String s, int i, String s1, String s2)
    {
        base64 = new Base64();
        proxyHost = s;
        proxyPort = i;
        proxyUsername = s1;
        proxyPassword = s2;
        tunnelHost = null;
    }

    private void tunnelHandshake(String s, int i, InputStream inputstream, OutputStream outputstream)
        throws IOException, UnsupportedEncodingException
    {
label0:
        {
            String s1 = (new StringBuilder()).append("CONNECT ").append(s).append(":").append(i).append(" HTTP/1.1").toString();
            String s2 = (new StringBuilder()).append("Host: ").append(s).append(":").append(i).toString();
            tunnelHost = s;
            outputstream.write(s1.getBytes("UTF-8"));
            outputstream.write(CRLF);
            outputstream.write(s2.getBytes("UTF-8"));
            outputstream.write(CRLF);
            if (proxyUsername != null && proxyPassword != null)
            {
                s = (new StringBuilder()).append(proxyUsername).append(":").append(proxyPassword).toString();
                outputstream.write((new StringBuilder()).append("Proxy-Authorization: Basic ").append(base64.encodeToString(s.getBytes("UTF-8"))).toString().getBytes("UTF-8"));
            }
            outputstream.write(CRLF);
            outputstream = new ArrayList();
            inputstream = new BufferedReader(new InputStreamReader(inputstream, getCharsetName()));
            for (s = inputstream.readLine(); s != null && s.length() > 0; s = inputstream.readLine())
            {
                outputstream.add(s);
            }

            if (outputstream.size() == 0)
            {
                throw new IOException("No response from proxy");
            }
            s = (String)outputstream.get(0);
            if (s.startsWith("HTTP/") && s.length() >= 12)
            {
                if ("200".equals(s.substring(9, 12)))
                {
                    break label0;
                }
                s = new StringBuilder();
                s.append("HTTPTunnelConnector: connection failed\r\n");
                s.append("Response received from the proxy:\r\n");
                for (inputstream = outputstream.iterator(); inputstream.hasNext(); s.append("\r\n"))
                {
                    s.append((String)inputstream.next());
                }

            } else
            {
                throw new IOException((new StringBuilder()).append("Invalid response from proxy: ").append(s).toString());
            }
            throw new IOException(s.toString());
        }
    }

    protected Socket _openDataConnection_(int i, String s)
        throws IOException
    {
        return super._openDataConnection_(i, s);
    }

    protected Socket _openDataConnection_(String s, String s1)
        throws IOException
    {
        if (getDataConnectionMode() != 2)
        {
            throw new IllegalStateException("Only passive connection mode supported");
        }
        boolean flag1 = getRemoteAddress() instanceof Inet6Address;
        Object obj;
        Socket socket;
        InputStream inputstream;
        OutputStream outputstream;
        boolean flag;
        if (isUseEPSVwithIPv4() || flag1)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        if (flag && epsv() == 229)
        {
            _parseExtendedPassiveModeReply((String)_replyLines.get(0));
            obj = tunnelHost;
        } else
        {
            if (flag1)
            {
                return null;
            }
            if (pasv() != 227)
            {
                return null;
            }
            _parsePassiveModeReply((String)_replyLines.get(0));
            obj = getPassiveHost();
        }
        socket = new Socket(proxyHost, proxyPort);
        inputstream = socket.getInputStream();
        outputstream = socket.getOutputStream();
        tunnelHandshake(((String) (obj)), getPassivePort(), inputstream, outputstream);
        if (getRestartOffset() > 0L && !restart(getRestartOffset()))
        {
            socket.close();
            obj = null;
        } else
        {
            obj = socket;
            if (!FTPReply.isPositivePreliminary(sendCommand(s, s1)))
            {
                socket.close();
                return null;
            }
        }
        return ((Socket) (obj));
    }

    public void connect(String s, int i)
        throws SocketException, IOException
    {
        _socket_ = new Socket(proxyHost, proxyPort);
        _input_ = _socket_.getInputStream();
        _output_ = _socket_.getOutputStream();
        try
        {
            tunnelHandshake(s, i, _input_, _output_);
        }
        catch (Exception exception)
        {
            s = new IOException((new StringBuilder()).append("Could not connect to ").append(s).append(" using port ").append(i).toString());
            s.initCause(exception);
            throw s;
        }
        super._connectAction_();
    }

}
