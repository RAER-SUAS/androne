// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;


// Referenced classes of package ioio.lib.api:
//            DigitalInput

public static class mode
{
    public static final class Mode extends Enum
    {

        private static final Mode ENUM$VALUES[];
        public static final Mode FLOATING;
        public static final Mode PULL_DOWN;
        public static final Mode PULL_UP;

        public static Mode valueOf(String s)
        {
            return (Mode)Enum.valueOf(ioio/lib/api/DigitalInput$Spec$Mode, s);
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
            FLOATING = new Mode("FLOATING", 0);
            PULL_UP = new Mode("PULL_UP", 1);
            PULL_DOWN = new Mode("PULL_DOWN", 2);
            ENUM$VALUES = (new Mode[] {
                FLOATING, PULL_UP, PULL_DOWN
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
        this(i, Mode.FLOATING);
    }

    public Mode(int i, Mode mode1)
    {
        pin = i;
        mode = mode1;
    }
}
