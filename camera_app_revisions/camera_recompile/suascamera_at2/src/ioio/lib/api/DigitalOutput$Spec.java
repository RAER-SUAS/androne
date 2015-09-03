// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            DigitalOutput

public static class mode
{
    public static final class Mode extends Enum
    {

        private static final Mode ENUM$VALUES[];
        public static final Mode NORMAL;
        public static final Mode OPEN_DRAIN;

        public static Mode valueOf(String s)
        {
            return (Mode)Enum.valueOf(ioio/lib/api/DigitalOutput$Spec$Mode, s);
        }

        public static Mode[] values()
        {
            Mode amode[] = ENUM$VALUES;
            int i = amode.length;
            Mode amode1[] = new Mode[i];
            System.arraycopy(amode, 0, amode1, 0, i);
            return amode1;
        }

        static 
        {
            NORMAL = new Mode("NORMAL", 0);
            OPEN_DRAIN = new Mode("OPEN_DRAIN", 1);
            ENUM$VALUES = (new Mode[] {
                NORMAL, OPEN_DRAIN
            });
        }

        private Mode(String s, int i)
        {
            super(s, i);
        }
    }


    public Mode mode;
    public int pin;

    public Mode(int i)
    {
        this(i, Mode.NORMAL);
    }

    public Mode(int i, Mode mode1)
    {
        pin = i;
        mode = mode1;
    }
}
