// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ntp;

import java.net.DatagramPacket;

// Referenced classes of package org.apache.commons.net.ntp:
//            NtpV3Packet, TimeStamp, NtpUtils

public class NtpV3Impl
    implements NtpV3Packet
{

    private static final int LI_INDEX = 0;
    private static final int LI_SHIFT = 6;
    private static final int MODE_INDEX = 0;
    private static final int MODE_SHIFT = 0;
    private static final int ORIGINATE_TIMESTAMP_INDEX = 24;
    private static final int POLL_INDEX = 2;
    private static final int PRECISION_INDEX = 3;
    private static final int RECEIVE_TIMESTAMP_INDEX = 32;
    private static final int REFERENCE_ID_INDEX = 12;
    private static final int REFERENCE_TIMESTAMP_INDEX = 16;
    private static final int ROOT_DELAY_INDEX = 4;
    private static final int ROOT_DISPERSION_INDEX = 8;
    private static final int STRATUM_INDEX = 1;
    private static final int TRANSMIT_TIMESTAMP_INDEX = 40;
    private static final int VERSION_INDEX = 0;
    private static final int VERSION_SHIFT = 3;
    private final byte buf[] = new byte[48];
    private volatile DatagramPacket dp;

    public NtpV3Impl()
    {
    }

    private int getInt(int i)
    {
        return ui(buf[i]) << 24 | ui(buf[i + 1]) << 16 | ui(buf[i + 2]) << 8 | ui(buf[i + 3]);
    }

    private long getLong(int i)
    {
        return ul(buf[i]) << 56 | ul(buf[i + 1]) << 48 | ul(buf[i + 2]) << 40 | ul(buf[i + 3]) << 32 | ul(buf[i + 4]) << 24 | ul(buf[i + 5]) << 16 | ul(buf[i + 6]) << 8 | ul(buf[i + 7]);
    }

    private TimeStamp getTimestamp(int i)
    {
        return new TimeStamp(getLong(i));
    }

    private String idAsHex()
    {
        return Integer.toHexString(getReferenceId());
    }

    private String idAsIPAddress()
    {
        return (new StringBuilder()).append(ui(buf[12])).append(".").append(ui(buf[13])).append(".").append(ui(buf[14])).append(".").append(ui(buf[15])).toString();
    }

    private String idAsString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        int i = 0;
        do
        {
            char c;
label0:
            {
                if (i <= 3)
                {
                    c = (char)buf[i + 12];
                    if (c != 0)
                    {
                        break label0;
                    }
                }
                return stringbuilder.toString();
            }
            stringbuilder.append(c);
            i++;
        } while (true);
    }

    private void setTimestamp(int i, TimeStamp timestamp)
    {
        int j;
        long l;
        if (timestamp == null)
        {
            l = 0L;
        } else
        {
            l = timestamp.ntpValue();
        }
        for (j = 7; j >= 0; j--)
        {
            buf[i + j] = (byte)(int)(255L & l);
            l >>>= 8;
        }

    }

    protected static final int ui(byte byte0)
    {
        return byte0 & 0xff;
    }

    protected static final long ul(byte byte0)
    {
        return (long)(byte0 & 0xff);
    }

    public DatagramPacket getDatagramPacket()
    {
        this;
        JVM INSTR monitorenter ;
        DatagramPacket datagrampacket;
        if (dp == null)
        {
            dp = new DatagramPacket(buf, buf.length);
            dp.setPort(123);
        }
        datagrampacket = dp;
        this;
        JVM INSTR monitorexit ;
        return datagrampacket;
        Exception exception;
        exception;
        throw exception;
    }

    public int getLeapIndicator()
    {
        return ui(buf[0]) >> 6 & 3;
    }

    public int getMode()
    {
        return ui(buf[0]) >> 0 & 7;
    }

    public String getModeName()
    {
        return NtpUtils.getModeName(getMode());
    }

    public TimeStamp getOriginateTimeStamp()
    {
        return getTimestamp(24);
    }

    public int getPoll()
    {
        return buf[2];
    }

    public int getPrecision()
    {
        return buf[3];
    }

    public TimeStamp getReceiveTimeStamp()
    {
        return getTimestamp(32);
    }

    public int getReferenceId()
    {
        return getInt(12);
    }

    public String getReferenceIdString()
    {
        int i = getVersion();
        int j = getStratum();
        if (i == 3 || i == 4)
        {
            if (j == 0 || j == 1)
            {
                return idAsString();
            }
            if (i == 4)
            {
                return idAsHex();
            }
        }
        if (j >= 2)
        {
            return idAsIPAddress();
        } else
        {
            return idAsHex();
        }
    }

    public TimeStamp getReferenceTimeStamp()
    {
        return getTimestamp(16);
    }

    public int getRootDelay()
    {
        return getInt(4);
    }

    public double getRootDelayInMillisDouble()
    {
        return (double)getRootDelay() / 65.536000000000001D;
    }

    public int getRootDispersion()
    {
        return getInt(8);
    }

    public long getRootDispersionInMillis()
    {
        return (1000L * (long)getRootDispersion()) / 0x10000L;
    }

    public double getRootDispersionInMillisDouble()
    {
        return (double)getRootDispersion() / 65.536000000000001D;
    }

    public int getStratum()
    {
        return ui(buf[1]);
    }

    public TimeStamp getTransmitTimeStamp()
    {
        return getTimestamp(40);
    }

    public String getType()
    {
        return "NTP";
    }

    public int getVersion()
    {
        return ui(buf[0]) >> 3 & 7;
    }

    public void setDatagramPacket(DatagramPacket datagrampacket)
    {
        byte abyte0[] = datagrampacket.getData();
        int j = datagrampacket.getLength();
        int i = j;
        if (j > buf.length)
        {
            i = buf.length;
        }
        System.arraycopy(abyte0, 0, buf, 0, i);
    }

    public void setLeapIndicator(int i)
    {
        buf[0] = (byte)(buf[0] & 0x3f | (i & 3) << 6);
    }

    public void setMode(int i)
    {
        buf[0] = (byte)(buf[0] & 0xf8 | i & 7);
    }

    public void setOriginateTimeStamp(TimeStamp timestamp)
    {
        setTimestamp(24, timestamp);
    }

    public void setPoll(int i)
    {
        buf[2] = (byte)(i & 0xff);
    }

    public void setPrecision(int i)
    {
        buf[3] = (byte)(i & 0xff);
    }

    public void setReceiveTimeStamp(TimeStamp timestamp)
    {
        setTimestamp(32, timestamp);
    }

    public void setReferenceId(int i)
    {
        byte byte0 = 3;
        int j = i;
        for (i = byte0; i >= 0; i--)
        {
            buf[i + 12] = (byte)(j & 0xff);
            j >>>= 8;
        }

    }

    public void setReferenceTime(TimeStamp timestamp)
    {
        setTimestamp(16, timestamp);
    }

    public void setStratum(int i)
    {
        buf[1] = (byte)(i & 0xff);
    }

    public void setTransmitTime(TimeStamp timestamp)
    {
        setTimestamp(40, timestamp);
    }

    public void setVersion(int i)
    {
        buf[0] = (byte)(buf[0] & 0xc7 | (i & 7) << 3);
    }

    public String toString()
    {
        return (new StringBuilder()).append("[version:").append(getVersion()).append(", mode:").append(getMode()).append(", poll:").append(getPoll()).append(", precision:").append(getPrecision()).append(", delay:").append(getRootDelay()).append(", dispersion(ms):").append(getRootDispersionInMillisDouble()).append(", id:").append(getReferenceIdString()).append(", xmitTime:").append(getTransmitTimeStamp().toDateString()).append(" ]").toString();
    }
}
