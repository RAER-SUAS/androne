// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import java.io.IOException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

class FlowControlledPacketSender
{
    class FlushThread extends Thread
    {

        final FlowControlledPacketSender this$0;

        public void run()
        {
            super.run();
            if (true) goto _L2; else goto _L1
_L1:
            obj;
            JVM INSTR monitorenter ;
_L2:
label0:
            do
            {
label1:
                {
                    synchronized (FlowControlledPacketSender.this)
                    {
                        if (queue_.isEmpty() || readyToSend_ < ((Packet)queue_.peek()).getSize())
                        {
                            break label1;
                        }
                        notifyAll();
                        FlowControlledPacketSender flowcontrolledpacketsender = FlowControlledPacketSender.this;
                        flowcontrolledpacketsender.readyToSend_ = flowcontrolledpacketsender.readyToSend_ - ((Packet)queue_.peek()).getSize();
                    }
                    try
                    {
                        sender_.send((Packet)queue_.remove());
                    }
                    // Misplaced declaration of an exception variable
                    catch (Object obj)
                    {
                        return;
                    }
                }
            } while (true);
            wait();
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
              goto _L2
        }

        FlushThread()
        {
            this$0 = FlowControlledPacketSender.this;
            super();
        }
    }

    static interface Packet
    {

        public abstract int getSize();
    }

    static interface Sender
    {

        public abstract void send(Packet packet);
    }


    private boolean closed_;
    private final BlockingQueue queue_ = new ArrayBlockingQueue(256);
    private int readyToSend_;
    private final Sender sender_;
    private final FlushThread thread_ = new FlushThread();

    public FlowControlledPacketSender(Sender sender)
    {
        readyToSend_ = 0;
        closed_ = false;
        sender_ = sender;
        thread_.start();
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        closed_ = true;
        thread_.interrupt();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void flush()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
_L1:
        boolean flag;
        if (closed_)
        {
            break MISSING_BLOCK_LABEL_23;
        }
        flag = queue_.isEmpty();
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_45;
        }
        if (closed_)
        {
            throw new IllegalStateException("Stream has been closed");
        }
        break MISSING_BLOCK_LABEL_63;
        Object obj;
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        wait();
          goto _L1
        obj;
        throw new IOException("Interrupted");
        this;
        JVM INSTR monitorexit ;
    }

    public void kill()
    {
        this;
        JVM INSTR monitorenter ;
        thread_.interrupt();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void readyToSend(int i)
    {
        this;
        JVM INSTR monitorenter ;
        readyToSend_ = readyToSend_ + i;
        notifyAll();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void write(Packet packet)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
_L1:
        boolean flag;
        if (closed_)
        {
            break MISSING_BLOCK_LABEL_24;
        }
        flag = queue_.offer(packet);
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_46;
        }
        if (closed_)
        {
            throw new IllegalStateException("Stream has been closed");
        }
        break MISSING_BLOCK_LABEL_64;
        packet;
        this;
        JVM INSTR monitorexit ;
        throw packet;
        wait();
          goto _L1
        packet;
        throw new IOException("Interrupted");
        notifyAll();
        this;
        JVM INSTR monitorexit ;
    }




}
