// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.DigitalInput;
import ioio.lib.api.exception.ConnectionLostException;
import java.io.IOException;

// Referenced classes of package ioio.lib.impl:
//            AbstractPin, IOIOImpl, IOIOProtocol

class DigitalInputImpl extends AbstractPin
    implements DigitalInput, IncomingState.InputPinListener
{

    static final boolean $assertionsDisabled;
    private boolean valid_;
    private boolean value_;

    DigitalInputImpl(IOIOImpl ioioimpl, int i)
        throws ConnectionLostException
    {
        super(ioioimpl, i);
        valid_ = false;
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        super.close();
        Exception exception;
        try
        {
            ioio_.protocol_.setChangeNotify(pinNum_, false);
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

    public boolean read()
        throws InterruptedException, ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
_L1:
        boolean flag;
        if (!valid_ && state_ != AbstractResource.State.DISCONNECTED)
        {
            break MISSING_BLOCK_LABEL_36;
        }
        checkState();
        flag = value_;
        this;
        JVM INSTR monitorexit ;
        return flag;
        wait();
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    public void setValue(int i)
    {
        boolean flag = true;
        this;
        JVM INSTR monitorenter ;
        if ($assertionsDisabled || i == 0 || i == 1)
        {
            break MISSING_BLOCK_LABEL_32;
        }
        throw new AssertionError();
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if (i != 1)
        {
            flag = false;
        }
        value_ = flag;
        if (!valid_)
        {
            valid_ = true;
        }
        notifyAll();
        this;
        JVM INSTR monitorexit ;
    }

    public void waitForValue(boolean flag)
        throws InterruptedException, ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
_L1:
        if ((!valid_ || value_ != flag) && state_ != AbstractResource.State.DISCONNECTED)
        {
            break MISSING_BLOCK_LABEL_38;
        }
        checkState();
        this;
        JVM INSTR monitorexit ;
        return;
        wait();
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    static 
    {
        boolean flag;
        if (!ioio/lib/impl/DigitalInputImpl.desiredAssertionStatus())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        $assertionsDisabled = flag;
    }
}
