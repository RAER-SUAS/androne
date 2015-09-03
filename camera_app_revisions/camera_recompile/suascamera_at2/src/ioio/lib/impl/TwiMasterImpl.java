// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.TwiMaster;
import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.spi.Log;
import java.io.IOException;
import java.util.Iterator;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

// Referenced classes of package ioio.lib.impl:
//            AbstractResource, FlowControlledPacketSender, IOIOImpl, IOIOProtocol

class TwiMasterImpl extends AbstractResource
    implements TwiMaster, IncomingState.DataModuleListener, FlowControlledPacketSender.Sender
{
    class OutgoingPacket
        implements FlowControlledPacketSender.Packet
    {

        int addr_;
        int readSize_;
        boolean tenBitAddr_;
        final TwiMasterImpl this$0;
        byte writeData_[];
        int writeSize_;

        public int getSize()
        {
            return writeSize_ + 4;
        }

        OutgoingPacket()
        {
            this$0 = TwiMasterImpl.this;
            super();
        }
    }

    class TwiResult
        implements ioio.lib.api.TwiMaster.Result
    {

        final byte data_[];
        boolean ready_;
        boolean success_;
        final TwiMasterImpl this$0;

        public boolean waitReady()
            throws ConnectionLostException, InterruptedException
        {
            this;
            JVM INSTR monitorenter ;
_L2:
            boolean flag;
            if (!ready_ && state_ != AbstractResource.State.DISCONNECTED)
            {
                break MISSING_BLOCK_LABEL_38;
            }
            checkState();
            flag = success_;
            this;
            JVM INSTR monitorexit ;
            return flag;
            wait();
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            throw exception;
        }

        public TwiResult(byte abyte0[])
        {
            this$0 = TwiMasterImpl.this;
            super();
            ready_ = false;
            data_ = abyte0;
        }
    }


    private final FlowControlledPacketSender outgoing_ = new FlowControlledPacketSender(this);
    private final Queue pendingRequests_ = new ConcurrentLinkedQueue();
    private final int twiNum_;

    TwiMasterImpl(IOIOImpl ioioimpl, int i)
        throws ConnectionLostException
    {
        super(ioioimpl);
        twiNum_ = i;
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        super.close();
        outgoing_.close();
        ioio_.closeTwi(twiNum_);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void dataReceived(byte abyte0[], int i)
    {
        boolean flag = true;
        TwiResult twiresult = (TwiResult)pendingRequests_.remove();
        twiresult;
        JVM INSTR monitorenter ;
        twiresult.ready_ = true;
        if (i == 255)
        {
            flag = false;
        }
        twiresult.success_ = flag;
        if (!twiresult.success_ || i <= 0)
        {
            break MISSING_BLOCK_LABEL_58;
        }
        System.arraycopy(abyte0, 0, twiresult.data_, 0, i);
        twiresult.notify();
        twiresult;
        JVM INSTR monitorexit ;
        return;
        abyte0;
        twiresult;
        JVM INSTR monitorexit ;
        throw abyte0;
    }

    public void disconnected()
    {
        this;
        JVM INSTR monitorenter ;
        Iterator iterator;
        super.disconnected();
        outgoing_.kill();
        iterator = pendingRequests_.iterator();
_L1:
        boolean flag = iterator.hasNext();
        if (flag)
        {
            break MISSING_BLOCK_LABEL_37;
        }
        this;
        JVM INSTR monitorexit ;
        return;
        synchronized ((TwiResult)iterator.next())
        {
            twiresult.notify();
        }
          goto _L1
        exception1;
        twiresult;
        JVM INSTR monitorexit ;
        throw exception1;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void reportAdditionalBuffer(int i)
    {
        outgoing_.readyToSend(i);
    }

    public void send(FlowControlledPacketSender.Packet packet)
    {
        packet = (OutgoingPacket)packet;
        try
        {
            ioio_.protocol_.i2cWriteRead(twiNum_, ((OutgoingPacket) (packet)).tenBitAddr_, ((OutgoingPacket) (packet)).addr_, ((OutgoingPacket) (packet)).writeSize_, ((OutgoingPacket) (packet)).readSize_, ((OutgoingPacket) (packet)).writeData_);
            return;
        }
        // Misplaced declaration of an exception variable
        catch (FlowControlledPacketSender.Packet packet)
        {
            Log.e("TwiImpl", "Caught exception", packet);
        }
    }

    public boolean writeRead(int i, boolean flag, byte abyte0[], int j, byte abyte1[], int k)
        throws ConnectionLostException, InterruptedException
    {
        return writeReadAsync(i, flag, abyte0, j, abyte1, k).waitReady();
    }

    public ioio.lib.api.TwiMaster.Result writeReadAsync(int i, boolean flag, byte abyte0[], int j, byte abyte1[], int k)
        throws ConnectionLostException
    {
        OutgoingPacket outgoingpacket;
        checkState();
        abyte1 = new TwiResult(abyte1);
        outgoingpacket = new OutgoingPacket();
        outgoingpacket.writeSize_ = j;
        outgoingpacket.writeData_ = abyte0;
        outgoingpacket.tenBitAddr_ = flag;
        outgoingpacket.readSize_ = k;
        outgoingpacket.addr_ = i;
        this;
        JVM INSTR monitorenter ;
        pendingRequests_.add(abyte1);
        outgoing_.write(outgoingpacket);
_L1:
        this;
        JVM INSTR monitorexit ;
        return abyte1;
        abyte0;
        Log.e("SpiMasterImpl", "Exception caught", abyte0);
          goto _L1
        abyte0;
        this;
        JVM INSTR monitorexit ;
        throw abyte0;
    }
}
