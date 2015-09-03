// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public final class ToNetASCIIOutputStream extends FilterOutputStream
{

    private boolean __lastWasCR;

    public ToNetASCIIOutputStream(OutputStream outputstream)
    {
        super(outputstream);
        __lastWasCR = false;
    }

    public void write(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        i;
        JVM INSTR tableswitch 10 13: default 32
    //                   10 70
    //                   11 32
    //                   12 32
    //                   13 48;
           goto _L1 _L2 _L1 _L1 _L3
_L1:
        __lastWasCR = false;
        out.write(i);
_L5:
        this;
        JVM INSTR monitorexit ;
        return;
_L3:
        __lastWasCR = true;
        out.write(13);
        if (true) goto _L5; else goto _L4
_L4:
        Exception exception;
        exception;
        throw exception;
_L2:
        if (__lastWasCR) goto _L1; else goto _L6
_L6:
        out.write(13);
          goto _L1
    }

    public void write(byte abyte0[])
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        write(abyte0, 0, abyte0.length);
        this;
        JVM INSTR monitorexit ;
        return;
        abyte0;
        throw abyte0;
    }

    public void write(byte abyte0[], int i, int j)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
_L2:
        if (j <= 0)
        {
            break; /* Loop/switch isn't completed */
        }
        write(abyte0[i]);
        j--;
        i++;
        if (true) goto _L2; else goto _L1
_L1:
        return;
        abyte0;
        throw abyte0;
    }
}
