// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

// Referenced classes of package org.apache.commons.net.ftp:
//            FTPFileEntryParser

public abstract class FTPFileEntryParserImpl
    implements FTPFileEntryParser
{

    public FTPFileEntryParserImpl()
    {
    }

    public List preParse(List list)
    {
        return list;
    }

    public String readNextEntry(BufferedReader bufferedreader)
        throws IOException
    {
        return bufferedreader.readLine();
    }
}
