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
//            IOIOBaseApplicationHelper, IOIOLooper

protected static class connectionFactory_ extends connectionFactory_
{

    private boolean abort_;
    private boolean connected_;
    private final IOIOConnectionFactory connectionFactory_;
    protected IOIO ioio_;
    private final IOIOLooper looper_;

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

    public final void run()
    {
        super.interrupt();
_L8:
        if (!abort_) goto _L2; else goto _L1
_L1:
        Log.d("IOIOBaseApplicationHelper", "IOIOThread is exiting");
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
        Object obj;
        obj;
        this;
        JVM INSTR monitorexit ;
        try
        {
            throw obj;
        }
        // Misplaced declaration of an exception variable
        catch (Object obj)
        {
            Log.e("IOIOBaseApplicationHelper", "Failed to create IOIO, aborting IOIOThread!");
        }
        return;
        ioio_ = IOIOFactory.create(connectionFactory_.createConnection());
        this;
        JVM INSTR monitorexit ;
        ioio_.waitForConnect();
        connected_ = true;
        looper_.setup(ioio_);
_L5:
        if (abort_) goto _L4; else goto _L3
_L3:
        ioio.lib.api. ;
        ioio.lib.api. 1;
         = ioio_.getState();
        1 = ioio.lib.api..ioio_;
        if ( == 1)
        {
            break MISSING_BLOCK_LABEL_160;
        }
_L4:
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
            looper_.disconnected();
            connected_ = false;
        }
        continue; /* Loop/switch isn't completed */
        looper_.loop();
          goto _L5
        ;
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
            looper_.disconnected();
            connected_ = false;
        }
        continue; /* Loop/switch isn't completed */
        ;
        this;
        JVM INSTR monitorexit ;
        throw ;
        ;
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
            looper_.disconnected();
            connected_ = false;
        }
        continue; /* Loop/switch isn't completed */
        ;
        this;
        JVM INSTR monitorexit ;
        throw ;
        ;
        Log.e("IOIOBaseApplicationHelper", "Incompatible IOIO firmware", );
        looper_.incompatible();
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
            looper_.disconnected();
            connected_ = false;
        }
        continue; /* Loop/switch isn't completed */
        ;
        this;
        JVM INSTR monitorexit ;
        throw ;
        ;
        Log.e("IOIOBaseApplicationHelper", "Unexpected exception caught", );
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
            looper_.disconnected();
            connected_ = false;
        }
        if (true) goto _L1; else goto _L6
_L6:
        ;
        this;
        JVM INSTR monitorexit ;
        throw ;
        ;
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
            looper_.disconnected();
            connected_ = false;
        }
        throw ;
        ;
        this;
        JVM INSTR monitorexit ;
        throw ;
        ;
        this;
        JVM INSTR monitorexit ;
        throw ;
        if (true) goto _L8; else goto _L7
_L7:
    }

    (IOIOLooper ioiolooper, IOIOConnectionFactory ioioconnectionfactory)
    {
        abort_ = false;
        connected_ = false;
        looper_ = ioiolooper;
        connectionFactory_ = ioioconnectionfactory;
    }
}
