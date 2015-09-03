// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.api:
//            Closeable

public interface TwiMaster
    extends Closeable
{
    public static final class Rate extends Enum
    {

        private static final Rate ENUM$VALUES[];
        public static final Rate RATE_100KHz;
        public static final Rate RATE_1MHz;
        public static final Rate RATE_400KHz;

        public static Rate valueOf(String s)
        {
            return (Rate)Enum.valueOf(ioio/lib/api/TwiMaster$Rate, s);
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
            RATE_100KHz = new Rate("RATE_100KHz", 0);
            RATE_400KHz = new Rate("RATE_400KHz", 1);
            RATE_1MHz = new Rate("RATE_1MHz", 2);
            ENUM$VALUES = (new Rate[] {
                RATE_100KHz, RATE_400KHz, RATE_1MHz
            });
        }

        private Rate(String s, int i)
        {
            super(s, i);
        }
    }

    public static interface Result
    {

        public abstract boolean waitReady()
            throws ConnectionLostException, InterruptedException;
    }


    public abstract boolean writeRead(int i, boolean flag, byte abyte0[], int j, byte abyte1[], int k)
        throws ConnectionLostException, InterruptedException;

    public abstract Result writeReadAsync(int i, boolean flag, byte abyte0[], int j, byte abyte1[], int k)
        throws ConnectionLostException;
}
