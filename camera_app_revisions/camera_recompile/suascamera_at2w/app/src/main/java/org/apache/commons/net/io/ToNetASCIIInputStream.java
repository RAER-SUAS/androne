// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

public final class ToNetASCIIInputStream extends FilterInputStream
{

    private static final int __LAST_WAS_CR = 1;
    private static final int __LAST_WAS_NL = 2;
    private static final int __NOTHING_SPECIAL = 0;
    private int __status;

    public ToNetASCIIInputStream(InputStream inputstream)
    {
        super(inputstream);
        __status = 0;
    }

    public int available()
        throws IOException
    {
        int j = in.available();
        int i = j;
        if (__status == 2)
        {
            i = j + 1;
        }
        return i;
    }

    public boolean markSupported()
    {
        return false;
    }

    public int read()
        throws IOException
    {
        int i;
        if (__status == 2)
        {
            __status = 0;
            return 10;
        }
        i = in.read();
        i;
        JVM INSTR tableswitch 10 13: default 56
    //                   10 71
    //                   11 56
    //                   12 56
    //                   13 63;
           goto _L1 _L2 _L1 _L1 _L3
_L1:
        __status = 0;
        return i;
_L3:
        __status = 1;
        return 13;
_L2:
        if (__status != 1)
        {
            __status = 2;
            return 13;
        }
        if (true) goto _L1; else goto _L4
_L4:
    }

    public int read(byte abyte0[])
        throws IOException
    {
        return read(abyte0, 0, abyte0.length);
    }

    public int read(byte abyte0[], int i, int j)
        throws IOException
    {
        byte byte0 = -1;
        int k;
        if (j < 1)
        {
            k = 0;
        } else
        {
            int j1 = available();
            k = j;
            if (j > j1)
            {
                k = j1;
            }
            j = k;
            if (k < 1)
            {
                j = 1;
            }
            j1 = read();
            k = byte0;
            if (j1 != -1)
            {
                int i1 = j;
                j = i;
                int l = j1;
                do
                {
                    int k1 = j;
                    j = k1 + 1;
                    abyte0[k1] = (byte)l;
                    i1--;
                    if (i1 <= 0)
                    {
                        break;
                    }
                    l = read();
                } while (l != -1);
                return j - i;
            }
        }
        return k;
    }
}
