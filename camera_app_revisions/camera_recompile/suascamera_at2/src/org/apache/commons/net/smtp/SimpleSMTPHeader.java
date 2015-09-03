// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.smtp;


public class SimpleSMTPHeader
{

    private StringBuffer __cc;
    private final String __from;
    private final StringBuffer __headerFields = new StringBuffer();
    private final String __subject;
    private final String __to;

    public SimpleSMTPHeader(String s, String s1, String s2)
    {
        __to = s1;
        __from = s;
        __subject = s2;
        __cc = null;
    }

    public void addCC(String s)
    {
        if (__cc == null)
        {
            __cc = new StringBuffer();
        } else
        {
            __cc.append(", ");
        }
        __cc.append(s);
    }

    public void addHeaderField(String s, String s1)
    {
        __headerFields.append(s);
        __headerFields.append(": ");
        __headerFields.append(s1);
        __headerFields.append('\n');
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        if (__headerFields.length() > 0)
        {
            stringbuilder.append(__headerFields.toString());
        }
        stringbuilder.append("From: ");
        stringbuilder.append(__from);
        stringbuilder.append("\nTo: ");
        stringbuilder.append(__to);
        if (__cc != null)
        {
            stringbuilder.append("\nCc: ");
            stringbuilder.append(__cc.toString());
        }
        if (__subject != null)
        {
            stringbuilder.append("\nSubject: ");
            stringbuilder.append(__subject);
        }
        stringbuilder.append('\n');
        stringbuilder.append('\n');
        return stringbuilder.toString();
    }
}
