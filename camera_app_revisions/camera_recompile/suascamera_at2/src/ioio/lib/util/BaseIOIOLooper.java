// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util;

import ioio.lib.api.IOIO;
import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.util:
//            IOIOLooper

public class BaseIOIOLooper
    implements IOIOLooper
{

    protected IOIO ioio_;

    public BaseIOIOLooper()
    {
    }

    public void disconnected()
    {
    }

    public void incompatible()
    {
    }

    public void loop()
        throws ConnectionLostException, InterruptedException
    {
        Thread.sleep(20L);
    }

    protected void setup()
        throws ConnectionLostException, InterruptedException
    {
    }

    public final void setup(IOIO ioio)
        throws ConnectionLostException, InterruptedException
    {
        ioio_ = ioio;
        setup();
    }
}
