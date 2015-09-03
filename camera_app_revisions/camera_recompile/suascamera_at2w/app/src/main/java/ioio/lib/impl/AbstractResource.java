// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.Closeable;
import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.impl:
//            IOIOImpl

class AbstractResource
    implements Closeable, IncomingState.DisconnectListener
{
    static final class State extends Enum
    {

        public static final State CLOSED;
        public static final State DISCONNECTED;
        private static final State ENUM$VALUES[];
        public static final State OPEN;

        public static State valueOf(String s)
        {
            return (State)Enum.valueOf(ioio/lib/impl/AbstractResource$State, s);
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
            DISCONNECTED = new State("DISCONNECTED", 2);
            ENUM$VALUES = (new State[] {
                OPEN, CLOSED, DISCONNECTED
            });
        }

        private State(String s, int i)
        {
            super(s, i);
        }
    }


    protected final IOIOImpl ioio_;
    protected State state_;

    public AbstractResource(IOIOImpl ioioimpl)
        throws ConnectionLostException
    {
        state_ = State.OPEN;
        ioio_ = ioioimpl;
    }

    protected void checkState()
        throws ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        if (state_ == State.CLOSED)
        {
            throw new IllegalStateException("Trying to use a closed resouce");
        }
        break MISSING_BLOCK_LABEL_27;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if (state_ == State.DISCONNECTED)
        {
            throw new ConnectionLostException();
        }
        this;
        JVM INSTR monitorexit ;
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        if (state_ == State.CLOSED)
        {
            throw new IllegalStateException("Trying to use a closed resouce");
        }
        break MISSING_BLOCK_LABEL_27;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if (state_ != State.DISCONNECTED)
        {
            break MISSING_BLOCK_LABEL_47;
        }
        state_ = State.CLOSED;
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        state_ = State.CLOSED;
        ioio_.removeDisconnectListener(this);
          goto _L1
    }

    public void disconnected()
    {
        this;
        JVM INSTR monitorenter ;
        if (state_ != State.CLOSED)
        {
            state_ = State.DISCONNECTED;
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }
}
