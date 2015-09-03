// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            DigitalOutput

public static final class  extends Enum
{

    private static final OPEN_DRAIN ENUM$VALUES[];
    public static final OPEN_DRAIN NORMAL;
    public static final OPEN_DRAIN OPEN_DRAIN;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/api/DigitalOutput$Spec$Mode, s);
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
        NORMAL = new <init>("NORMAL", 0);
        OPEN_DRAIN = new <init>("OPEN_DRAIN", 1);
        ENUM$VALUES = (new ENUM.VALUES[] {
            NORMAL, OPEN_DRAIN
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
