// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;


// Referenced classes of package ioio.lib.impl:
//            AbstractResource

static final class  extends Enum
{

    public static final DISCONNECTED CLOSED;
    public static final DISCONNECTED DISCONNECTED;
    private static final DISCONNECTED ENUM$VALUES[];
    public static final DISCONNECTED OPEN;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/impl/AbstractResource$State, s);
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
        OPEN = new <init>("OPEN", 0);
        CLOSED = new <init>("CLOSED", 1);
        DISCONNECTED = new <init>("DISCONNECTED", 2);
        ENUM$VALUES = (new ENUM.VALUES[] {
            OPEN, CLOSED, DISCONNECTED
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
