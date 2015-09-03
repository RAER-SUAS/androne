// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPFileEntryParserImpl;

public class MLSxEntryParser extends FTPFileEntryParserImpl
{

    private static final MLSxEntryParser PARSER = new MLSxEntryParser();
    private static final HashMap TYPE_TO_INT;
    private static int UNIX_GROUPS[] = {
        0, 1, 2
    };
    private static int UNIX_PERMS[][] = {
        new int[0], {
            2
        }, {
            1
        }, {
            2, 1
        }, {
            0
        }, {
            0, 2
        }, {
            0, 1
        }, {
            0, 1, 2
        }
    };

    public MLSxEntryParser()
    {
    }

    private void doUnixPerms(FTPFile ftpfile, String s)
    {
        int i;
        int j;
        s = s.toCharArray();
        j = s.length;
        i = 0;
_L12:
        if (i >= j)
        {
            break MISSING_BLOCK_LABEL_225;
        }
        s[i];
        JVM INSTR tableswitch 97 119: default 128
    //                   97 135
    //                   98 128
    //                   99 145
    //                   100 155
    //                   101 165
    //                   102 128
    //                   103 128
    //                   104 128
    //                   105 128
    //                   106 128
    //                   107 128
    //                   108 175
    //                   109 185
    //                   110 128
    //                   111 128
    //                   112 195
    //                   113 128
    //                   114 205
    //                   115 128
    //                   116 128
    //                   117 128
    //                   118 128
    //                   119 215;
           goto _L1 _L2 _L1 _L3 _L4 _L5 _L1 _L1 _L1 _L1 _L1 _L1 _L6 _L7 _L1 _L1 _L8 _L1 _L9 _L1 _L1 _L1 _L1 _L10
_L10:
        break MISSING_BLOCK_LABEL_215;
_L1:
        break; /* Loop/switch isn't completed */
_L2:
        break; /* Loop/switch isn't completed */
_L13:
        i++;
        if (true) goto _L12; else goto _L11
_L11:
        ftpfile.setPermission(0, 1, true);
          goto _L13
_L3:
        ftpfile.setPermission(0, 1, true);
          goto _L13
_L4:
        ftpfile.setPermission(0, 1, true);
          goto _L13
_L5:
        ftpfile.setPermission(0, 0, true);
          goto _L13
_L6:
        ftpfile.setPermission(0, 2, true);
          goto _L13
_L7:
        ftpfile.setPermission(0, 1, true);
          goto _L13
_L8:
        ftpfile.setPermission(0, 1, true);
          goto _L13
_L9:
        ftpfile.setPermission(0, 0, true);
          goto _L13
        ftpfile.setPermission(0, 1, true);
          goto _L13
    }

    public static MLSxEntryParser getInstance()
    {
        return PARSER;
    }

    public static FTPFile parseEntry(String s)
    {
        return PARSER.parseFTPEntry(s);
    }

    public FTPFile parseFTPEntry(String s)
    {
        String as1[] = s.split(" ", 2);
        if (as1.length == 2) goto _L2; else goto _L1
_L1:
        s = null;
_L4:
        return s;
_L2:
        FTPFile ftpfile = new FTPFile();
        ftpfile.setRawListing(s);
        ftpfile.setName(as1[1]);
        String as[] = as1[0].split(";");
        boolean flag = as1[0].toLowerCase(Locale.ENGLISH).contains("unix.mode=");
        int l = as.length;
        int i = 0;
        do
        {
            s = ftpfile;
            if (i >= l)
            {
                continue;
            }
            String as2[] = as[i].split("=");
            if (as2.length == 2)
            {
                s = as2[0].toLowerCase(Locale.ENGLISH);
                String s1 = as2[1];
                Object obj = s1.toLowerCase(Locale.ENGLISH);
                if ("size".equals(s))
                {
                    ftpfile.setSize(Long.parseLong(s1));
                } else
                if ("sizd".equals(s))
                {
                    ftpfile.setSize(Long.parseLong(s1));
                } else
                if ("modify".equals(s))
                {
                    if (s1.contains("."))
                    {
                        s = new SimpleDateFormat("yyyyMMddHHmmss.SSS");
                    } else
                    {
                        s = new SimpleDateFormat("yyyyMMddHHmmss");
                    }
                    obj = TimeZone.getTimeZone("GMT");
                    s.setTimeZone(((TimeZone) (obj)));
                    obj = new GregorianCalendar(((TimeZone) (obj)));
                    int j;
                    int k;
                    int i1;
                    int j1;
                    int k1;
                    try
                    {
                        ((GregorianCalendar) (obj)).setTime(s.parse(s1));
                    }
                    // Misplaced declaration of an exception variable
                    catch (String s) { }
                    ftpfile.setTimestamp(((java.util.Calendar) (obj)));
                } else
                if ("type".equals(s))
                {
                    s = (Integer)TYPE_TO_INT.get(obj);
                    if (s == null)
                    {
                        ftpfile.setType(3);
                    } else
                    {
                        ftpfile.setType(s.intValue());
                    }
                } else
                if (s.startsWith("unix."))
                {
                    s = s.substring("unix.".length()).toLowerCase(Locale.ENGLISH);
                    if ("group".equals(s))
                    {
                        ftpfile.setGroup(s1);
                    } else
                    if ("owner".equals(s))
                    {
                        ftpfile.setUser(s1);
                    } else
                    if ("mode".equals(s))
                    {
                        i1 = s1.length();
                        j = 0;
                        while (j < 3) 
                        {
                            k = s1.charAt((i1 - 3) + j) - 48;
                            if (k >= 0 && k <= 7)
                            {
                                s = UNIX_PERMS[k];
                                j1 = s.length;
                                for (k = 0; k < j1; k++)
                                {
                                    k1 = s[k];
                                    ftpfile.setPermission(UNIX_GROUPS[j], k1, true);
                                }

                            }
                            j++;
                        }
                    }
                } else
                if (!flag && "perm".equals(s))
                {
                    doUnixPerms(ftpfile, ((String) (obj)));
                }
            }
            i++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    static 
    {
        TYPE_TO_INT = new HashMap();
        TYPE_TO_INT.put("file", Integer.valueOf(0));
        TYPE_TO_INT.put("cdir", Integer.valueOf(1));
        TYPE_TO_INT.put("pdir", Integer.valueOf(1));
        TYPE_TO_INT.put("dir", Integer.valueOf(1));
    }
}
