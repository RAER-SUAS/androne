// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            PulseInput

public static final class scaling extends Enum
{

    private static final FREQ_SCALE_16 ENUM$VALUES[];
    public static final FREQ_SCALE_16 FREQ;
    public static final FREQ_SCALE_16 FREQ_SCALE_16;
    public static final FREQ_SCALE_16 FREQ_SCALE_4;
    public static final FREQ_SCALE_16 NEGATIVE;
    public static final FREQ_SCALE_16 POSITIVE;
    public final int scaling;

    public static scaling valueOf(String s)
    {
        return (scaling)Enum.valueOf(ioio/lib/api/PulseInput$PulseMode, s);
    }

    public static scaling[] values()
    {
        scaling ascaling[] = ENUM$VALUES;
        int i = ascaling.length;
        scaling ascaling1[] = new ENUM.VALUES[i];
        System.arraycopy(ascaling, 0, ascaling1, 0, i);
        return ascaling1;
    }

    static 
    {
        POSITIVE = new <init>("POSITIVE", 0, 1);
        NEGATIVE = new <init>("NEGATIVE", 1, 1);
        FREQ = new <init>("FREQ", 2, 1);
        FREQ_SCALE_4 = new <init>("FREQ_SCALE_4", 3, 4);
        FREQ_SCALE_16 = new <init>("FREQ_SCALE_16", 4, 16);
        ENUM$VALUES = (new ENUM.VALUES[] {
            POSITIVE, NEGATIVE, FREQ, FREQ_SCALE_4, FREQ_SCALE_16
        });
    }

    private (String s, int i, int j)
    {
        super(s, i);
        scaling = j;
    }
}
