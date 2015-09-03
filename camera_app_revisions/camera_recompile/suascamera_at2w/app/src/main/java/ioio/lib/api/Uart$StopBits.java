// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            Uart

public static final class  extends Enum
{

    private static final TWO ENUM$VALUES[];
    public static final TWO ONE;
    public static final TWO TWO;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/api/Uart$StopBits, s);
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
        ONE = new <init>("ONE", 0);
        TWO = new <init>("TWO", 1);
        ENUM$VALUES = (new ENUM.VALUES[] {
            ONE, TWO
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
