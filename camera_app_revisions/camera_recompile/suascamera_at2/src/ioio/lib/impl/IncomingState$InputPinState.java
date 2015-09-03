// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

// Referenced classes of package ioio.lib.impl:
//            IncomingState

class currentOpen_
{

    static final boolean $assertionsDisabled;
    private boolean currentOpen_;
    private Queue listeners_;
    final IncomingState this$0;

    void closeCurrentListener()
    {
        if (currentOpen_)
        {
            currentOpen_ = false;
            listeners_.remove();
        }
    }

    void openNextListener()
    {
        if (!$assertionsDisabled && listeners_.isEmpty())
        {
            throw new AssertionError();
        }
        if (!currentOpen_)
        {
            currentOpen_ = true;
        }
    }

    void pushListener(er er)
    {
        listeners_.add(er);
    }

    void setValue(int i)
    {
        if (!$assertionsDisabled && !currentOpen_)
        {
            throw new AssertionError();
        } else
        {
            ((er)listeners_.peek()).setValue(i);
            return;
        }
    }

    static 
    {
        boolean flag;
        if (!ioio/lib/impl/IncomingState.desiredAssertionStatus())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        $assertionsDisabled = flag;
    }

    er()
    {
        this$0 = IncomingState.this;
        super();
        listeners_ = new ConcurrentLinkedQueue();
        currentOpen_ = false;
    }
}
