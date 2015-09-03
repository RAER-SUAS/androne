// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.impl.IOIOImpl;
import ioio.lib.spi.IOIOConnectionFactory;
import ioio.lib.spi.Log;
import ioio.lib.util.IOIOConnectionRegistry;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;

// Referenced classes of package ioio.lib.api:
//            IOIO, IOIOConnection

public class IOIOFactory
{

    private static final String TAG = "IOIOFactory";

    public IOIOFactory()
    {
    }

    public static IOIO create()
    {
        Object obj = IOIOConnectionRegistry.getConnectionFactories();
        try
        {
            obj = create(((IOIOConnectionFactory)((Collection) (obj)).iterator().next()).createConnection());
        }
        catch (NoSuchElementException nosuchelementexception)
        {
            Log.e("IOIOFactory", "No connection is available. This shouldn't happen.");
            throw nosuchelementexception;
        }
        return ((IOIO) (obj));
    }

    public static IOIO create(IOIOConnection ioioconnection)
    {
        return new IOIOImpl(ioioconnection);
    }
}
