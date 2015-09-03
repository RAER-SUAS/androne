// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.echo;

import java.io.InputStream;
import org.apache.commons.net.discard.DiscardTCPClient;

public final class EchoTCPClient extends DiscardTCPClient
{

    public static final int DEFAULT_PORT = 7;

    public EchoTCPClient()
    {
        setDefaultPort(7);
    }

    public InputStream getInputStream()
    {
        return _input_;
    }
}
