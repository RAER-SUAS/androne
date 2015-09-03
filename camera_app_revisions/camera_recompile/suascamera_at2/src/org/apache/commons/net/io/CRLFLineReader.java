// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;

public final class CRLFLineReader extends BufferedReader
{

    private static final char CR = 13;
    private static final char LF = 10;

    public CRLFLineReader(Reader reader)
    {
        super(reader);
    }

    public String readLine()
        throws IOException
    {
        Object obj1;
        boolean flag;
        obj1 = new StringBuilder();
        flag = false;
        Object obj = lock;
        obj;
        JVM INSTR monitorenter ;
_L5:
        int i = read();
        if (i == -1) goto _L2; else goto _L1
_L1:
        if (!flag || i != 10) goto _L4; else goto _L3
_L3:
        obj1 = ((StringBuilder) (obj1)).substring(0, ((StringBuilder) (obj1)).length() - 1);
        obj;
        JVM INSTR monitorexit ;
        return ((String) (obj1));
_L6:
        ((StringBuilder) (obj1)).append((char)i);
          goto _L5
        obj1;
        obj;
        JVM INSTR monitorexit ;
        throw obj1;
_L8:
        flag = false;
          goto _L6
_L2:
        obj;
        JVM INSTR monitorexit ;
        obj1 = ((StringBuilder) (obj1)).toString();
        String s = ((String) (obj1));
        if (((String) (obj1)).length() == 0)
        {
            s = null;
        }
        return s;
_L4:
        if (i != 13) goto _L8; else goto _L7
_L7:
        flag = true;
          goto _L6
    }
}
