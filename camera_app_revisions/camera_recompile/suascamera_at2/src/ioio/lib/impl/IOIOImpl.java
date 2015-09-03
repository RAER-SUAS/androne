// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.AnalogInput;
import ioio.lib.api.DigitalInput;
import ioio.lib.api.DigitalOutput;
import ioio.lib.api.IOIO;
import ioio.lib.api.IOIOConnection;
import ioio.lib.api.IcspMaster;
import ioio.lib.api.PulseInput;
import ioio.lib.api.PwmOutput;
import ioio.lib.api.SpiMaster;
import ioio.lib.api.TwiMaster;
import ioio.lib.api.Uart;
import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.api.exception.IncompatibilityException;
import ioio.lib.spi.Log;
import java.io.IOException;

// Referenced classes of package ioio.lib.impl:
//            IncomingState, IOIOProtocol, Board, ModuleAllocator, 
//            AnalogInputImpl, DigitalInputImpl, DigitalOutputImpl, IcspMasterImpl, 
//            IncapImpl, PwmImpl, SpiMasterImpl, TwiMasterImpl, 
//            UartImpl

public class IOIOImpl
    implements IOIO, IncomingState.DisconnectListener
{

    private static int $SWITCH_TABLE$ioio$lib$api$IOIO$VersionType[];
    private static final byte REQUIRED_INTERFACE_ID[] = {
        73, 79, 73, 79, 48, 48, 48, 51
    };
    private static final String TAG = "IOIOImpl";
    private IOIOConnection connection_;
    private boolean disconnect_;
    private Board.Hardware hardware_;
    private ModuleAllocator incapAllocatorDouble_;
    private ModuleAllocator incapAllocatorSingle_;
    private IncomingState incomingState_;
    private boolean openIcsp_;
    private boolean openPins_[];
    private boolean openTwi_[];
    IOIOProtocol protocol_;
    private ModuleAllocator pwmAllocator_;
    private ModuleAllocator spiAllocator_;
    private ioio.lib.api.IOIO.State state_;
    private ModuleAllocator uartAllocator_;

    static int[] $SWITCH_TABLE$ioio$lib$api$IOIO$VersionType()
    {
        int ai[] = $SWITCH_TABLE$ioio$lib$api$IOIO$VersionType;
        if (ai != null)
        {
            return ai;
        }
        ai = new int[ioio.lib.api.IOIO.VersionType.values().length];
        try
        {
            ai[ioio.lib.api.IOIO.VersionType.APP_FIRMWARE_VER.ordinal()] = 3;
        }
        catch (NoSuchFieldError nosuchfielderror3) { }
        try
        {
            ai[ioio.lib.api.IOIO.VersionType.BOOTLOADER_VER.ordinal()] = 2;
        }
        catch (NoSuchFieldError nosuchfielderror2) { }
        try
        {
            ai[ioio.lib.api.IOIO.VersionType.HARDWARE_VER.ordinal()] = 1;
        }
        catch (NoSuchFieldError nosuchfielderror1) { }
        try
        {
            ai[ioio.lib.api.IOIO.VersionType.IOIOLIB_VER.ordinal()] = 4;
        }
        catch (NoSuchFieldError nosuchfielderror) { }
        $SWITCH_TABLE$ioio$lib$api$IOIO$VersionType = ai;
        return ai;
    }

    public IOIOImpl(IOIOConnection ioioconnection)
    {
        disconnect_ = false;
        incomingState_ = new IncomingState();
        state_ = ioio.lib.api.IOIO.State.INIT;
        connection_ = ioioconnection;
    }

    private void checkIcspFree()
    {
        if (openIcsp_)
        {
            throw new IllegalArgumentException("ICSP already open");
        } else
        {
            return;
        }
    }

    private void checkInterfaceVersion()
        throws IncompatibilityException, ConnectionLostException, InterruptedException
    {
        try
        {
            protocol_.checkInterface(REQUIRED_INTERFACE_ID);
        }
        catch (IOException ioexception)
        {
            throw new ConnectionLostException(ioexception);
        }
        if (!incomingState_.waitForInterfaceSupport())
        {
            state_ = ioio.lib.api.IOIO.State.INCOMPATIBLE;
            Log.e("IOIOImpl", "Required interface ID is not supported");
            throw new IncompatibilityException((new StringBuilder("IOIO firmware does not support required firmware: ")).append(new String(REQUIRED_INTERFACE_ID)).toString());
        } else
        {
            return;
        }
    }

    private void checkPinFree(int i)
    {
        if (openPins_[i])
        {
            throw new IllegalArgumentException((new StringBuilder("Pin already open: ")).append(i).toString());
        } else
        {
            return;
        }
    }

    private void checkState()
        throws ConnectionLostException
    {
        if (state_ == ioio.lib.api.IOIO.State.DEAD)
        {
            throw new ConnectionLostException();
        }
        if (state_ == ioio.lib.api.IOIO.State.INCOMPATIBLE)
        {
            throw new IllegalStateException("Incompatibility has been reported - IOIO cannot be used");
        }
        if (state_ != ioio.lib.api.IOIO.State.CONNECTED)
        {
            throw new IllegalStateException("Connection has not yet been established");
        } else
        {
            return;
        }
    }

    private void checkTwiFree(int i)
    {
        if (openTwi_[i])
        {
            throw new IllegalArgumentException((new StringBuilder("TWI already open: ")).append(i).toString());
        } else
        {
            return;
        }
    }

    private void initBoard()
        throws IncompatibilityException
    {
        if (incomingState_.board_ == null)
        {
            throw new IncompatibilityException((new StringBuilder("Unknown board: ")).append(incomingState_.hardwareId_).toString());
        } else
        {
            hardware_ = incomingState_.board_.hardware;
            openPins_ = new boolean[hardware_.numPins()];
            openTwi_ = new boolean[hardware_.numTwiModules()];
            openIcsp_ = false;
            pwmAllocator_ = new ModuleAllocator(hardware_.numPwmModules(), "PWM");
            uartAllocator_ = new ModuleAllocator(hardware_.numUartModules(), "UART");
            spiAllocator_ = new ModuleAllocator(hardware_.numSpiModules(), "SPI");
            incapAllocatorDouble_ = new ModuleAllocator(hardware_.incapDoubleModules(), "INCAP_DOUBLE");
            incapAllocatorSingle_ = new ModuleAllocator(hardware_.incapSingleModules(), "INCAP_SINGLE");
            return;
        }
    }

    void addDisconnectListener(IncomingState.DisconnectListener disconnectlistener)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        incomingState_.addDisconnectListener(disconnectlistener);
        this;
        JVM INSTR monitorexit ;
        return;
        disconnectlistener;
        throw disconnectlistener;
    }

    public void beginBatch()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        protocol_.beginBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    void closeIcsp()
    {
        this;
        JVM INSTR monitorenter ;
        Object obj;
        checkState();
        if (!openIcsp_)
        {
            throw new IllegalStateException("ICSP not open");
        }
          goto _L1
_L3:
        return;
_L1:
        try
        {
            openIcsp_ = false;
            int ai[] = hardware_.icspPins();
            openPins_[ai[0]] = false;
            openPins_[ai[1]] = false;
            protocol_.icspClose();
        }
        // Misplaced declaration of an exception variable
        catch (Object obj) { }
        // Misplaced declaration of an exception variable
        catch (int ai[]) { }
        finally
        {
            this;
        }
        if (true) goto _L3; else goto _L2
_L2:
        JVM INSTR monitorexit ;
        throw ai;
    }

    void closeIncap(int i, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        if (!flag) goto _L2; else goto _L1
_L1:
        incapAllocatorDouble_.releaseModule(i);
_L3:
        protocol_.incapClose(i, flag);
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        incapAllocatorSingle_.releaseModule(i);
          goto _L3
        Object obj;
        obj;
          goto _L4
        obj;
        throw obj;
        obj;
          goto _L4
    }

    void closePin(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Object obj;
        checkState();
        if (!openPins_[i])
        {
            throw new IllegalStateException((new StringBuilder("Pin not open: ")).append(i).toString());
        }
          goto _L1
_L3:
        return;
_L1:
        try
        {
            protocol_.setPinDigitalIn(i, ioio.lib.api.DigitalInput.Spec.Mode.FLOATING);
            openPins_[i] = false;
        }
        // Misplaced declaration of an exception variable
        catch (Object obj) { }
        // Misplaced declaration of an exception variable
        catch (Object obj) { }
        finally
        {
            this;
        }
        if (true) goto _L3; else goto _L2
_L2:
        JVM INSTR monitorexit ;
        throw obj;
    }

    void closePwm(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Exception exception;
        try
        {
            checkState();
            pwmAllocator_.releaseModule(i);
            protocol_.setPwmPeriod(i, 0, IOIOProtocol.PwmScale.SCALE_1X);
        }
        catch (IOException ioexception) { }
        catch (ConnectionLostException connectionlostexception) { }
        finally
        {
            this;
        }
        return;
        throw exception;
    }

    void closeSpi(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Exception exception;
        try
        {
            checkState();
            spiAllocator_.releaseModule(i);
            protocol_.spiClose(i);
        }
        catch (IOException ioexception) { }
        catch (ConnectionLostException connectionlostexception) { }
        finally
        {
            this;
        }
        return;
        throw exception;
    }

    void closeTwi(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Object obj;
        checkState();
        if (!openTwi_[i])
        {
            throw new IllegalStateException((new StringBuilder("TWI not open: ")).append(i).toString());
        }
          goto _L1
_L3:
        return;
_L1:
        try
        {
            openTwi_[i] = false;
            int ai[][] = hardware_.twiPins();
            openPins_[ai[i][0]] = false;
            openPins_[ai[i][1]] = false;
            protocol_.i2cClose(i);
        }
        // Misplaced declaration of an exception variable
        catch (Object obj) { }
        // Misplaced declaration of an exception variable
        catch (int ai[][]) { }
        finally
        {
            this;
        }
        if (true) goto _L3; else goto _L2
_L2:
        JVM INSTR monitorexit ;
        throw ai;
    }

    void closeUart(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Exception exception;
        try
        {
            checkState();
            uartAllocator_.releaseModule(i);
            protocol_.uartClose(i);
        }
        catch (IOException ioexception) { }
        catch (ConnectionLostException connectionlostexception) { }
        finally
        {
            this;
        }
        return;
        throw exception;
    }

    public void disconnect()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag;
        Log.d("IOIOImpl", "Client requested disconnect.");
        flag = disconnect_;
        if (!flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        disconnect_ = true;
        if (protocol_ != null && !connection_.canClose())
        {
            protocol_.softClose();
        }
_L4:
        connection_.disconnect();
        if (true) goto _L1; else goto _L3
_L3:
        Object obj;
        obj;
        throw obj;
        obj;
        Log.e("IOIOImpl", "Soft close failed", ((Throwable) (obj)));
          goto _L4
    }

    public void disconnected()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag;
        state_ = ioio.lib.api.IOIO.State.DEAD;
        flag = disconnect_;
        if (!flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        Log.d("IOIOImpl", "Physical disconnect.");
        disconnect_ = true;
        connection_.disconnect();
        if (true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public void endBatch()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        protocol_.endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Object obj;
        obj;
        throw new ConnectionLostException(((Exception) (obj)));
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
    }

    public String getImplVersion(ioio.lib.api.IOIO.VersionType versiontype)
        throws ConnectionLostException
    {
        if (state_ == ioio.lib.api.IOIO.State.INIT)
        {
            throw new IllegalStateException("Connection has not yet been established");
        }
        switch ($SWITCH_TABLE$ioio$lib$api$IOIO$VersionType()[versiontype.ordinal()])
        {
        default:
            return null;

        case 1: // '\001'
            return incomingState_.hardwareId_;

        case 2: // '\002'
            return incomingState_.bootloaderId_;

        case 3: // '\003'
            return incomingState_.firmwareId_;

        case 4: // '\004'
            return "IOIO0326";
        }
    }

    public ioio.lib.api.IOIO.State getState()
    {
        return state_;
    }

    public void hardReset()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        protocol_.hardReset();
        this;
        JVM INSTR monitorexit ;
        return;
        Object obj;
        obj;
        throw new ConnectionLostException(((Exception) (obj)));
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
    }

    public AnalogInput openAnalogInput(int i)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        AnalogInputImpl analoginputimpl;
        checkState();
        hardware_.checkSupportsAnalogInput(i);
        checkPinFree(i);
        analoginputimpl = new AnalogInputImpl(this, i);
        addDisconnectListener(analoginputimpl);
        openPins_[i] = true;
        incomingState_.addInputPinListener(i, analoginputimpl);
        protocol_.setPinAnalogIn(i);
        protocol_.setAnalogInSampling(i, true);
        this;
        JVM INSTR monitorexit ;
        return analoginputimpl;
        IOException ioexception;
        ioexception;
        analoginputimpl.close();
        throw new ConnectionLostException(ioexception);
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public DigitalInput openDigitalInput(int i)
        throws ConnectionLostException
    {
        return openDigitalInput(new ioio.lib.api.DigitalInput.Spec(i));
    }

    public DigitalInput openDigitalInput(int i, ioio.lib.api.DigitalInput.Spec.Mode mode)
        throws ConnectionLostException
    {
        return openDigitalInput(new ioio.lib.api.DigitalInput.Spec(i, mode));
    }

    public DigitalInput openDigitalInput(ioio.lib.api.DigitalInput.Spec spec)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        DigitalInputImpl digitalinputimpl;
        checkState();
        hardware_.checkValidPin(spec.pin);
        checkPinFree(spec.pin);
        digitalinputimpl = new DigitalInputImpl(this, spec.pin);
        addDisconnectListener(digitalinputimpl);
        openPins_[spec.pin] = true;
        incomingState_.addInputPinListener(spec.pin, digitalinputimpl);
        protocol_.setPinDigitalIn(spec.pin, spec.mode);
        protocol_.setChangeNotify(spec.pin, true);
        this;
        JVM INSTR monitorexit ;
        return digitalinputimpl;
        spec;
        digitalinputimpl.close();
        throw new ConnectionLostException(spec);
        spec;
        this;
        JVM INSTR monitorexit ;
        throw spec;
    }

    public DigitalOutput openDigitalOutput(int i)
        throws ConnectionLostException
    {
        return openDigitalOutput(new ioio.lib.api.DigitalOutput.Spec(i), false);
    }

    public DigitalOutput openDigitalOutput(int i, ioio.lib.api.DigitalOutput.Spec.Mode mode, boolean flag)
        throws ConnectionLostException
    {
        return openDigitalOutput(new ioio.lib.api.DigitalOutput.Spec(i, mode), flag);
    }

    public DigitalOutput openDigitalOutput(int i, boolean flag)
        throws ConnectionLostException
    {
        return openDigitalOutput(new ioio.lib.api.DigitalOutput.Spec(i), flag);
    }

    public DigitalOutput openDigitalOutput(ioio.lib.api.DigitalOutput.Spec spec, boolean flag)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        DigitalOutputImpl digitaloutputimpl;
        checkState();
        hardware_.checkValidPin(spec.pin);
        checkPinFree(spec.pin);
        digitaloutputimpl = new DigitalOutputImpl(this, spec.pin, flag);
        addDisconnectListener(digitaloutputimpl);
        openPins_[spec.pin] = true;
        protocol_.setPinDigitalOut(spec.pin, flag, spec.mode);
        this;
        JVM INSTR monitorexit ;
        return digitaloutputimpl;
        spec;
        digitaloutputimpl.close();
        throw new ConnectionLostException(spec);
        spec;
        this;
        JVM INSTR monitorexit ;
        throw spec;
    }

    public IcspMaster openIcspMaster()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        IcspMasterImpl icspmasterimpl;
        checkState();
        checkIcspFree();
        int ai[] = hardware_.icspPins();
        checkPinFree(ai[0]);
        checkPinFree(ai[1]);
        checkPinFree(ai[2]);
        openPins_[ai[0]] = true;
        openPins_[ai[1]] = true;
        openPins_[ai[2]] = true;
        openIcsp_ = true;
        icspmasterimpl = new IcspMasterImpl(this);
        addDisconnectListener(icspmasterimpl);
        incomingState_.addIcspListener(icspmasterimpl);
        protocol_.icspOpen();
        this;
        JVM INSTR monitorexit ;
        return icspmasterimpl;
        IOException ioexception;
        ioexception;
        icspmasterimpl.close();
        throw new ConnectionLostException(ioexception);
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public PulseInput openPulseInput(int i, ioio.lib.api.PulseInput.PulseMode pulsemode)
        throws ConnectionLostException
    {
        return openPulseInput(new ioio.lib.api.DigitalInput.Spec(i), ioio.lib.api.PulseInput.ClockRate.RATE_16MHz, pulsemode, true);
    }

    public PulseInput openPulseInput(ioio.lib.api.DigitalInput.Spec spec, ioio.lib.api.PulseInput.ClockRate clockrate, ioio.lib.api.PulseInput.PulseMode pulsemode, boolean flag)
        throws ConnectionLostException
    {
        checkState();
        checkPinFree(spec.pin);
        hardware_.checkSupportsPeripheralInput(spec.pin);
        Object obj;
        int i;
        if (flag)
        {
            obj = incapAllocatorDouble_.allocateModule();
        } else
        {
            obj = incapAllocatorSingle_.allocateModule();
        }
        i = ((Integer) (obj)).intValue();
        obj = new IncapImpl(this, pulsemode, i, spec.pin, clockrate.hertz, pulsemode.scaling, flag);
        addDisconnectListener(((IncomingState.DisconnectListener) (obj)));
        incomingState_.addIncapListener(i, ((IncomingState.DataModuleListener) (obj)));
        openPins_[spec.pin] = true;
        try
        {
            protocol_.setPinDigitalIn(spec.pin, spec.mode);
            protocol_.setPinIncap(spec.pin, i, true);
            protocol_.incapConfigure(i, flag, pulsemode.ordinal() + 1, clockrate.ordinal());
        }
        // Misplaced declaration of an exception variable
        catch (ioio.lib.api.DigitalInput.Spec spec)
        {
            ((IncapImpl) (obj)).close();
            throw new ConnectionLostException(spec);
        }
        return ((PulseInput) (obj));
    }

    public PwmOutput openPwmOutput(int i, int j)
        throws ConnectionLostException
    {
        return openPwmOutput(new ioio.lib.api.DigitalOutput.Spec(i), j);
    }

    public PwmOutput openPwmOutput(ioio.lib.api.DigitalOutput.Spec spec, int i)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        int l;
        checkState();
        hardware_.checkSupportsPeripheralOutput(spec.pin);
        checkPinFree(spec.pin);
        l = pwmAllocator_.allocateModule().intValue();
        int j = 0;
