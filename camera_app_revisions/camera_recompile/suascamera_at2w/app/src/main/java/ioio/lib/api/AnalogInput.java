// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.api:
//            Closeable

public interface AnalogInput
    extends Closeable
{

    public abstract int available()
        throws ConnectionLostException;

    public abstract int getOverflowCount()
        throws ConnectionLostException;

    public abstract float getReference();

    public abstract float getSampleRate()
        throws ConnectionLostException;

    public abstract float getVoltage()
        throws InterruptedException, ConnectionLostException;

    public abstract float getVoltageBuffered()
        throws InterruptedException, ConnectionLostException;

    public abstract float read()
        throws InterruptedException, ConnectionLostException;

    public abstract float readBuffered()
        throws InterruptedException, ConnectionLostException;

    public abstract void setBuffer(int i)
        throws ConnectionLostException;
}
