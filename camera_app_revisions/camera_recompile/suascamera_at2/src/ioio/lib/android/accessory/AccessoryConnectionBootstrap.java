// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.android.accessory;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import com.android.future.usb.UsbAccessory;
import com.android.future.usb.UsbManager;
import ioio.lib.api.IOIOConnection;
import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.spi.IOIOConnectionBootstrap;
import ioio.lib.spi.IOIOConnectionFactory;
import ioio.lib.spi.NoRuntimeSupportException;
import ioio.lib.util.android.ContextWrapperDependent;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;

public class AccessoryConnectionBootstrap extends BroadcastReceiver
    implements ContextWrapperDependent, IOIOConnectionBootstrap, IOIOConnectionFactory
{
    private class Connection
        implements IOIOConnection
    {

        private InstanceState instanceState_;
        private InputStream localInputStream_;
        private OutputStream localOutputStream_;
        final AccessoryConnectionBootstrap this$0;

        private void trySleep(long l)
        {
            synchronized (AccessoryConnectionBootstrap.this)
            {
                try
                {
                    wait(l);
                }
                // Misplaced declaration of an exception variable
                catch (InterruptedException interruptedexception) { }
            }
            return;
            exception;
            accessoryconnectionbootstrap;
            JVM INSTR monitorexit ;
            InterruptedException interruptedexception;
            throw exception;
        }

        public boolean canClose()
        {
            return false;
        }

        public void disconnect()
        {
            synchronized (AccessoryConnectionBootstrap.this)
            {
                instanceState_ = InstanceState.DEAD;
                notifyAll();
            }
            return;
            exception;
            accessoryconnectionbootstrap;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public InputStream getInputStream()
            throws ConnectionLostException
        {
            return localInputStream_;
        }

        public OutputStream getOutputStream()
            throws ConnectionLostException
        {
            return localOutputStream_;
        }

        public void waitForConnect()
            throws ConnectionLostException
        {
            AccessoryConnectionBootstrap accessoryconnectionbootstrap = AccessoryConnectionBootstrap.this;
            accessoryconnectionbootstrap;
            JVM INSTR monitorenter ;
            if (instanceState_ != InstanceState.INIT)
            {
                throw new IllegalStateException("waitForConnect() may only be called once");
            }
              goto _L1
            Exception exception;
            exception;
            accessoryconnectionbootstrap;
            JVM INSTR monitorexit ;
            throw exception;
_L3:
            try
            {
                wait();
            }
            catch (InterruptedException interruptedexception) { }
_L1:
            if (instanceState_ != InstanceState.DEAD && state_ != State.OPEN) goto _L3; else goto _L2
_L2:
            if (instanceState_ == InstanceState.DEAD)
            {
                throw new ConnectionLostException();
            }
            localInputStream_ = inputStream_;
            localOutputStream_ = outputStream_;
            accessoryconnectionbootstrap;
            JVM INSTR monitorexit ;
_L4:
            try
            {
                if (instanceState_ == InstanceState.CONNECTED)
                {
                    return;
                }
            }
            catch (IOException ioexception)
            {
                instanceState_ = InstanceState.DEAD;
                trySleep(1000L);
                throw new ConnectionLostException();
            }
            if (instanceState_ == InstanceState.DEAD || state_ != State.OPEN)
            {
                throw new ConnectionLostException();
            }
label0:
            {
                localOutputStream_.write(0);
                if (localInputStream_.read() != 1)
                {
                    break label0;
                }
                instanceState_ = InstanceState.CONNECTED;
            }
              goto _L4
            trySleep(1000L);
              goto _L4
        }

        private Connection()
        {
            this$0 = AccessoryConnectionBootstrap.this;
            super();
            instanceState_ = InstanceState.INIT;
        }

        Connection(Connection connection)
        {
            this();
        }
    }

    private static final class InstanceState extends Enum
    {

        public static final InstanceState CONNECTED;
        public static final InstanceState DEAD;
        private static final InstanceState ENUM$VALUES[];
        public static final InstanceState INIT;

        public static InstanceState valueOf(String s)
        {
            return (InstanceState)Enum.valueOf(ioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState, s);
        }

        public static InstanceState[] values()
        {
            InstanceState ainstancestate[] = ENUM$VALUES;
            int i = ainstancestate.length;
            InstanceState ainstancestate1[] = new InstanceState[i];
            System.arraycopy(ainstancestate, 0, ainstancestate1, 0, i);
            return ainstancestate1;
        }

        static 
        {
            INIT = new InstanceState("INIT", 0);
            CONNECTED = new InstanceState("CONNECTED", 1);
            DEAD = new InstanceState("DEAD", 2);
            ENUM$VALUES = (new InstanceState[] {
                INIT, CONNECTED, DEAD
            });
        }

        private InstanceState(String s, int i)
        {
            super(s, i);
        }
    }

    private static final class State extends Enum
    {

        public static final State CLOSED;
        private static final State ENUM$VALUES[];
        public static final State OPEN;
        public static final State WAIT_PERMISSION;

        public static State valueOf(String s)
        {
            return (State)Enum.valueOf(ioio/lib/android/accessory/AccessoryConnectionBootstrap$State, s);
        }

        public static State[] values()
        {
            State astate[] = ENUM$VALUES;
            int i = astate.length;
            State astate1[] = new State[i];
            System.arraycopy(astate, 0, astate1, 0, i);
            return astate1;
        }

        static 
        {
            CLOSED = new State("CLOSED", 0);
            WAIT_PERMISSION = new State("WAIT_PERMISSION", 1);
            OPEN = new State("OPEN", 2);
            ENUM$VALUES = (new State[] {
                CLOSED, WAIT_PERMISSION, OPEN
            });
        }

        private State(String s, int i)
        {
            super(s, i);
        }
    }


    private static final String ACTION_USB_PERMISSION = "ioio.lib.accessory.action.USB_PERMISSION";
    private static final String TAG = "AccessoryIOIOConnection";
    private UsbAccessory accessory_;
    private ContextWrapper activity_;
    private ParcelFileDescriptor fileDescriptor_;
    private FileInputStream inputStream_;
    private FileOutputStream outputStream_;
    private PendingIntent pendingIntent_;
    private State state_;
    private UsbManager usbManager_;

    public AccessoryConnectionBootstrap()
        throws NoRuntimeSupportException
    {
        state_ = State.CLOSED;
        try
        {
            Class.forName("com.android.future.usb.UsbManager");
            return;
        }
        catch (ClassNotFoundException classnotfoundexception)
        {
            throw new NoRuntimeSupportException("Accessory is not supported on this device.");
        }
    }

    private void closeStreams()
    {
        try
        {
            fileDescriptor_.close();
            return;
        }
        catch (IOException ioexception)
        {
            Log.e("AccessoryIOIOConnection", "Failed to proprly close accessory", ioexception);
        }
    }

    private void openStreams()
    {
        fileDescriptor_ = usbManager_.openAccessory(accessory_);
        if (fileDescriptor_ != null)
        {
            java.io.FileDescriptor filedescriptor = fileDescriptor_.getFileDescriptor();
            inputStream_ = new FileInputStream(filedescriptor);
            outputStream_ = new FileOutputStream(filedescriptor);
            setState(State.OPEN);
            return;
        }
        try
        {
            throw new IOException("Failed to open file descriptor");
        }
        catch (IOException ioexception)
        {
            Log.e("AccessoryIOIOConnection", "Failed to open streams", ioexception);
        }
        setState(State.CLOSED);
        return;
    }

    private void registerReceiver()
    {
        IntentFilter intentfilter = new IntentFilter("ioio.lib.accessory.action.USB_PERMISSION");
        intentfilter.addAction("android.hardware.usb.action.USB_ACCESSORY_DETACHED");
        activity_.registerReceiver(this, intentfilter);
    }

    private void setState(State state)
    {
        state_ = state;
        notifyAll();
    }

    private void unregisterReceiver()
    {
        activity_.unregisterReceiver(this);
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        if (state_ != State.OPEN) goto _L2; else goto _L1
_L1:
        closeStreams();
_L4:
        setState(State.CLOSED);
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (state_ != State.WAIT_PERMISSION) goto _L4; else goto _L3
_L3:
        pendingIntent_.cancel();
          goto _L4
        Exception exception;
        exception;
        throw exception;
    }

    public IOIOConnection createConnection()
    {
        return new Connection(null);
    }

    public Object getExtra()
    {
        return null;
    }

    public void getFactories(Collection collection)
    {
        collection.add(this);
    }

    public String getType()
    {
        return ioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection.getCanonicalName();
    }

    public void onCreate(ContextWrapper contextwrapper)
    {
        activity_ = contextwrapper;
        usbManager_ = UsbManager.getInstance(contextwrapper);
        registerReceiver();
    }

    public void onDestroy()
    {
        unregisterReceiver();
    }

    public void onReceive(Context context, Intent intent)
    {
        this;
        JVM INSTR monitorenter ;
        context = intent.getAction();
        if (!"android.hardware.usb.action.USB_ACCESSORY_DETACHED".equals(context)) goto _L2; else goto _L1
_L1:
        close();
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (!"ioio.lib.accessory.action.USB_PERMISSION".equals(context)) goto _L4; else goto _L3
_L3:
        if (!intent.getBooleanExtra("permission", false))
        {
            break MISSING_BLOCK_LABEL_54;
        }
        openStreams();
          goto _L4
        context;
        throw context;
        Log.e("AccessoryIOIOConnection", "Permission denied");
        setState(State.CLOSED);
          goto _L4
    }

    public void open()
    {
        this;
        JVM INSTR monitorenter ;
        Object obj;
        State state;
        obj = state_;
        state = State.CLOSED;
        if (obj == state) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        obj = usbManager_.getAccessoryList();
        if (obj == null)
        {
            obj = null;
        } else
        {
            obj = obj[0];
        }
        accessory_ = ((UsbAccessory) (obj));
        if (accessory_ == null)
        {
            break MISSING_BLOCK_LABEL_125;
        }
        if (!usbManager_.hasPermission(accessory_))
        {
            break MISSING_BLOCK_LABEL_78;
        }
        openStreams();
          goto _L1
        obj;
        throw obj;
        pendingIntent_ = PendingIntent.getBroadcast(activity_, 0, new Intent("ioio.lib.accessory.action.USB_PERMISSION"), 0);
        usbManager_.requestPermission(accessory_, pendingIntent_);
        setState(State.WAIT_PERMISSION);
          goto _L1
        Log.d("AccessoryIOIOConnection", "No accessory found.");
          goto _L1
    }

    public void reopen()
    {
        open();
    }



}
