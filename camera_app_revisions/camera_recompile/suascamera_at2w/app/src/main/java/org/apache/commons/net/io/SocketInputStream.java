// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;

public class SocketInputStream extends FilterInputStream
{

    private final Socket __socket;

    public SocketInputStream(Socket socket, InputStream inputstream)
    {
        super(inputstream);
        __socket = socket;
    }

    public void close()
        throws IOException
    {
        super.close();
        __socket.close();
    }
}
