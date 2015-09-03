// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;


// Referenced classes of package org.apache.commons.net.imap:
//            AuthenticatingIMAPClient

public static final class authName extends Enum
{

    private static final XOAUTH $VALUES[];
    public static final XOAUTH CRAM_MD5;
    public static final XOAUTH LOGIN;
    public static final XOAUTH PLAIN;
    public static final XOAUTH XOAUTH;
    private final String authName;

    public static authName valueOf(String s)
    {
        return (authName)Enum.valueOf(org/apache/commons/net/imap/AuthenticatingIMAPClient$AUTH_METHOD, s);
    }

    public static authName[] values()
    {
        return (authName[])$VALUES.clone();
    }

    public final String getAuthName()
    {
        return authName;
    }

    static 
    {
        PLAIN = new <init>("PLAIN", 0, "PLAIN");
        CRAM_MD5 = new <init>("CRAM_MD5", 1, "CRAM-MD5");
        LOGIN = new <init>("LOGIN", 2, "LOGIN");
        XOAUTH = new <init>("XOAUTH", 3, "XOAUTH");
        $VALUES = (new .VALUES[] {
            PLAIN, CRAM_MD5, LOGIN, XOAUTH
        });
    }

    private (String s, int i, String s1)
    {
        super(s, i);
        authName = s1;
    }
}
