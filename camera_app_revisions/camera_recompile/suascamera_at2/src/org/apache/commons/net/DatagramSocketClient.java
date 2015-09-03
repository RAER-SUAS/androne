// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.nio.charset.Charset;

// Referenced classes of package org.apache.commons.net:
//            DefaultDatagramSocketFactory, DatagramSocketFactory

public abstract class DatagramSocketClient
{

    private static final DatagramSocketFactory __DEFAULT_SOCKET_FACTORY = new DefaultDatagramSocketFactory();
    protected boolean _isOpen_;
    protected DatagramSocketFactory _socketFactory_;
    protected DatagramSocket _socket_;
    protected int _timeout_;
    private Charset charset;

    public DatagramSocketClient()
    {
        charset = Charset.defaultCharset();
        _socket_ = null;
        _timeout_ = 0;
        _isOpen_ = false;
        _socketFactory_ = __DEFAULT_SOCKET_FACTORY;
    }

    public void close()
    {
        if (_socket_ != null)
        {
            _socket_.close();
        }
        _socket_ = null;
        _isOpen_ = false;
    }

    public Charset getCharset()
    {
        return charset;
    }

    public String getCharsetName()
    {
        return charset.name();
    }

    public int getDefaultTimeout()
    {
        return _timeout_;
    }

    public InetAddress getLocalAddress()
    {
        return _socket_.getLocalAddress();
    }

    public int getLocalPort()
    {
        return _socket_.getLocalPort();
    }

    public int getSoTimeout()
        throws SocketException
    {
        return _socket_.getSoTimeout();
    }

    public boolean isOpen()
    {
        return _isOpen_;
    }

    public void open()
        throws SocketException
    {
        _socket_ = _socketFactory_.createDatagramSocket();
        _socket_.setSoTimeout(_timeout_);
        _isOpen_ = true;
    }

    public void open(int i)
        throws SocketException
    {
        _socket_ = _socketFactory_.createDatagramSocket(i);
        _socket_.setSoTimeout(_timeout_);
        _isOpen_ = true;
    }

    public void open(int i, InetAddress inetaddress)
        throws SocketException
    {
        _socket_ = _socketFactory_.createDatagramSocket(i, inetaddress);
        _socket_.setSoTimeout(_timeout_);
        _isOpen_ = true;
    }

    public void setCharset(Charset charset1)
    {
        charset = charset1;
    }

    public void setDatagramSocketFactory(DatagramSocketFactory datagramsocketfactory)
    {
        if (datagramsocketfactory == null)
        {
            _socketFactory_ = __DEFAULT_SOCKET_FACTORY;
            return;
        } else
        {
            _socketFactory_ = datagramsocketfactory;
            return;
        }
    }

    public void setDefaultTimeout(int i)
    {
        _timeout_ = i;
    }

    public void setSoTimeout(int i)
        throws SocketException
    {
        _socket_.setSoTimeout(i);
    }

}
