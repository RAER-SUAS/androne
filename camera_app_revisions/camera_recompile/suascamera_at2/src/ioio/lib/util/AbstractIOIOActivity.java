// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import ioio.lib.api.IOIO;
import ioio.lib.api.IOIOFactory;
import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.api.exception.IncompatibilityException;
import ioio.lib.spi.IOIOConnectionBootstrap;
import ioio.lib.spi.IOIOConnectionFactory;
import ioio.lib.spi.Log;
import ioio.lib.util.android.ContextWrapperDependent;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

// Referenced classes of package ioio.lib.util:
//            IOIOConnectionRegistry

public abstract class AbstractIOIOActivity extends Activity
{
    protected abstract class IOIOThread extends Thread
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

        protected IOIOThread()
        {
            this$0 = AbstractIOIOActivity.this;
            super();
            abort_ = false;
            connected_ = true;
            connectionFactory_ = currentConnectionFactory_;
        }
    }


    private static final String TAG = "AbstractIOIOActivity";
    private Collection bootstraps_;
    private IOIOConnectionFactory currentConnectionFactory_;
    private Collection threads_;

    public AbstractIOIOActivity()
    {
        threads_ = new LinkedList();
        bootstraps_ = IOIOConnectionRegistry.getBootstraps();
    }

    private void abortAllThreads()
    {
        Iterator iterator = threads_.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return;
            }
            ((IOIOThread)iterator.next()).abort();
        } while (true);
    }

    private void createAllThreads()
    {
        threads_.clear();
        Iterator iterator = IOIOConnectionRegistry.getConnectionFactories().iterator();
        do
        {
            Object obj;
            do
            {
                if (!iterator.hasNext())
                {
                    return;
                }
                obj = (IOIOConnectionFactory)iterator.next();
                currentConnectionFactory_ = ((IOIOConnectionFactory) (obj));
                obj = createIOIOThread(((IOIOConnectionFactory) (obj)).getType(), ((IOIOConnectionFactory) (obj)).getExtra());
            } while (obj == null);
            threads_.add(obj);
        } while (true);
    }

    private void joinAllThreads()
        throws InterruptedException
    {
        Iterator iterator = threads_.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return;
            }
            ((IOIOThread)iterator.next()).join();
        } while (true);
    }

    private void startAllThreads()
    {
        Iterator iterator = threads_.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return;
            }
            ((IOIOThread)iterator.next()).start();
        } while (true);
    }

    protected IOIOThread createIOIOThread()
    {
        throw new RuntimeException("Client must override on of the createIOIOThread overloads!");
    }

    protected IOIOThread createIOIOThread(String s, Object obj)
    {
        return createIOIOThread();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        bundle = bootstraps_.iterator();
        do
        {
            IOIOConnectionBootstrap ioioconnectionbootstrap;
            do
            {
                if (!bundle.hasNext())
                {
                    return;
                }
                ioioconnectionbootstrap = (IOIOConnectionBootstrap)bundle.next();
            } while (!(ioioconnectionbootstrap instanceof ContextWrapperDependent));
            ((ContextWrapperDependent)ioioconnectionbootstrap).onCreate(this);
        } while (true);
    }

    protected void onDestroy()
    {
        Iterator iterator = bootstraps_.iterator();
        do
        {
            IOIOConnectionBootstrap ioioconnectionbootstrap;
            do
            {
                if (!iterator.hasNext())
                {
                    super.onDestroy();
                    return;
                }
                ioioconnectionbootstrap = (IOIOConnectionBootstrap)iterator.next();
            } while (!(ioioconnectionbootstrap instanceof ContextWrapperDependent));
            ((ContextWrapperDependent)ioioconnectionbootstrap).onDestroy();
        } while (true);
    }

    protected void onNewIntent(Intent intent)
    {
        super.onNewIntent(intent);
        if ((intent.getFlags() & 0x10000000) == 0) goto _L2; else goto _L1
_L1:
        intent = bootstraps_.iterator();
_L5:
        if (intent.hasNext()) goto _L3; else goto _L2
_L2:
        return;
_L3:
        IOIOConnectionBootstrap ioioconnectionbootstrap = (IOIOConnectionBootstrap)intent.next();
        if (ioioconnectionbootstrap instanceof ContextWrapperDependent)
        {
            ((ContextWrapperDependent)ioioconnectionbootstrap).open();
        }
        if (true) goto _L5; else goto _L4
_L4:
    }

    protected void onStart()
    {
        super.onStart();
        Iterator iterator = bootstraps_.iterator();
        do
        {
            IOIOConnectionBootstrap ioioconnectionbootstrap;
            do
            {
                if (!iterator.hasNext())
                {
                    createAllThreads();
                    startAllThreads();
                    return;
                }
                ioioconnectionbootstrap = (IOIOConnectionBootstrap)iterator.next();
            } while (!(ioioconnectionbootstrap instanceof ContextWrapperDependent));
            ((ContextWrapperDependent)ioioconnectionbootstrap).open();
        } while (true);
    }

    protected void onStop()
    {
        abortAllThreads();
        Iterator iterator;
        try
        {
            joinAllThreads();
        }
        catch (InterruptedException interruptedexception) { }
        iterator = bootstraps_.iterator();
        do
        {
            IOIOConnectionBootstrap ioioconnectionbootstrap;
            do
            {
                if (!iterator.hasNext())
                {
                    super.onStop();
                    return;
                }
                ioioconnectionbootstrap = (IOIOConnectionBootstrap)iterator.next();
            } while (!(ioioconnectionbootstrap instanceof ContextWrapperDependent));
            ((ContextWrapperDependent)ioioconnectionbootstrap).close();
        } while (true);
    }

    static 
    {
        IOIOConnectionRegistry.addBootstraps(new String[] {
            "ioio.lib.android.accessory.AccessoryConnectionBootstrap", "ioio.lib.android.bluetooth.BluetoothIOIOConnectionBootstrap"
        });
    }

}
