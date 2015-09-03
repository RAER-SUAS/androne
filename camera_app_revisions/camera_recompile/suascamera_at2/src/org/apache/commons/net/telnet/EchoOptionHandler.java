// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.telnet;


// Referenced classes of package org.apache.commons.net.telnet:
//            TelnetOptionHandler

public class EchoOptionHandler extends TelnetOptionHandler
{

    public EchoOptionHandler()
    {
        super(1, false, false, false, false);
    }

    public EchoOptionHandler(boolean flag, boolean flag1, boolean flag2, boolean flag3)
    {
        super(1, flag, flag1, flag2, flag3);
    }

    public int[] answerSubnegotiation(int ai[], int i)
    {
        return null;
    }

    public int[] startSubnegotiationLocal()
    {
        return null;
    }

    public int[] startSubnegotiationRemote()
    {
        return null;
    }
}
