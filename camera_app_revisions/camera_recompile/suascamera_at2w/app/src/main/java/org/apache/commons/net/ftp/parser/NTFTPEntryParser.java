// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import org.apache.commons.net.ftp.Configurable;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            ConfigurableFTPFileEntryParserImpl, FTPTimestampParserImpl, FTPTimestampParser

public class NTFTPEntryParser extends ConfigurableFTPFileEntryParserImpl
{

    private static final String DEFAULT_DATE_FORMAT = "MM-dd-yy hh:mma";
    private static final String DEFAULT_DATE_FORMAT2 = "MM-dd-yy kk:mm";
    private static final String REGEX = "(\\S+)\\s+(\\S+)\\s+(?:(<DIR>)|([0-9]+))\\s+(\\S.*)";
    private final FTPTimestampParser timestampParser;

    public NTFTPEntryParser()
    {
        this(null);
    }

    public NTFTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        super("(\\S+)\\s+(\\S+)\\s+(?:(<DIR>)|([0-9]+))\\s+(\\S.*)");
        configure(ftpclientconfig);
        ftpclientconfig = new FTPClientConfig("WINDOWS", "MM-dd-yy kk:mm", null, null, null, null);
        ftpclientconfig.setDefaultDateFormatStr("MM-dd-yy kk:mm");
        timestampParser = new FTPTimestampParserImpl();
        ((Configurable)timestampParser).configure(ftpclientconfig);
    }

    public FTPClientConfig getDefaultConfiguration()
    {
        return new FTPClientConfig("WINDOWS", "MM-dd-yy hh:mma", null, null, null, null);
    }

    public FTPFile parseFTPEntry(String s)
    {
        FTPFile ftpfile;
        String s1;
        String s2;
        ftpfile = new FTPFile();
        ftpfile.setRawListing(s);
        if (!matches(s))
        {
            break MISSING_BLOCK_LABEL_185;
        }
        String s3 = (new StringBuilder()).append(group(1)).append(" ").append(group(2)).toString();
        s = group(3);
        s1 = group(4);
        s2 = group(5);
        try
        {
            ftpfile.setTimestamp(super.parseTimestamp(s3));
        }
        catch (ParseException parseexception1)
        {
            try
            {
                ftpfile.setTimestamp(timestampParser.parseTimestamp(s3));
            }
            catch (ParseException parseexception) { }
        }
        if (s2 != null && !s2.equals(".") && !s2.equals("..")) goto _L2; else goto _L1
_L1:
        s = null;
_L4:
        return s;
_L2:
        ftpfile.setName(s2);
        if ("<DIR>".equals(s))
        {
            ftpfile.setType(1);
            ftpfile.setSize(0L);
            return ftpfile;
        }
        ftpfile.setType(0);
        s = ftpfile;
        if (s1 == null) goto _L4; else goto _L3
_L3:
        ftpfile.setSize(Long.parseLong(s1));
        return ftpfile;
        return null;
    }
}
