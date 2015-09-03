// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;

import java.nio.charset.Charset;

public class Charsets
{

    public Charsets()
    {
    }

    public static Charset toCharset(String s)
    {
        if (s == null)
        {
            return Charset.defaultCharset();
        } else
        {
            return Charset.forName(s);
        }
    }

    public static Charset toCharset(String s, String s1)
    {
        if (s == null)
        {
            return Charset.forName(s1);
        } else
        {
            return Charset.forName(s);
        }
    }
}
