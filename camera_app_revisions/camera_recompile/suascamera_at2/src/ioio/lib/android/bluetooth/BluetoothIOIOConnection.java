// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.android.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.util.Log;
import ioio.lib.api.IOIOConnection;
import ioio.lib.api.exception.ConnectionLostException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class BluetoothIOIOConnection
    implements IOIOConnection
{

    private static final String TAG = "BluetoothIOIOConnection";
    private final String address_;
    private final BluetoothDevice device_;
    private boolean disconnect_;
    private final String name_;
    private BluetoothSocket socket_;

    public BluetoothIOIOConnection(BluetoothDevice bluetoothdevice)
    {
        socket_ = null;
        disconnect_ = false;
        device_ = bluetoothdevice;
        name_ = bluetoothdevice.getName();
        address_ = bluetoothdevice.getAddress();
    }

    public static BluetoothSocket createSocket(BluetoothDevice bluetoothdevice)
        throws IOException
    {
        if (android.os.Build.VERSION.SDK_INT >= 10)
        {
            return bluetoothdevice.createInsecureRfcommSocketToServiceRecord(UUID.fromString("00001101-0000-1000-8000-00805F9B34FB"));
        } else
        {
            return bluetoothdevice.createRfcommSocketToServiceRecord(UUID.fromString("00001101-0000-1000-8000-00805F9B34FB"));
        }
    }

    public boolean canClose()
    {
        return true;
    }

    public void disconnect()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag = disconnect_;
        if (!flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        BluetoothSocket bluetoothsocket;
        Log.v("BluetoothIOIOConnection", "Client initiated disconnect");
        disconnect_ = true;
        bluetoothsocket = socket_;
        Exception exception;
        if (bluetoothsocket != null)
        {
            try
            {
                socket_.close();
            }
            catch (IOException ioexception) { }
            finally
            {
                this;
            }
        }
        if (true) goto _L1; else goto _L3
_L3:
        JVM INSTR monitorexit ;
        throw exception;
    }

    public InputStream getInputStream()
        throws ConnectionLostException
    {
        InputStream inputstream;
        try
        {
            inputstream = socket_.getInputStream();
        }
        catch (IOException ioexception)
        {
            throw new ConnectionLostException(ioexception);
        }
        return inputstream;
    }

    public OutputStream getOutputStream()
        throws ConnectionLostException
    {
        OutputStream outputstream;
        try
        {
            outputstream = socket_.getOutputStream();
        }
        catch (IOException ioexception)
        {
            throw new ConnectionLostException(ioexception);
        }
        return outputstream;
    }

    public void waitForConnect()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        if (disconnect_)
        {
            throw new ConnectionLostException();
        }
        break MISSING_BLOCK_LABEL_22;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        socket_ = createSocket(device_);
        this;
        JVM INSTR monitorexit ;
_L2:
        IOException ioexception;
        try
        {
            Log.v("BluetoothIOIOConnection", (new StringBuilder("Attempting to connect to Bluetooth device: ")).append(name_).toString());
            socket_.connect();
            Log.v("BluetoothIOIOConnection", (new StringBuilder("Established connection to device ")).append(name_).append(" address: ").append(address_).toString());
            return;
        }
        catch (Exception exception1)
        {
            if (disconnect_)
            {
                throw new ConnectionLostException(exception1);
            }
        }
        break MISSING_BLOCK_LABEL_132;
        ioexception;
        throw new ConnectionLostException(ioexception);
        try
        {
            Thread.sleep(1000L);
        }
        catch (InterruptedException interruptedexception) { }
        if (true) goto _L2; else goto _L1
_L1:
    }
}
