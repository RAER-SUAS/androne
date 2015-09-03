// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util;

import ioio.lib.spi.IOIOConnectionFactory;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

// Referenced classes of package ioio.lib.util:
//            IOIOConnectionRegistry

public class IOIOConnectionManager
{
    public static interface IOIOConnectionThreadProvider
    {

        public abstract Thread createThreadFromFactory(IOIOConnectionFactory ioioconnectionfactory);
    }

    public static abstract class Thread extends java.lang.Thread
    {

        public abstract void abort();

        public Thread()
        {
        }
    }


    private final IOIOConnectionThreadProvider provider_;
    private Collection threads_;

    public IOIOConnectionManager(IOIOConnectionThreadProvider ioioconnectionthreadprovider)
    {
        threads_ = new LinkedList();
        provider_ = ioioconnectionthreadprovider;
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
            ((Thread)iterator.next()).abort();
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
                obj = provider_.createThreadFromFactory(((IOIOConnectionFactory) (obj)));
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
            ((Thread)iterator.next()).join();
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
            ((Thread)iterator.next()).start();
        } while (true);
    }

    public void start()
    {
        createAllThreads();
        startAllThreads();
    }

    public void stop()
    {
        abortAllThreads();
        try
        {
            joinAllThreads();
            return;
        }
        catch (InterruptedException interruptedexception)
        {
            return;
        }
    }
}
