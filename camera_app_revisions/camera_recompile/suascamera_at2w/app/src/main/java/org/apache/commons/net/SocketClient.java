// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Socket;
import java.net.SocketException;
import java.nio.charset.Charset;
import javax.net.ServerSocketFactory;
import javax.net.SocketFactory;

// Referenced classes of package org.apache.commons.net:
//            ProtocolCommandSupport, DefaultSocketFactory, ProtocolCommandListener

public abstract class SocketClient
{

    private static final int DEFAULT_CONNECT_TIMEOUT = 0;
    public static final String NETASCII_EOL = "\r\n";
    private static final ServerSocketFactory __DEFAULT_SERVER_SOCKET_FACTORY = ServerSocketFactory.getDefault();
    private static final SocketFactory __DEFAULT_SOCKET_FACTORY = SocketFactory.getDefault();
    private ProtocolCommandSupport __commandSupport;
    protected int _defaultPort_;
    protected InputStream _input_;
    protected OutputStream _output_;
    protected ServerSocketFactory _serverSocketFactory_;
    protected SocketFactory _socketFactory_;
    protected Socket _socket_;
    protected int _timeout_;
    private Charset charset;
    private Proxy connProxy;
    protected int connectTimeout;
    private int receiveBufferSize;
    private int sendBufferSize;

    public SocketClient()
    {
        connectTimeout = 0;
        receiveBufferSize = -1;
        sendBufferSize = -1;
        charset = Charset.defaultCharset();
        _socket_ = null;
        _input_ = null;
        _output_ = null;
        _timeout_ = 0;
        _defaultPort_ = 0;
        _socketFactory_ = __DEFAULT_SOCKET_FACTORY;
        _serverSocketFactory_ = __DEFAULT_SERVER_SOCKET_FACTORY;
    }

    private void closeQuietly(Closeable closeable)
    {
        if (closeable == null)
        {
            break MISSING_BLOCK_LABEL_10;
        }
        closeable.close();
        return;
        closeable;
    }

    private void closeQuietly(Socket socket)
    {
        if (socket == null)
        {
            break MISSING_BLOCK_LABEL_8;
        }
        socket.close();
        return;
        socket;
    }

    protected void _connectAction_()
        throws IOException
    {
        _socket_.setSoTimeout(_timeout_);
        _input_ = _socket_.getInputStream();
        _output_ = _socket_.getOutputStream();
    }

    public void addProtocolCommandListener(ProtocolCommandListener protocolcommandlistener)
    {
        getCommandSupport().addProtocolCommandListener(protocolcommandlistener);
    }

    public void connect(String s)
        throws SocketException, IOException
    {
        connect(s, _defaultPort_);
    }

    public void connect(String s, int i)
        throws SocketException, IOException
    {
        connect(InetAddress.getByName(s), i);
    }

    public void connect(String s, int i, InetAddress inetaddress, int j)
        throws SocketException, IOException
    {
        connect(InetAddress.getByName(s), i, inetaddress, j);
    }

    public void connect(InetAddress inetaddress)
        throws SocketException, IOException
    {
        connect(inetaddress, _defaultPort_);
    }

    public void connect(InetAddress inetaddress, int i)
        throws SocketException, IOException
    {
        _socket_ = _socketFactory_.createSocket();
        if (receiveBufferSize != -1)
        {
            _socket_.setReceiveBufferSize(receiveBufferSize);
        }
        if (sendBufferSize != -1)
        {
            _socket_.setSendBufferSize(sendBufferSize);
        }
        _socket_.connect(new InetSocketAddress(inetaddress, i), connectTimeout);
        _connectAction_();
    }

    public void connect(InetAddress inetaddress, int i, InetAddress inetaddress1, int j)
        throws SocketException, IOException
    {
        _socket_ = _socketFactory_.createSocket();
        if (receiveBufferSize != -1)
        {
            _socket_.setReceiveBufferSize(receiveBufferSize);
        }
        if (sendBufferSize != -1)
        {
            _socket_.setSendBufferSize(sendBufferSize);
        }
        _socket_.bind(new InetSocketAddress(inetaddress1, j));
        _socket_.connect(new InetSocketAddress(inetaddress, i), connectTimeout);
        _connectAction_();
    }

    protected void createCommandSupport()
    {
        __commandSupport = new ProtocolCommandSupport(this);
    }

    public void disconnect()
        throws IOException
    {
        closeQuietly(_socket_);
        closeQuietly(_input_);
        closeQuietly(_output_);
        _socket_ = null;
        _input_ = null;
        _output_ = null;
    }

    protected void fireCommandSent(String s, String s1)
    {
        if (getCommandSupport().getListenerCount() > 0)
        {
            getCommandSupport().fireCommandSent(s, s1);
        }
    }

