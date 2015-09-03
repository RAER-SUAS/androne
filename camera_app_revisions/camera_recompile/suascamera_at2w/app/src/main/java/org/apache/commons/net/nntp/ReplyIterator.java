// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import org.apache.commons.net.io.DotTerminatedMessageReader;
import org.apache.commons.net.io.Util;

class ReplyIterator
    implements Iterator, Iterable
{

    private String line;
    private final BufferedReader reader;
    private Exception savedException;

    ReplyIterator(BufferedReader bufferedreader)
        throws IOException
    {
        this(bufferedreader, true);
    }

    ReplyIterator(BufferedReader bufferedreader, boolean flag)
        throws IOException
    {
        Object obj = bufferedreader;
        if (flag)
        {
            obj = new DotTerminatedMessageReader(bufferedreader);
        }
        reader = ((BufferedReader) (obj));
        line = reader.readLine();
        if (line == null)
        {
            Util.closeQuietly(reader);
        }
    }

    public boolean hasNext()
    {
        if (savedException != null)
        {
            throw new NoSuchElementException(savedException.toString());
        }
        return line != null;
    }

    public Iterator iterator()
    {
        return this;
    }

    public volatile Object next()
    {
        return next();
    }

    public String next()
        throws NoSuchElementException
    {
        if (savedException != null)
        {
            throw new NoSuchElementException(savedException.toString());
        }
        String s = line;
        if (s == null)
        {
            throw new NoSuchElementException();
        }
        try
        {
            line = reader.readLine();
            if (line == null)
            {
                Util.closeQuietly(reader);
            }
        }
        catch (IOException ioexception)
        {
            savedException = ioexception;
            Util.closeQuietly(reader);
            return s;
        }
        return s;
    }

    public void remove()
    {
        throw new UnsupportedOperationException();
    }
}
