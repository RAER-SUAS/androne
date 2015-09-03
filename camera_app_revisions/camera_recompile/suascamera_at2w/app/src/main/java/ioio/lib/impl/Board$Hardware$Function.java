// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;


// Referenced classes of package ioio.lib.impl:
//            Board

private static final class  extends Enum
{

    public static final ANALOG_IN ANALOG_IN;
    private static final ANALOG_IN ENUM$VALUES[];
    public static final ANALOG_IN PERIPHERAL_IN;
    public static final ANALOG_IN PERIPHERAL_OUT;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/impl/Board$Hardware$Function, s);
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
        PERIPHERAL_OUT = new <init>("PERIPHERAL_OUT", 0);
        PERIPHERAL_IN = new <init>("PERIPHERAL_IN", 1);
        ANALOG_IN = new <init>("ANALOG_IN", 2);
        ENUM$VALUES = (new ENUM.VALUES[] {
            PERIPHERAL_OUT, PERIPHERAL_IN, ANALOG_IN
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