_L2:
        int k;
        int i1;
        k = 0xf42400 / IOIOProtocol.PwmScale.values()[j].scale;
        i1 = k / i;
        if (i1 > 0x10000)
        {
            break MISSING_BLOCK_LABEL_166;
        }
        PwmImpl pwmimpl;
        float f = 1000000F / (float)k;
        pwmimpl = new PwmImpl(this, spec.pin, l, i1, f);
        addDisconnectListener(pwmimpl);
        openPins_[spec.pin] = true;
        protocol_.setPinDigitalOut(spec.pin, false, spec.mode);
        protocol_.setPinPwm(spec.pin, l, true);
        protocol_.setPwmPeriod(l, i1 - 1, IOIOProtocol.PwmScale.values()[j]);
        this;
        JVM INSTR monitorexit ;
        return pwmimpl;
        k = j + 1;
        j = k;
        if (k < IOIOProtocol.PwmScale.values().length) goto _L2; else goto _L1
_L1:
        throw new IllegalArgumentException((new StringBuilder("Frequency too low: ")).append(i).toString());
        spec;
        this;
        JVM INSTR monitorexit ;
        throw spec;
        spec;
        pwmimpl.close();
        throw new ConnectionLostException(spec);
    }

    public SpiMaster openSpiMaster(int i, int j, int k, int l, ioio.lib.api.SpiMaster.Rate rate)
        throws ConnectionLostException
    {
        return openSpiMaster(i, j, k, new int[] {
            l
        }, rate);
    }

    public SpiMaster openSpiMaster(int i, int j, int k, int ai[], ioio.lib.api.SpiMaster.Rate rate)
        throws ConnectionLostException
    {
        ioio.lib.api.DigitalOutput.Spec aspec[] = new ioio.lib.api.DigitalOutput.Spec[ai.length];
        int l = 0;
        do
        {
            if (l >= ai.length)
            {
                return openSpiMaster(new ioio.lib.api.DigitalInput.Spec(i, ioio.lib.api.DigitalInput.Spec.Mode.PULL_UP), new ioio.lib.api.DigitalOutput.Spec(j), new ioio.lib.api.DigitalOutput.Spec(k), aspec, new ioio.lib.api.SpiMaster.Config(rate));
            }
            aspec[l] = new ioio.lib.api.DigitalOutput.Spec(ai[l]);
            l++;
        } while (true);
    }

    public SpiMaster openSpiMaster(ioio.lib.api.DigitalInput.Spec spec, ioio.lib.api.DigitalOutput.Spec spec1, ioio.lib.api.DigitalOutput.Spec spec2, ioio.lib.api.DigitalOutput.Spec aspec[], ioio.lib.api.SpiMaster.Config config)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        Object obj;
        checkState();
        obj = new int[aspec.length];
        checkPinFree(spec.pin);
        hardware_.checkSupportsPeripheralInput(spec.pin);
        checkPinFree(spec1.pin);
        hardware_.checkSupportsPeripheralOutput(spec1.pin);
        checkPinFree(spec2.pin);
        hardware_.checkSupportsPeripheralOutput(spec2.pin);
        int i = 0;
