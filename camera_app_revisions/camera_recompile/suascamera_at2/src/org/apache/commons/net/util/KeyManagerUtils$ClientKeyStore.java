// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;

import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;

// Referenced classes of package org.apache.commons.net.util:
//            KeyManagerUtils

private static class certChain
{

    private final X509Certificate certChain[];
    private final PrivateKey key;
    private final String keyAlias;

    final String getAlias()
    {
        return keyAlias;
    }

    final X509Certificate[] getCertificateChain()
    {
        return certChain;
    }

    final PrivateKey getPrivateKey()
    {
        return key;
    }

    (KeyStore keystore, String s, String s1)
        throws GeneralSecurityException
    {
        keyAlias = s;
        key = (PrivateKey)keystore.getKey(keyAlias, s1.toCharArray());
        keystore = keystore.getCertificateChain(keyAlias);
        s = new X509Certificate[keystore.length];
        for (int i = 0; i < keystore.length; i++)
        {
            s[i] = (X509Certificate)keystore[i];
        }

        certChain = s;
    }
}
