// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            IOIO

public static final class  extends Enum
{

    public static final IOIOLIB_VER APP_FIRMWARE_VER;
    public static final IOIOLIB_VER BOOTLOADER_VER;
    private static final IOIOLIB_VER ENUM$VALUES[];
    public static final IOIOLIB_VER HARDWARE_VER;
    public static final IOIOLIB_VER IOIOLIB_VER;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(ioio/lib/api/IOIO$VersionType, s);
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
        HARDWARE_VER = new <init>("HARDWARE_VER", 0);
        BOOTLOADER_VER = new <init>("BOOTLOADER_VER", 1);
        APP_FIRMWARE_VER = new <init>("APP_FIRMWARE_VER", 2);
        IOIOLIB_VER = new <init>("IOIOLIB_VER", 3);
        ENUM$VALUES = (new ENUM.VALUES[] {
            HARDWARE_VER, BOOTLOADER_VER, APP_FIRMWARE_VER, IOIOLIB_VER
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
