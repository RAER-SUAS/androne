// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.net.Socket;

// Referenced classes of package org.apache.commons.net.io:
//            CopyStreamException, CopyStreamListener

public final class Util
{

    public static final int DEFAULT_COPY_BUFFER_SIZE = 1024;

    private Util()
    {
    }

    public static void closeQuietly(Closeable closeable)
    {
        if (closeable == null)
        {
            break MISSING_BLOCK_LABEL_10;
        }
        closeable.close();
        return;
        closeable;
    }

    public static void closeQuietly(Socket socket)
    {
        if (socket == null)
        {
            break MISSING_BLOCK_LABEL_8;
        }
        socket.close();
        return;
        socket;
    }

    public static final long copyReader(Reader reader, Writer writer)
        throws CopyStreamException
    {
        return copyReader(reader, writer, 1024);
    }

    public static final long copyReader(Reader reader, Writer writer, int i)
        throws CopyStreamException
    {
        return copyReader(reader, writer, i, -1L, null);
    }

    public static final long copyReader(Reader reader, Writer writer, int i, long l, CopyStreamListener copystreamlistener)
        throws CopyStreamException
    {
        long l1 = 0L;
        char ac[];
        long l2;
        long l3;
        if (i < 0)
        {
            i = 1024;
        }
        ac = new char[i];
        l2 = l1;
        try
        {
            i = reader.read(ac);
        }
        // Misplaced declaration of an exception variable
        catch (Reader reader)
        {
            throw new CopyStreamException("IOException caught while copying.", l2, reader);
        }
        if (i == -1)
        {
            break; /* Loop/switch isn't completed */
        }
        if (i != 0)
        {
            break MISSING_BLOCK_LABEL_116;
        }
        l2 = l1;
        i = reader.read();
        if (i < 0)
        {
            return l1;
        }
        l2 = l1;
        writer.write(i);
        l2 = l1;
        writer.flush();
        l3 = l1 + 1L;
        l1 = l3;
        if (copystreamlistener == null)
        {
            continue; /* Loop/switch isn't completed */
        }
        l2 = l3;
        copystreamlistener.bytesTransferred(l3, i, l);
        l1 = l3;
        continue; /* Loop/switch isn't completed */
        l2 = l1;
        writer.write(ac, 0, i);
        l2 = l1;
        writer.flush();
        l3 = l1 + (long)i;
        l1 = l3;
        if (copystreamlistener == null)
        {
            continue; /* Loop/switch isn't completed */
        }
        l2 = l3;
        copystreamlistener.bytesTransferred(l3, i, l);
        l1 = l3;
        if (true) goto _L2; else goto _L1
_L2:
        break MISSING_BLOCK_LABEL_12;
_L1:
        return l1;
    }

    public static final long copyStream(InputStream inputstream, OutputStream outputstream)
        throws CopyStreamException
    {
        return copyStream(inputstream, outputstream, 1024);
    }

    public static final long copyStream(InputStream inputstream, OutputStream outputstream, int i)
        throws CopyStreamException
    {
        return copyStream(inputstream, outputstream, i, -1L, null);
    }

    public static final long copyStream(InputStream inputstream, OutputStream outputstream, int i, long l, CopyStreamListener copystreamlistener)
        throws CopyStreamException
    {
        return copyStream(inputstream, outputstream, i, l, copystreamlistener, true);
    }

    public static final long copyStream(InputStream inputstream, OutputStream outputstream, int i, long l, CopyStreamListener copystreamlistener, boolean flag)
        throws CopyStreamException
    {
        long l1 = 0L;
        byte abyte0[];
        long l2;
        long l3;
        if (i < 0)
        {
            i = 1024;
        }
        abyte0 = new byte[i];
        l2 = l1;
        try
        {
            i = inputstream.read(abyte0);
        }
        // Misplaced declaration of an exception variable
        catch (InputStream inputstream)
        {
            throw new CopyStreamException("IOException caught while copying.", l2, inputstream);
        }
        if (i == -1)
        {
            break; /* Loop/switch isn't completed */
        }
        if (i != 0)
        {
            break MISSING_BLOCK_LABEL_121;
        }
        l2 = l1;
        i = inputstream.read();
        if (i < 0)
        {
            return l1;
        }
        l2 = l1;
        outputstream.write(i);
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_70;
        }
        l2 = l1;
        outputstream.flush();
        l3 = l1 + 1L;
        l1 = l3;
        if (copystreamlistener == null)
        {
            continue; /* Loop/switch isn't completed */
        }
        l2 = l3;
        copystreamlistener.bytesTransferred(l3, 1, l);
        l1 = l3;
        continue; /* Loop/switch isn't completed */
        l2 = l1;
        outputstream.write(abyte0, 0, i);
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_146;
        }
        l2 = l1;
        outputstream.flush();
        l3 = l1 + (long)i;
        l1 = l3;
        if (copystreamlistener == null)
        {
            continue; /* Loop/switch isn't completed */
        }
        l2 = l3;
        copystreamlistener.bytesTransferred(l3, i, l);
        l1 = l3;
        if (true) goto _L2; else goto _L1
_L2:
        break MISSING_BLOCK_LABEL_12;
_L1:
        return l1;
    }
}
