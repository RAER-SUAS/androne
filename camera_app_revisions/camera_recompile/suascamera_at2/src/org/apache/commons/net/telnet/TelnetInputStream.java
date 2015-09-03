// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.telnet;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;

// Referenced classes of package org.apache.commons.net.telnet:
//            TelnetClient

final class TelnetInputStream extends BufferedInputStream
    implements Runnable
{

    private static final int EOF = -1;
    private static final int WOULD_BLOCK = -2;
    static final int _STATE_CR = 8;
    static final int _STATE_DATA = 0;
    static final int _STATE_DO = 4;
    static final int _STATE_DONT = 5;
    static final int _STATE_IAC = 1;
    static final int _STATE_IAC_SB = 9;
    static final int _STATE_SB = 6;
    static final int _STATE_SE = 7;
    static final int _STATE_WILL = 2;
    static final int _STATE_WONT = 3;
    private int __bytesAvailable;
    private final TelnetClient __client;
    private boolean __hasReachedEOF;
    private IOException __ioException;
    private volatile boolean __isClosed;
    private final int __queue[];
    private int __queueHead;
    private int __queueTail;
    private boolean __readIsWaiting;
    private int __receiveState;
    private final int __suboption[];
    private int __suboption_count;
    private final Thread __thread;
    private volatile boolean __threaded;

    TelnetInputStream(InputStream inputstream, TelnetClient telnetclient)
    {
        this(inputstream, telnetclient, true);
    }

    TelnetInputStream(InputStream inputstream, TelnetClient telnetclient, boolean flag)
    {
        super(inputstream);
        __suboption = new int[512];
        __suboption_count = 0;
        __client = telnetclient;
        __receiveState = 0;
        __isClosed = true;
        __hasReachedEOF = false;
        __queue = new int[2049];
        __queueHead = 0;
        __queueTail = 0;
        __bytesAvailable = 0;
        __ioException = null;
        __readIsWaiting = false;
        __threaded = false;
        if (flag)
        {
            __thread = new Thread(this);
            return;
        } else
        {
            __thread = null;
            return;
        }
    }

    private boolean __processChar(int i)
        throws InterruptedException
    {
        boolean flag = false;
        int ai[] = __queue;
        ai;
        JVM INSTR monitorenter ;
        if (__bytesAvailable == 0)
        {
            flag = true;
        }
_L1:
        if (__bytesAvailable < __queue.length - 1)
        {
            break MISSING_BLOCK_LABEL_76;
        }
        if (!__threaded)
        {
            break MISSING_BLOCK_LABEL_66;
        }
        __queue.notify();
        __queue.wait();
          goto _L1
        Object obj;
        obj;
        throw obj;
        obj;
        ai;
        JVM INSTR monitorexit ;
        throw obj;
        throw new IllegalStateException("Queue is full! Cannot process another character.");
        if (__readIsWaiting && __threaded)
        {
            __queue.notify();
        }
        __queue[__queueTail] = i;
        __bytesAvailable = __bytesAvailable + 1;
        i = __queueTail + 1;
        __queueTail = i;
        if (i >= __queue.length)
        {
            __queueTail = 0;
        }
        ai;
        JVM INSTR monitorexit ;
        return flag;
    }

    private int __read(boolean flag)
        throws IOException
    {
_L13:
        int i;
        if (!flag && super.available() == 0)
        {
            return -2;
        }
        i = super.read();
        if (i < 0)
        {
            return -1;
        }
        i &= 0xff;
        synchronized (__client)
        {
            __client._processAYTResponse();
        }
        __client._spyRead(i);
        __receiveState;
        JVM INSTR tableswitch 0 9: default 120
    //                   0 123
    //                   1 209
    //                   2 367
    //                   3 405
    //                   4 443
    //                   5 481
    //                   6 519
    //                   7 120
    //                   8 144
    //                   9 595;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L1 _L9 _L10
_L1:
        return i;
_L2:
        if (i != 255) goto _L12; else goto _L11
_L11:
        __receiveState = 1;
          goto _L13
        exception;
        telnetclient;
        JVM INSTR monitorexit ;
        throw exception;
_L9:
        if (i != 0) goto _L2; else goto _L13
_L12:
        if (i != 13) goto _L15; else goto _L14
_L14:
        TelnetClient telnetclient1 = __client;
        telnetclient1;
        JVM INSTR monitorenter ;
        if (!__client._requestedDont(0)) goto _L17; else goto _L16
_L16:
        __receiveState = 8;
_L18:
        return i;
        Exception exception1;
        exception1;
        telnetclient1;
        JVM INSTR monitorexit ;
        throw exception1;
_L17:
        __receiveState = 0;
        if (true) goto _L18; else goto _L15
_L15:
        __receiveState = 0;
        return i;
_L3:
        switch (i)
        {
        case 241: 
        case 242: 
        case 243: 
        case 244: 
        case 245: 
        case 246: 
        case 247: 
        case 248: 
        case 249: 
        default:
            __receiveState = 0;
            __client._processCommand(i);
            break;

        case 251: 
            __receiveState = 2;
            break;

        case 252: 
            __receiveState = 3;
            break;

        case 253: 
            __receiveState = 4;
            break;

        case 254: 
            __receiveState = 5;
            break;

        case 250: 
            __suboption_count = 0;
            __receiveState = 6;
            break;

        case 255: 
            __receiveState = 0;
            return i;

        case 240: 
            __receiveState = 0;
            break;
        }
        if (true) goto _L13; else goto _L19
_L19:
_L4:
        synchronized (__client)
        {
            __client._processWill(i);
            __client._flushOutputStream();
        }
        __receiveState = 0;
          goto _L13
        exception2;
        telnetclient2;
        JVM INSTR monitorexit ;
        throw exception2;
_L5:
        synchronized (__client)
        {
            __client._processWont(i);
            __client._flushOutputStream();
        }
        __receiveState = 0;
          goto _L13
        exception3;
        telnetclient3;
        JVM INSTR monitorexit ;
        throw exception3;
_L6:
        synchronized (__client)
        {
            __client._processDo(i);
            __client._flushOutputStream();
        }
        __receiveState = 0;
          goto _L13
        exception4;
        telnetclient4;
        JVM INSTR monitorexit ;
        throw exception4;
_L7:
        synchronized (__client)
        {
            __client._processDont(i);
            __client._flushOutputStream();
        }
        __receiveState = 0;
          goto _L13
        exception5;
        telnetclient5;
        JVM INSTR monitorexit ;
        throw exception5;
_L8:
        switch (i)
        {
        default:
            if (__suboption_count < __suboption.length)
            {
                int ai[] = __suboption;
                int j = __suboption_count;
                __suboption_count = j + 1;
                ai[j] = i;
            }
            __receiveState = 6;
            break;

        case 255: 
            __receiveState = 9;
            break;
        }
        continue; /* Loop/switch isn't completed */
_L10:
        i;
        JVM INSTR lookupswitch 2: default 624
    //                   240: 633
    //                   255: 677;
           goto _L20 _L21 _L22
_L20:
        __receiveState = 6;
        if (true) goto _L13; else goto _L23
_L23:
_L21:
        synchronized (__client)
        {
            __client._processSuboption(__suboption, __suboption_count);
            __client._flushOutputStream();
        }
        __receiveState = 0;
          goto _L13
        exception6;
        telnetclient6;
        JVM INSTR monitorexit ;
        throw exception6;
_L22:
        if (__suboption_count < __suboption.length)
        {
            int ai1[] = __suboption;
            int k = __suboption_count;
            __suboption_count = k + 1;
            ai1[k] = i;
        }
          goto _L20
    }

    void _start()
    {
        if (__thread == null)
        {
            return;
        }
        __isClosed = false;
        int j = Thread.currentThread().getPriority() + 1;
        int i = j;
        if (j > 10)
        {
            i = 10;
        }
        __thread.setPriority(i);
        __thread.setDaemon(true);
        __thread.start();
        __threaded = true;
    }

    public int available()
        throws IOException
    {
label0:
        {
            int i;
            synchronized (__queue)
            {
                if (!__threaded)
                {
                    break label0;
                }
                i = __bytesAvailable;
            }
            return i;
        }
        int j;
        int k;
        j = __bytesAvailable;
        k = super.available();
        ai;
        JVM INSTR monitorexit ;
        return j + k;
        exception;
        ai;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void close()
        throws IOException
    {
        super.close();
        synchronized (__queue)
        {
            __hasReachedEOF = true;
            __isClosed = true;
            if (__thread != null && __thread.isAlive())
            {
                __thread.interrupt();
            }
            __queue.notifyAll();
        }
        return;
        exception;
        ai;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean markSupported()
    {
        return false;
    }

    public int read()
        throws IOException
    {
        int ai[] = __queue;
        ai;
        JVM INSTR monitorenter ;
_L6:
        if (__ioException != null)
        {
            IOException ioexception = __ioException;
            __ioException = null;
            throw ioexception;
        }
        break MISSING_BLOCK_LABEL_31;
        Object obj;
        obj;
        ai;
        JVM INSTR monitorexit ;
        throw obj;
        if (__bytesAvailable != 0)
        {
            break MISSING_BLOCK_LABEL_226;
        }
        if (!__hasReachedEOF)
        {
            break MISSING_BLOCK_LABEL_49;
        }
        ai;
        JVM INSTR monitorexit ;
        return -1;
        if (!__threaded)
        {
            break MISSING_BLOCK_LABEL_94;
        }
        __queue.notify();
        try
        {
            __readIsWaiting = true;
            __queue.wait();
            __readIsWaiting = false;
            continue; /* Loop/switch isn't completed */
        }
        // Misplaced declaration of an exception variable
        catch (Object obj) { }
        throw new InterruptedIOException("Fatal thread interruption during read.");
        __readIsWaiting = true;
        boolean flag = true;
_L2:
        int i = __read(flag);
        if (i >= 0 || i == -2)
        {
            break MISSING_BLOCK_LABEL_168;
        }
        ai;
        JVM INSTR monitorexit ;
        return i;
        Object obj1;
        obj1;
        int ai1[] = __queue;
        ai1;
        JVM INSTR monitorenter ;
        __ioException = ((IOException) (obj1));
        __queue.notifyAll();
        try
        {
            __queue.wait(100L);
        }
        catch (InterruptedException interruptedexception) { }
        ai;
        JVM INSTR monitorexit ;
        return -1;
        obj1;
        ai1;
        JVM INSTR monitorexit ;
        throw obj1;
        if (i == -2)
        {
            break MISSING_BLOCK_LABEL_182;
        }
        __processChar(i);
_L4:
        flag = false;
        if (super.available() > 0 && __bytesAvailable < __queue.length - 1) goto _L2; else goto _L1
_L1:
        __readIsWaiting = false;
        continue; /* Loop/switch isn't completed */
        ai1;
        if (!__isClosed) goto _L4; else goto _L3
_L3:
        ai;
        JVM INSTR monitorexit ;
        return -1;
        i = __queue[__queueHead];
        int j = __queueHead + 1;
        __queueHead = j;
        if (j >= __queue.length)
        {
            __queueHead = 0;
        }
        __bytesAvailable = __bytesAvailable - 1;
        if (__bytesAvailable == 0 && __threaded)
        {
            __queue.notify();
        }
        ai;
        JVM INSTR monitorexit ;
        return i;
        if (true) goto _L6; else goto _L5
_L5:
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
        if (j >= 1) goto _L2; else goto _L1
_L1:
        j = 0;
_L4:
        return j;
_L2:
        int ai[] = __queue;
        ai;
        JVM INSTR monitorenter ;
        int k = j;
        if (j > __bytesAvailable)
        {
            k = __bytesAvailable;
        }
        ai;
        JVM INSTR monitorexit ;
        int i1;
        i1 = read();
        j = byte0;
        if (i1 == -1) goto _L4; else goto _L3
_L3:
        int l = k;
        j = i;
        k = i1;
        do
        {
            int j1 = j;
            j = j1 + 1;
            abyte0[j1] = (byte)k;
            l--;
            if (l <= 0)
            {
                break;
            }
            k = read();
        } while (k != -1);
        return j - i;
        abyte0;
        ai;
        JVM INSTR monitorexit ;
        throw abyte0;
    }

    public void run()
    {
_L8:
        boolean flag = __isClosed;
        if (flag) goto _L2; else goto _L1
_L1:
        int i = __read(true);
        if (i >= 0) goto _L3; else goto _L2
_L2:
        synchronized (__queue)
        {
            __isClosed = true;
            __hasReachedEOF = true;
            __queue.notify();
        }
        __threaded = false;
        return;
        Object obj1;
        obj1;
        obj = __queue;
        obj;
        JVM INSTR monitorenter ;
        __ioException = ((IOException) (obj1));
        __queue.notifyAll();
        __queue.wait(100L);
_L5:
        continue; /* Loop/switch isn't completed */
        obj1;
        obj;
        JVM INSTR monitorexit ;
        try
        {
            throw obj1;
        }
        // Misplaced declaration of an exception variable
        catch (Object obj1)
        {
            synchronized (__queue)
            {
                __ioException = ((IOException) (obj1));
            }
        }
        __client.notifyInputListener();
        continue; /* Loop/switch isn't completed */
        obj1;
        if (!__isClosed) goto _L5; else goto _L4
_L4:
        obj;
        JVM INSTR monitorexit ;
        continue; /* Loop/switch isn't completed */
        obj;
        super.close();
        if (true) goto _L2; else goto _L3
_L3:
        flag = false;
        boolean flag1 = __processChar(i);
        flag = flag1;
_L6:
        if (!flag)
        {
            continue; /* Loop/switch isn't completed */
        }
        __client.notifyInputListener();
        continue; /* Loop/switch isn't completed */
        obj;
        flag1 = __isClosed;
        if (!flag1) goto _L6; else goto _L2
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        obj;
        JVM INSTR monitorexit ;
        throw exception1;
        if (true) goto _L8; else goto _L7
_L7:
    }
}
