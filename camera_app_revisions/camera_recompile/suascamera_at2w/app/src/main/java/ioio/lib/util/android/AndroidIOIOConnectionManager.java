// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util.android;

import android.content.ContextWrapper;
import ioio.lib.spi.IOIOConnectionBootstrap;
import ioio.lib.util.IOIOConnectionManager;
import ioio.lib.util.IOIOConnectionRegistry;
import java.util.Collection;
import java.util.Iterator;

// Referenced classes of package ioio.lib.util.android:
//            ContextWrapperDependent

public class AndroidIOIOConnectionManager extends IOIOConnectionManager
{

    private Collection bootstraps_;
    private final ContextWrapper contextWrapper_;

    public AndroidIOIOConnectionManager(ContextWrapper contextwrapper, ioio.lib.util.IOIOConnectionManager.IOIOConnectionThreadProvider ioioconnectionthreadprovider)
    {
        super(ioioconnectionthreadprovider);
        bootstraps_ = IOIOConnectionRegistry.getBootstraps();
        contextWrapper_ = contextwrapper;
    }

    public void create()
    {
        Iterator iterator = bootstraps_.iterator();
        do
        {
            IOIOConnectionBootstrap ioioconnectionbootstrap;
            do
            {
                if (!iterator.hasNext())
                {
                    return;
                }
                ioioconnectionbootstrap = (IOIOConnectionBootstrap)iterator.next();
            } while (!(ioioconnectionbootstrap instanceof ContextWrapperDependent));
            ((ContextWrapperDependent)ioioconnectionbootstrap).onCreate(contextWrapper_);
        } while (true);
    }

    public void destroy()
    {
        Iterator iterator = bootstraps_.iterator();
        do
        {
            IOIOConnectionBootstrap ioioconnectionbootstrap;
            do
            {
                if (!iterator.hasNext())
                {
                    return;
                }
                ioioconnectionbootstrap = (IOIOConnectionBootstrap)iterator.next();
            } while (!(ioioconnectionbootstrap instanceof ContextWrapperDependent));
            ((ContextWrapperDependent)ioioconnectionbootstrap).onDestroy();
        } while (true);
    }

    public void restart()
    {
        Iterator iterator = bootstraps_.iterator();
        do
        {
            IOIOConnectionBootstrap ioioconnectionbootstrap;
            do
            {
                if (!iterator.hasNext())
                {
                    return;
                }
                ioioconnectionbootstrap = (IOIOConnectionBootstrap)iterator.next();
            } while (!(ioioconnectionbootstrap instanceof ContextWrapperDependent));
            ((ContextWrapperDependent)ioioconnectionbootstrap).reopen();
        } while (true);
    }

    public void start()
    {
        Iterator iterator = bootstraps_.iterator();
        do
        {
            IOIOConnectionBootstrap ioioconnectionbootstrap;
            do
            {
                if (!iterator.hasNext())
                {
                    super.start();
                    return;
                }
                ioioconnectionbootstrap = (IOIOConnectionBootstrap)iterator.next();
            } while (!(ioioconnectionbootstrap instanceof ContextWrapperDependent));
            ((ContextWrapperDependent)ioioconnectionbootstrap).open();
        } while (true);
    }

    public void stop()
    {
        super.stop();
        Iterator iterator = bootstraps_.iterator();
        do
        {
            IOIOConnectionBootstrap ioioconnectionbootstrap;
            do
            {
                if (!iterator.hasNext())
                {
                    return;
                }
                ioioconnectionbootstrap = (IOIOConnectionBootstrap)iterator.next();
            } while (!(ioioconnectionbootstrap instanceof ContextWrapperDependent));
            ((ContextWrapperDependent)ioioconnectionbootstrap).close();
        } while (true);
    }
}
