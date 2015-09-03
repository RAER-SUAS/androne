// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.telnet;

import java.io.IOException;
import java.io.OutputStream;

// Referenced classes of package org.apache.commons.net.telnet:
//            TelnetClient

final class TelnetOutputStream extends OutputStream
{

    private final TelnetClient __client;
    private final boolean __convertCRtoCRLF = true;
    private boolean __lastWasCR;

    TelnetOutputStream(TelnetClient telnetclient)
    {
        __lastWasCR = false;
        __client = telnetclient;
    }

    public void close()
        throws IOException
    {
        __client._closeOutputStream();
    }

    public void flush()
        throws IOException
    {
        __client._flushOutputStream();
    }

    public void write(int i)
        throws IOException
    {
        TelnetClient telnetclient = __client;
        telnetclient;
        JVM INSTR monitorenter ;
        i &= 0xff;
        if (!__client._requestedWont(0)) goto _L2; else goto _L1
_L1:
        if (!__lastWasCR)
        {
            break MISSING_BLOCK_LABEL_54;
        }
        __client._sendByte(10);
        if (i != 10)
        {
            break MISSING_BLOCK_LABEL_54;
        }
        __lastWasCR = false;
        telnetclient;
        JVM INSTR monitorexit ;
        return;
        __lastWasCR = false;
        i;
        JVM INSTR lookupswitch 2: default 183
    //                   13: 104
    //                   255: 121;
           goto _L3 _L4 _L5
_L3:
        __client._sendByte(i);
_L6:
        telnetclient;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        telnetclient;
        JVM INSTR monitorexit ;
        throw exception;
_L4:
        __client._sendByte(13);
        __lastWasCR = true;
          goto _L6
_L5:
        __client._sendByte(255);
        __client._sendByte(255);
          goto _L6
_L2:
        if (i != 255) goto _L8; else goto _L7
_L7:
        __client._sendByte(i);
        __client._sendByte(255);
          goto _L6
_L8:
        __client._sendByte(i);
          goto _L6
    }

    public void write(byte abyte0[])
        throws IOException
    {
        write(abyte0, 0, abyte0.length);
    }

    public void write(byte abyte0[], int i, int j)
        throws IOException
    {
        TelnetClient telnetclient = __client;
        telnetclient;
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
        telnetclient;
        JVM INSTR monitorexit ;
        return;
        abyte0;
_L4:
        telnetclient;
        JVM INSTR monitorexit ;
        throw abyte0;
        abyte0;
        if (true) goto _L4; else goto _L3
_L3:
    }
}
