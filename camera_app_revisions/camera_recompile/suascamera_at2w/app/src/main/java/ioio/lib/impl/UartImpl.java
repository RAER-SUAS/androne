// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.Uart;
import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.spi.Log;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

// Referenced classes of package ioio.lib.impl:
//            AbstractResource, FlowControlledOutputStream, QueueInputStream, IOIOImpl, 
//            IOIOProtocol

class UartImpl extends AbstractResource
    implements IncomingState.DataModuleListener, FlowControlledOutputStream.Sender, Uart
{

    private static final int MAX_PACKET = 64;
    private final QueueInputStream incoming_ = new QueueInputStream();
    private final FlowControlledOutputStream outgoing_ = new FlowControlledOutputStream(this, 64);
    private final int rxPinNum_;
    private final int txPinNum_;
    private final int uartNum_;

    public UartImpl(IOIOImpl ioioimpl, int i, int j, int k)
        throws ConnectionLostException
    {
        super(ioioimpl);
        uartNum_ = k;
        rxPinNum_ = j;
        txPinNum_ = i;
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        super.close();
        incoming_.close();
        outgoing_.close();
        ioio_.closeUart(uartNum_);
        if (rxPinNum_ != -1)
        {
            ioio_.closePin(rxPinNum_);
        }
        if (txPinNum_ != -1)
        {
            ioio_.closePin(txPinNum_);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void dataReceived(byte abyte0[], int i)
    {
        incoming_.write(abyte0, i);
    }

    public void disconnected()
    {
        this;
        JVM INSTR monitorenter ;
        super.disconnected();
        incoming_.kill();
        outgoing_.close();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public InputStream getInputStream()
    {
        return incoming_;
    }

    public OutputStream getOutputStream()
    {
        return outgoing_;
    }

    public void reportAdditionalBuffer(int i)
    {
        outgoing_.readyToSend(i);
    }

    public void send(byte abyte0[], int i)
    {
        try
        {
            ioio_.protocol_.uartData(uartNum_, i, abyte0);
            return;
        }
        // Misplaced declaration of an exception variable
        catch (byte abyte0[])
        {
            Log.e("UartImpl", abyte0.getMessage());
        }
    }
}
