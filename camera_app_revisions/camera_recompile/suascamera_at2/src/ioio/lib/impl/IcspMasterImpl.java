// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.IcspMaster;
import ioio.lib.api.exception.ConnectionLostException;
import java.io.IOException;
import java.util.LinkedList;
import java.util.Queue;

// Referenced classes of package ioio.lib.impl:
//            AbstractResource, IOIOImpl, IOIOProtocol

class IcspMasterImpl extends AbstractResource
    implements IcspMaster, IncomingState.DataModuleListener
{

    static final boolean $assertionsDisabled;
    private Queue resultQueue_;
    private int rxRemaining_;

    public IcspMasterImpl(IOIOImpl ioioimpl)
        throws ConnectionLostException
    {
        super(ioioimpl);
        resultQueue_ = new LinkedList();
        rxRemaining_ = 0;
    }

    private static int byteToInt(byte byte0)
    {
        return byte0 & 0xff;
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        super.close();
        ioio_.closeIcsp();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void dataReceived(byte abyte0[], int i)
    {
        this;
        JVM INSTR monitorenter ;
        if ($assertionsDisabled || i == 2)
        {
            break MISSING_BLOCK_LABEL_26;
        }
        throw new AssertionError();
        abyte0;
        this;
        JVM INSTR monitorexit ;
        throw abyte0;
        i = byteToInt(abyte0[1]);
        int j = byteToInt(abyte0[0]);
        resultQueue_.add(Integer.valueOf(i << 8 | j));
        notifyAll();
        this;
        JVM INSTR monitorexit ;
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

    public void enterProgramming()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        ioio_.protocol_.icspEnter();
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

    public void executeInstruction(int i)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        ioio_.protocol_.icspSix(i);
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

    public void exitProgramming()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        ioio_.protocol_.icspExit();
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

    public void readVisi()
        throws ConnectionLostException, InterruptedException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
_L1:
        if (rxRemaining_ < 2 && state_ == AbstractResource.State.OPEN)
        {
            break MISSING_BLOCK_LABEL_51;
        }
        checkState();
        rxRemaining_ = rxRemaining_ - 2;
        ioio_.protocol_.icspRegout();
        this;
        JVM INSTR monitorexit ;
        return;
        wait();
          goto _L1
        Object obj;
        obj;
        throw obj;
        obj;
        throw new ConnectionLostException(((Exception) (obj)));
    }

    public void reportAdditionalBuffer(int i)
    {
        this;
        JVM INSTR monitorenter ;
        rxRemaining_ = rxRemaining_ + i;
        notifyAll();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public int waitVisiResult()
        throws ConnectionLostException, InterruptedException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
_L1:
        int i;
        if (resultQueue_.isEmpty() && state_ == AbstractResource.State.OPEN)
        {
            break MISSING_BLOCK_LABEL_52;
        }
        checkState();
        i = ((Integer)resultQueue_.remove()).intValue();
        this;
        JVM INSTR monitorexit ;
        return i;
        wait();
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    static 
    {
        boolean flag;
        if (!ioio/lib/impl/IcspMasterImpl.desiredAssertionStatus())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        $assertionsDisabled = flag;
    }
}
