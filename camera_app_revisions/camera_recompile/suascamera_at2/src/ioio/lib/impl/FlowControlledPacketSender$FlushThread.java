// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import java.util.concurrent.BlockingQueue;

// Referenced classes of package ioio.lib.impl:
//            FlowControlledPacketSender

class this._cls0 extends Thread
{

    final FlowControlledPacketSender this$0;

    public void run()
    {
        super.run();
        if (true) goto _L2; else goto _L1
_L1:
        obj;
        JVM INSTR monitorenter ;
_L2:
label0:
        do
        {
label1:
            {
                synchronized (FlowControlledPacketSender.this)
                {
                    if (FlowControlledPacketSender.access$0(FlowControlledPacketSender.this).isEmpty() || FlowControlledPacketSender.access$1(FlowControlledPacketSender.this) < ((this._cls0)FlowControlledPacketSender.access$0(FlowControlledPacketSender.this).peek()).ze())
                    {
                        break label1;
                    }
                    notifyAll();
                    FlowControlledPacketSender flowcontrolledpacketsender = FlowControlledPacketSender.this;
                    FlowControlledPacketSender.access$2(flowcontrolledpacketsender, FlowControlledPacketSender.access$1(flowcontrolledpacketsender) - ((this._cls0)FlowControlledPacketSender.access$0(FlowControlledPacketSender.this).peek()).ze());
                }
                try
                {
                    FlowControlledPacketSender.access$3(FlowControlledPacketSender.this)._mth0((this._cls0)FlowControlledPacketSender.access$0(FlowControlledPacketSender.this).remove());
                }
                // Misplaced declaration of an exception variable
                catch (Object obj)
                {
                    return;
                }
            }
        } while (true);
        wait();
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
          goto _L2
    }

    ()
    {
        this$0 = FlowControlledPacketSender.this;
        super();
    }
}
