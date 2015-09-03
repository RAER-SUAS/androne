// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.api:
//            Closeable

public interface DigitalInput
    extends Closeable
{
    public static class Spec
    {

        public Mode mode;
        public int pin;

        public Spec(int i)
        {
            this(i, Mode.FLOATING);
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
        public static final Spec.Mode FLOATING;
        public static final Spec.Mode PULL_DOWN;
        public static final Spec.Mode PULL_UP;

        public static Spec.Mode valueOf(String s)
        {
            return (Spec.Mode)Enum.valueOf(ioio/lib/api/DigitalInput$Spec$Mode, s);
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
            FLOATING = new Spec.Mode("FLOATING", 0);
            PULL_UP = new Spec.Mode("PULL_UP", 1);
            PULL_DOWN = new Spec.Mode("PULL_DOWN", 2);
            ENUM$VALUES = (new Spec.Mode[] {
                FLOATING, PULL_UP, PULL_DOWN
            });
        }

        private Spec.Mode(String s, int i)
        {
            super(s, i);
        }
    }


    public abstract boolean read()
        throws InterruptedException, ConnectionLostException;

    public abstract void waitForValue(boolean flag)
        throws InterruptedException, ConnectionLostException;
}
