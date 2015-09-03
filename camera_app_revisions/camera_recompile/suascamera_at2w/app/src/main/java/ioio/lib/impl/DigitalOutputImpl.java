// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.DigitalOutput;
import ioio.lib.api.exception.ConnectionLostException;
import java.io.IOException;

// Referenced classes of package ioio.lib.impl:
//            AbstractPin, IOIOImpl, IOIOProtocol

class DigitalOutputImpl extends AbstractPin
    implements DigitalOutput
{

    boolean value_;

    DigitalOutputImpl(IOIOImpl ioioimpl, int i, boolean flag)
        throws ConnectionLostException
    {
        super(ioioimpl, i);
        value_ = flag;
    }

    public void write(boolean flag)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag1;
        checkState();
        flag1 = value_;
        if (flag == flag1)
        {
            break MISSING_BLOCK_LABEL_36;
        }
        ioio_.protocol_.setDigitalOutLevel(pinNum_, flag);
        value_ = flag;
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
}
