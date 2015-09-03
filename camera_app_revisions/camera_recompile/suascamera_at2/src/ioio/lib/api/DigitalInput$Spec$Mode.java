// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            DigitalInput

public static final class  extends Enum
{

    private static final PULL_DOWN ENUM$VALUES[];
    public static final PULL_DOWN FLOATING;
    public static final PULL_DOWN PULL_DOWN;
    public static final PULL_DOWN PULL_UP;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/api/DigitalInput$Spec$Mode, s);
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
        FLOATING = new <init>("FLOATING", 0);
        PULL_UP = new <init>("PULL_UP", 1);
        PULL_DOWN = new <init>("PULL_DOWN", 2);
        ENUM$VALUES = (new ENUM.VALUES[] {
            FLOATING, PULL_UP, PULL_DOWN
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
