// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.impl:
//            TwiMasterImpl

class data_
    implements ioio.lib.api.
{

    final byte data_[];
    boolean ready_;
    boolean success_;
    final TwiMasterImpl this$0;

    public boolean waitReady()
        throws ConnectionLostException, InterruptedException
    {
        this;
        JVM INSTR monitorenter ;
_L2:
        boolean flag;
        if (!ready_ && state_ != ISCONNECTED)
        {
            break MISSING_BLOCK_LABEL_38;
        }
        checkState();
        flag = success_;
        this;
        JVM INSTR monitorexit ;
        return flag;
        wait();
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        throw exception;
    }

    public xception(byte abyte0[])
    {
        this$0 = TwiMasterImpl.this;
        super();
        ready_ = false;
        data_ = abyte0;
    }
}
