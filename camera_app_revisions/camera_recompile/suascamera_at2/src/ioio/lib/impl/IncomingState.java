// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.spi.Log;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.ConcurrentLinkedQueue;

// Referenced classes of package ioio.lib.impl:
//            Board

class IncomingState
    implements IOIOProtocol.IncomingHandler
{
    static final class ConnectionState extends Enum
    {

        public static final ConnectionState CONNECTED;
        public static final ConnectionState DISCONNECTED;
        private static final ConnectionState ENUM$VALUES[];
        public static final ConnectionState ESTABLISHED;
        public static final ConnectionState INIT;
        public static final ConnectionState UNSUPPORTED_IID;

        public static ConnectionState valueOf(String s)
        {
            return (ConnectionState)Enum.valueOf(ioio/lib/impl/IncomingState$ConnectionState, s);
        }

        public static ConnectionState[] values()
        {
            ConnectionState aconnectionstate[] = ENUM$VALUES;
            int i = aconnectionstate.length;
            ConnectionState aconnectionstate1[] = new ConnectionState[i];
            System.arraycopy(aconnectionstate, 0, aconnectionstate1, 0, i);
            return aconnectionstate1;
        }

        static 
        {
            INIT = new ConnectionState("INIT", 0);
            ESTABLISHED = new ConnectionState("ESTABLISHED", 1);
            CONNECTED = new ConnectionState("CONNECTED", 2);
            DISCONNECTED = new ConnectionState("DISCONNECTED", 3);
            UNSUPPORTED_IID = new ConnectionState("UNSUPPORTED_IID", 4);
            ENUM$VALUES = (new ConnectionState[] {
                INIT, ESTABLISHED, CONNECTED, DISCONNECTED, UNSUPPORTED_IID
            });
        }

        private ConnectionState(String s, int i)
        {
            super(s, i);
        }
    }

    static interface DataModuleListener
    {

        public abstract void dataReceived(byte abyte0[], int i);

        public abstract void reportAdditionalBuffer(int i);
    }

    class DataModuleState
    {

        static final boolean $assertionsDisabled;
        private boolean currentOpen_;
        private Queue listeners_;
        final IncomingState this$0;

        void closeCurrentListener()
        {
            if (currentOpen_)
            {
                currentOpen_ = false;
                listeners_.remove();
            }
        }

        void dataReceived(byte abyte0[], int i)
        {
            if (!$assertionsDisabled && !currentOpen_)
            {
                throw new AssertionError();
            } else
            {
                ((DataModuleListener)listeners_.peek()).dataReceived(abyte0, i);
                return;
            }
        }

        void openNextListener()
        {
            if (!$assertionsDisabled && listeners_.isEmpty())
            {
                throw new AssertionError();
            }
            if (!currentOpen_)
            {
                currentOpen_ = true;
            }
        }

        void pushListener(DataModuleListener datamodulelistener)
        {
            listeners_.add(datamodulelistener);
        }

        public void reportAdditionalBuffer(int i)
        {
            if (!$assertionsDisabled && !currentOpen_)
            {
                throw new AssertionError();
            } else
            {
                ((DataModuleListener)listeners_.peek()).reportAdditionalBuffer(i);
                return;
            }
        }

        static 
        {
            boolean flag;
            if (!ioio/lib/impl/IncomingState.desiredAssertionStatus())
            {
                flag = true;
            } else
            {
                flag = false;
            }
            $assertionsDisabled = flag;
        }

        DataModuleState()
        {
            this$0 = IncomingState.this;
            super();
            listeners_ = new ConcurrentLinkedQueue();
            currentOpen_ = false;
        }
    }

    static interface DisconnectListener
    {

        public abstract void disconnected();
    }

    static interface InputPinListener
    {

        public abstract void setValue(int i);
    }

    class InputPinState
    {

        static final boolean $assertionsDisabled;
        private boolean currentOpen_;
        private Queue listeners_;
        final IncomingState this$0;

        void closeCurrentListener()
        {
            if (currentOpen_)
            {
                currentOpen_ = false;
                listeners_.remove();
            }
        }

        void openNextListener()
        {
            if (!$assertionsDisabled && listeners_.isEmpty())
            {
                throw new AssertionError();
            }
            if (!currentOpen_)
            {
                currentOpen_ = true;
            }
        }

        void pushListener(InputPinListener inputpinlistener)
        {
            listeners_.add(inputpinlistener);
        }

        void setValue(int i)
        {
            if (!$assertionsDisabled && !currentOpen_)
            {
                throw new AssertionError();
            } else
            {
                ((InputPinListener)listeners_.peek()).setValue(i);
                return;
            }
        }

        static 
        {
            boolean flag;
            if (!ioio/lib/impl/IncomingState.desiredAssertionStatus())
            {
                flag = true;
            } else
            {
                flag = false;
            }
            $assertionsDisabled = flag;
        }

        InputPinState()
        {
            this$0 = IncomingState.this;
            super();
            listeners_ = new ConcurrentLinkedQueue();
            currentOpen_ = false;
        }
    }


    static final boolean $assertionsDisabled;
    private static final String TAG = "IncomingState";
    public Board board_;
    public String bootloaderId_;
    private ConnectionState connection_;
    private final Set disconnectListeners_ = new HashSet();
    public String firmwareId_;
    public String hardwareId_;
    private DataModuleState icspState_;
    private DataModuleState incapStates_[];
    private InputPinState intputPinStates_[];
    private DataModuleState spiStates_[];
    private DataModuleState twiStates_[];
    private DataModuleState uartStates_[];

    IncomingState()
    {
        connection_ = ConnectionState.INIT;
    }

    private void checkNotDisconnected()
        throws ConnectionLostException
    {
        if (connection_ == ConnectionState.DISCONNECTED)
        {
            throw new ConnectionLostException();
        } else
        {
            return;
        }
    }

    public void addDisconnectListener(DisconnectListener disconnectlistener)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkNotDisconnected();
        disconnectListeners_.add(disconnectlistener);
        this;
        JVM INSTR monitorexit ;
        return;
        disconnectlistener;
        throw disconnectlistener;
    }

    public void addIcspListener(DataModuleListener datamodulelistener)
    {
        icspState_.pushListener(datamodulelistener);
    }

    public void addIncapListener(int i, DataModuleListener datamodulelistener)
    {
        incapStates_[i].pushListener(datamodulelistener);
    }

    public void addInputPinListener(int i, InputPinListener inputpinlistener)
    {
        intputPinStates_[i].pushListener(inputpinlistener);
    }

    public void addSpiListener(int i, DataModuleListener datamodulelistener)
    {
        spiStates_[i].pushListener(datamodulelistener);
    }

    public void addTwiListener(int i, DataModuleListener datamodulelistener)
    {
        twiStates_[i].pushListener(datamodulelistener);
    }

    public void addUartListener(int i, DataModuleListener datamodulelistener)
    {
        uartStates_[i].pushListener(datamodulelistener);
    }

    public void handleAnalogPinStatus(int i, boolean flag)
    {
        if (flag)
        {
            intputPinStates_[i].openNextListener();
            return;
        } else
        {
            intputPinStates_[i].closeCurrentListener();
            return;
        }
    }

    public void handleCheckInterfaceResponse(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_22;
        }
        ConnectionState connectionstate = ConnectionState.CONNECTED;
