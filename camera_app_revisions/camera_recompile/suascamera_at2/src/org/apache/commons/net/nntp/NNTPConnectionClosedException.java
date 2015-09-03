// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;

import java.io.IOException;

public final class NNTPConnectionClosedException extends IOException
{

    private static final long serialVersionUID = 0xe4a88946e15d202L;

    public NNTPConnectionClosedException()
    {
    }

    public NNTPConnectionClosedException(String s)
    {
        super(s);
    }
}
