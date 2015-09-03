// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import org.apache.commons.net.util.Base64;
import org.apache.commons.net.util.SSLContextUtils;
import org.apache.commons.net.util.TrustManagerUtils;

// Referenced classes of package org.apache.commons.net.ftp:
//            FTPClient, FTPCommand, FTPSSocketFactory, FTPSServerSocketFactory

public class FTPSClient extends FTPClient
{

    private static final String CMD_ADAT = "ADAT";
    private static final String CMD_AUTH = "AUTH";
    private static final String CMD_CCC = "CCC";
    private static final String CMD_CONF = "CONF";
    private static final String CMD_ENC = "ENC";
    private static final String CMD_MIC = "MIC";
    private static final String CMD_PBSZ = "PBSZ";
    private static final String CMD_PROT = "PROT";
    public static final int DEFAULT_FTPS_DATA_PORT = 989;
    public static final int DEFAULT_FTPS_PORT = 990;
    private static final String DEFAULT_PROT = "C";
    private static final String DEFAULT_PROTOCOL = "TLS";
    public static String KEYSTORE_ALGORITHM;
    private static final String PROT_COMMAND_VALUE[] = {
        "C", "E", "S", "P"
    };
    public static String PROVIDER;
    public static String STORE_TYPE;
    public static String TRUSTSTORE_ALGORITHM;
    private String auth;
    private SSLContext context;
    private boolean isClientMode;
    private boolean isCreation;
    private final boolean isImplicit;
    private boolean isNeedClientAuth;
    private boolean isWantClientAuth;
    private KeyManager keyManager;
    private Socket plainSocket;
    private final String protocol;
    private String protocols[];
    private String suites[];
    private TrustManager trustManager;

    public FTPSClient()
    {
        this("TLS", false);
    }

    public FTPSClient(String s)
    {
        this(s, false);
    }

    public FTPSClient(String s, boolean flag)
    {
        auth = "TLS";
        isCreation = true;
        isClientMode = true;
        isNeedClientAuth = false;
        isWantClientAuth = false;
        suites = null;
        protocols = null;
        trustManager = TrustManagerUtils.getValidateServerCertificateTrustManager();
        keyManager = null;
        protocol = s;
        isImplicit = flag;
        if (flag)
        {
            setDefaultPort(990);
        }
    }

    public FTPSClient(SSLContext sslcontext)
    {
        this(false, sslcontext);
    }

    public FTPSClient(boolean flag)
    {
        this("TLS", flag);
    }

    public FTPSClient(boolean flag, SSLContext sslcontext)
    {
        this("TLS", flag);
        context = sslcontext;
    }

    private boolean checkPROTValue(String s)
    {
        String as[] = PROT_COMMAND_VALUE;
        int j = as.length;
        for (int i = 0; i < j; i++)
        {
            if (as[i].equals(s))
            {
                return true;
            }
        }

        return false;
    }

    private String extractPrefixedData(String s, String s1)
    {
        int i = s1.indexOf(s);
        if (i == -1)
        {
            return null;
        } else
        {
            return s1.substring(s.length() + i).trim();
        }
    }

    private KeyManager getKeyManager()
    {
        return keyManager;
    }

    private void initSslContext()
        throws IOException
    {
        if (context == null)
        {
            context = SSLContextUtils.createSSLContext(protocol, getKeyManager(), getTrustManager());
        }
    }

    protected void _connectAction_()
        throws IOException
    {
        if (isImplicit)
        {
            sslNegotiation();
        }
        super._connectAction_();
        if (!isImplicit)
        {
            execAUTH();
            sslNegotiation();
        }
    }

    protected Socket _openDataConnection_(int i, String s)
        throws IOException
    {
        return _openDataConnection_(FTPCommand.getCommand(i), s);
    }

    protected Socket _openDataConnection_(String s, String s1)
        throws IOException
    {
        s = super._openDataConnection_(s, s1);
        _prepareDataSocket_(s);
        if (s instanceof SSLSocket)
        {
            s1 = (SSLSocket)s;
            s1.setUseClientMode(isClientMode);
            s1.setEnableSessionCreation(isCreation);
            if (!isClientMode)
            {
                s1.setNeedClientAuth(isNeedClientAuth);
                s1.setWantClientAuth(isWantClientAuth);
            }
            if (suites != null)
            {
                s1.setEnabledCipherSuites(suites);
            }
            if (protocols != null)
            {
                s1.setEnabledProtocols(protocols);
            }
            s1.startHandshake();
        }
        return s;
    }

    protected void _prepareDataSocket_(Socket socket)
        throws IOException
    {
    }

    public void disconnect()
        throws IOException
    {
        super.disconnect();
        setSocketFactory(null);
        setServerSocketFactory(null);
    }

    public int execADAT(byte abyte0[])
        throws IOException
    {
        if (abyte0 != null)
        {
            return sendCommand("ADAT", Base64.encodeBase64StringUnChunked(abyte0));
        } else
        {
            return sendCommand("ADAT");
        }
    }

    public int execAUTH(String s)
        throws IOException
    {
        return sendCommand("AUTH", s);
    }

    protected void execAUTH()
        throws SSLException, IOException
    {
        for (int i = sendCommand("AUTH", auth); 334 == i || 234 == i;)
        {
            return;
        }

        throw new SSLException(getReplyString());
    }

    public int execCCC()
        throws IOException
    {
        return sendCommand("CCC");
    }

    public int execCONF(byte abyte0[])
        throws IOException
    {
        if (abyte0 != null)
        {
            return sendCommand("CONF", Base64.encodeBase64StringUnChunked(abyte0));
        } else
        {
            return sendCommand("CONF", "");
        }
    }

