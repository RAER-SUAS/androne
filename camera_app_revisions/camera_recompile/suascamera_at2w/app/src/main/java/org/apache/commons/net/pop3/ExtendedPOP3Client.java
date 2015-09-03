// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.pop3;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.net.util.Base64;

// Referenced classes of package org.apache.commons.net.pop3:
//            POP3SClient

public class ExtendedPOP3Client extends POP3SClient
{
    public static final class AUTH_METHOD extends Enum
    {

        private static final AUTH_METHOD $VALUES[];
        public static final AUTH_METHOD CRAM_MD5;
        public static final AUTH_METHOD PLAIN;
        private final String methodName;

        public static AUTH_METHOD valueOf(String s)
        {
            return (AUTH_METHOD)Enum.valueOf(org/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD, s);
        }

        public static AUTH_METHOD[] values()
        {
            return (AUTH_METHOD[])$VALUES.clone();
        }

        public final String getAuthName()
        {
            return methodName;
        }

        static 
        {
            PLAIN = new AUTH_METHOD("PLAIN", 0, "PLAIN");
            CRAM_MD5 = new AUTH_METHOD("CRAM_MD5", 1, "CRAM-MD5");
            $VALUES = (new AUTH_METHOD[] {
                PLAIN, CRAM_MD5
            });
        }

        private AUTH_METHOD(String s, int i, String s1)
        {
            super(s, i);
            methodName = s1;
        }
    }


    public ExtendedPOP3Client()
        throws NoSuchAlgorithmException
    {
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
        boolean flag1 = true;
        boolean flag = true;
        if (sendCommand(13, auth_method.getAuthName()) != 2)
        {
            return false;
        }
        static class _cls1
        {

            static final int $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD[];

            static 
            {
                $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD = new int[AUTH_METHOD.values().length];
                try
                {
                    $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD[AUTH_METHOD.PLAIN.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD[AUTH_METHOD.CRAM_MD5.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror)
                {
                    return;
                }
            }
        }

        switch (_cls1..SwitchMap.org.apache.commons.net.pop3.ExtendedPOP3Client.AUTH_METHOD[auth_method.ordinal()])
        {
        default:
            return false;

        case 1: // '\001'
            if (sendCommand(new String(Base64.encodeBase64((new StringBuilder()).append("\0").append(s).append("\0").append(s1).toString().getBytes(getCharsetName())), getCharsetName())) != 0)
            {
                flag = false;
            }
            return flag;

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
            break;
        }
        if (sendCommand(Base64.encodeBase64StringUnChunked(s1)) == 0)
        {
            flag = flag1;
        } else
        {
            flag = false;
        }
        return flag;
    }
}
