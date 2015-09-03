// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.IOException;

public class CopyStreamException extends IOException
{

    private static final long serialVersionUID = 0xdbe0a50853f59664L;
    private final long totalBytesTransferred;

    public CopyStreamException(String s, long l, IOException ioexception)
    {
        super(s);
        initCause(ioexception);
        totalBytesTransferred = l;
    }

    public IOException getIOException()
    {
        return (IOException)getCause();
    }

    public long getTotalBytesTransferred()
    {
        return totalBytesTransferred;
    }
}
