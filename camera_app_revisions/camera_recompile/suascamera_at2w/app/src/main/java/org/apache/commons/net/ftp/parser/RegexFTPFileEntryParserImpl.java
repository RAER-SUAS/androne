// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;
import org.apache.commons.net.ftp.FTPFileEntryParserImpl;

public abstract class RegexFTPFileEntryParserImpl extends FTPFileEntryParserImpl
{

    protected Matcher _matcher_;
    private Pattern pattern;
    private MatchResult result;

    public RegexFTPFileEntryParserImpl(String s)
    {
        pattern = null;
        result = null;
        _matcher_ = null;
        setRegex(s);
    }

    public int getGroupCnt()
    {
        if (result == null)
        {
            return 0;
        } else
        {
            return result.groupCount();
        }
    }

    public String getGroupsAsString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        for (int i = 1; i <= result.groupCount(); i++)
        {
            stringbuilder.append(i).append(") ").append(result.group(i)).append(System.getProperty("line.separator"));
        }

        return stringbuilder.toString();
    }

    public String group(int i)
    {
        if (result == null)
        {
            return null;
        } else
        {
            return result.group(i);
        }
    }

    public boolean matches(String s)
    {
        result = null;
        _matcher_ = pattern.matcher(s);
        if (_matcher_.matches())
        {
            result = _matcher_.toMatchResult();
        }
        return result != null;
    }

    public boolean setRegex(String s)
    {
        try
        {
            pattern = Pattern.compile(s);
        }
        catch (PatternSyntaxException patternsyntaxexception)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Unparseable regex supplied: ").append(s).toString());
        }
        return true;
    }
}
