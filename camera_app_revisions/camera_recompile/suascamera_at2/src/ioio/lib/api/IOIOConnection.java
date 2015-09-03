// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;
import java.io.InputStream;
import java.io.OutputStream;

public interface IOIOConnection
{

    public abstract boolean canClose();

    public abstract void disconnect();

    public abstract InputStream getInputStream()
        throws ConnectionLostException;

    public abstract OutputStream getOutputStream()
        throws ConnectionLostException;

    public abstract void waitForConnect()
        throws ConnectionLostException;
}
