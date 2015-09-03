// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.PulseInput;
import ioio.lib.api.exception.ConnectionLostException;
import java.util.LinkedList;
import java.util.Queue;

// Referenced classes of package ioio.lib.impl:
//            AbstractPin, IOIOImpl

class IncapImpl extends AbstractPin
    implements IncomingState.DataModuleListener, PulseInput
{

    private static final int MAX_QUEUE_LEN = 32;
    private final boolean doublePrecision_;
    private final int incapNum_;
    private long lastDuration_;
    private final ioio.lib.api.PulseInput.PulseMode mode_;
    private Queue pulseQueue_;
    private final float timeBase_;
    private boolean valid_;

    public IncapImpl(IOIOImpl ioioimpl, ioio.lib.api.PulseInput.PulseMode pulsemode, int i, int j, int k, int l, boolean flag)
        throws ConnectionLostException
    {
        super(ioioimpl, j);
        valid_ = false;
        pulseQueue_ = new LinkedList();
        mode_ = pulsemode;
        incapNum_ = i;
        timeBase_ = 1.0F / (float)(l * k);
        doublePrecision_ = flag;
    }

    private static long ByteArrayToLong(byte abyte0[], int i)
    {
        long l = 0L;
        int j = i;
        do
        {
            int k = j - 1;
            if (j <= 0)
            {
                long l1 = l;
                if (l == 0L)
                {
                    l1 = 1 << i * 8;
                }
                return l1;
            }
            l = l << 8 | (long)(abyte0[k] & 0xff);
            j = k;
        } while (true);
    }

    public void close()
    {
        this;
        JVM INSTR monitorenter ;
        ioio_.closeIncap(incapNum_, doublePrecision_);
        super.close();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void dataReceived(byte abyte0[], int i)
    {
        this;
        JVM INSTR monitorenter ;
        lastDuration_ = ByteArrayToLong(abyte0, i);
        if (pulseQueue_.size() == 32)
        {
            pulseQueue_.remove();
        }
        pulseQueue_.add(Long.valueOf(lastDuration_));
        valid_ = true;
        notifyAll();
        this;
        JVM INSTR monitorexit ;
        return;
        abyte0;
        throw abyte0;
    }

    public void disconnected()
    {
        this;
        JVM INSTR monitorenter ;
        notifyAll();
        super.disconnected();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public float getDuration()
        throws InterruptedException, ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        checkState();
_L1:
        float f;
        long l;
        if (!valid_)
        {
            break MISSING_BLOCK_LABEL_34;
        }
        f = timeBase_;
        l = lastDuration_;
        float f1 = l;
        this;
        JVM INSTR monitorexit ;
        return f * f1;
        wait();
        checkState();
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    public float getFrequency()
        throws InterruptedException, ConnectionLostException
    {
        if (mode_ != ioio.lib.api.PulseInput.PulseMode.FREQ && mode_ != ioio.lib.api.PulseInput.PulseMode.FREQ_SCALE_4 && mode_ != ioio.lib.api.PulseInput.PulseMode.FREQ_SCALE_16)
        {
            throw new IllegalStateException("Cannot query frequency when module was not opened in frequency mode.");
        } else
        {
            return 1.0F / getDuration();
        }
    }

    public void reportAdditionalBuffer(int i)
    {
        this;
        JVM INSTR monitorenter ;
    }

    public float waitPulseGetDuration()
        throws InterruptedException, ConnectionLostException
    {
        this;
        JVM INSTR monitorenter ;
        if (mode_ != ioio.lib.api.PulseInput.PulseMode.POSITIVE && mode_ != ioio.lib.api.PulseInput.PulseMode.NEGATIVE)
        {
            throw new IllegalStateException("Cannot wait for pulse when module was not opened in pulse mode.");
        }
        break MISSING_BLOCK_LABEL_37;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        checkState();
_L1:
        float f;
        long l;
        if (pulseQueue_.isEmpty() && state_ == AbstractResource.State.OPEN)
        {
            break MISSING_BLOCK_LABEL_99;
        }
        checkState();
        f = timeBase_;
        l = ((Long)pulseQueue_.remove()).longValue();
        float f1 = l;
        this;
        JVM INSTR monitorexit ;
        return f1 * f;
        wait();
          goto _L1
    }
}
