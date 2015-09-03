// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util;

import ioio.lib.spi.IOIOConnectionBootstrap;
import ioio.lib.spi.Log;
import ioio.lib.spi.NoRuntimeSupportException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

public class IOIOConnectionRegistry
{

    private static final String TAG = "IOIOConnectionRegistry";
    private static Collection bootstraps_ = new LinkedList();

    public IOIOConnectionRegistry()
    {
    }

    private static void addBootstrap(String s)
    {
        try
        {
            Class class1 = Class.forName(s).asSubclass(ioio/lib/spi/IOIOConnectionBootstrap);
            bootstraps_.add((IOIOConnectionBootstrap)class1.newInstance());
            Log.d("IOIOConnectionRegistry", (new StringBuilder("Successfully added bootstrap class: ")).append(s).toString());
            return;
        }
        catch (ClassNotFoundException classnotfoundexception)
        {
            Log.d("IOIOConnectionRegistry", (new StringBuilder("Bootstrap class not found: ")).append(s).append(". Not adding.").toString());
            return;
        }
        catch (NoRuntimeSupportException noruntimesupportexception)
        {
            Log.d("IOIOConnectionRegistry", (new StringBuilder("No runtime support for: ")).append(s).append(". Not adding.").toString());
            return;
        }
        // Misplaced declaration of an exception variable
        catch (String s)
        {
            Log.e("IOIOConnectionRegistry", "Exception caught while attempting to initialize connection factory", s);
        }
    }

    public static void addBootstraps(String as[])
    {
        int j = as.length;
        int i = 0;
        do
        {
            if (i >= j)
            {
                return;
            }
            addBootstrap(as[i]);
            i++;
        } while (true);
    }

    public static Collection getBootstraps()
    {
        return bootstraps_;
    }

    public static Collection getConnectionFactories()
    {
        LinkedList linkedlist = new LinkedList();
        Iterator iterator = bootstraps_.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return linkedlist;
            }
            ((IOIOConnectionBootstrap)iterator.next()).getFactories(linkedlist);
        } while (true);
    }

}
