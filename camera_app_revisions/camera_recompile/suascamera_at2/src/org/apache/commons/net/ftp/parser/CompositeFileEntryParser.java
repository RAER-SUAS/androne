// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPFileEntryParser;
import org.apache.commons.net.ftp.FTPFileEntryParserImpl;

public class CompositeFileEntryParser extends FTPFileEntryParserImpl
{

    private FTPFileEntryParser cachedFtpFileEntryParser;
    private final FTPFileEntryParser ftpFileEntryParsers[];

    public CompositeFileEntryParser(FTPFileEntryParser aftpfileentryparser[])
    {
        cachedFtpFileEntryParser = null;
        ftpFileEntryParsers = aftpfileentryparser;
    }

    public FTPFile parseFTPEntry(String s)
    {
        if (cachedFtpFileEntryParser != null)
        {
            s = cachedFtpFileEntryParser.parseFTPEntry(s);
            if (s != null)
            {
                return s;
            }
        } else
        {
            FTPFileEntryParser aftpfileentryparser[] = ftpFileEntryParsers;
            int j = aftpfileentryparser.length;
            for (int i = 0; i < j; i++)
            {
                FTPFileEntryParser ftpfileentryparser = aftpfileentryparser[i];
                FTPFile ftpfile = ftpfileentryparser.parseFTPEntry(s);
                if (ftpfile != null)
                {
                    cachedFtpFileEntryParser = ftpfileentryparser;
                    return ftpfile;
                }
            }

        }
        return null;
    }
}
