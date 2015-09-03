// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.discard;

import java.io.OutputStream;
import org.apache.commons.net.SocketClient;

public class DiscardTCPClient extends SocketClient
{

    public static final int DEFAULT_PORT = 9;

    public DiscardTCPClient()
    {
        setDefaultPort(9);
    }

    public OutputStream getOutputStream()
    {
        return _output_;
    }
}
