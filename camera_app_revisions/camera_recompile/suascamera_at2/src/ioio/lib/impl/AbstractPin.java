// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.impl:
//            AbstractResource, IOIOImpl

abstract class AbstractPin extends AbstractResource
{

    protected final int pinNum_;

    AbstractPin(IOIOImpl ioioimpl, int i)
        throws ConnectionLostException
    {
        super(ioioimpl);
        pinNum_ = i;
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        super.close();
        ioio_.closePin(pinNum_);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }
}
