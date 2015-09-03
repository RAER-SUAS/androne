// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;


public class SimpleNNTPHeader
{

    private final String __from;
    private final StringBuilder __headerFields = new StringBuilder();
    private int __newsgroupCount;
    private final StringBuilder __newsgroups = new StringBuilder();
    private final String __subject;

    public SimpleNNTPHeader(String s, String s1)
    {
        __from = s;
        __subject = s1;
        __newsgroupCount = 0;
    }

    public void addHeaderField(String s, String s1)
    {
        __headerFields.append(s);
        __headerFields.append(": ");
        __headerFields.append(s1);
        __headerFields.append('\n');
    }

    public void addNewsgroup(String s)
    {
        int i = __newsgroupCount;
        __newsgroupCount = i + 1;
        if (i > 0)
        {
            __newsgroups.append(',');
        }
        __newsgroups.append(s);
    }

    public String getFromAddress()
    {
        return __from;
    }

    public String getNewsgroups()
    {
        return __newsgroups.toString();
    }

    public String getSubject()
    {
        return __subject;
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("From: ");
        stringbuilder.append(__from);
        stringbuilder.append("\nNewsgroups: ");
        stringbuilder.append(__newsgroups.toString());
        stringbuilder.append("\nSubject: ");
        stringbuilder.append(__subject);
        stringbuilder.append('\n');
        if (__headerFields.length() > 0)
        {
            stringbuilder.append(__headerFields.toString());
        }
        stringbuilder.append('\n');
        return stringbuilder.toString();
    }
}
