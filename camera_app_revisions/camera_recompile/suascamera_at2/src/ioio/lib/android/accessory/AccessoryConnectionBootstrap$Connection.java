// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.android.accessory;

import ioio.lib.api.IOIOConnection;
import ioio.lib.api.exception.ConnectionLostException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

// Referenced classes of package ioio.lib.android.accessory:
//            AccessoryConnectionBootstrap

private class <init>
    implements IOIOConnection
{

    private te instanceState_;
    private InputStream localInputStream_;
    private OutputStream localOutputStream_;
    final AccessoryConnectionBootstrap this$0;

    private void trySleep(long l)
    {
        synchronized (AccessoryConnectionBootstrap.this)
        {
            try
            {
                wait(l);
            }
            // Misplaced declaration of an exception variable
            catch (InterruptedException interruptedexception) { }
        }
        return;
        exception;
        accessoryconnectionbootstrap;
        JVM INSTR monitorexit ;
        InterruptedException interruptedexception;
        throw exception;
    }

    public boolean canClose()
    {
        return false;
    }

    public void disconnect()
    {
        synchronized (AccessoryConnectionBootstrap.this)
        {
            instanceState_ = te.DEAD;
            notifyAll();
        }
        return;
        exception;
        accessoryconnectionbootstrap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public InputStream getInputStream()
        throws ConnectionLostException
    {
        return localInputStream_;
    }

    public OutputStream getOutputStream()
        throws ConnectionLostException
    {
        return localOutputStream_;
    }

    public void waitForConnect()
        throws ConnectionLostException
    {
        AccessoryConnectionBootstrap accessoryconnectionbootstrap = AccessoryConnectionBootstrap.this;
        accessoryconnectionbootstrap;
        JVM INSTR monitorenter ;
        if (instanceState_ != te.INIT)
        {
            throw new IllegalStateException("waitForConnect() may only be called once");
        }
          goto _L1
        Exception exception;
        exception;
        accessoryconnectionbootstrap;
        JVM INSTR monitorexit ;
        throw exception;
_L3:
        try
        {
            wait();
        }
        catch (InterruptedException interruptedexception) { }
_L1:
        if (instanceState_ != te.DEAD && AccessoryConnectionBootstrap.access$0(AccessoryConnectionBootstrap.this) != this._fld0) goto _L3; else goto _L2
_L2:
        if (instanceState_ == te.DEAD)
        {
            throw new ConnectionLostException();
        }
        localInputStream_ = AccessoryConnectionBootstrap.access$1(AccessoryConnectionBootstrap.this);
        localOutputStream_ = AccessoryConnectionBootstrap.access$2(AccessoryConnectionBootstrap.this);
        accessoryconnectionbootstrap;
        JVM INSTR monitorexit ;
_L4:
        try
        {
            if (instanceState_ == te.CONNECTED)
            {
                return;
            }
        }
        catch (IOException ioexception)
        {
            instanceState_ = te.DEAD;
            trySleep(1000L);
            throw new ConnectionLostException();
        }
        if (instanceState_ == te.DEAD || AccessoryConnectionBootstrap.access$0(AccessoryConnectionBootstrap.this) != this._fld0)
        {
            throw new ConnectionLostException();
        }
label0:
        {
            localOutputStream_.write(0);
            if (localInputStream_.read() != 1)
            {
                break label0;
            }
            instanceState_ = te.CONNECTED;
        }
          goto _L4
        trySleep(1000L);
          goto _L4
    }

    private te()
    {
        this$0 = AccessoryConnectionBootstrap.this;
        super();
        instanceState_ = te.INIT;
    }

    te.INIT(te.INIT init)
    {
        this();
    }
}
