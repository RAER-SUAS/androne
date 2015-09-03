// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.api:
//            Closeable

public interface PwmOutput
    extends Closeable
{

    public abstract void setDutyCycle(float f)
        throws ConnectionLostException;

    public abstract void setPulseWidth(float f)
        throws ConnectionLostException;

    public abstract void setPulseWidth(int i)
        throws ConnectionLostException;
}
