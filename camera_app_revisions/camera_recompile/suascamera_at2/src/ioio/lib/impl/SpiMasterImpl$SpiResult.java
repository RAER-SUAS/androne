// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.impl:
//            SpiMasterImpl

public class data_
    implements ioio.lib.api.
{

    final byte data_[];
    boolean ready_;
    final SpiMasterImpl this$0;

    public void waitReady()
        throws ConnectionLostException, InterruptedException
    {
        this;
        JVM INSTR monitorenter ;
_L2:
        if (!ready_ && state_ != ISCONNECTED)
        {
            break MISSING_BLOCK_LABEL_32;
        }
        checkState();
        this;
        JVM INSTR monitorexit ;
        return;
        wait();
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        throw exception;
    }

    xception(byte abyte0[])
    {
        this$0 = SpiMasterImpl.this;
        super();
        data_ = abyte0;
    }
}
