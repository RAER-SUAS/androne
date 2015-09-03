// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import org.apache.commons.net.util.Charsets;

// Referenced classes of package org.apache.commons.net.ftp:
//            FTPFileEntryParser, FTPFileFilters, FTPFileFilter, FTPFile

public class FTPListParseEngine
{

    private ListIterator _internalIterator;
    private List entries;
    private final FTPFileEntryParser parser;

    public FTPListParseEngine(FTPFileEntryParser ftpfileentryparser)
    {
        entries = new LinkedList();
        _internalIterator = entries.listIterator();
        parser = ftpfileentryparser;
    }

    private void readStream(InputStream inputstream, String s)
        throws IOException
    {
        s = new BufferedReader(new InputStreamReader(inputstream, Charsets.toCharset(s)));
        for (inputstream = parser.readNextEntry(s); inputstream != null; inputstream = parser.readNextEntry(s))
        {
            entries.add(inputstream);
        }

        s.close();
    }

    public FTPFile[] getFiles()
        throws IOException
    {
        return getFiles(FTPFileFilters.NON_NULL);
    }

    public FTPFile[] getFiles(FTPFileFilter ftpfilefilter)
        throws IOException
    {
        ArrayList arraylist = new ArrayList();
        Iterator iterator = entries.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                break;
            }
            Object obj = (String)iterator.next();
            obj = parser.parseFTPEntry(((String) (obj)));
            if (ftpfilefilter.accept(((FTPFile) (obj))))
            {
                arraylist.add(obj);
            }
        } while (true);
        return (FTPFile[])arraylist.toArray(new FTPFile[arraylist.size()]);
    }

    public FTPFile[] getNext(int i)
    {
        LinkedList linkedlist = new LinkedList();
        for (; i > 0 && _internalIterator.hasNext(); i--)
        {
            String s = (String)_internalIterator.next();
            linkedlist.add(parser.parseFTPEntry(s));
        }

        return (FTPFile[])linkedlist.toArray(new FTPFile[linkedlist.size()]);
    }

    public FTPFile[] getPrevious(int i)
    {
        LinkedList linkedlist = new LinkedList();
        for (; i > 0 && _internalIterator.hasPrevious(); i--)
        {
            String s = (String)_internalIterator.previous();
            linkedlist.add(0, parser.parseFTPEntry(s));
        }

        return (FTPFile[])linkedlist.toArray(new FTPFile[linkedlist.size()]);
    }

    public boolean hasNext()
    {
        return _internalIterator.hasNext();
    }

    public boolean hasPrevious()
    {
        return _internalIterator.hasPrevious();
    }

    public void readServerList(InputStream inputstream)
        throws IOException
    {
        readServerList(inputstream, null);
    }

    public void readServerList(InputStream inputstream, String s)
        throws IOException
    {
        entries = new LinkedList();
        readStream(inputstream, s);
        parser.preParse(entries);
        resetIterator();
    }

    public void resetIterator()
    {
        _internalIterator = entries.listIterator();
    }
}
