// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.smtp;

import java.io.IOException;
import java.net.InetAddress;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.SSLContext;
import org.apache.commons.net.util.Base64;

// Referenced classes of package org.apache.commons.net.smtp:
//            SMTPSClient, SMTPReply

public class AuthenticatingSMTPClient extends SMTPSClient
{
    public static final class AUTH_METHOD extends Enum
    {

        private static final AUTH_METHOD $VALUES[];
        public static final AUTH_METHOD CRAM_MD5;
        public static final AUTH_METHOD LOGIN;
        public static final AUTH_METHOD PLAIN;
        public static final AUTH_METHOD XOAUTH;

        public static final String getAuthName(AUTH_METHOD auth_method)
        {
            if (auth_method.equals(PLAIN))
            {
                return "PLAIN";
            }
            if (auth_method.equals(CRAM_MD5))
            {
                return "CRAM-MD5";
            }
            if (auth_method.equals(LOGIN))
            {
                return "LOGIN";
            }
            if (auth_method.equals(XOAUTH))
            {
                return "XOAUTH";
            } else
            {
                return null;
            }
        }

        public static AUTH_METHOD valueOf(String s)
        {
            return (AUTH_METHOD)Enum.valueOf(org/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD, s);
        }

        public static AUTH_METHOD[] values()
        {
            return (AUTH_METHOD[])$VALUES.clone();
        }

        static 
        {
            PLAIN = new AUTH_METHOD("PLAIN", 0);
            CRAM_MD5 = new AUTH_METHOD("CRAM_MD5", 1);
            LOGIN = new AUTH_METHOD("LOGIN", 2);
            XOAUTH = new AUTH_METHOD("XOAUTH", 3);
            $VALUES = (new AUTH_METHOD[] {
                PLAIN, CRAM_MD5, LOGIN, XOAUTH
            });
        }

        private AUTH_METHOD(String s, int i)
        {
            super(s, i);
        }
    }


    public AuthenticatingSMTPClient()
        throws NoSuchAlgorithmException
    {
    }

    public AuthenticatingSMTPClient(String s)
        throws NoSuchAlgorithmException
    {
        super(s);
    }

    public AuthenticatingSMTPClient(String s, String s1)
        throws NoSuchAlgorithmException
    {
        super(s, false, s1);
    }

    public AuthenticatingSMTPClient(String s, boolean flag)
    {
        super(s, flag);
    }

    public AuthenticatingSMTPClient(String s, boolean flag, String s1)
    {
        super(s, flag, s1);
    }

    public AuthenticatingSMTPClient(boolean flag, SSLContext sslcontext)
    {
        super(flag, sslcontext);
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
        if (SMTPReply.isPositiveIntermediate(sendCommand(14, AUTH_METHOD.getAuthName(auth_method)))) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        if (auth_method.equals(AUTH_METHOD.PLAIN))
        {
            return SMTPReply.isPositiveCompletion(sendCommand(Base64.encodeBase64StringUnChunked((new StringBuilder()).append("\0").append(s).append("\0").append(s1).toString().getBytes(getCharsetName()))));
        }
        if (auth_method.equals(AUTH_METHOD.CRAM_MD5))
        {
            auth_method = Base64.decodeBase64(getReplyString().substring(4).trim());
            Mac mac = Mac.getInstance("HmacMD5");
            mac.init(new SecretKeySpec(s1.getBytes(getCharsetName()), "HmacMD5"));
            auth_method = _convertToHexString(mac.doFinal(auth_method)).getBytes(getCharsetName());
            s = s.getBytes(getCharsetName());
            s1 = new byte[s.length + 1 + auth_method.length];
            System.arraycopy(s, 0, s1, 0, s.length);
            s1[s.length] = 32;
            System.arraycopy(auth_method, 0, s1, s.length + 1, auth_method.length);
            return SMTPReply.isPositiveCompletion(sendCommand(Base64.encodeBase64StringUnChunked(s1)));
        }
        if (!auth_method.equals(AUTH_METHOD.LOGIN))
        {
            continue; /* Loop/switch isn't completed */
        }
        if (!SMTPReply.isPositiveIntermediate(sendCommand(Base64.encodeBase64StringUnChunked(s.getBytes(getCharsetName()))))) goto _L1; else goto _L3
_L3:
        return SMTPReply.isPositiveCompletion(sendCommand(Base64.encodeBase64StringUnChunked(s1.getBytes(getCharsetName()))));
        if (!auth_method.equals(AUTH_METHOD.XOAUTH)) goto _L1; else goto _L4
_L4:
        return SMTPReply.isPositiveIntermediate(sendCommand(Base64.encodeBase64StringUnChunked(s.getBytes(getCharsetName()))));
    }

    public int ehlo(String s)
        throws IOException
    {
        return sendCommand(15, s);
    }

    public boolean elogin()
        throws IOException
    {
        String s = getLocalAddress().getHostName();
        if (s == null)
        {
            return false;
        } else
        {
            return SMTPReply.isPositiveCompletion(ehlo(s));
        }
    }

    public boolean elogin(String s)
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(ehlo(s));
    }

    public int[] getEnhancedReplyCode()
    {
        String s = getReplyString().substring(4);
        String as[] = s.substring(0, s.indexOf(' ')).split("\\.");
        int ai[] = new int[as.length];
        for (int i = 0; i < as.length; i++)
        {
            ai[i] = Integer.parseInt(as[i]);
        }

        return ai;
    }
}
