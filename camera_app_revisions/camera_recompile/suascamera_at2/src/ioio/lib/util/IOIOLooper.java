// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util;

import ioio.lib.api.IOIO;
import ioio.lib.api.exception.ConnectionLostException;

public interface IOIOLooper
{

    public abstract void disconnected();

    public abstract void incompatible();

    public abstract void loop()
        throws ConnectionLostException, InterruptedException;

    public abstract void setup(IOIO ioio)
        throws ConnectionLostException, InterruptedException;
}
