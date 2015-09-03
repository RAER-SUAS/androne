// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.telnet;


// Referenced classes of package org.apache.commons.net.telnet:
//            TelnetOptionHandler

public class WindowSizeOptionHandler extends TelnetOptionHandler
{

    protected static final int WINDOW_SIZE = 31;
    private int m_nHeight;
    private int m_nWidth;

    public WindowSizeOptionHandler(int i, int j)
    {
        super(31, false, false, false, false);
        m_nWidth = 80;
        m_nHeight = 24;
        m_nWidth = i;
        m_nHeight = j;
    }

    public WindowSizeOptionHandler(int i, int j, boolean flag, boolean flag1, boolean flag2, boolean flag3)
    {
        super(31, flag, flag1, flag2, flag3);
        m_nWidth = 80;
        m_nHeight = 24;
        m_nWidth = i;
        m_nHeight = j;
    }

    public int[] answerSubnegotiation(int ai[], int i)
    {
        return null;
    }

    public int[] startSubnegotiationLocal()
    {
        int j1 = m_nWidth;
        int k1 = m_nHeight;
        int j = 5;
        if (m_nWidth % 256 == 255)
        {
            j = 5 + 1;
        }
        int i = j;
        if (m_nWidth / 256 == 255)
        {
            i = j + 1;
        }
        j = i;
        if (m_nHeight % 256 == 255)
        {
            j = i + 1;
        }
        int l = j;
        if (m_nHeight / 256 == 255)
        {
            l = j + 1;
        }
        int ai[] = new int[l];
        ai[0] = 31;
        i = 1;
        for (int k = 24; i < l; k -= 8)
        {
            ai[i] = (j1 * 0x10000 + k1 & 255 << k) >>> k;
            int i1 = i;
            if (ai[i] == 255)
            {
                i1 = i + 1;
                ai[i1] = 255;
            }
            i = i1 + 1;
        }

        return ai;
    }

    public int[] startSubnegotiationRemote()
    {
        return null;
    }
}
