// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.AnalogInput;
import ioio.lib.api.exception.ConnectionLostException;
import java.io.IOException;

// Referenced classes of package ioio.lib.impl:
//            AbstractPin, IOIOImpl, IOIOProtocol

class AnalogInputImpl extends AbstractPin
    implements AnalogInput, IncomingState.InputPinListener
{

    static final boolean $assertionsDisabled;
    int bufferCapacity_;
    int bufferOverflowCount_;
    int bufferReadCursor_;
    int bufferSize_;
    int bufferWriteCursor_;
    short buffer_[];
    private boolean valid_;
    private int value_;

    AnalogInputImpl(IOIOImpl ioioimpl, int i)
        throws ConnectionLostException
    {
        super(ioioimpl, i);
        valid_ = false;
        bufferOverflowCount_ = 0;
    }

    private short bufferPull()
        throws InterruptedException, ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        if (buffer_ == null)
        {
            throw new IllegalStateException("Need to call setBuffer() before reading buffered values.");
        }
          goto _L1
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
_L3:
        wait();
_L1:
        if (bufferSize_ == 0 && state_ == AbstractResource.State.OPEN) goto _L3; else goto _L2
_L2:
        short aword0[];
        int i;
        checkState();
        aword0 = buffer_;
        i = bufferReadCursor_;
        bufferReadCursor_ = i + 1;
        short word0 = aword0[i];
        if (bufferReadCursor_ == bufferCapacity_)
        {
            bufferReadCursor_ = 0;
        }
        bufferSize_ = bufferSize_ - 1;
        this;
        JVM INSTR monitorexit ;
        return word0;
    }

    private void bufferPush(short word0)
    {
        if (buffer_ == null)
        {
            return;
        }
        short aword0[];
        int i;
        if (bufferSize_ == bufferCapacity_)
        {
            bufferOverflowCount_ = bufferOverflowCount_ + 1;
        } else
        {
            bufferSize_ = bufferSize_ + 1;
        }
        aword0 = buffer_;
        i = bufferWriteCursor_;
        bufferWriteCursor_ = i + 1;
        aword0[i] = word0;
        if (bufferWriteCursor_ == bufferCapacity_)
        {
            bufferWriteCursor_ = 0;
        }
        notifyAll();
    }

    public int available()
        throws ConnectionLostException
    {
        return bufferSize_;
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        super.close();
        Exception exception;
        try
        {
            ioio_.protocol_.setAnalogInSampling(pinNum_, false);
        }
        catch (IOException ioexception) { }
        this;
        JVM INSTR monitorexit ;
        return;
        exception;
        throw exception;
    }

    public void disconnected()
    {
        this;
        JVM INSTR monitorenter ;
        super.disconnected();
        notifyAll();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public int getOverflowCount()
        throws ConnectionLostException
    {
        return bufferOverflowCount_;
    }

    public float getReference()
    {
        return 3.3F;
    }

    public float getSampleRate()
        throws ConnectionLostException
    {
        return 1000F;
    }

    public float getVoltage()
        throws InterruptedException, ConnectionLostException
    {
        return read() * getReference();
    }

    public float getVoltageBuffered()
        throws InterruptedException, ConnectionLostException
    {
        return readBuffered() * getReference();
    }

    public float read()
        throws InterruptedException, ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
_L1:
        int i;
        if (!valid_ && state_ == AbstractResource.State.OPEN)
        {
            break MISSING_BLOCK_LABEL_42;
        }
        checkState();
        i = value_;
        float f = (float)i / 1023F;
        this;
        JVM INSTR monitorexit ;
        return f;
        wait();
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    public float readBuffered()
        throws InterruptedException, ConnectionLostException
    {
        checkState();
        return (float)bufferPull() / 1023F;
    }

    public void setBuffer(int i)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        if (i > 0)
        {
            break MISSING_BLOCK_LABEL_43;
        }
        buffer_ = null;
_L1:
        bufferCapacity_ = i;
        bufferSize_ = 0;
        bufferReadCursor_ = 0;
        bufferWriteCursor_ = 0;
        bufferOverflowCount_ = 0;
        this;
        JVM INSTR monitorexit ;
        return;
        buffer_ = new short[i];
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    public void setValue(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if ($assertionsDisabled || i >= 0 && i < 1024)
        {
            break MISSING_BLOCK_LABEL_32;
        }
        throw new AssertionError();
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        value_ = i;
        if (!valid_)
        {
            valid_ = true;
            notifyAll();
        }
        bufferPush((short)i);
        this;
        JVM INSTR monitorexit ;
    }

    static 
    {
        boolean flag;
        if (!ioio/lib/impl/AnalogInputImpl.desiredAssertionStatus())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        $assertionsDisabled = flag;
    }
}
