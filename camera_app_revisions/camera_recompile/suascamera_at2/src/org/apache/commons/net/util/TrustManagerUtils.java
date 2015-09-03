// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;

import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

public final class TrustManagerUtils
{
    private static class TrustManager
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
            return TrustManagerUtils.EMPTY_X509CERTIFICATE_ARRAY;
        }

        TrustManager(boolean flag)
        {
            checkServerValidity = flag;
        }
    }


    private static final X509TrustManager ACCEPT_ALL = new TrustManager(false);
    private static final X509TrustManager CHECK_SERVER_VALIDITY = new TrustManager(true);
    private static final X509Certificate EMPTY_X509CERTIFICATE_ARRAY[] = new X509Certificate[0];

    public TrustManagerUtils()
    {
    }

    public static X509TrustManager getAcceptAllTrustManager()
    {
        return ACCEPT_ALL;
    }

    public static X509TrustManager getDefaultTrustManager(KeyStore keystore)
        throws GeneralSecurityException
    {
        TrustManagerFactory trustmanagerfactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        trustmanagerfactory.init(keystore);
        return (X509TrustManager)trustmanagerfactory.getTrustManagers()[0];
    }

    public static X509TrustManager getValidateServerCertificateTrustManager()
    {
        return CHECK_SERVER_VALIDITY;
    }


}
