// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.io.IOException;

public class MalformedServerReplyException extends IOException
{

    private static final long serialVersionUID = 0x535c512ec0cf1f49L;

    public MalformedServerReplyException()
    {
    }

    public MalformedServerReplyException(String s)
    {
        super(s);
    }
}
