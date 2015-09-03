// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.IOException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import org.apache.commons.net.io.CopyStreamEvent;
import org.apache.commons.net.io.CopyStreamListener;

// Referenced classes of package org.apache.commons.net.ftp:
//            FTPClient

private static class oTimeout
    implements CopyStreamListener
{

    private final int currentSoTimeout;
    private final long idle;
    private int notAcked;
    private final FTPClient parent;
    private long time;

    public void bytesTransferred(long l, int i, long l1)
    {
        l = System.currentTimeMillis();
        if (l - time > idle)
        {
            try
            {
                parent.__noop();
            }
            catch (SocketTimeoutException sockettimeoutexception)
            {
                notAcked = notAcked + 1;
            }
            catch (IOException ioexception) { }
            time = l;
        }
    }

    public void bytesTransferred(CopyStreamEvent copystreamevent)
    {
        bytesTransferred(copystreamevent.getTotalBytesTransferred(), copystreamevent.getBytesTransferred(), copystreamevent.getStreamSize());
    }

    void cleanUp()
        throws IOException
    {
_L2:
        int i;
        i = notAcked;
        notAcked = i - 1;
        if (i <= 0)
        {
            break; /* Loop/switch isn't completed */
        }
        parent.__getReplyNoReport();
        if (true) goto _L2; else goto _L1
        Exception exception;
        exception;
        parent.setSoTimeout(currentSoTimeout);
        throw exception;
_L1:
        parent.setSoTimeout(currentSoTimeout);
        return;
    }

    (FTPClient ftpclient, long l, int i)
        throws SocketException
    {
        time = System.currentTimeMillis();
        idle = l;
        parent = ftpclient;
        currentSoTimeout = ftpclient.getSoTimeout();
        ftpclient.setSoTimeout(i);
    }
}
