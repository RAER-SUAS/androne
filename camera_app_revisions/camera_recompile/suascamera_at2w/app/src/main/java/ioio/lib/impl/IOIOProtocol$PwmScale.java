// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;


// Referenced classes of package ioio.lib.impl:
//            IOIOProtocol

static final class encoding extends Enum
{

    private static final SCALE_256X ENUM$VALUES[];
    public static final SCALE_256X SCALE_1X;
    public static final SCALE_256X SCALE_256X;
    public static final SCALE_256X SCALE_64X;
    public static final SCALE_256X SCALE_8X;
    private final int encoding;
    public final int scale;

    public static encoding valueOf(String s)
    {
        return (encoding)Enum.valueOf(ioio/lib/impl/IOIOProtocol$PwmScale, s);
    }

    public static encoding[] values()
    {
        encoding aencoding[] = ENUM$VALUES;
        int i = aencoding.length;
        encoding aencoding1[] = new ENUM.VALUES[i];
        System.arraycopy(aencoding, 0, aencoding1, 0, i);
        return aencoding1;
    }

    static 
    {
        SCALE_1X = new <init>("SCALE_1X", 0, 1, 0);
        SCALE_8X = new <init>("SCALE_8X", 1, 8, 3);
        SCALE_64X = new <init>("SCALE_64X", 2, 64, 2);
        SCALE_256X = new <init>("SCALE_256X", 3, 256, 1);
        ENUM$VALUES = (new ENUM.VALUES[] {
            SCALE_1X, SCALE_8X, SCALE_64X, SCALE_256X
        });
    }


    private (String s, int i, int j, int k)
    {
        super(s, i);
        scale = j;
        encoding = k;
    }
}
