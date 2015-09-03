// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.api:
//            Closeable

public interface DigitalOutput
    extends Closeable
{
    public static class Spec
    {

        public Mode mode;
        public int pin;

        public Spec(int i)
        {
            this(i, Mode.NORMAL);
        }

        public Spec(int i, Mode mode1)
        {
            pin = i;
            mode = mode1;
        }
    }

    public static final class Spec.Mode extends Enum
    {

        private static final Spec.Mode ENUM$VALUES[];
        public static final Spec.Mode NORMAL;
        public static final Spec.Mode OPEN_DRAIN;

        public static Spec.Mode valueOf(String s)
        {
            return (Spec.Mode)Enum.valueOf(ioio/lib/api/DigitalOutput$Spec$Mode, s);
        }

        public static Spec.Mode[] values()
        {
            Spec.Mode amode[] = ENUM$VALUES;
            int i = amode.length;
            Spec.Mode amode1[] = new Spec.Mode[i];
            System.arraycopy(amode, 0, amode1, 0, i);
            return amode1;
        }

        static 
        {
            NORMAL = new Spec.Mode("NORMAL", 0);
            OPEN_DRAIN = new Spec.Mode("OPEN_DRAIN", 1);
            ENUM$VALUES = (new Spec.Mode[] {
                NORMAL, OPEN_DRAIN
            });
        }

        private Spec.Mode(String s, int i)
        {
            super(s, i);
        }
    }


    public abstract void write(boolean flag)
        throws ConnectionLostException;
}
