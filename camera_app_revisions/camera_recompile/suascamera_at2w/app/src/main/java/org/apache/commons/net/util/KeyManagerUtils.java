// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.Socket;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.Principal;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import java.util.Enumeration;
import javax.net.ssl.KeyManager;
import javax.net.ssl.X509ExtendedKeyManager;
import org.apache.commons.net.io.Util;

public final class KeyManagerUtils
{
    private static class ClientKeyStore
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

        ClientKeyStore(KeyStore keystore, String s, String s1)
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

    private static class X509KeyManager extends X509ExtendedKeyManager
    {

        private final ClientKeyStore keyStore;

        public String chooseClientAlias(String as[], Principal aprincipal[], Socket socket)
        {
            return keyStore.getAlias();
        }

        public String chooseServerAlias(String s, Principal aprincipal[], Socket socket)
        {
            return null;
        }

        public X509Certificate[] getCertificateChain(String s)
        {
            return keyStore.getCertificateChain();
        }

        public String[] getClientAliases(String s, Principal aprincipal[])
        {
            return (new String[] {
                keyStore.getAlias()
            });
        }

        public PrivateKey getPrivateKey(String s)
        {
            return keyStore.getPrivateKey();
        }

        public String[] getServerAliases(String s, Principal aprincipal[])
        {
            return null;
        }

        X509KeyManager(ClientKeyStore clientkeystore)
        {
            keyStore = clientkeystore;
        }
    }


    private static final String DEFAULT_STORE_TYPE = KeyStore.getDefaultType();

    private KeyManagerUtils()
    {
    }

    public static KeyManager createClientKeyManager(File file, String s)
        throws IOException, GeneralSecurityException
    {
        return createClientKeyManager(DEFAULT_STORE_TYPE, file, s, null, s);
    }

    public static KeyManager createClientKeyManager(File file, String s, String s1)
        throws IOException, GeneralSecurityException
    {
        return createClientKeyManager(DEFAULT_STORE_TYPE, file, s, s1, s);
    }

    public static KeyManager createClientKeyManager(String s, File file, String s1, String s2, String s3)
        throws IOException, GeneralSecurityException
    {
        return createClientKeyManager(loadStore(s, file, s1), s2, s3);
    }

    public static KeyManager createClientKeyManager(KeyStore keystore, String s, String s1)
        throws GeneralSecurityException
    {
        if (s == null)
        {
            s = findAlias(keystore);
        }
        return new X509KeyManager(new ClientKeyStore(keystore, s, s1));
    }

    private static String findAlias(KeyStore keystore)
        throws KeyStoreException
    {
        for (Enumeration enumeration = keystore.aliases(); enumeration.hasMoreElements();)
        {
            String s = (String)enumeration.nextElement();
            if (keystore.isKeyEntry(s))
            {
                return s;
            }
        }

        throw new KeyStoreException("Cannot find a private key entry");
    }

    private static KeyStore loadStore(String s, File file, String s1)
        throws KeyStoreException, IOException, GeneralSecurityException
    {
        KeyStore keystore;
        keystore = KeyStore.getInstance(s);
        s = null;
        file = new FileInputStream(file);
        keystore.load(file, s1.toCharArray());
        Util.closeQuietly(file);
        return keystore;
        file;
_L2:
        Util.closeQuietly(s);
        throw file;
        s1;
        s = file;
        file = s1;
        if (true) goto _L2; else goto _L1
_L1:
    }

}
