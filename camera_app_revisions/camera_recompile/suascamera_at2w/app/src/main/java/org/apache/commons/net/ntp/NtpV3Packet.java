// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ntp;

import java.net.DatagramPacket;

// Referenced classes of package org.apache.commons.net.ntp:
//            TimeStamp

public interface NtpV3Packet
{

    public static final int LI_ALARM_CONDITION = 3;
    public static final int LI_LAST_MINUTE_HAS_59_SECONDS = 2;
    public static final int LI_LAST_MINUTE_HAS_61_SECONDS = 1;
    public static final int LI_NO_WARNING = 0;
    public static final int MODE_BROADCAST = 5;
    public static final int MODE_CLIENT = 3;
    public static final int MODE_CONTROL_MESSAGE = 6;
    public static final int MODE_PRIVATE = 7;
    public static final int MODE_RESERVED = 0;
    public static final int MODE_SERVER = 4;
    public static final int MODE_SYMMETRIC_ACTIVE = 1;
    public static final int MODE_SYMMETRIC_PASSIVE = 2;
    public static final int NTP_MAXCLOCK = 10;
    public static final int NTP_MAXPOLL = 14;
    public static final int NTP_MINCLOCK = 1;
    public static final int NTP_MINPOLL = 4;
    public static final int NTP_PORT = 123;
    public static final String TYPE_DAYTIME = "DAYTIME";
    public static final String TYPE_ICMP = "ICMP";
    public static final String TYPE_NTP = "NTP";
    public static final String TYPE_TIME = "TIME";
    public static final int VERSION_3 = 3;
    public static final int VERSION_4 = 4;

    public abstract DatagramPacket getDatagramPacket();

    public abstract int getLeapIndicator();

    public abstract int getMode();

    public abstract String getModeName();

    public abstract TimeStamp getOriginateTimeStamp();

    public abstract int getPoll();

    public abstract int getPrecision();

    public abstract TimeStamp getReceiveTimeStamp();

    public abstract int getReferenceId();

    public abstract String getReferenceIdString();

    public abstract TimeStamp getReferenceTimeStamp();

    public abstract int getRootDelay();

    public abstract double getRootDelayInMillisDouble();

    public abstract int getRootDispersion();

    public abstract long getRootDispersionInMillis();

    public abstract double getRootDispersionInMillisDouble();

    public abstract int getStratum();

    public abstract TimeStamp getTransmitTimeStamp();

    public abstract String getType();

    public abstract int getVersion();

    public abstract void setDatagramPacket(DatagramPacket datagrampacket);

    public abstract void setLeapIndicator(int i);

    public abstract void setMode(int i);

    public abstract void setOriginateTimeStamp(TimeStamp timestamp);

    public abstract void setPoll(int i);

    public abstract void setReceiveTimeStamp(TimeStamp timestamp);

    public abstract void setReferenceId(int i);

    public abstract void setReferenceTime(TimeStamp timestamp);

    public abstract void setStratum(int i);

    public abstract void setTransmitTime(TimeStamp timestamp);

    public abstract void setVersion(int i);
}
