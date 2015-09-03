// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            PulseInput

public static final class hertz extends Enum
{

    private static final RATE_62KHz ENUM$VALUES[];
    public static final RATE_62KHz RATE_16MHz;
    public static final RATE_62KHz RATE_250KHz;
    public static final RATE_62KHz RATE_2MHz;
    public static final RATE_62KHz RATE_62KHz;
    public final int hertz;

    public static hertz valueOf(String s)
    {
        return (hertz)Enum.valueOf(ioio/lib/api/PulseInput$ClockRate, s);
    }

    public static hertz[] values()
    {
        hertz ahertz[] = ENUM$VALUES;
        int i = ahertz.length;
        hertz ahertz1[] = new ENUM.VALUES[i];
        System.arraycopy(ahertz, 0, ahertz1, 0, i);
        return ahertz1;
    }

    static 
    {
        RATE_16MHz = new <init>("RATE_16MHz", 0, 0xf42400);
        RATE_2MHz = new <init>("RATE_2MHz", 1, 0x1e8480);
        RATE_250KHz = new <init>("RATE_250KHz", 2, 0x3d090);
        RATE_62KHz = new <init>("RATE_62KHz", 3, 62500);
        ENUM$VALUES = (new ENUM.VALUES[] {
            RATE_16MHz, RATE_2MHz, RATE_250KHz, RATE_62KHz
        });
    }

    private (String s, int i, int j)
    {
        super(s, i);
        hertz = j;
    }
}
