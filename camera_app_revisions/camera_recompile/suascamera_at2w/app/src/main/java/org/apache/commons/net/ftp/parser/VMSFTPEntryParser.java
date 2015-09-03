// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.StringTokenizer;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPListParseEngine;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            ConfigurableFTPFileEntryParserImpl

public class VMSFTPEntryParser extends ConfigurableFTPFileEntryParserImpl
{

    private static final String DEFAULT_DATE_FORMAT = "d-MMM-yyyy HH:mm:ss";
    private static final String REGEX = "(.*;[0-9]+)\\s*(\\d+)/\\d+\\s*(\\S+)\\s+(\\S+)\\s+\\[(([0-9$A-Za-z_]+)|([0-9$A-Za-z_]+),([0-9$a-zA-Z_]+))\\]?\\s*\\([a-zA-Z]*,([a-zA-Z]*),([a-zA-Z]*),([a-zA-Z]*)\\)";

    public VMSFTPEntryParser()
    {
        this(null);
    }

    public VMSFTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        super("(.*;[0-9]+)\\s*(\\d+)/\\d+\\s*(\\S+)\\s+(\\S+)\\s+\\[(([0-9$A-Za-z_]+)|([0-9$A-Za-z_]+),([0-9$a-zA-Z_]+))\\]?\\s*\\([a-zA-Z]*,([a-zA-Z]*),([a-zA-Z]*),([a-zA-Z]*)\\)");
        configure(ftpclientconfig);
    }

    protected FTPClientConfig getDefaultConfiguration()
    {
        return new FTPClientConfig("VMS", "d-MMM-yyyy HH:mm:ss", null, null, null, null);
    }

    protected boolean isVersioning()
    {
        return false;
    }

    public FTPFile parseFTPEntry(String s)
    {
        if (!matches(s))
        {
            break MISSING_BLOCK_LABEL_375;
        }
        FTPFile ftpfile = new FTPFile();
        ftpfile.setRawListing(s);
        String s4 = group(1);
        String s5 = group(2);
        Object obj = (new StringBuilder()).append(group(3)).append(" ").append(group(4)).toString();
        s = group(5);
        String s1 = group(9);
        String s2 = group(10);
        String s3 = group(11);
        int i;
        boolean flag;
        try
        {
            ftpfile.setTimestamp(super.parseTimestamp(((String) (obj))));
        }
        catch (ParseException parseexception) { }
        obj = new StringTokenizer(s, ",");
        ((StringTokenizer) (obj)).countTokens();
        JVM INSTR tableswitch 1 2: default 144
    //                   1 306
    //                   2 316;
           goto _L1 _L2 _L3
_L3:
        break MISSING_BLOCK_LABEL_316;
_L1:
        s = null;
        obj = null;
_L4:
        if (s4.lastIndexOf(".DIR") != -1)
        {
            ftpfile.setType(1);
        } else
        {
            ftpfile.setType(0);
        }
        if (isVersioning())
        {
            ftpfile.setName(s4);
        } else
        {
            ftpfile.setName(s4.substring(0, s4.lastIndexOf(";")));
        }
        ftpfile.setSize(Long.parseLong(s5) * 512L);
        ftpfile.setGroup(s);
        ftpfile.setUser(((String) (obj)));
        i = 0;
        do
        {
            s = ftpfile;
            if (i >= 3)
            {
                break;
            }
            s = (new String[] {
                s1, s2, s3
            })[i];
            if (s.indexOf('R') >= 0)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            ftpfile.setPermission(i, 0, flag);
            if (s.indexOf('W') >= 0)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            ftpfile.setPermission(i, 1, flag);
            if (s.indexOf('E') >= 0)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            ftpfile.setPermission(i, 2, flag);
            i++;
        } while (true);
        break MISSING_BLOCK_LABEL_377;
_L2:
        s = null;
        obj = ((StringTokenizer) (obj)).nextToken();
          goto _L4
        s = ((StringTokenizer) (obj)).nextToken();
        obj = ((StringTokenizer) (obj)).nextToken();
          goto _L4
        s = null;
        return s;
    }

    public FTPFile[] parseFileList(InputStream inputstream)
        throws IOException
    {
        FTPListParseEngine ftplistparseengine = new FTPListParseEngine(this);
        ftplistparseengine.readServerList(inputstream, null);
        return ftplistparseengine.getFiles();
    }

    public String readNextEntry(BufferedReader bufferedreader)
        throws IOException
    {
        String s = bufferedreader.readLine();
        StringBuilder stringbuilder = new StringBuilder();
        do
        {
label0:
            {
                if (s != null)
                {
                    if (s.startsWith("Directory") || s.startsWith("Total"))
                    {
                        s = bufferedreader.readLine();
                        continue;
                    }
                    stringbuilder.append(s);
                    if (!s.trim().endsWith(")"))
                    {
                        break label0;
                    }
                }
                if (stringbuilder.length() == 0)
                {
                    return null;
                } else
                {
                    return stringbuilder.toString();
                }
            }
            s = bufferedreader.readLine();
        } while (true);
    }
}
