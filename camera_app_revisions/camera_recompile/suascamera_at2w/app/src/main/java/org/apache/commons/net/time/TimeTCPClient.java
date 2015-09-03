// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.time;

import java.io.DataInputStream;
import java.io.IOException;
import java.util.Date;
import org.apache.commons.net.SocketClient;

public final class TimeTCPClient extends SocketClient
{

    public static final int DEFAULT_PORT = 37;
    public static final long SECONDS_1900_TO_1970 = 0x83aa7e80L;

    public TimeTCPClient()
    {
        setDefaultPort(37);
    }

    public Date getDate()
        throws IOException
    {
        return new Date((getTime() - 0x83aa7e80L) * 1000L);
    }

    public long getTime()
        throws IOException
    {
        return (long)(new DataInputStream(_input_)).readInt() & 0xffffffffL;
    }
}
