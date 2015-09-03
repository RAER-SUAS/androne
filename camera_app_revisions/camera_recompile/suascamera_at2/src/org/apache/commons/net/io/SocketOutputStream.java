// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;

public class SocketOutputStream extends FilterOutputStream
{

    private final Socket __socket;

    public SocketOutputStream(Socket socket, OutputStream outputstream)
    {
        super(outputstream);
        __socket = socket;
    }

    public void close()
        throws IOException
    {
        super.close();
        __socket.close();
    }

    public void write(byte abyte0[], int i, int j)
        throws IOException
    {
        out.write(abyte0, i, j);
    }
}
