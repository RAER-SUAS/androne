// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import java.io.InputStream;
import java.io.OutputStream;

// Referenced classes of package ioio.lib.api:
//            Closeable

public interface Uart
    extends Closeable
{
    public static final class Parity extends Enum
    {

        private static final Parity ENUM$VALUES[];
        public static final Parity EVEN;
        public static final Parity NONE;
        public static final Parity ODD;

        public static Parity valueOf(String s)
        {
            return (Parity)Enum.valueOf(ioio/lib/api/Uart$Parity, s);
        }

        public static Parity[] values()
        {
            Parity aparity[] = ENUM$VALUES;
            int i = aparity.length;
            Parity aparity1[] = new Parity[i];
            System.arraycopy(aparity, 0, aparity1, 0, i);
            return aparity1;
        }

        static 
        {
            NONE = new Parity("NONE", 0);
            EVEN = new Parity("EVEN", 1);
            ODD = new Parity("ODD", 2);
            ENUM$VALUES = (new Parity[] {
                NONE, EVEN, ODD
            });
        }

        private Parity(String s, int i)
        {
            super(s, i);
        }
    }

    public static final class StopBits extends Enum
    {

        private static final StopBits ENUM$VALUES[];
        public static final StopBits ONE;
        public static final StopBits TWO;

        public static StopBits valueOf(String s)
        {
            return (StopBits)Enum.valueOf(ioio/lib/api/Uart$StopBits, s);
        }

        public static StopBits[] values()
        {
            StopBits astopbits[] = ENUM$VALUES;
            int i = astopbits.length;
            StopBits astopbits1[] = new StopBits[i];
            System.arraycopy(astopbits, 0, astopbits1, 0, i);
            return astopbits1;
        }

        static 
        {
            ONE = new StopBits("ONE", 0);
            TWO = new StopBits("TWO", 1);
            ENUM$VALUES = (new StopBits[] {
                ONE, TWO
            });
        }

        private StopBits(String s, int i)
        {
            super(s, i);
        }
    }


    public abstract InputStream getInputStream();

    public abstract OutputStream getOutputStream();
}
