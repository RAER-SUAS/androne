// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.telnet;


// Referenced classes of package org.apache.commons.net.telnet:
//            TelnetOptionHandler

public class TerminalTypeOptionHandler extends TelnetOptionHandler
{

    protected static final int TERMINAL_TYPE = 24;
    protected static final int TERMINAL_TYPE_IS = 0;
    protected static final int TERMINAL_TYPE_SEND = 1;
    private final String termType;

    public TerminalTypeOptionHandler(String s)
    {
        super(24, false, false, false, false);
        termType = s;
    }

    public TerminalTypeOptionHandler(String s, boolean flag, boolean flag1, boolean flag2, boolean flag3)
    {
        super(24, flag, flag1, flag2, flag3);
        termType = s;
    }

    public int[] answerSubnegotiation(int ai[], int i)
    {
        if (ai != null && i > 1 && termType != null && ai[0] == 24 && ai[1] == 1)
        {
            int ai1[] = new int[termType.length() + 2];
            ai1[0] = 24;
            ai1[1] = 0;
            i = 0;
            do
            {
                ai = ai1;
                if (i >= termType.length())
                {
                    break;
                }
                ai1[i + 2] = termType.charAt(i);
                i++;
            } while (true);
        } else
        {
            ai = null;
        }
        return ai;
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
