// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.pop3;


public final class POP3MessageInfo
{

    public String identifier;
    public int number;
    public int size;

    public POP3MessageInfo()
    {
        this(0, null, 0);
    }

    public POP3MessageInfo(int i, int j)
    {
        this(i, null, j);
    }

    public POP3MessageInfo(int i, String s)
    {
        this(i, s, -1);
    }

    private POP3MessageInfo(int i, String s, int j)
    {
        number = i;
        size = j;
        identifier = s;
    }
}
