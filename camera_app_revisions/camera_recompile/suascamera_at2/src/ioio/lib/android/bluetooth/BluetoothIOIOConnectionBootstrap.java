// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.android.bluetooth;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.util.Log;
import ioio.lib.api.IOIOConnection;
import ioio.lib.spi.IOIOConnectionBootstrap;
import ioio.lib.spi.IOIOConnectionFactory;
import ioio.lib.spi.NoRuntimeSupportException;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

// Referenced classes of package ioio.lib.android.bluetooth:
//            BluetoothIOIOConnection

public class BluetoothIOIOConnectionBootstrap
    implements IOIOConnectionBootstrap
{

    private static final String TAG = "BluetoothIOIOConnectionDiscovery";
    private final BluetoothAdapter adapter_;

    public BluetoothIOIOConnectionBootstrap()
        throws NoRuntimeSupportException
    {
        BluetoothAdapter bluetoothadapter;
        try
        {
            adapter_ = BluetoothAdapter.getDefaultAdapter();
            bluetoothadapter = adapter_;
        }
        catch (Throwable throwable)
        {
            throw new NoRuntimeSupportException("Bluetooth is not supported on this device.");
        }
label0:
        {
            if (bluetoothadapter != null)
            {
                return;
            }
            break label0;
        }
    }

    public void getFactories(Collection collection)
    {
        Iterator iterator = adapter_.getBondedDevices().iterator();
_L1:
        if (!iterator.hasNext())
        {
            return;
        }
        try
        {
            final BluetoothDevice device = (BluetoothDevice)iterator.next();
            if (device.getName().startsWith("IOIO"))
            {
                collection.add(new IOIOConnectionFactory() {

                    final BluetoothIOIOConnectionBootstrap this$0;
                    private final BluetoothDevice val$device;

                    public IOIOConnection createConnection()
                    {
                        return new BluetoothIOIOConnection(device);
                    }

                    public Object getExtra()
                    {
                        return ((Object) (new Object[] {
                            device.getName(), device.getAddress()
                        }));
                    }

                    public String getType()
                    {
                        return ioio/lib/android/bluetooth/BluetoothIOIOConnection.getCanonicalName();
                    }

            
            {
                this$0 = BluetoothIOIOConnectionBootstrap.this;
                device = bluetoothdevice;
                super();
            }
                });
            }
        }
        // Misplaced declaration of an exception variable
        catch (Collection collection)
        {
            Log.e("BluetoothIOIOConnectionDiscovery", "Did you forget to declare uses-permission of android.permission.BLUETOOTH?");
            throw collection;
        }
        // Misplaced declaration of an exception variable
        catch (Collection collection)
        {
            Log.w("BluetoothIOIOConnectionDiscovery", "Bluetooth is not supported on this device.", collection);
            return;
        }
          goto _L1
    }
}
