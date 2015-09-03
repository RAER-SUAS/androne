// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;


// Referenced classes of package ioio.lib.impl:
//            IncomingState

static final class  extends Enum
{

    public static final UNSUPPORTED_IID CONNECTED;
    public static final UNSUPPORTED_IID DISCONNECTED;
    private static final UNSUPPORTED_IID ENUM$VALUES[];
    public static final UNSUPPORTED_IID ESTABLISHED;
    public static final UNSUPPORTED_IID INIT;
    public static final UNSUPPORTED_IID UNSUPPORTED_IID;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/impl/IncomingState$ConnectionState, s);
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
        INIT = new <init>("INIT", 0);
        ESTABLISHED = new <init>("ESTABLISHED", 1);
        CONNECTED = new <init>("CONNECTED", 2);
        DISCONNECTED = new <init>("DISCONNECTED", 3);
        UNSUPPORTED_IID = new <init>("UNSUPPORTED_IID", 4);
        ENUM$VALUES = (new ENUM.VALUES[] {
            INIT, ESTABLISHED, CONNECTED, DISCONNECTED, UNSUPPORTED_IID
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
