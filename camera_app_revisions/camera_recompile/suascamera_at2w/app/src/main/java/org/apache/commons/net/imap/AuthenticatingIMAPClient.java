// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.SSLContext;
import org.apache.commons.net.util.Base64;

// Referenced classes of package org.apache.commons.net.imap:
//            IMAPSClient, IMAPCommand, IMAPReply

public class AuthenticatingIMAPClient extends IMAPSClient
{
    public static final class AUTH_METHOD extends Enum
    {

        private static final AUTH_METHOD $VALUES[];
        public static final AUTH_METHOD CRAM_MD5;
        public static final AUTH_METHOD LOGIN;
        public static final AUTH_METHOD PLAIN;
        public static final AUTH_METHOD XOAUTH;
        private final String authName;

        public static AUTH_METHOD valueOf(String s)
        {
            return (AUTH_METHOD)Enum.valueOf(org/apache/commons/net/imap/AuthenticatingIMAPClient$AUTH_METHOD, s);
        }

        public static AUTH_METHOD[] values()
        {
            return (AUTH_METHOD[])$VALUES.clone();
        }

        public final String getAuthName()
        {
            return authName;
        }

        static 
        {
            PLAIN = new AUTH_METHOD("PLAIN", 0, "PLAIN");
            CRAM_MD5 = new AUTH_METHOD("CRAM_MD5", 1, "CRAM-MD5");
            LOGIN = new AUTH_METHOD("LOGIN", 2, "LOGIN");
            XOAUTH = new AUTH_METHOD("XOAUTH", 3, "XOAUTH");
            $VALUES = (new AUTH_METHOD[] {
                PLAIN, CRAM_MD5, LOGIN, XOAUTH
            });
        }

        private AUTH_METHOD(String s, int i, String s1)
        {
            super(s, i);
            authName = s1;
        }
    }


    public AuthenticatingIMAPClient()
    {
        this("TLS", false);
    }

    public AuthenticatingIMAPClient(String s)
    {
        this(s, false);
    }

    public AuthenticatingIMAPClient(String s, boolean flag)
    {
        this(s, flag, null);
    }

    public AuthenticatingIMAPClient(String s, boolean flag, SSLContext sslcontext)
    {
        super(s, flag, sslcontext);
    }

    public AuthenticatingIMAPClient(SSLContext sslcontext)
    {
        this(false, sslcontext);
    }

    public AuthenticatingIMAPClient(boolean flag)
    {
        this("TLS", flag);
    }

    public AuthenticatingIMAPClient(boolean flag, SSLContext sslcontext)
    {
        this("TLS", flag, sslcontext);
    }

    private String _convertToHexString(byte abyte0[])
    {
        StringBuilder stringbuilder = new StringBuilder(abyte0.length * 2);
        int j = abyte0.length;
        for (int i = 0; i < j; i++)
        {
            byte byte0 = abyte0[i];
            if ((byte0 & 0xff) <= 15)
            {
                stringbuilder.append("0");
            }
            stringbuilder.append(Integer.toHexString(byte0 & 0xff));
        }

        return stringbuilder.toString();
    }

    public boolean auth(AUTH_METHOD auth_method, String s, String s1)
        throws IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidKeySpecException
    {
        boolean flag = true;
        if (IMAPReply.isContinuation(sendCommand(IMAPCommand.AUTHENTICATE, auth_method.getAuthName()))) goto _L2; else goto _L1
_L1:
        flag = false;
_L4:
        return flag;
_L2:
        static class _cls1
        {

            static final int $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD[];

            static 
            {
                $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD = new int[AUTH_METHOD.values().length];
                try
                {
                    $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD[AUTH_METHOD.PLAIN.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD[AUTH_METHOD.CRAM_MD5.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD[AUTH_METHOD.LOGIN.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD[AUTH_METHOD.XOAUTH.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror)
                {
                    return;
                }
            }
        }

        int l;
        switch (_cls1..SwitchMap.org.apache.commons.net.imap.AuthenticatingIMAPClient.AUTH_METHOD[auth_method.ordinal()])
        {
        default:
            return false;

        case 1: // '\001'
            int i = sendData(Base64.encodeBase64StringUnChunked((new StringBuilder()).append("\0").append(s).append("\0").append(s1).toString().getBytes(getCharsetName())));
            if (i == 0)
            {
                setState(IMAP.IMAPState.AUTH_STATE);
            }
            if (i != 0)
            {
                return false;
            }
            break;

        case 2: // '\002'
            auth_method = Base64.decodeBase64(getReplyString().substring(2).trim());
            Mac mac = Mac.getInstance("HmacMD5");
            mac.init(new SecretKeySpec(s1.getBytes(getCharsetName()), "HmacMD5"));
            auth_method = _convertToHexString(mac.doFinal(auth_method)).getBytes(getCharsetName());
            s = s.getBytes(getCharsetName());
            s1 = new byte[s.length + 1 + auth_method.length];
            System.arraycopy(s, 0, s1, 0, s.length);
            s1[s.length] = 32;
            System.arraycopy(auth_method, 0, s1, s.length + 1, auth_method.length);
            int j = sendData(Base64.encodeBase64StringUnChunked(s1));
            if (j == 0)
            {
                setState(IMAP.IMAPState.AUTH_STATE);
            }
            if (j != 0)
            {
                return false;
            }
            break;

        case 3: // '\003'
            if (sendData(Base64.encodeBase64StringUnChunked(s.getBytes(getCharsetName()))) != 3)
            {
                return false;
            }
            int k = sendData(Base64.encodeBase64StringUnChunked(s1.getBytes(getCharsetName())));
            if (k == 0)
            {
                setState(IMAP.IMAPState.AUTH_STATE);
            }
            if (k != 0)
            {
                return false;
            }
            break;

        case 4: // '\004'
            l = sendData(s);
            if (l == 0)
            {
                setState(IMAP.IMAPState.AUTH_STATE);
            }
            continue; /* Loop/switch isn't completed */
        }
        if (true) goto _L4; else goto _L3
_L3:
        if (l == 0) goto _L4; else goto _L5
_L5:
        return false;
    }

    public boolean authenticate(AUTH_METHOD auth_method, String s, String s1)
        throws IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidKeySpecException
    {
        return auth(auth_method, s, s1);
    }
}
