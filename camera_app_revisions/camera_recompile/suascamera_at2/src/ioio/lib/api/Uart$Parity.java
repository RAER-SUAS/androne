// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            Uart

public static final class  extends Enum
{

    private static final ODD ENUM$VALUES[];
    public static final ODD EVEN;
    public static final ODD NONE;
    public static final ODD ODD;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/api/Uart$Parity, s);
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
        NONE = new <init>("NONE", 0);
        EVEN = new <init>("EVEN", 1);
        ODD = new <init>("ODD", 2);
        ENUM$VALUES = (new ENUM.VALUES[] {
            NONE, EVEN, ODD
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
