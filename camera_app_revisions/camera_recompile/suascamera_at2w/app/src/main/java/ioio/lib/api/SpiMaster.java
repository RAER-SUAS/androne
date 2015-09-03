// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.api:
//            Closeable

public interface SpiMaster
    extends Closeable
{
    public static class Config
    {

        public boolean invertClk;
        public Rate rate;
        public boolean sampleOnTrailing;

        public Config(Rate rate1)
        {
            this(rate1, false, false);
        }

        public Config(Rate rate1, boolean flag, boolean flag1)
        {
            rate = rate1;
            invertClk = flag;
            sampleOnTrailing = flag1;
        }
    }

    public static final class Rate extends Enum
    {

        private static final Rate ENUM$VALUES[];
        public static final Rate RATE_125K;
        public static final Rate RATE_142K;
        public static final Rate RATE_166K;
        public static final Rate RATE_1M;
        public static final Rate RATE_1_3M;
        public static final Rate RATE_200K;
        public static final Rate RATE_250K;
        public static final Rate RATE_2M;
        public static final Rate RATE_2_2M;
        public static final Rate RATE_2_6M;
        public static final Rate RATE_31K;
        public static final Rate RATE_333K;
        public static final Rate RATE_35K;
        public static final Rate RATE_3_2M;
        public static final Rate RATE_41K;
        public static final Rate RATE_4M;
        public static final Rate RATE_500K;
        public static final Rate RATE_50K;
        public static final Rate RATE_571K;
        public static final Rate RATE_5_3M;
        public static final Rate RATE_62K;
        public static final Rate RATE_666K;
        public static final Rate RATE_800K;
        public static final Rate RATE_83K;
        public static final Rate RATE_8M;

        public static Rate valueOf(String s)
        {
            return (Rate)Enum.valueOf(ioio/lib/api/SpiMaster$Rate, s);
        }

        public static Rate[] values()
        {
            Rate arate[] = ENUM$VALUES;
            int i = arate.length;
            Rate arate1[] = new Rate[i];
            System.arraycopy(arate, 0, arate1, 0, i);
            return arate1;
        }

        static 
        {
            RATE_31K = new Rate("RATE_31K", 0);
            RATE_35K = new Rate("RATE_35K", 1);
            RATE_41K = new Rate("RATE_41K", 2);
            RATE_50K = new Rate("RATE_50K", 3);
            RATE_62K = new Rate("RATE_62K", 4);
            RATE_83K = new Rate("RATE_83K", 5);
            RATE_125K = new Rate("RATE_125K", 6);
            RATE_142K = new Rate("RATE_142K", 7);
            RATE_166K = new Rate("RATE_166K", 8);
            RATE_200K = new Rate("RATE_200K", 9);
            RATE_250K = new Rate("RATE_250K", 10);
            RATE_333K = new Rate("RATE_333K", 11);
            RATE_500K = new Rate("RATE_500K", 12);
            RATE_571K = new Rate("RATE_571K", 13);
            RATE_666K = new Rate("RATE_666K", 14);
            RATE_800K = new Rate("RATE_800K", 15);
            RATE_1M = new Rate("RATE_1M", 16);
            RATE_1_3M = new Rate("RATE_1_3M", 17);
            RATE_2M = new Rate("RATE_2M", 18);
            RATE_2_2M = new Rate("RATE_2_2M", 19);
            RATE_2_6M = new Rate("RATE_2_6M", 20);
            RATE_3_2M = new Rate("RATE_3_2M", 21);
            RATE_4M = new Rate("RATE_4M", 22);
            RATE_5_3M = new Rate("RATE_5_3M", 23);
            RATE_8M = new Rate("RATE_8M", 24);
            ENUM$VALUES = (new Rate[] {
                RATE_31K, RATE_35K, RATE_41K, RATE_50K, RATE_62K, RATE_83K, RATE_125K, RATE_142K, RATE_166K, RATE_200K, 
                RATE_250K, RATE_333K, RATE_500K, RATE_571K, RATE_666K, RATE_800K, RATE_1M, RATE_1_3M, RATE_2M, RATE_2_2M, 
                RATE_2_6M, RATE_3_2M, RATE_4M, RATE_5_3M, RATE_8M
            });
        }

        private Rate(String s, int i)
        {
            super(s, i);
        }
    }

    public static interface Result
    {

        public abstract void waitReady()
            throws ConnectionLostException, InterruptedException;
    }


    public abstract void writeRead(int i, byte abyte0[], int j, int k, byte abyte1[], int l)
        throws ConnectionLostException, InterruptedException;

    public abstract void writeRead(byte abyte0[], int i, int j, byte abyte1[], int k)
        throws ConnectionLostException, InterruptedException;

    public abstract Result writeReadAsync(int i, byte abyte0[], int j, int k, byte abyte1[], int l)
        throws ConnectionLostException;
}