    public int execENC(byte abyte0[])
        throws IOException
    {
        if (abyte0 != null)
        {
            return sendCommand("ENC", Base64.encodeBase64StringUnChunked(abyte0));
        } else
        {
            return sendCommand("ENC", "");
        }
    }

    public int execMIC(byte abyte0[])
        throws IOException
    {
        if (abyte0 != null)
        {
            return sendCommand("MIC", Base64.encodeBase64StringUnChunked(abyte0));
        } else
        {
            return sendCommand("MIC", "");
        }
    }

    public void execPBSZ(long l)
        throws SSLException, IOException
    {
        if (l < 0L || 0xffffffffL < l)
        {
            throw new IllegalArgumentException();
        }
        if (200 != sendCommand("PBSZ", String.valueOf(l)))
        {
            throw new SSLException(getReplyString());
        } else
        {
            return;
        }
    }

    public void execPROT(String s)
        throws SSLException, IOException
    {
        String s1 = s;
        if (s == null)
        {
            s1 = "C";
        }
        if (!checkPROTValue(s1))
        {
            throw new IllegalArgumentException();
        }
        if (200 != sendCommand("PROT", s1))
        {
            throw new SSLException(getReplyString());
        }
        if ("C".equals(s1))
        {
            setSocketFactory(null);
            setServerSocketFactory(null);
            return;
        } else
        {
            setSocketFactory(new FTPSSocketFactory(context));
            setServerSocketFactory(new FTPSServerSocketFactory(context));
            initSslContext();
            return;
        }
    }

    public String getAuthValue()
    {
        return auth;
    }

    public boolean getEnableSessionCreation()
    {
        if (_socket_ instanceof SSLSocket)
        {
            return ((SSLSocket)_socket_).getEnableSessionCreation();
        } else
        {
            return false;
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

    public boolean getNeedClientAuth()
    {
        if (_socket_ instanceof SSLSocket)
        {
            return ((SSLSocket)_socket_).getNeedClientAuth();
        } else
        {
            return false;
        }
    }

    public TrustManager getTrustManager()
    {
        return trustManager;
    }

    public boolean getUseClientMode()
    {
        if (_socket_ instanceof SSLSocket)
        {
            return ((SSLSocket)_socket_).getUseClientMode();
        } else
        {
            return false;
        }
    }

    public boolean getWantClientAuth()
    {
        if (_socket_ instanceof SSLSocket)
        {
            return ((SSLSocket)_socket_).getWantClientAuth();
        } else
        {
            return false;
        }
    }

    public byte[] parseADATReply(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return Base64.decodeBase64(extractPrefixedData("ADAT=", s));
        }
    }

    public long parsePBSZ(long l)
        throws SSLException, IOException
    {
        execPBSZ(l);
        String s = extractPrefixedData("PBSZ=", getReplyString());
        long l1 = l;
        if (s != null)
        {
            long l2 = Long.parseLong(s);
            l1 = l;
            if (l2 < l)
            {
                l1 = l2;
            }
        }
        return l1;
    }

    public int sendCommand(String s, String s1)
        throws IOException
    {
label0:
        {
            int i = super.sendCommand(s, s1);
            if ("CCC".equals(s))
            {
                if (200 != i)
                {
                    break label0;
                }
                _socket_.close();
                _socket_ = plainSocket;
                _controlInput_ = new BufferedReader(new InputStreamReader(_socket_.getInputStream(), getControlEncoding()));
                _controlOutput_ = new BufferedWriter(new OutputStreamWriter(_socket_.getOutputStream(), getControlEncoding()));
            }
            return i;
        }
        throw new SSLException(getReplyString());
    }

    public void setAuthValue(String s)
    {
        auth = s;
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

    public void setEnabledSessionCreation(boolean flag)
    {
        isCreation = flag;
    }

    public void setKeyManager(KeyManager keymanager)
    {
        keyManager = keymanager;
    }

    public void setNeedClientAuth(boolean flag)
    {
        isNeedClientAuth = flag;
    }

    public void setTrustManager(TrustManager trustmanager)
    {
        trustManager = trustmanager;
    }

    public void setUseClientMode(boolean flag)
    {
        isClientMode = flag;
    }

    public void setWantClientAuth(boolean flag)
    {
        isWantClientAuth = flag;
    }

    protected void sslNegotiation()
        throws IOException
    {
        plainSocket = _socket_;
        initSslContext();
        Object obj = context.getSocketFactory();
        String s = _socket_.getInetAddress().getHostAddress();
        int i = _socket_.getPort();
        obj = (SSLSocket)((SSLSocketFactory) (obj)).createSocket(_socket_, s, i, false);
        ((SSLSocket) (obj)).setEnableSessionCreation(isCreation);
        ((SSLSocket) (obj)).setUseClientMode(isClientMode);
        if (!isClientMode)
        {
            ((SSLSocket) (obj)).setNeedClientAuth(isNeedClientAuth);
            ((SSLSocket) (obj)).setWantClientAuth(isWantClientAuth);
        }
        if (protocols != null)
        {
            ((SSLSocket) (obj)).setEnabledProtocols(protocols);
        }
        if (suites != null)
        {
            ((SSLSocket) (obj)).setEnabledCipherSuites(suites);
        }
        ((SSLSocket) (obj)).startHandshake();
        _socket_ = ((Socket) (obj));
        _controlInput_ = new BufferedReader(new InputStreamReader(((SSLSocket) (obj)).getInputStream(), getControlEncoding()));
        _controlOutput_ = new BufferedWriter(new OutputStreamWriter(((SSLSocket) (obj)).getOutputStream(), getControlEncoding()));
    }

}