_L1:
        connection_ = connectionstate;
        notifyAll();
        this;
        JVM INSTR monitorexit ;
        return;
        connectionstate = ConnectionState.UNSUPPORTED_IID;
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    public void handleConnectionLost()
    {
        this;
        JVM INSTR monitorenter ;
        connection_ = ConnectionState.DISCONNECTED;
        this;
        JVM INSTR monitorexit ;
        Object obj = disconnectListeners_.iterator();
_L2:
        if (((Iterator) (obj)).hasNext())
        {
            break MISSING_BLOCK_LABEL_53;
        }
        disconnectListeners_.clear();
        this;
        JVM INSTR monitorenter ;
        notifyAll();
        this;
        JVM INSTR monitorexit ;
        return;
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        ((DisconnectListener)((Iterator) (obj)).next()).disconnected();
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void handleEstablishConnection(byte abyte0[], byte abyte1[], byte abyte2[])
    {
        int i;
        hardwareId_ = new String(abyte0);
        bootloaderId_ = new String(abyte1);
        firmwareId_ = new String(abyte2);
        Log.i("IncomingState", (new StringBuilder("IOIO Connection established. Hardware ID: ")).append(hardwareId_).append(" Bootloader ID: ").append(bootloaderId_).append(" Firmware ID: ").append(firmwareId_).toString());
        try
        {
            board_ = Board.valueOf(hardwareId_);
        }
        // Misplaced declaration of an exception variable
        catch (byte abyte0[])
        {
            Log.e("IncomingState", (new StringBuilder("Unknown board: ")).append(hardwareId_).toString());
        }
        if (board_ == null) goto _L2; else goto _L1
_L1:
        abyte0 = board_.hardware;
        intputPinStates_ = new InputPinState[abyte0.numPins()];
        i = 0;
_L18:
        if (i < intputPinStates_.length) goto _L4; else goto _L3
_L3:
        uartStates_ = new DataModuleState[abyte0.numUartModules()];
        i = 0;
_L13:
        if (i < uartStates_.length) goto _L6; else goto _L5
_L5:
        twiStates_ = new DataModuleState[abyte0.numTwiModules()];
        i = 0;
_L14:
        if (i < twiStates_.length) goto _L8; else goto _L7
_L7:
        spiStates_ = new DataModuleState[abyte0.numSpiModules()];
        i = 0;
_L15:
        if (i < spiStates_.length) goto _L10; else goto _L9
_L9:
        incapStates_ = new DataModuleState[abyte0.incapDoubleModules().length * 2 + abyte0.incapSingleModules().length];
        i = 0;
_L16:
        if (i < incapStates_.length) goto _L12; else goto _L11
_L11:
        icspState_ = new DataModuleState();
_L2:
        this;
        JVM INSTR monitorenter ;
        connection_ = ConnectionState.ESTABLISHED;
        notifyAll();
        this;
        JVM INSTR monitorexit ;
        return;
_L4:
        intputPinStates_[i] = new InputPinState();
        i++;
        continue; /* Loop/switch isn't completed */
_L6:
        uartStates_[i] = new DataModuleState();
        i++;
          goto _L13
_L8:
        twiStates_[i] = new DataModuleState();
        i++;
          goto _L14
_L10:
        spiStates_[i] = new DataModuleState();
        i++;
          goto _L15
_L12:
        incapStates_[i] = new DataModuleState();
        i++;
          goto _L16
        abyte0;
        this;
        JVM INSTR monitorexit ;
        throw abyte0;
        if (true) goto _L18; else goto _L17
_L17:
    }

    public void handleI2cClose(int i)
    {
        twiStates_[i].closeCurrentListener();
    }

    public void handleI2cOpen(int i)
    {
        twiStates_[i].openNextListener();
    }

    public void handleI2cReportTxStatus(int i, int j)
    {
        twiStates_[i].reportAdditionalBuffer(j);
    }

    public void handleI2cResult(int i, int j, byte abyte0[])
    {
        twiStates_[i].dataReceived(abyte0, j);
    }

    public void handleIcspClose()
    {
        icspState_.closeCurrentListener();
    }

    public void handleIcspOpen()
    {
        icspState_.openNextListener();
    }

    public void handleIcspReportRxStatus(int i)
    {
        icspState_.reportAdditionalBuffer(i);
    }

    public void handleIcspResult(int i, byte abyte0[])
    {
        icspState_.dataReceived(abyte0, i);
    }

    public void handleIncapClose(int i)
    {
        incapStates_[i].closeCurrentListener();
    }

    public void handleIncapOpen(int i)
    {
        incapStates_[i].openNextListener();
    }

    public void handleIncapReport(int i, int j, byte abyte0[])
    {
        incapStates_[i].dataReceived(abyte0, j);
    }

    public void handleRegisterPeriodicDigitalSampling(int i, int j)
    {
        if (!$assertionsDisabled)
        {
            throw new AssertionError();
        } else
        {
            return;
        }
    }

    public void handleReportAnalogInStatus(List list, List list1)
    {
        int i = 0;
        do
        {
            if (i >= list.size())
            {
                return;
            }
            intputPinStates_[((Integer)list.get(i)).intValue()].setValue(((Integer)list1.get(i)).intValue());
            i++;
        } while (true);
    }

    public void handleReportDigitalInStatus(int i, boolean flag)
    {
        InputPinState inputpinstate = intputPinStates_[i];
        if (flag)
        {
            i = 1;
        } else
        {
            i = 0;
        }
        inputpinstate.setValue(i);
    }

    public void handleReportPeriodicDigitalInStatus(int i, boolean aflag[])
    {
    }

    public void handleSetChangeNotify(int i, boolean flag)
    {
        if (flag)
        {
            intputPinStates_[i].openNextListener();
            return;
        } else
        {
            intputPinStates_[i].closeCurrentListener();
            return;
        }
    }

    public void handleSoftReset()
    {
        Object aobj[];
        int i;
        boolean flag;
        int j;
        flag = false;
        aobj = intputPinStates_;
        j = aobj.length;
        i = 0;
_L9:
        if (i < j) goto _L2; else goto _L1
_L1:
        aobj = uartStates_;
        j = aobj.length;
        i = 0;
_L10:
        if (i < j) goto _L4; else goto _L3
_L3:
        aobj = twiStates_;
        j = aobj.length;
        i = 0;
_L11:
        if (i < j) goto _L6; else goto _L5
_L5:
        aobj = spiStates_;
        j = aobj.length;
        i = 0;
_L12:
        if (i < j) goto _L8; else goto _L7
_L7:
        aobj = incapStates_;
        j = aobj.length;
        i = ((flag) ? 1 : 0);
_L13:
        if (i >= j)
        {
            icspState_.closeCurrentListener();
            return;
        }
        break MISSING_BLOCK_LABEL_147;
_L2:
        ((InputPinState) (aobj[i])).closeCurrentListener();
        i++;
          goto _L9
_L4:
        ((DataModuleState) (aobj[i])).closeCurrentListener();
        i++;
          goto _L10
_L6:
        ((DataModuleState) (aobj[i])).closeCurrentListener();
        i++;
          goto _L11
_L8:
        ((DataModuleState) (aobj[i])).closeCurrentListener();
        i++;
          goto _L12
        ((DataModuleState) (aobj[i])).closeCurrentListener();
        i++;
          goto _L13
    }

    public void handleSpiClose(int i)
    {
        spiStates_[i].closeCurrentListener();
    }

    public void handleSpiData(int i, int j, byte abyte0[], int k)
    {
        spiStates_[i].dataReceived(abyte0, k);
    }

    public void handleSpiOpen(int i)
    {
        spiStates_[i].openNextListener();
    }

    public void handleSpiReportTxStatus(int i, int j)
    {
        spiStates_[i].reportAdditionalBuffer(j);
    }

    public void handleUartClose(int i)
    {
        uartStates_[i].closeCurrentListener();
    }

    public void handleUartData(int i, int j, byte abyte0[])
    {
        uartStates_[i].dataReceived(abyte0, j);
    }

    public void handleUartOpen(int i)
    {
        uartStates_[i].openNextListener();
    }

    public void handleUartReportTxStatus(int i, int j)
    {
        uartStates_[i].reportAdditionalBuffer(j);
    }

    public void removeDisconnectListener(DisconnectListener disconnectlistener)
    {
        this;
        JVM INSTR monitorenter ;
        if (connection_ != ConnectionState.DISCONNECTED)
        {
            disconnectListeners_.remove(disconnectlistener);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        disconnectlistener;
        throw disconnectlistener;
    }

    public void waitConnectionEstablished()
        throws InterruptedException, ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
_L2:
        if (connection_ != ConnectionState.INIT)
        {
            if (connection_ == ConnectionState.DISCONNECTED)
            {
                throw new ConnectionLostException();
            }
            break; /* Loop/switch isn't completed */
        }
        break MISSING_BLOCK_LABEL_35;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        wait();
        if (true) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
    }

    public void waitDisconnect()
        throws InterruptedException
    {
        this;
        JVM INSTR monitorenter ;
_L2:
        ConnectionState connectionstate;
        ConnectionState connectionstate1;
        connectionstate = connection_;
        connectionstate1 = ConnectionState.DISCONNECTED;
        if (connectionstate != connectionstate1)
        {
            break MISSING_BLOCK_LABEL_19;
        }
        this;
        JVM INSTR monitorexit ;
        return;
        wait();
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        throw exception;
    }

    public boolean waitForInterfaceSupport()
        throws InterruptedException, ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        if (connection_ == ConnectionState.INIT)
        {
            throw new IllegalStateException("Have to connect before waiting for interface support");
        }
          goto _L1
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
_L3:
        wait();
_L1:
        if (connection_ == ConnectionState.ESTABLISHED) goto _L3; else goto _L2
_L2:
        ConnectionState connectionstate;
        ConnectionState connectionstate1;
        if (connection_ == ConnectionState.DISCONNECTED)
        {
            throw new ConnectionLostException();
        }
        connectionstate = connection_;
        connectionstate1 = ConnectionState.CONNECTED;
        boolean flag;
        if (connectionstate == connectionstate1)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        this;
        JVM INSTR monitorexit ;
        return flag;
    }

    static 
    {
        boolean flag;
        if (!ioio/lib/impl/IncomingState.desiredAssertionStatus())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        $assertionsDisabled = flag;
    }
}