_L10:
        if (i < aspec.length) goto _L2; else goto _L1
_L1:
        int j;
        j = spiAllocator_.allocateModule().intValue();
        obj = new SpiMasterImpl(this, j, spec1.pin, spec.pin, spec2.pin, ((int []) (obj)));
        addDisconnectListener(((IncomingState.DisconnectListener) (obj)));
        openPins_[spec.pin] = true;
        openPins_[spec1.pin] = true;
        openPins_[spec2.pin] = true;
        i = 0;
_L7:
        if (i < aspec.length) goto _L4; else goto _L3
_L3:
        incomingState_.addSpiListener(j, ((IncomingState.DataModuleListener) (obj)));
        int k;
        protocol_.setPinDigitalIn(spec.pin, spec.mode);
        protocol_.setPinSpi(spec.pin, 1, true, j);
        protocol_.setPinDigitalOut(spec1.pin, true, spec1.mode);
        protocol_.setPinSpi(spec1.pin, 0, true, j);
        protocol_.setPinDigitalOut(spec2.pin, config.invertClk, spec2.mode);
        protocol_.setPinSpi(spec2.pin, 2, true, j);
        k = aspec.length;
        i = 0;
_L8:
        if (i < k) goto _L6; else goto _L5
_L5:
        protocol_.spiConfigureMaster(j, config);
        this;
        JVM INSTR monitorexit ;
        return ((SpiMaster) (obj));
