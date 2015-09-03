// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.util.Calendar;
import org.apache.commons.net.ftp.FTPFile;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            RegexFTPFileEntryParserImpl

public class EnterpriseUnixFTPEntryParser extends RegexFTPFileEntryParserImpl
{

    private static final String MONTHS = "(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)";
    private static final String REGEX = "(([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z]))(\\S*)\\s*(\\S+)\\s*(\\S*)\\s*(\\d*)\\s*(\\d*)\\s*(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\\s*((?:[012]\\d*)|(?:3[01]))\\s*((\\d\\d\\d\\d)|((?:[01]\\d)|(?:2[0123])):([012345]\\d))\\s(\\S*)(\\s*.*)";

    public EnterpriseUnixFTPEntryParser()
    {
        super("(([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z]))(\\S*)\\s*(\\S+)\\s*(\\S*)\\s*(\\d*)\\s*(\\d*)\\s*(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\\s*((?:[012]\\d*)|(?:3[01]))\\s*((\\d\\d\\d\\d)|((?:[01]\\d)|(?:2[0123])):([012345]\\d))\\s(\\S*)(\\s*.*)");
    }

    public FTPFile parseFTPEntry(String s)
    {
        FTPFile ftpfile;
        ftpfile = new FTPFile();
        ftpfile.setRawListing(s);
        if (!matches(s)) goto _L2; else goto _L1
_L1:
        Object obj = group(14);
        String s6 = group(15);
        String s7 = group(16);
        String s1 = group(17);
        String s2 = group(18);
        String s3 = group(20);
        String s4 = group(21);
        String s5 = group(22);
        s = group(23);
        ftpfile.setType(0);
        ftpfile.setUser(((String) (obj)));
        ftpfile.setGroup(s6);
        NumberFormatException numberformatexception;
        int i;
        int j;
        int k;
        try
        {
            ftpfile.setSize(Long.parseLong(s7));
        }
        catch (NumberFormatException numberformatexception1) { }
        obj = Calendar.getInstance();
        ((Calendar) (obj)).set(14, 0);
        ((Calendar) (obj)).set(13, 0);
        ((Calendar) (obj)).set(12, 0);
        ((Calendar) (obj)).set(11, 0);
        k = "(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)".indexOf(s1) / 4;
        if (s3 == null) goto _L4; else goto _L3
_L3:
        ((Calendar) (obj)).set(1, Integer.parseInt(s3));
_L7:
        ((Calendar) (obj)).set(2, k);
        ((Calendar) (obj)).set(5, Integer.parseInt(s2));
        ftpfile.setTimestamp(((Calendar) (obj)));
_L5:
        ftpfile.setName(s);
        return ftpfile;
_L4:
        j = ((Calendar) (obj)).get(1);
        i = j;
        if (((Calendar) (obj)).get(2) < k)
        {
            i = j - 1;
        }
        try
        {
            ((Calendar) (obj)).set(1, i);
            ((Calendar) (obj)).set(11, Integer.parseInt(s4));
            ((Calendar) (obj)).set(12, Integer.parseInt(s5));
            continue; /* Loop/switch isn't completed */
        }
        // Misplaced declaration of an exception variable
        catch (NumberFormatException numberformatexception) { }
        if (true) goto _L5; else goto _L2
_L2:
        return null;
        if (true) goto _L7; else goto _L6
_L6:
    }
}
