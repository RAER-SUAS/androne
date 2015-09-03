// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

class FlowControlledOutputStream extends OutputStream
{
    class FlushThread extends Thread
    {

        final FlowControlledOutputStream this$0;

        public void run()
        {
            super.run();
_L5:
            Object obj = FlowControlledOutputStream.this;
            obj;
            JVM INSTR monitorenter ;
_L6:
            if (readyToSend_ == 0 || queue_.isEmpty()) goto _L2; else goto _L1
_L1:
            int j = Math.min(maxPacket_, Math.min(readyToSend_, queue_.size()));
            int i = 0;
_L7:
            if (i < j) goto _L4; else goto _L3
_L3:
            FlowControlledOutputStream flowcontrolledoutputstream = FlowControlledOutputStream.this;
            flowcontrolledoutputstream.readyToSend_ = flowcontrolledoutputstream.readyToSend_ - j;
            notifyAll();
            obj;
            JVM INSTR monitorexit ;
            try
            {
                sender_.send(packet_, j);
            }
            // Misplaced declaration of an exception variable
            catch (Object obj)
            {
                return;
            }
              goto _L5
_L2:
            wait();
              goto _L6
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
_L4:
            packet_[i] = ((Byte)queue_.remove()).byteValue();
            i++;
              goto _L7
        }

        FlushThread()
        {
            this$0 = FlowControlledOutputStream.this;
            super();
        }
    }

    static interface Sender
    {

        public abstract void send(byte abyte0[], int i);
    }


    private boolean closed_;
    private final int maxPacket_;
    private final byte packet_[];
    private final BlockingQueue queue_ = new ArrayBlockingQueue(1024);
    private int readyToSend_;
    private final Sender sender_;
    private final FlushThread thread_ = new FlushThread();

    public FlowControlledOutputStream(Sender sender, int i)
    {
        readyToSend_ = 0;
        closed_ = false;
        sender_ = sender;
        maxPacket_ = i;
        packet_ = new byte[i];
        thread_.start();
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag = closed_;
        if (!flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        closed_ = true;
        notifyAll();
        thread_.interrupt();
        if (true) goto _L1; else goto _L3
_L3:
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
            throw new IOException("Stream has been closed");
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

    public void write(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
_L1:
        boolean flag;
        if (closed_)
        {
            break MISSING_BLOCK_LABEL_28;
        }
        flag = queue_.offer(Byte.valueOf((byte)i));
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_50;
        }
        if (closed_)
        {
            throw new IOException("Stream has been closed");
        }
        break MISSING_BLOCK_LABEL_68;
        Object obj;
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
        wait();
          goto _L1
        obj;
        throw new IOException("Interrupted");
        notifyAll();
        this;
        JVM INSTR monitorexit ;
    }






}
