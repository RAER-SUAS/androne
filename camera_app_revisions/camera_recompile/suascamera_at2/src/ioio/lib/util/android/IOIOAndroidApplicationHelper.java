// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util.android;

import android.content.ContextWrapper;
import ioio.lib.util.IOIOBaseApplicationHelper;
import ioio.lib.util.IOIOConnectionRegistry;
import ioio.lib.util.IOIOLooperProvider;

// Referenced classes of package ioio.lib.util.android:
//            AndroidIOIOConnectionManager

public class IOIOAndroidApplicationHelper extends IOIOBaseApplicationHelper
{

    private final AndroidIOIOConnectionManager manager_;

    public IOIOAndroidApplicationHelper(ContextWrapper contextwrapper, IOIOLooperProvider ioiolooperprovider)
    {
        super(ioiolooperprovider);
        manager_ = new AndroidIOIOConnectionManager(contextwrapper, this);
    }

    public void create()
    {
        manager_.create();
    }

    public void destroy()
    {
        manager_.destroy();
    }

    public void restart()
    {
        manager_.restart();
    }

    public void start()
    {
        manager_.start();
    }

    public void stop()
    {
        manager_.stop();
    }

    static 
    {
        IOIOConnectionRegistry.addBootstraps(new String[] {
            "ioio.lib.impl.SocketIOIOConnectionBootstrap", "ioio.lib.android.accessory.AccessoryConnectionBootstrap", "ioio.lib.android.bluetooth.BluetoothIOIOConnectionBootstrap"
        });
    }
}
