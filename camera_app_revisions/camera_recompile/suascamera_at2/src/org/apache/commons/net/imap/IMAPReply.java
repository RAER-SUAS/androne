// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.net.MalformedServerReplyException;

public final class IMAPReply
{

    public static final int BAD = 2;
    public static final int CONT = 3;
    private static final String IMAP_BAD = "BAD";
    private static final String IMAP_CONTINUATION_PREFIX = "+";
    private static final String IMAP_NO = "NO";
    private static final String IMAP_OK = "OK";
    private static final String IMAP_UNTAGGED_PREFIX = "* ";
    private static final Pattern LITERAL_PATTERN = Pattern.compile("\\{(\\d+)\\}$");
    public static final int NO = 1;
    public static final int OK = 0;
    private static final Pattern TAGGED_PATTERN = Pattern.compile("^\\w+ (\\S+).*");
    private static final String TAGGED_RESPONSE = "^\\w+ (\\S+).*";
    private static final Pattern UNTAGGED_PATTERN = Pattern.compile("^\\* (\\S+).*");
    private static final String UNTAGGED_RESPONSE = "^\\* (\\S+).*";

    private IMAPReply()
    {
    }

    public static int getReplyCode(String s)
        throws IOException
    {
        return getReplyCode(s, TAGGED_PATTERN);
    }

    private static int getReplyCode(String s, Pattern pattern)
        throws IOException
    {
        byte byte0 = 1;
        if (!isContinuation(s)) goto _L2; else goto _L1
_L1:
        byte0 = 3;
_L4:
        return byte0;
_L2:
        pattern = pattern.matcher(s);
        if (!pattern.matches())
        {
            break; /* Loop/switch isn't completed */
        }
        pattern = pattern.group(1);
        if (pattern.equals("OK"))
        {
            return 0;
        }
        if (pattern.equals("BAD"))
        {
            return 2;
        }
        if (pattern.equals("NO")) goto _L4; else goto _L3
_L3:
        throw new MalformedServerReplyException((new StringBuilder()).append("Received unexpected IMAP protocol response from server: '").append(s).append("'.").toString());
    }

    public static int getUntaggedReplyCode(String s)
        throws IOException
    {
        return getReplyCode(s, UNTAGGED_PATTERN);
    }

    public static boolean isContinuation(int i)
    {
        return i == 3;
    }

    public static boolean isContinuation(String s)
    {
        return s.startsWith("+");
    }

    public static boolean isSuccess(int i)
    {
        return i == 0;
    }

    public static boolean isUntagged(String s)
    {
        return s.startsWith("* ");
    }

    public static int literalCount(String s)
    {
        s = LITERAL_PATTERN.matcher(s);
        if (s.find())
        {
            return Integer.parseInt(s.group(1));
        } else
        {
            return -1;
        }
    }

}
