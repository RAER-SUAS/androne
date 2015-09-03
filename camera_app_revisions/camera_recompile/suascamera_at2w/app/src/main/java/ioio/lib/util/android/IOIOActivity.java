// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import ioio.lib.util.IOIOLooper;
import ioio.lib.util.IOIOLooperProvider;

// Referenced classes of package ioio.lib.util.android:
//            IOIOAndroidApplicationHelper

public abstract class IOIOActivity extends Activity
    implements IOIOLooperProvider
{

    private final IOIOAndroidApplicationHelper helper_ = new IOIOAndroidApplicationHelper(this, this);

    public IOIOActivity()
    {
    }

    protected IOIOLooper createIOIOLooper()
    {
        throw new RuntimeException("Client must override one of the createIOIOLooper overloads!");
    }

    public IOIOLooper createIOIOLooper(String s, Object obj)
    {
        return createIOIOLooper();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        helper_.create();
    }

    protected void onDestroy()
    {
        helper_.destroy();
        super.onDestroy();
    }

    protected void onNewIntent(Intent intent)
    {
        super.onNewIntent(intent);
        if ((intent.getFlags() & 0x10000000) != 0)
        {
            helper_.restart();
        }
    }

    protected void onStart()
    {
        super.onStart();
        helper_.start();
    }

    protected void onStop()
    {
        helper_.stop();
        super.onStop();
    }
}
