// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.pop3;


// Referenced classes of package org.apache.commons.net.pop3:
//            ExtendedPOP3Client

public static final class methodName extends Enum
{

    private static final CRAM_MD5 $VALUES[];
    public static final CRAM_MD5 CRAM_MD5;
    public static final CRAM_MD5 PLAIN;
    private final String methodName;

    public static methodName valueOf(String s)
    {
        return (methodName)Enum.valueOf(org/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD, s);
    }

    public static methodName[] values()
    {
        return (methodName[])$VALUES.clone();
    }

    public final String getAuthName()
    {
        return methodName;
    }

    static 
    {
        PLAIN = new <init>("PLAIN", 0, "PLAIN");
        CRAM_MD5 = new <init>("CRAM_MD5", 1, "CRAM-MD5");
        $VALUES = (new .VALUES[] {
            PLAIN, CRAM_MD5
        });
    }

    private (String s, int i, String s1)
    {
        super(s, i);
        methodName = s1;
    }
}
