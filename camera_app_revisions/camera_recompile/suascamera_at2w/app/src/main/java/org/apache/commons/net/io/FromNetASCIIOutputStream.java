// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// Referenced classes of package org.apache.commons.net.io:
//            FromNetASCIIInputStream

public final class FromNetASCIIOutputStream extends FilterOutputStream
{

    private boolean __lastWasCR;

    public FromNetASCIIOutputStream(OutputStream outputstream)
    {
        super(outputstream);
        __lastWasCR = false;
    }

    private void __write(int i)
        throws IOException
    {
        switch (i)
        {
        case 11: // '\013'
        case 12: // '\f'
        default:
            if (__lastWasCR)
            {
                out.write(13);
                __lastWasCR = false;
            }
            out.write(i);
            return;

        case 13: // '\r'
            __lastWasCR = true;
            return;

        case 10: // '\n'
            break;
        }
        if (__lastWasCR)
        {
            out.write(FromNetASCIIInputStream._lineSeparatorBytes);
            __lastWasCR = false;
            return;
        } else
        {
            __lastWasCR = false;
            out.write(10);
            return;
        }
    }

    public void close()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (!FromNetASCIIInputStream._noConversionRequired) goto _L2; else goto _L1
_L1:
        super.close();
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (__lastWasCR)
        {
            out.write(13);
        }
        super.close();
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public void write(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (!FromNetASCIIInputStream._noConversionRequired) goto _L2; else goto _L1
_L1:
        out.write(i);
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        __write(i);
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
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
        if (!FromNetASCIIInputStream._noConversionRequired) goto _L2; else goto _L1
_L1:
        out.write(abyte0, i, j);
_L7:
        this;
        JVM INSTR monitorexit ;
        return;
_L4:
        if (i <= 0)
        {
            continue; /* Loop/switch isn't completed */
        }
        __write(abyte0[j]);
        i--;
        j++;
        if (true) goto _L4; else goto _L3
_L3:
        abyte0;
        throw abyte0;
_L2:
        int k = i;
        i = j;
        j = k;
        if (true) goto _L4; else goto _L5
_L5:
        if (true) goto _L7; else goto _L6
_L6:
    }
}