_L2:
        checkPinFree(aspec[i].pin);
        obj[i] = aspec[i].pin;
        i++;
        continue; /* Loop/switch isn't completed */
_L4:
        openPins_[aspec[i].pin] = true;
        i++;
          goto _L7
_L6:
        spec = aspec[i];
        protocol_.setPinDigitalOut(((ioio.lib.api.DigitalOutput.Spec) (spec)).pin, true, ((ioio.lib.api.DigitalOutput.Spec) (spec)).mode);
        i++;
          goto _L8
        spec;
        ((SpiMasterImpl) (obj)).close();
        throw new ConnectionLostException(spec);
        spec;
        this;
        JVM INSTR monitorexit ;
        throw spec;
        if (true) goto _L10; else goto _L9
_L9:
    }

    public TwiMaster openTwiMaster(int i, ioio.lib.api.TwiMaster.Rate rate, boolean flag)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        TwiMasterImpl twimasterimpl;
        checkState();
        checkTwiFree(i);
        int ai[][] = hardware_.twiPins();
        checkPinFree(ai[i][0]);
        checkPinFree(ai[i][1]);
        openPins_[ai[i][0]] = true;
        openPins_[ai[i][1]] = true;
        openTwi_[i] = true;
        twimasterimpl = new TwiMasterImpl(this, i);
        addDisconnectListener(twimasterimpl);
        incomingState_.addTwiListener(i, twimasterimpl);
        protocol_.i2cConfigureMaster(i, rate, flag);
        this;
        JVM INSTR monitorexit ;
        return twimasterimpl;
        rate;
        twimasterimpl.close();
        throw new ConnectionLostException(rate);
        rate;
        this;
        JVM INSTR monitorexit ;
        throw rate;
    }

    public Uart openUart(int i, int j, int k, ioio.lib.api.Uart.Parity parity, ioio.lib.api.Uart.StopBits stopbits)
        throws ConnectionLostException
    {
        ioio.lib.api.DigitalOutput.Spec spec1 = null;
        ioio.lib.api.DigitalInput.Spec spec;
        if (i == -1)
        {
            spec = null;
        } else
        {
            spec = new ioio.lib.api.DigitalInput.Spec(i);
        }
        if (j != -1)
        {
            spec1 = new ioio.lib.api.DigitalOutput.Spec(j);
        }
        return openUart(spec, spec1, k, parity, stopbits);
    }

    public Uart openUart(ioio.lib.api.DigitalInput.Spec spec, ioio.lib.api.DigitalOutput.Spec spec1, int i, ioio.lib.api.Uart.Parity parity, ioio.lib.api.Uart.StopBits stopbits)
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        if (spec == null)
        {
            break MISSING_BLOCK_LABEL_29;
        }
        hardware_.checkSupportsPeripheralInput(spec.pin);
        checkPinFree(spec.pin);
        if (spec1 == null)
        {
            break MISSING_BLOCK_LABEL_52;
        }
        hardware_.checkSupportsPeripheralOutput(spec1.pin);
        checkPinFree(spec1.pin);
        if (spec == null) goto _L2; else goto _L1
