// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            SpiMaster

public static final class  extends Enum
{

    private static final RATE_8M ENUM$VALUES[];
    public static final RATE_8M RATE_125K;
    public static final RATE_8M RATE_142K;
    public static final RATE_8M RATE_166K;
    public static final RATE_8M RATE_1M;
    public static final RATE_8M RATE_1_3M;
    public static final RATE_8M RATE_200K;
    public static final RATE_8M RATE_250K;
    public static final RATE_8M RATE_2M;
    public static final RATE_8M RATE_2_2M;
    public static final RATE_8M RATE_2_6M;
    public static final RATE_8M RATE_31K;
    public static final RATE_8M RATE_333K;
    public static final RATE_8M RATE_35K;
    public static final RATE_8M RATE_3_2M;
    public static final RATE_8M RATE_41K;
    public static final RATE_8M RATE_4M;
    public static final RATE_8M RATE_500K;
    public static final RATE_8M RATE_50K;
    public static final RATE_8M RATE_571K;
    public static final RATE_8M RATE_5_3M;
    public static final RATE_8M RATE_62K;
    public static final RATE_8M RATE_666K;
    public static final RATE_8M RATE_800K;
    public static final RATE_8M RATE_83K;
    public static final RATE_8M RATE_8M;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/api/SpiMaster$Rate, s);
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
        RATE_31K = new <init>("RATE_31K", 0);
        RATE_35K = new <init>("RATE_35K", 1);
        RATE_41K = new <init>("RATE_41K", 2);
        RATE_50K = new <init>("RATE_50K", 3);
        RATE_62K = new <init>("RATE_62K", 4);
        RATE_83K = new <init>("RATE_83K", 5);
        RATE_125K = new <init>("RATE_125K", 6);
        RATE_142K = new <init>("RATE_142K", 7);
        RATE_166K = new <init>("RATE_166K", 8);
        RATE_200K = new <init>("RATE_200K", 9);
        RATE_250K = new <init>("RATE_250K", 10);
        RATE_333K = new <init>("RATE_333K", 11);
        RATE_500K = new <init>("RATE_500K", 12);
        RATE_571K = new <init>("RATE_571K", 13);
        RATE_666K = new <init>("RATE_666K", 14);
        RATE_800K = new <init>("RATE_800K", 15);
        RATE_1M = new <init>("RATE_1M", 16);
        RATE_1_3M = new <init>("RATE_1_3M", 17);
        RATE_2M = new <init>("RATE_2M", 18);
        RATE_2_2M = new <init>("RATE_2_2M", 19);
        RATE_2_6M = new <init>("RATE_2_6M", 20);
        RATE_3_2M = new <init>("RATE_3_2M", 21);
        RATE_4M = new <init>("RATE_4M", 22);
        RATE_5_3M = new <init>("RATE_5_3M", 23);
        RATE_8M = new <init>("RATE_8M", 24);
        ENUM$VALUES = (new ENUM.VALUES[] {
            RATE_31K, RATE_35K, RATE_41K, RATE_50K, RATE_62K, RATE_83K, RATE_125K, RATE_142K, RATE_166K, RATE_200K, 
            RATE_250K, RATE_333K, RATE_500K, RATE_571K, RATE_666K, RATE_800K, RATE_1M, RATE_1_3M, RATE_2M, RATE_2_2M, 
            RATE_2_6M, RATE_3_2M, RATE_4M, RATE_5_3M, RATE_8M
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
