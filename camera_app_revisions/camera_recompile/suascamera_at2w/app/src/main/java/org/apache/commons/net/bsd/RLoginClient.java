// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.bsd;

import java.io.IOException;

// Referenced classes of package org.apache.commons.net.bsd:
//            RCommandClient

public class RLoginClient extends RCommandClient
{

    public static final int DEFAULT_PORT = 513;

    public RLoginClient()
    {
        setDefaultPort(513);
    }

    public void rlogin(String s, String s1, String s2)
        throws IOException
    {
        rexec(s, s1, s2, false);
    }

    public void rlogin(String s, String s1, String s2, int i)
        throws IOException
    {
        rexec(s, s1, (new StringBuilder()).append(s2).append("/").append(i).toString(), false);
    }
}
