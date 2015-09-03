// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.api:
//            Closeable

public interface PulseInput
    extends Closeable
{
    public static final class ClockRate extends Enum
    {

        private static final ClockRate ENUM$VALUES[];
        public static final ClockRate RATE_16MHz;
        public static final ClockRate RATE_250KHz;
        public static final ClockRate RATE_2MHz;
        public static final ClockRate RATE_62KHz;
        public final int hertz;

        public static ClockRate valueOf(String s)
        {
            return (ClockRate)Enum.valueOf(ioio/lib/api/PulseInput$ClockRate, s);
        }

        public static ClockRate[] values()
        {
            ClockRate aclockrate[] = ENUM$VALUES;
            int i = aclockrate.length;
            ClockRate aclockrate1[] = new ClockRate[i];
            System.arraycopy(aclockrate, 0, aclockrate1, 0, i);
            return aclockrate1;
        }

        static 
        {
            RATE_16MHz = new ClockRate("RATE_16MHz", 0, 0xf42400);
            RATE_2MHz = new ClockRate("RATE_2MHz", 1, 0x1e8480);
            RATE_250KHz = new ClockRate("RATE_250KHz", 2, 0x3d090);
            RATE_62KHz = new ClockRate("RATE_62KHz", 3, 62500);
            ENUM$VALUES = (new ClockRate[] {
                RATE_16MHz, RATE_2MHz, RATE_250KHz, RATE_62KHz
            });
        }

        private ClockRate(String s, int i, int j)
        {
            super(s, i);
            hertz = j;
        }
    }

    public static final class PulseMode extends Enum
    {

        private static final PulseMode ENUM$VALUES[];
        public static final PulseMode FREQ;
        public static final PulseMode FREQ_SCALE_16;
        public static final PulseMode FREQ_SCALE_4;
        public static final PulseMode NEGATIVE;
        public static final PulseMode POSITIVE;
        public final int scaling;

        public static PulseMode valueOf(String s)
        {
            return (PulseMode)Enum.valueOf(ioio/lib/api/PulseInput$PulseMode, s);
        }

        public static PulseMode[] values()
        {
            PulseMode apulsemode[] = ENUM$VALUES;
            int i = apulsemode.length;
            PulseMode apulsemode1[] = new PulseMode[i];
            System.arraycopy(apulsemode, 0, apulsemode1, 0, i);
            return apulsemode1;
        }

        static 
        {
            POSITIVE = new PulseMode("POSITIVE", 0, 1);
            NEGATIVE = new PulseMode("NEGATIVE", 1, 1);
            FREQ = new PulseMode("FREQ", 2, 1);
            FREQ_SCALE_4 = new PulseMode("FREQ_SCALE_4", 3, 4);
            FREQ_SCALE_16 = new PulseMode("FREQ_SCALE_16", 4, 16);
            ENUM$VALUES = (new PulseMode[] {
                POSITIVE, NEGATIVE, FREQ, FREQ_SCALE_4, FREQ_SCALE_16
            });
        }

        private PulseMode(String s, int i, int j)
        {
            super(s, i);
            scaling = j;
        }
    }


    public abstract float getDuration()
        throws InterruptedException, ConnectionLostException;

    public abstract float getFrequency()
        throws InterruptedException, ConnectionLostException;

    public abstract float waitPulseGetDuration()
        throws InterruptedException, ConnectionLostException;
}
