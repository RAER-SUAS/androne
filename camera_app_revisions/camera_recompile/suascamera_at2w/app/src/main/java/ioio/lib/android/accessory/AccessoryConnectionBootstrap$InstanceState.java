// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.android.accessory;


// Referenced classes of package ioio.lib.android.accessory:
//            AccessoryConnectionBootstrap

private static final class  extends Enum
{

    public static final DEAD CONNECTED;
    public static final DEAD DEAD;
    private static final DEAD ENUM$VALUES[];
    public static final DEAD INIT;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState, s);
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
        CONNECTED = new <init>("CONNECTED", 1);
        DEAD = new <init>("DEAD", 2);
        ENUM$VALUES = (new ENUM.VALUES[] {
            INIT, CONNECTED, DEAD
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
