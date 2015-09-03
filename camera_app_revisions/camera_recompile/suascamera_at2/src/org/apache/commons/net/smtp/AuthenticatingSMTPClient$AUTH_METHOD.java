// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.smtp;


// Referenced classes of package org.apache.commons.net.smtp:
//            AuthenticatingSMTPClient

public static final class  extends Enum
{

    private static final XOAUTH $VALUES[];
    public static final XOAUTH CRAM_MD5;
    public static final XOAUTH LOGIN;
    public static final XOAUTH PLAIN;
    public static final XOAUTH XOAUTH;

    public static final String getAuthName( )
    {
        if (.equals(PLAIN))
        {
            return "PLAIN";
        }
        if (.equals(CRAM_MD5))
        {
            return "CRAM-MD5";
        }
        if (.equals(LOGIN))
        {
            return "LOGIN";
        }
        if (.equals(XOAUTH))
        {
            return "XOAUTH";
        } else
        {
            return null;
        }
    }

    public static XOAUTH valueOf(String s)
    {
        return (XOAUTH)Enum.valueOf(org/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD, s);
    }

    public static XOAUTH[] values()
    {
        return (XOAUTH[])$VALUES.clone();
    }

    static 
    {
        PLAIN = new <init>("PLAIN", 0);
        CRAM_MD5 = new <init>("CRAM_MD5", 1);
        LOGIN = new <init>("LOGIN", 2);
        XOAUTH = new <init>("XOAUTH", 3);
        $VALUES = (new .VALUES[] {
            PLAIN, CRAM_MD5, LOGIN, XOAUTH
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
