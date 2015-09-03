// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util.android;

import android.app.Service;
import android.content.Intent;
import ioio.lib.util.IOIOLooper;
import ioio.lib.util.IOIOLooperProvider;

// Referenced classes of package ioio.lib.util.android:
//            IOIOAndroidApplicationHelper

public abstract class IOIOService extends Service
    implements IOIOLooperProvider
{

    private final IOIOAndroidApplicationHelper helper_ = new IOIOAndroidApplicationHelper(this, this);
    private boolean started_;

    public IOIOService()
    {
        started_ = false;
    }

    protected IOIOLooper createIOIOLooper()
    {
        throw new RuntimeException("Client must override one of the createIOIOLooper overloads!");
    }

    public IOIOLooper createIOIOLooper(String s, Object obj)
    {
        return createIOIOLooper();
    }

    public void onCreate()
    {
        super.onCreate();
        helper_.create();
    }

    public void onDestroy()
    {
        stop();
        helper_.destroy();
        super.onDestroy();
    }

    public void onStart(Intent intent, int i)
    {
        super.onStart(intent, i);
        if (!started_)
        {
            helper_.start();
            started_ = true;
        } else
        if ((intent.getFlags() & 0x10000000) != 0)
        {
            helper_.restart();
            return;
        }
    }

    protected void stop()
    {
        if (started_)
        {
            helper_.stop();
            started_ = false;
        }
    }
}
