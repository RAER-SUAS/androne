// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;

import java.util.Calendar;

public final class NewGroupsOrNewsQuery
{

    private final String __date;
    private StringBuffer __distributions;
    private final boolean __isGMT;
    private StringBuffer __newsgroups;
    private final String __time;

    public NewGroupsOrNewsQuery(Calendar calendar, boolean flag)
    {
        __distributions = null;
        __newsgroups = null;
        __isGMT = flag;
        StringBuilder stringbuilder = new StringBuilder();
        String s = Integer.toString(calendar.get(1));
        int i = s.length();
        if (i >= 2)
        {
            stringbuilder.append(s.substring(i - 2));
        } else
        {
            stringbuilder.append("00");
        }
        s = Integer.toString(calendar.get(2) + 1);
        i = s.length();
        if (i == 1)
        {
            stringbuilder.append('0');
            stringbuilder.append(s);
        } else
        if (i == 2)
        {
            stringbuilder.append(s);
        } else
        {
            stringbuilder.append("01");
        }
        s = Integer.toString(calendar.get(5));
        i = s.length();
        if (i == 1)
        {
            stringbuilder.append('0');
            stringbuilder.append(s);
        } else
        if (i == 2)
        {
            stringbuilder.append(s);
        } else
        {
            stringbuilder.append("01");
        }
        __date = stringbuilder.toString();
        stringbuilder.setLength(0);
        s = Integer.toString(calendar.get(11));
        i = s.length();
        if (i == 1)
        {
            stringbuilder.append('0');
            stringbuilder.append(s);
        } else
        if (i == 2)
        {
            stringbuilder.append(s);
        } else
        {
            stringbuilder.append("00");
        }
        s = Integer.toString(calendar.get(12));
        i = s.length();
        if (i == 1)
        {
            stringbuilder.append('0');
            stringbuilder.append(s);
        } else
        if (i == 2)
        {
            stringbuilder.append(s);
        } else
        {
            stringbuilder.append("00");
        }
        calendar = Integer.toString(calendar.get(13));
        i = calendar.length();
        if (i == 1)
        {
            stringbuilder.append('0');
            stringbuilder.append(calendar);
        } else
        if (i == 2)
        {
            stringbuilder.append(calendar);
        } else
        {
            stringbuilder.append("00");
        }
        __time = stringbuilder.toString();
    }

    public void addDistribution(String s)
    {
        if (__distributions != null)
        {
            __distributions.append(',');
        } else
        {
            __distributions = new StringBuffer();
        }
        __distributions.append(s);
    }

    public void addNewsgroup(String s)
    {
        if (__newsgroups != null)
        {
            __newsgroups.append(',');
        } else
        {
            __newsgroups = new StringBuffer();
        }
        __newsgroups.append(s);
    }

    public String getDate()
    {
        return __date;
    }

    public String getDistributions()
    {
        if (__distributions == null)
        {
            return null;
        } else
        {
            return __distributions.toString();
        }
    }

    public String getNewsgroups()
    {
        if (__newsgroups == null)
        {
            return null;
        } else
        {
            return __newsgroups.toString();
        }
    }

    public String getTime()
    {
        return __time;
    }

    public boolean isGMT()
    {
        return __isGMT;
    }

    public void omitNewsgroup(String s)
    {
        addNewsgroup((new StringBuilder()).append("!").append(s).toString());
    }
}
