// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import org.apache.commons.net.io.CRLFLineReader;
import org.apache.commons.net.util.SSLContextUtils;

// Referenced classes of package org.apache.commons.net.imap:
//            IMAPClient, IMAPCommand

public class IMAPSClient extends IMAPClient
{

    public static final int DEFAULT_IMAPS_PORT = 993;
    public static final String DEFAULT_PROTOCOL = "TLS";
    private SSLContext context;
    private final boolean isImplicit;
    private KeyManager keyManager;
    private final String protocol;
    private String protocols[];
    private String suites[];
    private TrustManager trustManager;

    public IMAPSClient()
    {
        this("TLS", false);
    }

    public IMAPSClient(String s)
    {
        this(s, false);
    }

    public IMAPSClient(String s, boolean flag)
    {
        this(s, flag, null);
    }

    public IMAPSClient(String s, boolean flag, SSLContext sslcontext)
    {
        context = null;
        suites = null;
        protocols = null;
        trustManager = null;
        keyManager = null;
        setDefaultPort(993);
        protocol = s;
        isImplicit = flag;
        context = sslcontext;
    }

    public IMAPSClient(SSLContext sslcontext)
    {
        this(false, sslcontext);
    }

    public IMAPSClient(boolean flag)
    {
        this("TLS", flag);
    }

    public IMAPSClient(boolean flag, SSLContext sslcontext)
    {
        this("TLS", flag, sslcontext);
    }

    private KeyManager getKeyManager()
    {
        return keyManager;
    }

    private void initSSLContext()
        throws IOException
    {
        if (context == null)
        {
            context = SSLContextUtils.createSSLContext(protocol, getKeyManager(), getTrustManager());
        }
    }

    private void performSSLNegotiation()
        throws IOException
    {
        initSSLContext();
        Object obj = context.getSocketFactory();
        String s = getRemoteAddress().getHostAddress();
        int i = getRemotePort();
        obj = (SSLSocket)((SSLSocketFactory) (obj)).createSocket(_socket_, s, i, true);
        ((SSLSocket) (obj)).setEnableSessionCreation(true);
        ((SSLSocket) (obj)).setUseClientMode(true);
        if (protocols != null)
        {
            ((SSLSocket) (obj)).setEnabledProtocols(protocols);
        }
        if (suites != null)
        {
            ((SSLSocket) (obj)).setEnabledCipherSuites(suites);
        }
        ((SSLSocket) (obj)).startHandshake();
        _socket_ = ((java.net.Socket) (obj));
        _input_ = ((SSLSocket) (obj)).getInputStream();
        _output_ = ((SSLSocket) (obj)).getOutputStream();
        _reader = new CRLFLineReader(new InputStreamReader(_input_, "ISO-8859-1"));
        __writer = new BufferedWriter(new OutputStreamWriter(_output_, "ISO-8859-1"));
    }

    protected void _connectAction_()
        throws IOException
    {
        if (isImplicit)
        {
            performSSLNegotiation();
        }
        super._connectAction_();
    }

    public boolean execTLS()
        throws SSLException, IOException
    {
        if (sendCommand(IMAPCommand.getCommand(IMAPCommand.STARTTLS)) != 0)
        {
            return false;
        } else
        {
            performSSLNegotiation();
            return true;
        }
    }

    public String[] getEnabledCipherSuites()
    {
        if (_socket_ instanceof SSLSocket)
        {
            return ((SSLSocket)_socket_).getEnabledCipherSuites();
        } else
        {
            return null;
        }
    }

    public String[] getEnabledProtocols()
    {
        if (_socket_ instanceof SSLSocket)
        {
            return ((SSLSocket)_socket_).getEnabledProtocols();
        } else
        {
            return null;
        }
    }

    public TrustManager getTrustManager()
    {
        return trustManager;
    }

    public void setEnabledCipherSuites(String as[])
    {
        suites = new String[as.length];
        System.arraycopy(as, 0, suites, 0, as.length);
    }

    public void setEnabledProtocols(String as[])
    {
        protocols = new String[as.length];
        System.arraycopy(as, 0, protocols, 0, as.length);
    }

    public void setKeyManager(KeyManager keymanager)
    {
        keyManager = keymanager;
    }

    public void setTrustManager(TrustManager trustmanager)
    {
        trustManager = trustmanager;
    }
}
