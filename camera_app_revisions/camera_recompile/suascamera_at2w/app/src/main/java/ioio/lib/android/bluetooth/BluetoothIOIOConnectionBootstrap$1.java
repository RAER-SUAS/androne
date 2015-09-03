// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.android.bluetooth;

import android.bluetooth.BluetoothDevice;
import ioio.lib.api.IOIOConnection;
import ioio.lib.spi.IOIOConnectionFactory;

// Referenced classes of package ioio.lib.android.bluetooth:
//            BluetoothIOIOConnectionBootstrap, BluetoothIOIOConnection

class val.device
    implements IOIOConnectionFactory
{

    final BluetoothIOIOConnectionBootstrap this$0;
    private final BluetoothDevice val$device;

    public IOIOConnection createConnection()
    {
        return new BluetoothIOIOConnection(val$device);
    }

    public Object getExtra()
    {
        return ((Object) (new Object[] {
            val$device.getName(), val$device.getAddress()
        }));
    }

    public String getType()
    {
        return ioio/lib/android/bluetooth/BluetoothIOIOConnection.getCanonicalName();
    }

    ()
    {
        this$0 = final_bluetoothioioconnectionbootstrap;
        val$device = BluetoothDevice.this;
        super();
    }
}
