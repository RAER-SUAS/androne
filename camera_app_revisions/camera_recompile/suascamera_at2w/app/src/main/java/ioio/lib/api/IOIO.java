// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.api.exception.IncompatibilityException;

// Referenced classes of package ioio.lib.api:
//            AnalogInput, DigitalInput, DigitalOutput, IcspMaster, 
//            PulseInput, PwmOutput, SpiMaster, TwiMaster, 
//            Uart

public interface IOIO
{
    public static final class State extends Enum
    {

        public static final State CONNECTED;
        public static final State DEAD;
        private static final State ENUM$VALUES[];
        public static final State INCOMPATIBLE;
        public static final State INIT;

        public static State valueOf(String s)
        {
            return (State)Enum.valueOf(ioio/lib/api/IOIO$State, s);
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
            INIT = new State("INIT", 0);
            CONNECTED = new State("CONNECTED", 1);
            INCOMPATIBLE = new State("INCOMPATIBLE", 2);
            DEAD = new State("DEAD", 3);
            ENUM$VALUES = (new State[] {
                INIT, CONNECTED, INCOMPATIBLE, DEAD
            });
        }

        private State(String s, int i)
        {
            super(s, i);
        }
    }

    public static final class VersionType extends Enum
    {

        public static final VersionType APP_FIRMWARE_VER;
        public static final VersionType BOOTLOADER_VER;
        private static final VersionType ENUM$VALUES[];
        public static final VersionType HARDWARE_VER;
        public static final VersionType IOIOLIB_VER;

        public static VersionType valueOf(String s)
        {
            return (VersionType)Enum.valueOf(ioio/lib/api/IOIO$VersionType, s);
        }

        public static VersionType[] values()
        {
            VersionType aversiontype[] = ENUM$VALUES;
            int i = aversiontype.length;
            VersionType aversiontype1[] = new VersionType[i];
            System.arraycopy(aversiontype, 0, aversiontype1, 0, i);
            return aversiontype1;
        }

        static 
        {
            HARDWARE_VER = new VersionType("HARDWARE_VER", 0);
            BOOTLOADER_VER = new VersionType("BOOTLOADER_VER", 1);
            APP_FIRMWARE_VER = new VersionType("APP_FIRMWARE_VER", 2);
            IOIOLIB_VER = new VersionType("IOIOLIB_VER", 3);
            ENUM$VALUES = (new VersionType[] {
                HARDWARE_VER, BOOTLOADER_VER, APP_FIRMWARE_VER, IOIOLIB_VER
            });
        }

        private VersionType(String s, int i)
        {
            super(s, i);
        }
    }


    public static final int INVALID_PIN = -1;
    public static final int LED_PIN = 0;

    public abstract void beginBatch()
        throws ConnectionLostException;

    public abstract void disconnect();

    public abstract void endBatch()
        throws ConnectionLostException;

    public abstract String getImplVersion(VersionType versiontype)
        throws ConnectionLostException;

    public abstract State getState();

    public abstract void hardReset()
        throws ConnectionLostException;

    public abstract AnalogInput openAnalogInput(int i)
        throws ConnectionLostException;

    public abstract DigitalInput openDigitalInput(int i)
        throws ConnectionLostException;

    public abstract DigitalInput openDigitalInput(int i, DigitalInput.Spec.Mode mode)
        throws ConnectionLostException;

    public abstract DigitalInput openDigitalInput(DigitalInput.Spec spec)
        throws ConnectionLostException;

    public abstract DigitalOutput openDigitalOutput(int i)
        throws ConnectionLostException;

    public abstract DigitalOutput openDigitalOutput(int i, DigitalOutput.Spec.Mode mode, boolean flag)
        throws ConnectionLostException;

    public abstract DigitalOutput openDigitalOutput(int i, boolean flag)
        throws ConnectionLostException;

    public abstract DigitalOutput openDigitalOutput(DigitalOutput.Spec spec, boolean flag)
        throws ConnectionLostException;

    public abstract IcspMaster openIcspMaster()
        throws ConnectionLostException;

    public abstract PulseInput openPulseInput(int i, PulseInput.PulseMode pulsemode)
        throws ConnectionLostException;

    public abstract PulseInput openPulseInput(DigitalInput.Spec spec, PulseInput.ClockRate clockrate, PulseInput.PulseMode pulsemode, boolean flag)
        throws ConnectionLostException;

    public abstract PwmOutput openPwmOutput(int i, int j)
        throws ConnectionLostException;

    public abstract PwmOutput openPwmOutput(DigitalOutput.Spec spec, int i)
        throws ConnectionLostException;

    public abstract SpiMaster openSpiMaster(int i, int j, int k, int l, SpiMaster.Rate rate)
        throws ConnectionLostException;

    public abstract SpiMaster openSpiMaster(int i, int j, int k, int ai[], SpiMaster.Rate rate)
        throws ConnectionLostException;

    public abstract SpiMaster openSpiMaster(DigitalInput.Spec spec, DigitalOutput.Spec spec1, DigitalOutput.Spec spec2, DigitalOutput.Spec aspec[], SpiMaster.Config config)
        throws ConnectionLostException;

    public abstract TwiMaster openTwiMaster(int i, TwiMaster.Rate rate, boolean flag)
        throws ConnectionLostException;

    public abstract Uart openUart(int i, int j, int k, Uart.Parity parity, Uart.StopBits stopbits)
        throws ConnectionLostException;

    public abstract Uart openUart(DigitalInput.Spec spec, DigitalOutput.Spec spec1, int i, Uart.Parity parity, Uart.StopBits stopbits)
        throws ConnectionLostException;

    public abstract void softReset()
        throws ConnectionLostException;

    public abstract void waitForConnect()
        throws ConnectionLostException, IncompatibilityException;

    public abstract void waitForDisconnect()
        throws InterruptedException;
}
