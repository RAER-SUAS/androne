// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.pop3;


// Referenced classes of package org.apache.commons.net.pop3:
//            ExtendedPOP3Client

static class TH_METHOD
{

    static final int $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD[];

    static 
    {
        $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD = new int[TH_METHOD.values().length];
        try
        {
            $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD[TH_METHOD.PLAIN.ordinal()] = 1;
        }
        catch (NoSuchFieldError nosuchfielderror1) { }
        try
        {
            $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD[TH_METHOD.CRAM_MD5.ordinal()] = 2;
        }
        catch (NoSuchFieldError nosuchfielderror)
        {
            return;
        }
    }
}
