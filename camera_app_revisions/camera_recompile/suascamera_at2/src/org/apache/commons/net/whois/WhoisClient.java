// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.whois;

import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.net.finger.FingerClient;

public final class WhoisClient extends FingerClient
{

    public static final String DEFAULT_HOST = "whois.internic.net";
    public static final int DEFAULT_PORT = 43;

    public WhoisClient()
    {
        setDefaultPort(43);
    }

    public InputStream getInputStream(String s)
        throws IOException
    {
        return getInputStream(false, s);
    }

    public String query(String s)
        throws IOException
    {
        return query(false, s);
    }
}