_L1:
        int j = spec.pin;
_L7:
        if (spec1 == null) goto _L4; else goto _L3
_L3:
        int k = spec1.pin;
_L5:
        UartImpl uartimpl;
        int l;
        l = uartAllocator_.allocateModule().intValue();
        uartimpl = new UartImpl(this, k, j, l);
        addDisconnectListener(uartimpl);
        incomingState_.addUartListener(l, uartimpl);
        if (spec == null)
        {
            break MISSING_BLOCK_LABEL_161;
        }
        openPins_[spec.pin] = true;
        protocol_.setPinDigitalIn(spec.pin, spec.mode);
        protocol_.setPinUart(spec.pin, l, false, true);
        if (spec1 == null)
        {
            break MISSING_BLOCK_LABEL_206;
        }
        openPins_[spec1.pin] = true;
        protocol_.setPinDigitalOut(spec1.pin, true, spec1.mode);
        protocol_.setPinUart(spec1.pin, l, true, true);
        boolean flag = true;
        k = Math.round(4000000F / (float)i) - 1;
        j = k;
        if (k <= 65535)
        {
            break MISSING_BLOCK_LABEL_250;
        }
        flag = false;
        j = Math.round(1000000F / (float)i) - 1;
        protocol_.uartConfigure(l, j, flag, stopbits, parity);
        this;
        JVM INSTR monitorexit ;
        return uartimpl;
