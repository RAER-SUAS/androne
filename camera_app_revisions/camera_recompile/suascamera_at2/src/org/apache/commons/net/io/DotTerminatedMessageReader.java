// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;

public final class DotTerminatedMessageReader extends BufferedReader
{

    private static final char CR = 13;
    private static final int DOT = 46;
    private static final char LF = 10;
    private boolean atBeginning;
    private boolean eof;
    private boolean seenCR;

    public DotTerminatedMessageReader(Reader reader)
    {
        super(reader);
        atBeginning = true;
        eof = false;
    }

    public void close()
        throws IOException
    {
        synchronized (lock)
        {
            if (!eof)
            {
                while (read() != -1) ;
            }
            eof = true;
            atBeginning = false;
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int read()
        throws IOException
    {
label0:
        {
            synchronized (lock)
            {
                if (!eof)
                {
                    break label0;
                }
            }
            return -1;
        }
        int i = super.read();
        if (i != -1)
        {
            break MISSING_BLOCK_LABEL_37;
        }
        eof = true;
        obj;
        JVM INSTR monitorexit ;
        return -1;
        if (!atBeginning)
        {
            break MISSING_BLOCK_LABEL_149;
        }
        atBeginning = false;
        if (i != 46)
        {
            break MISSING_BLOCK_LABEL_149;
        }
        mark(2);
        i = super.read();
        if (i != -1)
        {
            break MISSING_BLOCK_LABEL_80;
        }
        eof = true;
        obj;
        JVM INSTR monitorexit ;
        return 46;
        if (i != 46)
        {
            break MISSING_BLOCK_LABEL_95;
        }
        obj;
        JVM INSTR monitorexit ;
        return i;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        if (i != 13)
        {
            break MISSING_BLOCK_LABEL_140;
        }
        i = super.read();
        if (i != -1)
        {
            break MISSING_BLOCK_LABEL_120;
        }
        reset();
        obj;
        JVM INSTR monitorexit ;
        return 46;
        if (i != 10)
        {
            break MISSING_BLOCK_LABEL_140;
        }
        atBeginning = true;
        eof = true;
        obj;
        JVM INSTR monitorexit ;
        return -1;
        reset();
        obj;
        JVM INSTR monitorexit ;
        return 46;
        if (!seenCR)
        {
            break MISSING_BLOCK_LABEL_172;
        }
        seenCR = false;
        if (i != 10)
        {
            break MISSING_BLOCK_LABEL_172;
        }
        atBeginning = true;
        if (i != 13)
        {
            break MISSING_BLOCK_LABEL_183;
        }
        seenCR = true;
        obj;
        JVM INSTR monitorexit ;
        return i;
    }

    public int read(char ac[])
        throws IOException
    {
        return read(ac, 0, ac.length);
    }

    public int read(char ac[], int i, int j)
        throws IOException
    {
        if (j < 1)
        {
            return 0;
        }
        Object obj = lock;
        obj;
        JVM INSTR monitorenter ;
        int i1 = read();
        if (i1 != -1)
        {
            break MISSING_BLOCK_LABEL_39;
        }
        obj;
        JVM INSTR monitorexit ;
        return -1;
        ac;
        obj;
        JVM INSTR monitorexit ;
        throw ac;
        int k;
        int l;
        k = i;
        l = j;
        j = i1;
_L2:
        i1 = k + 1;
        char c = (char)j;
        ac[k] = c;
        l--;
        if (l <= 0)
        {
            break MISSING_BLOCK_LABEL_85;
        }
        j = read();
        if (j != -1)
        {
            break MISSING_BLOCK_LABEL_93;
        }
        obj;
        JVM INSTR monitorexit ;
        return i1 - i;
        k = i1;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public String readLine()
        throws IOException
    {
        Object obj1 = new StringBuilder();
        Object obj = lock;
        obj;
        JVM INSTR monitorenter ;
_L1:
        int i = read();
        if (i == -1)
        {
            break MISSING_BLOCK_LABEL_69;
        }
        if (i != 10)
        {
            break MISSING_BLOCK_LABEL_54;
        }
        if (!atBeginning)
        {
            break MISSING_BLOCK_LABEL_54;
        }
        obj1 = ((StringBuilder) (obj1)).substring(0, ((StringBuilder) (obj1)).length() - 1);
        obj;
        JVM INSTR monitorexit ;
        return ((String) (obj1));
        ((StringBuilder) (obj1)).append((char)i);
          goto _L1
        obj1;
        obj;
        JVM INSTR monitorexit ;
        throw obj1;
        obj;
        JVM INSTR monitorexit ;
        obj1 = ((StringBuilder) (obj1)).toString();
        String s = ((String) (obj1));
        if (((String) (obj1)).length() == 0)
        {
            s = null;
        }
        return s;
    }
}
