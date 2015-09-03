// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ntp;

import java.util.ArrayList;
import java.util.List;

// Referenced classes of package org.apache.commons.net.ntp:
//            NtpV3Packet, TimeStamp

public class TimeInfo
{

    private List _comments;
    private Long _delay;
    private boolean _detailsComputed;
    private final NtpV3Packet _message;
    private Long _offset;
    private final long _returnTime;

    public TimeInfo(NtpV3Packet ntpv3packet, long l)
    {
        this(ntpv3packet, l, null, true);
    }

    public TimeInfo(NtpV3Packet ntpv3packet, long l, List list)
    {
        this(ntpv3packet, l, list, true);
    }

    public TimeInfo(NtpV3Packet ntpv3packet, long l, List list, boolean flag)
    {
        if (ntpv3packet == null)
        {
            throw new IllegalArgumentException("message cannot be null");
        }
        _returnTime = l;
        _message = ntpv3packet;
        _comments = list;
        if (flag)
        {
            computeDetails();
        }
    }

    public TimeInfo(NtpV3Packet ntpv3packet, long l, boolean flag)
    {
        this(ntpv3packet, l, null, flag);
    }

    public void addComment(String s)
    {
        if (_comments == null)
        {
            _comments = new ArrayList();
        }
        _comments.add(s);
    }

    public void computeDetails()
    {
        if (!_detailsComputed) goto _L2; else goto _L1
_L1:
        return;
_L2:
        long l2;
        long l3;
        long l4;
        _detailsComputed = true;
        if (_comments == null)
        {
            _comments = new ArrayList();
        }
        TimeStamp timestamp = _message.getOriginateTimeStamp();
        l2 = timestamp.getTime();
        TimeStamp timestamp1 = _message.getReceiveTimeStamp();
        l3 = timestamp1.getTime();
        TimeStamp timestamp2 = _message.getTransmitTimeStamp();
        l4 = timestamp2.getTime();
        if (timestamp.ntpValue() == 0L)
        {
            if (timestamp2.ntpValue() != 0L)
            {
                _offset = Long.valueOf(l4 - _returnTime);
                _comments.add("Error: zero orig time -- cannot compute delay");
                return;
            } else
            {
                _comments.add("Error: zero orig time -- cannot compute delay/offset");
                return;
            }
        }
        if (timestamp1.ntpValue() != 0L && timestamp2.ntpValue() != 0L)
        {
            break; /* Loop/switch isn't completed */
        }
        _comments.add("Warning: zero rcvNtpTime or xmitNtpTime");
        if (l2 > _returnTime)
        {
            _comments.add("Error: OrigTime > DestRcvTime");
        } else
        {
            _delay = Long.valueOf(_returnTime - l2);
        }
        if (timestamp1.ntpValue() != 0L)
        {
            _offset = Long.valueOf(l3 - l2);
            return;
        }
        if (timestamp2.ntpValue() != 0L)
        {
            _offset = Long.valueOf(l4 - _returnTime);
            return;
        }
        if (true) goto _L1; else goto _L3
_L3:
        long l1 = _returnTime - l2;
        if (l4 >= l3) goto _L5; else goto _L4
_L4:
        long l;
        _comments.add("Error: xmitTime < rcvTime");
        l = l1;
_L7:
        _delay = Long.valueOf(l);
        if (l2 > _returnTime)
        {
            _comments.add("Error: OrigTime > DestRcvTime");
        }
        _offset = Long.valueOf(((l3 - l2) + (l4 - _returnTime)) / 2L);
        return;
_L5:
        l = l4 - l3;
        if (l <= l1)
        {
            l = l1 - l;
        } else
        if (l - l1 == 1L)
        {
            l = l1;
            if (l1 != 0L)
            {
                _comments.add("Info: processing time > total network time by 1 ms -> assume zero delay");
                l = 0L;
            }
        } else
        {
            _comments.add("Warning: processing time > total network time");
            l = l1;
        }
        if (true) goto _L7; else goto _L6
_L6:
    }

    public List getComments()
    {
        return _comments;
    }

    public Long getDelay()
    {
        return _delay;
    }

    public NtpV3Packet getMessage()
    {
        return _message;
    }

    public Long getOffset()
    {
        return _offset;
    }

    public long getReturnTime()
    {
        return _returnTime;
    }
}
