// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            ConfigurableFTPFileEntryParserImpl

public class OS2FTPEntryParser extends ConfigurableFTPFileEntryParserImpl
{

    private static final String DEFAULT_DATE_FORMAT = "MM-dd-yy HH:mm";
    private static final String REGEX = "\\s*([0-9]+)\\s*(\\s+|[A-Z]+)\\s*(DIR|\\s+)\\s*(\\S+)\\s+(\\S+)\\s+(\\S.*)";

    public OS2FTPEntryParser()
    {
        this(null);
    }

    public OS2FTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        super("\\s*([0-9]+)\\s*(\\s+|[A-Z]+)\\s*(DIR|\\s+)\\s*(\\S+)\\s+(\\S+)\\s+(\\S.*)");
        configure(ftpclientconfig);
    }

    protected FTPClientConfig getDefaultConfiguration()
    {
        return new FTPClientConfig("OS/2", "MM-dd-yy HH:mm", null, null, null, null);
    }

    public FTPFile parseFTPEntry(String s)
    {
        FTPFile ftpfile = new FTPFile();
        if (matches(s))
        {
            s = group(1);
            String s1 = group(2);
            String s2 = group(3);
            String s4 = (new StringBuilder()).append(group(4)).append(" ").append(group(5)).toString();
            String s3 = group(6);
            try
            {
                ftpfile.setTimestamp(super.parseTimestamp(s4));
            }
            catch (ParseException parseexception) { }
            if (s2.trim().equals("DIR") || s1.trim().equals("DIR"))
            {
                ftpfile.setType(1);
            } else
            {
                ftpfile.setType(0);
            }
            ftpfile.setName(s3.trim());
            ftpfile.setSize(Long.parseLong(s.trim()));
            return ftpfile;
        } else
        {
            return null;
        }
    }
}
