// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;


// Referenced classes of package ioio.lib.impl:
//            QueueInputStream

private static final class  extends Enum
{

    public static final KILLED CLOSED;
    private static final KILLED ENUM$VALUES[];
    public static final KILLED KILLED;
    public static final KILLED OPEN;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/impl/QueueInputStream$State, s);
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
        KILLED = new <init>("KILLED", 2);
        ENUM$VALUES = (new ENUM.VALUES[] {
            OPEN, CLOSED, KILLED
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
