// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.telnet;


public class InvalidTelnetOptionException extends Exception
{

    private static final long serialVersionUID = 0xdd129c82da0bde03L;
    private final String msg;
    private final int optionCode;

    public InvalidTelnetOptionException(String s, int i)
    {
        optionCode = i;
        msg = s;
    }

    public String getMessage()
    {
        return (new StringBuilder()).append(msg).append(": ").append(optionCode).toString();
    }
}
