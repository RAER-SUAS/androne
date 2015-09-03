// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.SpiMaster;
import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.spi.Log;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

// Referenced classes of package ioio.lib.impl:
//            AbstractResource, FlowControlledPacketSender, IOIOImpl, IOIOProtocol

class SpiMasterImpl extends AbstractResource
    implements SpiMaster, IncomingState.DataModuleListener, FlowControlledPacketSender.Sender
{
    class OutgoingPacket
        implements FlowControlledPacketSender.Packet
    {

        int readSize_;
        int ssPin_;
        final SpiMasterImpl this$0;
        int totalSize_;
        byte writeData_[];
        int writeSize_;

        public int getSize()
        {
            return writeSize_ + 4;
        }

        OutgoingPacket()
        {
            this$0 = SpiMasterImpl.this;
            super();
        }
    }

    public class SpiResult
        implements ioio.lib.api.SpiMaster.Result
    {

        final byte data_[];
        boolean ready_;
        final SpiMasterImpl this$0;

        public void waitReady()
            throws ConnectionLostException, InterruptedException
        {
            this;
            JVM INSTR monitorenter ;
_L2:
            if (!ready_ && state_ != AbstractResource.State.DISCONNECTED)
            {
                break MISSING_BLOCK_LABEL_32;
            }
            checkState();
            this;
            JVM INSTR monitorexit ;
            return;
            wait();
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            throw exception;
        }

        SpiResult(byte abyte0[])
        {
            this$0 = SpiMasterImpl.this;
            super();
            data_ = abyte0;
        }
    }


    private final int clkPinNum_;
    private final int indexToSsPin_[];
    private final int misoPinNum_;
    private final int mosiPinNum_;
    private final FlowControlledPacketSender outgoing_ = new FlowControlledPacketSender(this);
    private final Queue pendingRequests_ = new ConcurrentLinkedQueue();
    private final int spiNum_;
    private final Map ssPinToIndex_;

    SpiMasterImpl(IOIOImpl ioioimpl, int i, int j, int k, int l, int ai[])
        throws ConnectionLostException
    {
        super(ioioimpl);
        spiNum_ = i;
        mosiPinNum_ = j;
        misoPinNum_ = k;
        clkPinNum_ = l;
        indexToSsPin_ = (int[])ai.clone();
        ssPinToIndex_ = new HashMap(ai.length);
        i = 0;
        do
        {
            if (i >= ai.length)
            {
                return;
            }
            ssPinToIndex_.put(Integer.valueOf(ai[i]), Integer.valueOf(i));
            i++;
        } while (true);
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        int ai[];
        int j;
        super.close();
        outgoing_.close();
        ioio_.closeSpi(spiNum_);
        ioio_.closePin(mosiPinNum_);
        ioio_.closePin(misoPinNum_);
        ioio_.closePin(clkPinNum_);
        ai = indexToSsPin_;
        j = ai.length;
        int i = 0;
_L2:
        int k;
        if (i >= j)
        {
            return;
        }
        k = ai[i];
        ioio_.closePin(k);
        i++;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        throw exception;
    }

    public void dataReceived(byte abyte0[], int i)
    {
        synchronized ((SpiResult)pendingRequests_.remove())
        {
            spiresult.ready_ = true;
            System.arraycopy(abyte0, 0, spiresult.data_, 0, i);
            spiresult.notify();
        }
        return;
        abyte0;
        spiresult;
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
        synchronized ((SpiResult)iterator.next())
        {
            spiresult.notify();
        }
          goto _L1
        exception1;
        spiresult;
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
            ioio_.protocol_.spiMasterRequest(spiNum_, ((OutgoingPacket) (packet)).ssPin_, ((OutgoingPacket) (packet)).writeData_, ((OutgoingPacket) (packet)).writeSize_, ((OutgoingPacket) (packet)).totalSize_, ((OutgoingPacket) (packet)).readSize_);
            return;
        }
        // Misplaced declaration of an exception variable
        catch (FlowControlledPacketSender.Packet packet)
        {
            Log.e("SpiImpl", "Caught exception", packet);
        }
    }

    public void writeRead(int i, byte abyte0[], int j, int k, byte abyte1[], int l)
        throws ConnectionLostException, InterruptedException
    {
        writeReadAsync(i, abyte0, j, k, abyte1, l).waitReady();
    }

    public void writeRead(byte abyte0[], int i, int j, byte abyte1[], int k)
        throws ConnectionLostException, InterruptedException
    {
        writeRead(0, abyte0, i, j, abyte1, k);
    }

    public volatile ioio.lib.api.SpiMaster.Result writeReadAsync(int i, byte abyte0[], int j, int k, byte abyte1[], int l)
        throws ConnectionLostException
    {
        return writeReadAsync(i, abyte0, j, k, abyte1, l);
    }

    public SpiResult writeReadAsync(int i, byte abyte0[], int j, int k, byte abyte1[], int l)
        throws ConnectionLostException
    {
        OutgoingPacket outgoingpacket;
        checkState();
        abyte1 = new SpiResult(abyte1);
        outgoingpacket = new OutgoingPacket();
        outgoingpacket.writeSize_ = j;
        outgoingpacket.writeData_ = abyte0;
        outgoingpacket.readSize_ = l;
        outgoingpacket.ssPin_ = indexToSsPin_[i];
        outgoingpacket.totalSize_ = k;
        if (outgoingpacket.readSize_ <= 0) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorenter ;
        pendingRequests_.add(abyte1);
        this;
        JVM INSTR monitorexit ;
_L4:
        try
        {
            outgoing_.write(outgoingpacket);
        }
        // Misplaced declaration of an exception variable
        catch (byte abyte0[])
        {
            Log.e("SpiMasterImpl", "Exception caught", abyte0);
            return abyte1;
        }
        return abyte1;
        abyte0;
        this;
        JVM INSTR monitorexit ;
        throw abyte0;
_L2:
        abyte1.ready_ = true;
        if (true) goto _L4; else goto _L3
_L3:
    }
}
