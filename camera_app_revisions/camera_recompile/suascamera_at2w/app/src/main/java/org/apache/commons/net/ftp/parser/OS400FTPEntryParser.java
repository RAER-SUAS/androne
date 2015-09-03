// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            ConfigurableFTPFileEntryParserImpl

public class OS400FTPEntryParser extends ConfigurableFTPFileEntryParserImpl
{

    private static final String DEFAULT_DATE_FORMAT = "yy/MM/dd HH:mm:ss";
    private static final String REGEX = "(\\S+)\\s+(\\d+)\\s+(\\S+)\\s+(\\S+)\\s+(\\*\\S+)\\s+(\\S+/?)\\s*";

    public OS400FTPEntryParser()
    {
        this(null);
    }

    public OS400FTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        super("(\\S+)\\s+(\\d+)\\s+(\\S+)\\s+(\\S+)\\s+(\\*\\S+)\\s+(\\S+/?)\\s*");
        configure(ftpclientconfig);
    }

    protected FTPClientConfig getDefaultConfiguration()
    {
        return new FTPClientConfig("OS/400", "yy/MM/dd HH:mm:ss", null, null, null, null);
    }

    public FTPFile parseFTPEntry(String s)
    {
        FTPFile ftpfile = new FTPFile();
        ftpfile.setRawListing(s);
        if (matches(s))
        {
            s = group(1);
            String s2 = group(2);
            String s4 = (new StringBuilder()).append(group(3)).append(" ").append(group(4)).toString();
            String s3 = group(5);
            String s1 = group(6);
            int i;
            try
            {
                ftpfile.setTimestamp(super.parseTimestamp(s4));
            }
            catch (ParseException parseexception) { }
            if (s3.equalsIgnoreCase("*STMF"))
            {
                i = 0;
            } else
            if (s3.equalsIgnoreCase("*DIR"))
            {
                i = 1;
            } else
            {
                i = 3;
            }
            ftpfile.setType(i);
            ftpfile.setUser(s);
            try
            {
                ftpfile.setSize(Long.parseLong(s2));
            }
            // Misplaced declaration of an exception variable
            catch (String s) { }
            s = s1;
            if (s1.endsWith("/"))
            {
                s = s1.substring(0, s1.length() - 1);
            }
            i = s.lastIndexOf('/');
            s1 = s;
            if (i > -1)
            {
                s1 = s.substring(i + 1);
            }
            ftpfile.setName(s1);
            return ftpfile;
        } else
        {
            return null;
        }
    }
}
