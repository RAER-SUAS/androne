// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;


public class ParserInitializationException extends RuntimeException
{

    private static final long serialVersionUID = 0x4d34eff601f4aca2L;

    public ParserInitializationException(String s)
    {
        super(s);
    }

    public ParserInitializationException(String s, Throwable throwable)
    {
        super(s, throwable);
    }

    public Throwable getRootCause()
    {
        return super.getCause();
    }
}