    protected void fireReplyReceived(int i, String s)
    {
        if (getCommandSupport().getListenerCount() > 0)
        {
            getCommandSupport().fireReplyReceived(i, s);
        }
    }

    public Charset getCharset()
    {
        return charset;
    }

    public String getCharsetName()
    {
        return charset.name();
    }

    protected ProtocolCommandSupport getCommandSupport()
    {
        return __commandSupport;
    }

    public int getConnectTimeout()
    {
        return connectTimeout;
    }

    public int getDefaultPort()
    {
        return _defaultPort_;
    }

    public int getDefaultTimeout()
    {
        return _timeout_;
    }

    public boolean getKeepAlive()
        throws SocketException
    {
        return _socket_.getKeepAlive();
    }

    public InetAddress getLocalAddress()
    {
        return _socket_.getLocalAddress();
    }

    public int getLocalPort()
    {
        return _socket_.getLocalPort();
    }

    public Proxy getProxy()
    {
        return connProxy;
    }

    protected int getReceiveBufferSize()
    {
        return receiveBufferSize;
    }

    public InetAddress getRemoteAddress()
    {
        return _socket_.getInetAddress();
    }

    public int getRemotePort()
    {
        return _socket_.getPort();
    }

    protected int getSendBufferSize()
    {
        return sendBufferSize;
    }

    public ServerSocketFactory getServerSocketFactory()
    {
        return _serverSocketFactory_;
    }

    public int getSoLinger()
        throws SocketException
    {
        return _socket_.getSoLinger();
    }

    public int getSoTimeout()
        throws SocketException
    {
        return _socket_.getSoTimeout();
    }

    public boolean getTcpNoDelay()
        throws SocketException
    {
        return _socket_.getTcpNoDelay();
    }

    public boolean isAvailable()
    {
        if (!isConnected())
        {
            break MISSING_BLOCK_LABEL_88;
        }
        if (_socket_.getInetAddress() == null)
        {
            return false;
        }
        if (_socket_.getPort() == 0 || _socket_.getRemoteSocketAddress() == null || _socket_.isClosed() || _socket_.isInputShutdown() || _socket_.isOutputShutdown())
        {
            break MISSING_BLOCK_LABEL_88;
        }
        _socket_.getInputStream();
        _socket_.getOutputStream();
        return true;
        IOException ioexception;
        ioexception;
        return false;
    }

    public boolean isConnected()
    {
        if (_socket_ == null)
        {
            return false;
        } else
        {
            return _socket_.isConnected();
        }
    }

    public void removeProtocolCommandListener(ProtocolCommandListener protocolcommandlistener)
    {
        getCommandSupport().removeProtocolCommandListener(protocolcommandlistener);
    }

    public void setCharset(Charset charset1)
    {
        charset = charset1;
    }

    public void setConnectTimeout(int i)
    {
        connectTimeout = i;
    }

    public void setDefaultPort(int i)
    {
        _defaultPort_ = i;
    }

    public void setDefaultTimeout(int i)
    {
        _timeout_ = i;
    }

    public void setKeepAlive(boolean flag)
        throws SocketException
    {
        _socket_.setKeepAlive(flag);
    }

    public void setProxy(Proxy proxy)
    {
        setSocketFactory(new DefaultSocketFactory(proxy));
        connProxy = proxy;
    }

    public void setReceiveBufferSize(int i)
        throws SocketException
    {
        receiveBufferSize = i;
    }

    public void setSendBufferSize(int i)
        throws SocketException
    {
        sendBufferSize = i;
    }

    public void setServerSocketFactory(ServerSocketFactory serversocketfactory)
    {
        if (serversocketfactory == null)
        {
            _serverSocketFactory_ = __DEFAULT_SERVER_SOCKET_FACTORY;
            return;
        } else
        {
            _serverSocketFactory_ = serversocketfactory;
            return;
        }
    }

    public void setSoLinger(boolean flag, int i)
        throws SocketException
    {
        _socket_.setSoLinger(flag, i);
    }

    public void setSoTimeout(int i)
        throws SocketException
    {
        _socket_.setSoTimeout(i);
    }

    public void setSocketFactory(SocketFactory socketfactory)
    {
        if (socketfactory == null)
        {
            _socketFactory_ = __DEFAULT_SOCKET_FACTORY;
        } else
        {
            _socketFactory_ = socketfactory;
        }
        connProxy = null;
    }

    public void setTcpNoDelay(boolean flag)
        throws SocketException
    {
        _socket_.setTcpNoDelay(flag);
    }

    public boolean verifyRemote(Socket socket)
    {
        return socket.getInetAddress().equals(getRemoteAddress());
    }

}
