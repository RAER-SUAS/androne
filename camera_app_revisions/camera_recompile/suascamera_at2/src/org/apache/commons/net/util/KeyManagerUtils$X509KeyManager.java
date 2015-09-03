// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;

import java.net.Socket;
import java.security.Principal;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import javax.net.ssl.X509ExtendedKeyManager;

// Referenced classes of package org.apache.commons.net.util:
//            KeyManagerUtils

private static class keyStore extends X509ExtendedKeyManager
{

    private final getPrivateKey keyStore;

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

    ( )
    {
        keyStore = ;
    }
}
