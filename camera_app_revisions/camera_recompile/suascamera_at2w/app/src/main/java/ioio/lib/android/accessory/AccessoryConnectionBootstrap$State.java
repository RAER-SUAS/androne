// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.android.accessory;


// Referenced classes of package ioio.lib.android.accessory:
//            AccessoryConnectionBootstrap

private static final class  extends Enum
{

    public static final OPEN CLOSED;
    private static final OPEN ENUM$VALUES[];
    public static final OPEN OPEN;
    public static final OPEN WAIT_PERMISSION;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/android/accessory/AccessoryConnectionBootstrap$State, s);
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
        CLOSED = new <init>("CLOSED", 0);
        WAIT_PERMISSION = new <init>("WAIT_PERMISSION", 1);
        OPEN = new <init>("OPEN", 2);
        ENUM$VALUES = (new ENUM.VALUES[] {
            CLOSED, WAIT_PERMISSION, OPEN
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
