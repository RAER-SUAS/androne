// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            ConfigurableFTPFileEntryParserImpl

public class MacOsPeterFTPEntryParser extends ConfigurableFTPFileEntryParserImpl
{

    static final String DEFAULT_DATE_FORMAT = "MMM d yyyy";
    static final String DEFAULT_RECENT_DATE_FORMAT = "MMM d HH:mm";
    private static final String REGEX = "([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s+((folder\\s+)|((\\d+)\\s+(\\d+)\\s+))(\\d+)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)";

    public MacOsPeterFTPEntryParser()
    {
        this(null);
    }

    public MacOsPeterFTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        super("([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s+((folder\\s+)|((\\d+)\\s+(\\d+)\\s+))(\\d+)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)");
        configure(ftpclientconfig);
    }

    protected FTPClientConfig getDefaultConfiguration()
    {
        return new FTPClientConfig("UNIX", "MMM d yyyy", "MMM d HH:mm", null, null, null);
    }

    public FTPFile parseFTPEntry(String s)
    {
        FTPFile ftpfile = new FTPFile();
        ftpfile.setRawListing(s);
        boolean flag = false;
        if (!matches(s))
        {
            break MISSING_BLOCK_LABEL_480;
        }
        String s3 = group(1);
        String s2 = group(20);
        String s4 = (new StringBuilder()).append(group(21)).append(" ").append(group(22)).toString();
        s = group(23);
        String s1 = group(24);
        NumberFormatException numberformatexception;
        NumberFormatException numberformatexception1;
        int i;
        int j;
        int k;
        boolean flag1;
        try
        {
            ftpfile.setTimestamp(super.parseTimestamp(s4));
        }
        catch (ParseException parseexception) { }
        s3.charAt(0);
        JVM INSTR lookupswitch 7: default 172
    //                   45: 329
    //                   98: 320
    //                   99: 320
    //                   100: 302
    //                   101: 308
    //                   102: 329
    //                   108: 314;
           goto _L1 _L2 _L3 _L3 _L4 _L5 _L2 _L6
_L2:
        break MISSING_BLOCK_LABEL_329;
_L1:
        i = 3;
_L7:
        ftpfile.setType(i);
        j = 4;
        k = 0;
        while (k < 3) 
        {
            if (!group(j).equals("-"))
            {
                flag1 = true;
            } else
            {
                flag1 = false;
            }
            ftpfile.setPermission(k, 0, flag1);
            if (!group(j + 1).equals("-"))
            {
                flag1 = true;
            } else
            {
                flag1 = false;
            }
            ftpfile.setPermission(k, 1, flag1);
            s3 = group(j + 2);
            if (!s3.equals("-") && !Character.isUpperCase(s3.charAt(0)))
            {
                ftpfile.setPermission(k, 2, true);
            } else
            {
                ftpfile.setPermission(k, 2, false);
            }
            k++;
            j += 4;
        }
        break MISSING_BLOCK_LABEL_358;
_L4:
        i = 1;
          goto _L7
_L5:
        i = 2;
          goto _L7
_L6:
        i = 2;
          goto _L7
_L3:
        flag = true;
        i = 0;
          goto _L7
        i = 0;
          goto _L7
        if (!flag)
        {
            try
            {
                ftpfile.setHardLinkCount(Integer.parseInt("0"));
            }
            // Misplaced declaration of an exception variable
            catch (NumberFormatException numberformatexception1) { }
        }
        ftpfile.setUser(null);
        ftpfile.setGroup(null);
        try
        {
            ftpfile.setSize(Long.parseLong(s2));
        }
        // Misplaced declaration of an exception variable
        catch (NumberFormatException numberformatexception) { }
        if (s1 == null)
        {
            ftpfile.setName(s);
            return ftpfile;
        }
        s = (new StringBuilder()).append(s).append(s1).toString();
        if (i == 2)
        {
            i = s.indexOf(" -> ");
            if (i == -1)
            {
                ftpfile.setName(s);
                return ftpfile;
            } else
            {
                ftpfile.setName(s.substring(0, i));
                ftpfile.setLink(s.substring(i + 4));
                return ftpfile;
            }
        } else
        {
            ftpfile.setName(s);
            return ftpfile;
        }
        return null;
    }
}
