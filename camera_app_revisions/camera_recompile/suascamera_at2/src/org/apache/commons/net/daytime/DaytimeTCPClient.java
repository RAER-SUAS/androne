// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.daytime;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.commons.net.SocketClient;

public final class DaytimeTCPClient extends SocketClient
{

    public static final int DEFAULT_PORT = 13;
    private final char __buffer[] = new char[64];

    public DaytimeTCPClient()
    {
        setDefaultPort(13);
    }

    public String getTime()
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder(__buffer.length);
        BufferedReader bufferedreader = new BufferedReader(new InputStreamReader(_input_, getCharsetName()));
        do
        {
            int i = bufferedreader.read(__buffer, 0, __buffer.length);
            if (i <= 0)
            {
                return stringbuilder.toString();
            }
            stringbuilder.append(__buffer, 0, i);
        } while (true);
    }
}
