// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            ConfigurableFTPFileEntryParserImpl

public class NetwareFTPEntryParser extends ConfigurableFTPFileEntryParserImpl
{

    private static final String DEFAULT_DATE_FORMAT = "MMM dd yyyy";
    private static final String DEFAULT_RECENT_DATE_FORMAT = "MMM dd HH:mm";
    private static final String REGEX = "(d|-){1}\\s+\\[(.*)\\]\\s+(\\S+)\\s+(\\d+)\\s+(\\S+\\s+\\S+\\s+((\\d+:\\d+)|(\\d{4})))\\s+(.*)";

    public NetwareFTPEntryParser()
    {
        this(null);
    }

    public NetwareFTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        super("(d|-){1}\\s+\\[(.*)\\]\\s+(\\S+)\\s+(\\d+)\\s+(\\S+\\s+\\S+\\s+((\\d+:\\d+)|(\\d{4})))\\s+(.*)");
        configure(ftpclientconfig);
    }

    protected FTPClientConfig getDefaultConfiguration()
    {
        return new FTPClientConfig("NETWARE", "MMM dd yyyy", "MMM dd HH:mm", null, null, null);
    }

    public FTPFile parseFTPEntry(String s)
    {
        FTPFile ftpfile = new FTPFile();
        if (matches(s))
        {
            s = group(1);
            String s1 = group(2);
            String s2 = group(3);
            String s3 = group(4);
            String s5 = group(5);
            String s4 = group(9);
            try
            {
                ftpfile.setTimestamp(super.parseTimestamp(s5));
            }
            catch (ParseException parseexception) { }
            if (s.trim().equals("d"))
            {
                ftpfile.setType(1);
            } else
            {
                ftpfile.setType(0);
            }
            ftpfile.setUser(s2);
            ftpfile.setName(s4.trim());
            ftpfile.setSize(Long.parseLong(s3.trim()));
            if (s1.indexOf("R") != -1)
            {
                ftpfile.setPermission(0, 0, true);
            }
            if (s1.indexOf("W") != -1)
            {
                ftpfile.setPermission(0, 1, true);
            }
            return ftpfile;
        } else
        {
            return null;
        }
    }
}
