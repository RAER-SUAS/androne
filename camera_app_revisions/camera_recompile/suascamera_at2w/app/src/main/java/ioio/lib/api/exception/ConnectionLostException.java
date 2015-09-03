// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api.exception;


public class ConnectionLostException extends Exception
{

    private static final long serialVersionUID = 0x67034e111d152c34L;

    public ConnectionLostException()
    {
        super("Connection lost");
    }

    public ConnectionLostException(Exception exception)
    {
        super(exception);
    }
}
