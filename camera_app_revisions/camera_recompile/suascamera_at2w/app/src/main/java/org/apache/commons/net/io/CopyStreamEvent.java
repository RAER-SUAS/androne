// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.util.EventObject;

public class CopyStreamEvent extends EventObject
{

    public static final long UNKNOWN_STREAM_SIZE = -1L;
    private static final long serialVersionUID = 0xf29be36d82d2b5a5L;
    private final int bytesTransferred;
    private final long streamSize;
    private final long totalBytesTransferred;

    public CopyStreamEvent(Object obj, long l, int i, long l1)
    {
        super(obj);
        bytesTransferred = i;
        totalBytesTransferred = l;
        streamSize = l1;
    }

    public int getBytesTransferred()
    {
        return bytesTransferred;
    }

    public long getStreamSize()
    {
        return streamSize;
    }

    public long getTotalBytesTransferred()
    {
        return totalBytesTransferred;
    }

    public String toString()
    {
        return (new StringBuilder()).append(getClass().getName()).append("[source=").append(source).append(", total=").append(totalBytesTransferred).append(", bytes=").append(bytesTransferred).append(", size=").append(streamSize).append("]").toString();
    }
}
