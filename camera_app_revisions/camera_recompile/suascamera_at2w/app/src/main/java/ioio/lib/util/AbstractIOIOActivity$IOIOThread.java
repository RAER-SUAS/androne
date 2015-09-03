// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util;

import ioio.lib.api.IOIO;
import ioio.lib.api.IOIOFactory;
import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.api.exception.IncompatibilityException;
import ioio.lib.spi.IOIOConnectionFactory;
import ioio.lib.spi.Log;

// Referenced classes of package ioio.lib.util:
//            AbstractIOIOActivity

protected abstract class connectionFactory_ extends Thread
{

    private boolean abort_;
    private boolean connected_;
    private final IOIOConnectionFactory connectionFactory_;
    protected IOIO ioio_;
    final AbstractIOIOActivity this$0;

    public final void abort()
    {
        this;
        JVM INSTR monitorenter ;
        abort_ = true;
        if (ioio_ != null)
        {
            ioio_.disconnect();
        }
        if (connected_)
        {
            interrupt();
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    protected void disconnected()
    {
    }

    protected void incompatible()
    {
    }

    protected void loop()
        throws ConnectionLostException, InterruptedException
    {
        sleep(0x186a0L);
    }

    public final void run()
    {
        super.run();
_L6:
        if (!abort_) goto _L2; else goto _L1
_L1:
        Log.d("AbstractIOIOActivity", "IOIOThread is exiting");
        return;
_L2:
        this;
        JVM INSTR monitorenter ;
        if (!abort_)
        {
            break MISSING_BLOCK_LABEL_47;
        }
        this;
        JVM INSTR monitorexit ;
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        try
        {
            throw exception;
        }
        catch (Exception exception1)
        {
            Log.e("AbstractIOIOActivity", "Failed to create IOIO, aborting IOIOThread!");
        }
        return;
        ioio_ = IOIOFactory.create(connectionFactory_.createConnection());
        this;
        JVM INSTR monitorexit ;
        ioio_.waitForConnect();
        connected_ = true;
        setup();
_L3:
        boolean flag = abort_;
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_129;
        }
        Object obj;
        try
        {
            ioio_.waitForDisconnect();
        }
        catch (InterruptedException interruptedexception) { }
        this;
        JVM INSTR monitorenter ;
        ioio_ = null;
        this;
        JVM INSTR monitorexit ;
        if (connected_)
        {
            disconnected();
            connected_ = false;
        }
        continue; /* Loop/switch isn't completed */
        loop();
          goto _L3
        obj;
        try
        {
            ioio_.waitForDisconnect();
        }
        catch (InterruptedException interruptedexception4) { }
        this;
        JVM INSTR monitorenter ;
        ioio_ = null;
        this;
        JVM INSTR monitorexit ;
        if (connected_)
        {
            disconnected();
            connected_ = false;
        }
        continue; /* Loop/switch isn't completed */
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        obj;
        ioio_.disconnect();
        try
        {
            ioio_.waitForDisconnect();
        }
        catch (InterruptedException interruptedexception3) { }
        this;
        JVM INSTR monitorenter ;
        ioio_ = null;
        this;
        JVM INSTR monitorexit ;
        if (connected_)
        {
            disconnected();
            connected_ = false;
        }
        continue; /* Loop/switch isn't completed */
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        obj;
        Log.e("AbstractIOIOActivity", "Incompatible IOIO firmware", ((Throwable) (obj)));
        incompatible();
        try
        {
            ioio_.waitForDisconnect();
        }
        catch (InterruptedException interruptedexception2) { }
        this;
        JVM INSTR monitorenter ;
        ioio_ = null;
        this;
        JVM INSTR monitorexit ;
        if (connected_)
        {
            disconnected();
            connected_ = false;
        }
        continue; /* Loop/switch isn't completed */
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        obj;
        Log.e("AbstractIOIOActivity", "Unexpected exception caught", ((Throwable) (obj)));
        ioio_.disconnect();
        try
        {
            ioio_.waitForDisconnect();
        }
        catch (InterruptedException interruptedexception1) { }
        this;
        JVM INSTR monitorenter ;
        ioio_ = null;
        this;
        JVM INSTR monitorexit ;
        if (connected_)
        {
            disconnected();
            connected_ = false;
        }
        if (true) goto _L1; else goto _L4
_L4:
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        obj;
        try
        {
            ioio_.waitForDisconnect();
        }
        catch (InterruptedException interruptedexception5) { }
        this;
        JVM INSTR monitorenter ;
        ioio_ = null;
        this;
        JVM INSTR monitorexit ;
        if (connected_)
        {
            disconnected();
            connected_ = false;
        }
        throw obj;
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        if (true) goto _L6; else goto _L5
_L5:
    }

    protected void setup()
        throws ConnectionLostException, InterruptedException
    {
    }

    protected ()
    {
        this$0 = AbstractIOIOActivity.this;
        super();
        abort_ = false;
        connected_ = true;
        connectionFactory_ = AbstractIOIOActivity.access$0(AbstractIOIOActivity.this);
    }
}