_L2:
        j = -1;
        continue; /* Loop/switch isn't completed */
_L4:
        k = -1;
          goto _L5
        spec;
        uartimpl.close();
        throw new ConnectionLostException(spec);
        spec;
        this;
        JVM INSTR monitorexit ;
        throw spec;
        if (true) goto _L7; else goto _L6
_L6:
    }

    void removeDisconnectListener(IncomingState.DisconnectListener disconnectlistener)
    {
        this;
        JVM INSTR monitorenter ;
        incomingState_.removeDisconnectListener(disconnectlistener);
        this;
        JVM INSTR monitorexit ;
        return;
        disconnectlistener;
        throw disconnectlistener;
    }

    public void softReset()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
        protocol_.softReset();
        this;
        JVM INSTR monitorexit ;
        return;
        Object obj;
        obj;
        throw new ConnectionLostException(((Exception) (obj)));
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
    }

    public void waitForConnect()
        throws ConnectionLostException, IncompatibilityException
    {
        if (state_ == ioio.lib.api.IOIO.State.CONNECTED)
        {
            return;
        }
        if (state_ == ioio.lib.api.IOIO.State.DEAD)
        {
            throw new ConnectionLostException();
        }
        addDisconnectListener(this);
        Log.d("IOIOImpl", "Waiting for IOIO connection");
        Log.v("IOIOImpl", "Waiting for underlying connection");
        connection_.waitForConnect();
        this;
        JVM INSTR monitorenter ;
        if (disconnect_)
        {
            throw new ConnectionLostException();
        }
        break MISSING_BLOCK_LABEL_109;
        Object obj;
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        obj;
        try
        {
            incomingState_.handleConnectionLost();
            throw obj;
        }
        catch (ConnectionLostException connectionlostexception)
        {
            Log.d("IOIOImpl", "Connection lost / aborted");
            state_ = ioio.lib.api.IOIO.State.DEAD;
            throw connectionlostexception;
        }
        catch (IncompatibilityException incompatibilityexception)
        {
            throw incompatibilityexception;
        }
        catch (InterruptedException interruptedexception)
        {
            Log.e("IOIOImpl", "Unexpected exception", interruptedexception);
        }
        break MISSING_BLOCK_LABEL_212;
        protocol_ = new IOIOProtocol(connection_.getInputStream(), connection_.getOutputStream(), incomingState_);
        this;
        JVM INSTR monitorexit ;
        Log.v("IOIOImpl", "Waiting for handshake");
        incomingState_.waitConnectionEstablished();
        initBoard();
        Log.v("IOIOImpl", "Querying for required interface ID");
        checkInterfaceVersion();
        Log.v("IOIOImpl", "Required interface ID is supported");
        state_ = ioio.lib.api.IOIO.State.CONNECTED;
        Log.i("IOIOImpl", "IOIO connection established");
        return;
    }

    public void waitForDisconnect()
        throws InterruptedException
    {
        incomingState_.waitDisconnect();
    }

}
