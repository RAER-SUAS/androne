// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.X509TrustManager;

public class FTPSTrustManager
    implements X509TrustManager
{

    private static final X509Certificate EMPTY_X509CERTIFICATE_ARRAY[] = new X509Certificate[0];

    public FTPSTrustManager()
    {
    }

    public void checkClientTrusted(X509Certificate ax509certificate[], String s)
    {
    }

    public void checkServerTrusted(X509Certificate ax509certificate[], String s)
        throws CertificateException
    {
        int j = ax509certificate.length;
        for (int i = 0; i < j; i++)
        {
            ax509certificate[i].checkValidity();
        }

    }

    public X509Certificate[] getAcceptedIssuers()
    {
        return EMPTY_X509CERTIFICATE_ARRAY;
    }

}
