// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;
import org.apache.commons.net.ftp.FTPClientConfig;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            VMSFTPEntryParser

public class VMSVersioningFTPEntryParser extends VMSFTPEntryParser
{

    private static final String PRE_PARSE_REGEX = "(.*);([0-9]+)\\s*.*";
    private final Pattern _preparse_pattern_;

    public VMSVersioningFTPEntryParser()
    {
        this(null);
    }

    public VMSVersioningFTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        configure(ftpclientconfig);
        try
        {
            _preparse_pattern_ = Pattern.compile("(.*);([0-9]+)\\s*.*");
            return;
        }
        // Misplaced declaration of an exception variable
        catch (FTPClientConfig ftpclientconfig)
        {
            throw new IllegalArgumentException("Unparseable regex supplied:  (.*);([0-9]+)\\s*.*");
        }
    }

    protected boolean isVersioning()
    {
        return true;
    }

    public List preParse(List list)
    {
        HashMap hashmap = new HashMap();
        ListIterator listiterator = list.listIterator();
        do
        {
            if (!listiterator.hasNext())
            {
                break;
            }
            Object obj = ((String)listiterator.next()).trim();
            obj = _preparse_pattern_.matcher(((CharSequence) (obj)));
            if (((Matcher) (obj)).matches())
            {
                Object obj2 = ((Matcher) (obj)).toMatchResult();
                obj = ((MatchResult) (obj2)).group(1);
                obj2 = Integer.valueOf(((MatchResult) (obj2)).group(2));
                Integer integer = (Integer)hashmap.get(obj);
                if (integer != null && ((Integer) (obj2)).intValue() < integer.intValue())
                {
                    listiterator.remove();
                } else
                {
                    hashmap.put(obj, obj2);
                }
            }
        } while (true);
        do
        {
            if (!listiterator.hasPrevious())
            {
                break;
            }
            Object obj1 = ((String)listiterator.previous()).trim();
            obj1 = _preparse_pattern_.matcher(((CharSequence) (obj1)));
            if (((Matcher) (obj1)).matches())
            {
                Object obj3 = ((Matcher) (obj1)).toMatchResult();
                obj1 = ((MatchResult) (obj3)).group(1);
                obj3 = Integer.valueOf(((MatchResult) (obj3)).group(2));
                obj1 = (Integer)hashmap.get(obj1);
                if (obj1 != null && ((Integer) (obj3)).intValue() < ((Integer) (obj1)).intValue())
                {
                    listiterator.remove();
                }
            }
        } while (true);
        return list;
    }
}
