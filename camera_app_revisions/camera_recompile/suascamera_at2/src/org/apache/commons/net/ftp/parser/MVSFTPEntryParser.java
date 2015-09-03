// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import java.util.List;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            ConfigurableFTPFileEntryParserImpl, UnixFTPEntryParser

public class MVSFTPEntryParser extends ConfigurableFTPFileEntryParserImpl
{

    static final String DEFAULT_DATE_FORMAT = "yyyy/MM/dd HH:mm";
    static final String FILE_LIST_REGEX = "\\S+\\s+\\S+\\s+\\S+\\s+\\S+\\s+\\S+\\s+[FV]\\S*\\s+\\S+\\s+\\S+\\s+(PS|PO|PO-E)\\s+(\\S+)\\s*";
    static final int FILE_LIST_TYPE = 0;
    static final String JES_LEVEL_1_LIST_REGEX = "(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s*";
    static final int JES_LEVEL_1_LIST_TYPE = 3;
    static final String JES_LEVEL_2_LIST_REGEX = "(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+).*";
    static final int JES_LEVEL_2_LIST_TYPE = 4;
    static final String MEMBER_LIST_REGEX = "(\\S+)\\s+\\S+\\s+\\S+\\s+(\\S+)\\s+(\\S+)\\s+\\S+\\s+\\S+\\s+\\S+\\s+\\S+\\s*";
    static final int MEMBER_LIST_TYPE = 1;
    static final int UNIX_LIST_TYPE = 2;
    static final int UNKNOWN_LIST_TYPE = -1;
    private int isType;
    private UnixFTPEntryParser unixFTPEntryParser;

    public MVSFTPEntryParser()
    {
        super("");
        isType = -1;
        super.configure(null);
    }

    private boolean parseFileList(FTPFile ftpfile, String s)
    {
        boolean flag;
        boolean flag1;
        flag1 = false;
        flag = flag1;
        if (!matches(s)) goto _L2; else goto _L1
_L1:
        String s1;
        ftpfile.setRawListing(s);
        s = group(2);
        s1 = group(1);
        ftpfile.setName(s);
        if (!"PS".equals(s1)) goto _L4; else goto _L3
_L3:
        ftpfile.setType(0);
_L7:
        flag = true;
_L2:
        return flag;
_L4:
        if ("PO".equals(s1))
        {
            break; /* Loop/switch isn't completed */
        }
        flag = flag1;
        if (!"PO-E".equals(s1)) goto _L2; else goto _L5
_L5:
        ftpfile.setType(1);
        if (true) goto _L7; else goto _L6
_L6:
    }

    private boolean parseJeslevel1List(FTPFile ftpfile, String s)
    {
        boolean flag1 = false;
        boolean flag = flag1;
        if (matches(s))
        {
            flag = flag1;
            if (group(3).equalsIgnoreCase("OUTPUT"))
            {
                ftpfile.setRawListing(s);
                ftpfile.setName(group(2));
                ftpfile.setType(0);
                flag = true;
            }
        }
        return flag;
    }

    private boolean parseJeslevel2List(FTPFile ftpfile, String s)
    {
        boolean flag1 = false;
        boolean flag = flag1;
        if (matches(s))
        {
            flag = flag1;
            if (group(4).equalsIgnoreCase("OUTPUT"))
            {
                ftpfile.setRawListing(s);
                ftpfile.setName(group(2));
                ftpfile.setType(0);
                flag = true;
            }
        }
        return flag;
    }

    private boolean parseMemberList(FTPFile ftpfile, String s)
    {
        if (matches(s))
        {
            ftpfile.setRawListing(s);
            s = group(1);
            String s1 = (new StringBuilder()).append(group(2)).append(" ").append(group(3)).toString();
            ftpfile.setName(s);
            ftpfile.setType(0);
            try
            {
                ftpfile.setTimestamp(super.parseTimestamp(s1));
            }
            // Misplaced declaration of an exception variable
            catch (FTPFile ftpfile)
            {
                ftpfile.printStackTrace();
                return false;
            }
            return true;
        } else
        {
            return false;
        }
    }

    private boolean parseSimpleEntry(FTPFile ftpfile, String s)
    {
        boolean flag1 = false;
        boolean flag = flag1;
        if (s != null)
        {
            flag = flag1;
            if (s.trim().length() > 0)
            {
                ftpfile.setRawListing(s);
                ftpfile.setName(s.split(" ")[0]);
                ftpfile.setType(0);
                flag = true;
            }
        }
        return flag;
    }

    private boolean parseUnixList(FTPFile ftpfile, String s)
    {
        return unixFTPEntryParser.parseFTPEntry(s) != null;
    }

    protected FTPClientConfig getDefaultConfiguration()
    {
        return new FTPClientConfig("MVS", "yyyy/MM/dd HH:mm", null, null, null, null);
    }

    public FTPFile parseFTPEntry(String s)
    {
        FTPFile ftpfile;
        boolean flag;
        flag = false;
        ftpfile = new FTPFile();
        if (isType != 0) goto _L2; else goto _L1
_L1:
        flag = parseFileList(ftpfile, s);
_L4:
        s = ftpfile;
        if (!flag)
        {
            s = null;
        }
        return s;
_L2:
        if (isType == 1)
        {
            boolean flag1 = parseMemberList(ftpfile, s);
            flag = flag1;
            if (!flag1)
            {
                flag = parseSimpleEntry(ftpfile, s);
            }
        } else
        if (isType == 2)
        {
            flag = parseUnixList(ftpfile, s);
        } else
        if (isType == 3)
        {
            flag = parseJeslevel1List(ftpfile, s);
        } else
        if (isType == 4)
        {
            flag = parseJeslevel2List(ftpfile, s);
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public List preParse(List list)
    {
        if (list != null && list.size() > 0)
        {
            String s = (String)list.get(0);
            if (s.indexOf("Volume") >= 0 && s.indexOf("Dsname") >= 0)
            {
                setType(0);
                super.setRegex("\\S+\\s+\\S+\\s+\\S+\\s+\\S+\\s+\\S+\\s+[FV]\\S*\\s+\\S+\\s+\\S+\\s+(PS|PO|PO-E)\\s+(\\S+)\\s*");
            } else
            if (s.indexOf("Name") >= 0 && s.indexOf("Id") >= 0)
            {
                setType(1);
                super.setRegex("(\\S+)\\s+\\S+\\s+\\S+\\s+(\\S+)\\s+(\\S+)\\s+\\S+\\s+\\S+\\s+\\S+\\s+\\S+\\s*");
            } else
            if (s.indexOf("total") == 0)
            {
                setType(2);
                unixFTPEntryParser = new UnixFTPEntryParser();
            } else
            if (s.indexOf("Spool Files") >= 30)
            {
                setType(3);
                super.setRegex("(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s*");
            } else
            if (s.indexOf("JOBNAME") == 0 && s.indexOf("JOBID") > 8)
            {
                setType(4);
                super.setRegex("(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+).*");
            } else
            {
                setType(-1);
            }
            if (isType != 3)
            {
                list.remove(0);
            }
        }
        return list;
    }

    void setType(int i)
    {
        isType = i;
    }
}
