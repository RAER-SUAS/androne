// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.smtp;

import java.io.IOException;

public final class SMTPConnectionClosedException extends IOException
{

    private static final long serialVersionUID = 0x8b1d903fc906613L;

    public SMTPConnectionClosedException()
    {
    }

    public SMTPConnectionClosedException(String s)
    {
        super(s);
    }
}
