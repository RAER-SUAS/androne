// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            TwiMaster

public static final class  extends Enum
{

    private static final RATE_1MHz ENUM$VALUES[];
    public static final RATE_1MHz RATE_100KHz;
    public static final RATE_1MHz RATE_1MHz;
    public static final RATE_1MHz RATE_400KHz;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/api/TwiMaster$Rate, s);
    }

    public static [] values()
    {
         a[] = ENUM$VALUES;
        int i = a.length;
         a1[] = new ENUM.VALUES[i];
        System.arraycopy(a, 0, a1, 0, i);
        return a1;
    }

    static 
    {
        RATE_100KHz = new <init>("RATE_100KHz", 0);
        RATE_400KHz = new <init>("RATE_400KHz", 1);
        RATE_1MHz = new <init>("RATE_1MHz", 2);
        ENUM$VALUES = (new ENUM.VALUES[] {
            RATE_100KHz, RATE_400KHz, RATE_1MHz
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
