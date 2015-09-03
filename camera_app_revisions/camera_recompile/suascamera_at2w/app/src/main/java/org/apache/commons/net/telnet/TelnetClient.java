// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.telnet;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

// Referenced classes of package org.apache.commons.net.telnet:
//            Telnet, TelnetInputStream, TelnetOutputStream, InvalidTelnetOptionException, 
//            TelnetInputListener, TelnetOptionHandler, TelnetNotificationHandler

public class TelnetClient extends Telnet
{

    private InputStream __input;
    private OutputStream __output;
    private TelnetInputListener inputListener;
    protected boolean readerThread;

    public TelnetClient()
    {
        super("VT100");
        readerThread = true;
        __input = null;
        __output = null;
    }

    public TelnetClient(String s)
    {
        super(s);
        readerThread = true;
        __input = null;
        __output = null;
    }

    void _closeOutputStream()
        throws IOException
    {
        _output_.close();
    }

    protected void _connectAction_()
        throws IOException
    {
        super._connectAction_();
        TelnetInputStream telnetinputstream = new TelnetInputStream(_input_, this, readerThread);
        if (readerThread)
        {
            telnetinputstream._start();
        }
        __input = new BufferedInputStream(telnetinputstream);
        __output = new TelnetOutputStream(this);
    }

    void _flushOutputStream()
        throws IOException
    {
        _output_.flush();
    }

    public void addOptionHandler(TelnetOptionHandler telnetoptionhandler)
        throws InvalidTelnetOptionException, IOException
    {
        super.addOptionHandler(telnetoptionhandler);
    }

    public void deleteOptionHandler(int i)
        throws InvalidTelnetOptionException, IOException
    {
        super.deleteOptionHandler(i);
    }

    public void disconnect()
        throws IOException
    {
        if (__input != null)
        {
            __input.close();
        }
        if (__output != null)
        {
            __output.close();
        }
        super.disconnect();
    }

    public InputStream getInputStream()
    {
        return __input;
    }

    public boolean getLocalOptionState(int i)
    {
        return _stateIsWill(i) && _requestedWill(i);
    }

    public OutputStream getOutputStream()
    {
        return __output;
    }

    public boolean getReaderThread()
    {
        return readerThread;
    }

    public boolean getRemoteOptionState(int i)
    {
        return _stateIsDo(i) && _requestedDo(i);
    }

    void notifyInputListener()
    {
        this;
        JVM INSTR monitorenter ;
        TelnetInputListener telnetinputlistener = inputListener;
        this;
        JVM INSTR monitorexit ;
        if (telnetinputlistener != null)
        {
            telnetinputlistener.telnetInputAvailable();
        }
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void registerInputListener(TelnetInputListener telnetinputlistener)
    {
        this;
        JVM INSTR monitorenter ;
        inputListener = telnetinputlistener;
        this;
        JVM INSTR monitorexit ;
        return;
        telnetinputlistener;
        throw telnetinputlistener;
    }

    public void registerNotifHandler(TelnetNotificationHandler telnetnotificationhandler)
    {
        super.registerNotifHandler(telnetnotificationhandler);
    }

    public void registerSpyStream(OutputStream outputstream)
    {
        super._registerSpyStream(outputstream);
    }

    public boolean sendAYT(long l)
        throws IOException, IllegalArgumentException, InterruptedException
    {
        return _sendAYT(l);
    }

    public void sendCommand(byte byte0)
        throws IOException, IllegalArgumentException
    {
        _sendCommand(byte0);
    }

    public void sendSubnegotiation(int ai[])
        throws IOException, IllegalArgumentException
    {
        if (ai.length < 1)
        {
            throw new IllegalArgumentException("zero length message");
        } else
        {
            _sendSubnegotiation(ai);
            return;
        }
    }

    public void setReaderThread(boolean flag)
    {
        readerThread = flag;
    }

    public void stopSpyStream()
    {
        super._stopSpyStream();
    }

    public void unregisterInputListener()
    {
        this;
        JVM INSTR monitorenter ;
        inputListener = null;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void unregisterNotifHandler()
    {
        super.unregisterNotifHandler();
    }
}
