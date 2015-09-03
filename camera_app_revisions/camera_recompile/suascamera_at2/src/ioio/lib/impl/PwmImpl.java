// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.PwmOutput;
import ioio.lib.api.exception.ConnectionLostException;
import java.io.IOException;

// Referenced classes of package ioio.lib.impl:
//            AbstractResource, IOIOImpl, IOIOProtocol

class PwmImpl extends AbstractResource
    implements PwmOutput
{

    static final boolean $assertionsDisabled;
    private final float baseUs_;
    private final int period_;
    private final int pinNum_;
    private final int pwmNum_;

    public PwmImpl(IOIOImpl ioioimpl, int i, int j, int k, float f)
        throws ConnectionLostException
    {
        super(ioioimpl);
        pwmNum_ = j;
        pinNum_ = i;
        baseUs_ = f;
        period_ = k;
    }

    private void setPulseWidthInClocks(float f)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        float f1 = f;
        int i;
        if (f <= (float)period_)
        {
            break MISSING_BLOCK_LABEL_28;
        }
        i = period_;
        f1 = i;
        f = f1 - 1.0F;
        int j;
        int k;
        if (f < 1.0F)
        {
            k = 0;
            j = 0;
        } else
        {
            k = (int)f;
            j = (int)f * 4 & 3;
        }
        ioio_.protocol_.setPwmDutyCycle(pwmNum_, k, j);
        this;
        JVM INSTR monitorexit ;
        return;
        Object obj;
        obj;
        throw new ConnectionLostException(((Exception) (obj)));
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        super.close();
        ioio_.closePwm(pwmNum_);
        ioio_.closePin(pinNum_);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setDutyCycle(float f)
        throws ConnectionLostException
    {
        if (!$assertionsDisabled && (f > 1.0F || f < 0.0F))
        {
            throw new AssertionError();
        } else
        {
            setPulseWidthInClocks((float)period_ * f);
            return;
        }
    }

    public void setPulseWidth(float f)
        throws ConnectionLostException
    {
        if (!$assertionsDisabled && f < 0.0F)
        {
            throw new AssertionError();
        } else
        {
            setPulseWidthInClocks(f / baseUs_);
            return;
        }
    }

    public void setPulseWidth(int i)
        throws ConnectionLostException
    {
        setPulseWidth(i);
    }

    static 
    {
        boolean flag;
        if (!ioio/lib/impl/PwmImpl.desiredAssertionStatus())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        $assertionsDisabled = flag;
    }
}
