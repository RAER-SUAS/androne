// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.IOException;
import java.io.Writer;

public final class DotTerminatedMessageWriter extends Writer
{

    private static final int __LAST_WAS_CR_STATE = 1;
    private static final int __LAST_WAS_NL_STATE = 2;
    private static final int __NOTHING_SPECIAL_STATE = 0;
    private Writer __output;
    private int __state;

    public DotTerminatedMessageWriter(Writer writer)
    {
        super(writer);
        __output = writer;
        __state = 0;
    }

    public void close()
        throws IOException
    {
label0:
        {
            synchronized (lock)
            {
                if (__output != null)
                {
                    break label0;
                }
            }
            return;
        }
        if (__state != 1) goto _L2; else goto _L1
_L1:
        __output.write(10);
_L4:
        __output.write(".\r\n");
        __output.flush();
        __output = null;
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        if (__state == 2) goto _L4; else goto _L3
_L3:
        __output.write("\r\n");
          goto _L4
    }

    public void flush()
        throws IOException
    {
        synchronized (lock)
        {
            __output.flush();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void write(int i)
        throws IOException
    {
        Object obj = lock;
        obj;
        JVM INSTR monitorenter ;
        i;
        JVM INSTR lookupswitch 3: default 44
    //                   10: 82
    //                   13: 60
    //                   46: 116;
           goto _L1 _L2 _L3 _L4
_L1:
        __state = 0;
        __output.write(i);
        obj;
        JVM INSTR monitorexit ;
        return;
_L3:
        __state = 1;
        __output.write(13);
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        if (__state != 1)
        {
            __output.write(13);
        }
        __output.write(10);
        __state = 2;
        obj;
        JVM INSTR monitorexit ;
        return;
_L4:
        if (__state != 2) goto _L1; else goto _L5
_L5:
        __output.write(46);
          goto _L1
    }

    public void write(String s)
        throws IOException
    {
        write(s.toCharArray());
    }

    public void write(String s, int i, int j)
        throws IOException
    {
        write(s.toCharArray(), i, j);
    }

    public void write(char ac[])
        throws IOException
    {
        write(ac, 0, ac.length);
    }

    public void write(char ac[], int i, int j)
        throws IOException
    {
        Object obj = lock;
        obj;
        JVM INSTR monitorenter ;
_L2:
        if (j <= 0)
        {
            break; /* Loop/switch isn't completed */
        }
        write(ac[i]);
        j--;
        i++;
        if (true) goto _L2; else goto _L1
_L1:
        obj;
        JVM INSTR monitorexit ;
        return;
        ac;
_L4:
        obj;
        JVM INSTR monitorexit ;
        throw ac;
        ac;
        if (true) goto _L4; else goto _L3
_L3:
    }
}
