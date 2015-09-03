// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.spi;

import ioio.lib.api.IOIOConnection;

public interface IOIOConnectionFactory
{

    public abstract IOIOConnection createConnection();

    public abstract Object getExtra();

    public abstract String getType();
}
