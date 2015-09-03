// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.IOException;

public class FTPConnectionClosedException extends IOException
{

    private static final long serialVersionUID = 0x3094712b6a94b0f0L;

    public FTPConnectionClosedException()
    {
    }

    public FTPConnectionClosedException(String s)
    {
        super(s);
    }
}
