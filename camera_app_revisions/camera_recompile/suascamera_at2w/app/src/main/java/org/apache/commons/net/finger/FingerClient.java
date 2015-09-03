// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.finger;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.util.Charsets;

public class FingerClient extends SocketClient
{

    public static final int DEFAULT_PORT = 79;
    private static final String __LONG_FLAG = "/W ";
    private transient char __buffer[];

    public FingerClient()
    {
        __buffer = new char[1024];
        setDefaultPort(79);
    }

    public InputStream getInputStream(boolean flag)
        throws IOException
    {
        return getInputStream(flag, "");
    }

    public InputStream getInputStream(boolean flag, String s)
        throws IOException
    {
        return getInputStream(flag, s, null);
    }

    public InputStream getInputStream(boolean flag, String s, String s1)
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder(64);
        if (flag)
        {
            stringbuilder.append("/W ");
        }
        stringbuilder.append(s);
        stringbuilder.append("\r\n");
        s = stringbuilder.toString().getBytes(Charsets.toCharset(s1).name());
        s1 = new DataOutputStream(new BufferedOutputStream(_output_, 1024));
        s1.write(s, 0, s.length);
        s1.flush();
        return _input_;
    }

    public String query(boolean flag)
        throws IOException
    {
        return query(flag, "");
    }

    public String query(boolean flag, String s)
        throws IOException
    {
        StringBuilder stringbuilder;
        stringbuilder = new StringBuilder(__buffer.length);
        s = new BufferedReader(new InputStreamReader(getInputStream(flag, s), getCharsetName()));
_L1:
        int i = s.read(__buffer, 0, __buffer.length);
        if (i <= 0)
        {
            s.close();
            return stringbuilder.toString();
        }
        stringbuilder.append(__buffer, 0, i);
          goto _L1
        Exception exception;
        exception;
        s.close();
        throw exception;
    }
}
