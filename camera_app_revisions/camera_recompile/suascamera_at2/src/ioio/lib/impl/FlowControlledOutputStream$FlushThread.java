// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import java.util.concurrent.BlockingQueue;

// Referenced classes of package ioio.lib.impl:
//            FlowControlledOutputStream

class this._cls0 extends Thread
{

    final FlowControlledOutputStream this$0;

    public void run()
    {
        super.run();
_L5:
        Object obj = FlowControlledOutputStream.this;
        obj;
        JVM INSTR monitorenter ;
_L6:
        if (FlowControlledOutputStream.access$0(FlowControlledOutputStream.this) == 0 || FlowControlledOutputStream.access$1(FlowControlledOutputStream.this).isEmpty()) goto _L2; else goto _L1
_L1:
        int j = Math.min(FlowControlledOutputStream.access$2(FlowControlledOutputStream.this), Math.min(FlowControlledOutputStream.access$0(FlowControlledOutputStream.this), FlowControlledOutputStream.access$1(FlowControlledOutputStream.this).size()));
        int i = 0;
_L7:
        if (i < j) goto _L4; else goto _L3
_L3:
        FlowControlledOutputStream flowcontrolledoutputstream = FlowControlledOutputStream.this;
        FlowControlledOutputStream.access$4(flowcontrolledoutputstream, FlowControlledOutputStream.access$0(flowcontrolledoutputstream) - j);
        notifyAll();
        obj;
        JVM INSTR monitorexit ;
        try
        {
            FlowControlledOutputStream.access$5(FlowControlledOutputStream.this)._mth0(FlowControlledOutputStream.access$3(FlowControlledOutputStream.this), j);
        }
        // Misplaced declaration of an exception variable
        catch (Object obj)
        {
            return;
        }
          goto _L5
_L2:
        wait();
          goto _L6
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L4:
        FlowControlledOutputStream.access$3(FlowControlledOutputStream.this)[i] = ((Byte)FlowControlledOutputStream.access$1(FlowControlledOutputStream.this).remove()).byteValue();
        i++;
          goto _L7
    }

    ()
    {
        this$0 = FlowControlledOutputStream.this;
        super();
    }
}
