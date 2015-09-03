// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.spi.Log;
import java.io.IOException;
import java.io.InputStream;
import java.util.Queue;
import java.util.concurrent.ArrayBlockingQueue;

class QueueInputStream extends InputStream
{
    private static final class State extends Enum
    {

        public static final State CLOSED;
        private static final State ENUM$VALUES[];
        public static final State KILLED;
        public static final State OPEN;

        public static State valueOf(String s)
        {
            return (State)Enum.valueOf(ioio/lib/impl/QueueInputStream$State, s);
        }

        public static State[] values()
        {
            State astate[] = ENUM$VALUES;
            int i = astate.length;
            State astate1[] = new State[i];
            System.arraycopy(astate, 0, astate1, 0, i);
            return astate1;
        }

        static 
        {
            OPEN = new State("OPEN", 0);
            CLOSED = new State("CLOSED", 1);
            KILLED = new State("KILLED", 2);
            ENUM$VALUES = (new State[] {
                OPEN, CLOSED, KILLED
            });
        }

        private State(String s, int i)
        {
            super(s, i);
        }
    }


    private final Queue queue_ = new ArrayBlockingQueue(1024);
    private State state_;

    QueueInputStream()
    {
        state_ = State.OPEN;
    }

    public int available()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        int i = queue_.size();
        this;
        JVM INSTR monitorexit ;
        return i;
        Exception exception;
        exception;
        throw exception;
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        State state;
        State state1;
        state = state_;
        state1 = State.OPEN;
        if (state == state1) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        state_ = State.CLOSED;
        notifyAll();
        if (true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public void kill()
    {
        this;
        JVM INSTR monitorenter ;
        State state;
        State state1;
        state = state_;
        state1 = State.OPEN;
        if (state == state1) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        state_ = State.KILLED;
        notifyAll();
        if (true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public int read()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
_L1:
        Exception exception;
        try
        {
            if (state_ != State.OPEN || !queue_.isEmpty())
            {
                if (state_ == State.KILLED)
                {
                    throw new IOException("Stream has been closed");
                }
                break MISSING_BLOCK_LABEL_67;
            }
            break MISSING_BLOCK_LABEL_60;
        }
        catch (InterruptedException interruptedexception) { }
        finally
        {
            this;
        }
        throw new IOException("Interrupted");
        throw exception;
        wait();
          goto _L1
        if (state_ != State.CLOSED) goto _L3; else goto _L2
_L2:
        boolean flag = queue_.isEmpty();
        if (!flag) goto _L3; else goto _L4
_L4:
        int i = -1;
_L6:
        this;
        JVM INSTR monitorexit ;
        return i;
_L3:
        i = ((Byte)queue_.remove()).byteValue();
        i &= 0xff;
        if (true) goto _L6; else goto _L5
_L5:
    }

    public int read(byte abyte0[], int i, int j)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (j != 0) goto _L2; else goto _L1
_L1:
        i = 0;
_L7:
        this;
        JVM INSTR monitorexit ;
        return i;
_L2:
        try
        {
            while (state_ == State.OPEN && queue_.isEmpty()) 
            {
                wait();
            }
            if (state_ == State.KILLED)
            {
                throw new IOException("Stream has been closed");
            }
            break MISSING_BLOCK_LABEL_74;
        }
        // Misplaced declaration of an exception variable
        catch (byte abyte0[]) { }
        finally
        {
            this;
        }
        throw new IOException("Interrupted");
        throw abyte0;
        int k;
        if (state_ == State.CLOSED && queue_.isEmpty())
        {
            i = -1;
            continue; /* Loop/switch isn't completed */
        }
        k = j;
        if (j > queue_.size())
        {
            k = queue_.size();
        }
          goto _L3
_L5:
        abyte0[i] = ((Byte)queue_.remove()).byteValue();
        j++;
        i++;
        continue; /* Loop/switch isn't completed */
_L3:
        j = 0;
        if (j < k) goto _L5; else goto _L4
_L4:
        i = k;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void write(byte abyte0[], int i)
    {
        this;
        JVM INSTR monitorenter ;
        int j = 0;
_L3:
        if (j < i)
        {
            break MISSING_BLOCK_LABEL_16;
        }
_L1:
        notifyAll();
        this;
        JVM INSTR monitorexit ;
        return;
        if (queue_.size() != 1024)
        {
            break MISSING_BLOCK_LABEL_46;
        }
        Log.e("QueueInputStream", "Buffer overflow, discarding data");
          goto _L1
        abyte0;
        throw abyte0;
        queue_.add(Byte.valueOf(abyte0[j]));
        j++;
        if (true) goto _L3; else goto _L2
_L2:
    }
}
