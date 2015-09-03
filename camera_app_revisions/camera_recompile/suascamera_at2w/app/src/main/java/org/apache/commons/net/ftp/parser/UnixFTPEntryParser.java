// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import java.util.List;
import java.util.ListIterator;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            ConfigurableFTPFileEntryParserImpl

public class UnixFTPEntryParser extends ConfigurableFTPFileEntryParserImpl
{

    static final String DEFAULT_DATE_FORMAT = "MMM d yyyy";
    static final String DEFAULT_RECENT_DATE_FORMAT = "MMM d HH:mm";
    public static final FTPClientConfig NUMERIC_DATE_CONFIG = new FTPClientConfig("UNIX", "yyyy-MM-dd HH:mm", null, null, null, null);
    static final String NUMERIC_DATE_FORMAT = "yyyy-MM-dd HH:mm";
    private static final String REGEX = "([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s*(\\d+)\\s+(?:(\\S+(?:\\s\\S+)*?)\\s+)?(?:(\\S+(?:\\s\\S+)*)\\s+)?(\\d+(?:,\\s*\\d+)?)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)";

    public UnixFTPEntryParser()
    {
        this(null);
    }

    public UnixFTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        super("([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s*(\\d+)\\s+(?:(\\S+(?:\\s\\S+)*?)\\s+)?(?:(\\S+(?:\\s\\S+)*)\\s+)?(\\d+(?:,\\s*\\d+)?)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)");
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
            break MISSING_BLOCK_LABEL_506;
        }
        String s6 = group(1);
        String s5 = group(15);
        String s2 = group(16);
        String s3 = group(17);
        String s4 = group(18);
        String s7 = (new StringBuilder()).append(group(19)).append(" ").append(group(20)).toString();
        s = group(21);
        String s1 = group(22);
        NumberFormatException numberformatexception;
        NumberFormatException numberformatexception1;
        int i;
        int j;
        int k;
        boolean flag1;
        try
        {
            ftpfile.setTimestamp(super.parseTimestamp(s7));
        }
        catch (ParseException parseexception) { }
        s6.charAt(0);
        JVM INSTR lookupswitch 7: default 196
    //                   45: 353
    //                   98: 344
    //                   99: 344
    //                   100: 326
    //                   101: 332
    //                   102: 353
    //                   108: 338;
           goto _L1 _L2 _L3 _L3 _L4 _L5 _L2 _L6
_L2:
        break MISSING_BLOCK_LABEL_353;
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
            s6 = group(j + 2);
            if (!s6.equals("-") && !Character.isUpperCase(s6.charAt(0)))
            {
                ftpfile.setPermission(k, 2, true);
            } else
            {
                ftpfile.setPermission(k, 2, false);
            }
            k++;
            j += 4;
        }
        break MISSING_BLOCK_LABEL_382;
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
                ftpfile.setHardLinkCount(Integer.parseInt(s5));
            }
            // Misplaced declaration of an exception variable
            catch (NumberFormatException numberformatexception1) { }
        }
        ftpfile.setUser(s2);
        ftpfile.setGroup(s3);
        try
        {
            ftpfile.setSize(Long.parseLong(s4));
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

    public List preParse(List list)
    {
        ListIterator listiterator = list.listIterator();
        do
        {
            if (!listiterator.hasNext())
            {
                break;
            }
            if (((String)listiterator.next()).matches("^total \\d+$"))
            {
                listiterator.remove();
            }
        } while (true);
        return list;
    }

}
