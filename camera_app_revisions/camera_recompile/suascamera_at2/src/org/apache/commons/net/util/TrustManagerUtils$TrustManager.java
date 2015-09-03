// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.X509TrustManager;

// Referenced classes of package org.apache.commons.net.util:
//            TrustManagerUtils

private static class checkServerValidity
    implements X509TrustManager
{

    private final boolean checkServerValidity;

    public void checkClientTrusted(X509Certificate ax509certificate[], String s)
    {
    }

    public void checkServerTrusted(X509Certificate ax509certificate[], String s)
        throws CertificateException
    {
        if (checkServerValidity)
        {
            int j = ax509certificate.length;
            for (int i = 0; i < j; i++)
            {
                ax509certificate[i].checkValidity();
            }

        }
    }

    public X509Certificate[] getAcceptedIssuers()
    {
        return TrustManagerUtils.access$000();
    }

    (boolean flag)
    {
        checkServerValidity = flag;
    }
}
