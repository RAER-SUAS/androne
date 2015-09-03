// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;

import java.io.IOException;
import java.security.GeneralSecurityException;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;

public class SSLContextUtils
{

    private SSLContextUtils()
    {
    }

    public static SSLContext createSSLContext(String s, KeyManager keymanager, TrustManager trustmanager)
        throws IOException
    {
        Object obj = null;
        if (keymanager == null)
        {
            keymanager = null;
        } else
        {
            KeyManager akeymanager[] = new KeyManager[1];
            akeymanager[0] = keymanager;
            keymanager = akeymanager;
        }
        if (trustmanager == null)
        {
            trustmanager = obj;
        } else
        {
            TrustManager atrustmanager[] = new TrustManager[1];
            atrustmanager[0] = trustmanager;
            trustmanager = atrustmanager;
        }
        return createSSLContext(s, ((KeyManager []) (keymanager)), ((TrustManager []) (trustmanager)));
    }

    public static SSLContext createSSLContext(String s, KeyManager akeymanager[], TrustManager atrustmanager[])
        throws IOException
    {
        try
        {
            s = SSLContext.getInstance(s);
            s.init(akeymanager, atrustmanager, null);
        }
        // Misplaced declaration of an exception variable
        catch (String s)
        {
            akeymanager = new IOException("Could not initialize SSL context");
            akeymanager.initCause(s);
            throw akeymanager;
        }
        return s;
    }
}
