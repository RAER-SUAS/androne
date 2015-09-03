// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ntp;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class TimeStamp
    implements Serializable, Comparable
{

    public static final String NTP_DATE_FORMAT = "EEE, MMM dd yyyy HH:mm:ss.SSS";
    protected static final long msb0baseTime = 0x1e5ae01dc00L;
    protected static final long msb1baseTime = 0xfffffdfdae01dc00L;
    private static final long serialVersionUID = 0x70f667418312e431L;
    private final long ntpTime;
    private DateFormat simpleFormatter;
    private DateFormat utcFormatter;

    public TimeStamp(long l)
    {
        ntpTime = l;
    }

    public TimeStamp(String s)
        throws NumberFormatException
    {
        ntpTime = decodeNtpHexString(s);
    }

    public TimeStamp(Date date)
    {
        long l;
        if (date == null)
        {
            l = 0L;
        } else
        {
            l = toNtpTime(date.getTime());
        }
        ntpTime = l;
    }

    private static void appendHexString(StringBuilder stringbuilder, long l)
    {
        String s = Long.toHexString(l);
        for (int i = s.length(); i < 8; i++)
        {
            stringbuilder.append('0');
        }

        stringbuilder.append(s);
    }

    protected static long decodeNtpHexString(String s)
        throws NumberFormatException
    {
        if (s == null)
        {
            throw new NumberFormatException("null");
        }
        int i = s.indexOf('.');
        if (i == -1)
        {
            if (s.length() == 0)
            {
                return 0L;
            } else
            {
                return Long.parseLong(s, 16) << 32;
            }
        } else
        {
            return Long.parseLong(s.substring(0, i), 16) << 32 | Long.parseLong(s.substring(i + 1), 16);
        }
    }

    public static TimeStamp getCurrentTime()
    {
        return getNtpTime(System.currentTimeMillis());
    }

    public static TimeStamp getNtpTime(long l)
    {
        return new TimeStamp(toNtpTime(l));
    }

    public static long getTime(long l)
    {
        long l1 = l >>> 32 & 0xffffffffL;
        l = Math.round((1000D * (double)(l & 0xffffffffL)) / 4294967296D);
        if ((l1 & 0x80000000L) == 0L)
        {
            return 0x1e5ae01dc00L + l1 * 1000L + l;
        } else
        {
            return 0xfffffdfdae01dc00L + l1 * 1000L + l;
        }
    }

    public static TimeStamp parseNtpString(String s)
        throws NumberFormatException
    {
        return new TimeStamp(decodeNtpHexString(s));
    }

    protected static long toNtpTime(long l)
    {
        boolean flag;
        long l1;
        long l2;
        if (l < 0x1e5ae01dc00L)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        if (flag)
        {
            l += 0x20251fe2400L;
        } else
        {
            l -= 0x1e5ae01dc00L;
        }
        l1 = l / 1000L;
        l2 = ((l % 1000L) * 0x100000000L) / 1000L;
        l = l1;
        if (flag)
        {
            l = l1 | 0x80000000L;
        }
        return l << 32 | l2;
    }

    public static String toString(long l)
    {
        StringBuilder stringbuilder = new StringBuilder();
        appendHexString(stringbuilder, l >>> 32 & 0xffffffffL);
        stringbuilder.append('.');
        appendHexString(stringbuilder, l & 0xffffffffL);
        return stringbuilder.toString();
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((TimeStamp)obj);
    }

    public int compareTo(TimeStamp timestamp)
    {
        long l = ntpTime;
        long l1 = timestamp.ntpTime;
        if (l < l1)
        {
            return -1;
        }
        return l != l1 ? 1 : 0;
    }

    public boolean equals(Object obj)
    {
        boolean flag1 = false;
        boolean flag = flag1;
        if (obj instanceof TimeStamp)
        {
            flag = flag1;
            if (ntpTime == ((TimeStamp)obj).ntpValue())
            {
                flag = true;
            }
        }
        return flag;
    }

    public Date getDate()
    {
        return new Date(getTime(ntpTime));
    }

    public long getFraction()
    {
        return ntpTime & 0xffffffffL;
    }

    public long getSeconds()
    {
        return ntpTime >>> 32 & 0xffffffffL;
    }

    public long getTime()
    {
        return getTime(ntpTime);
    }

    public int hashCode()
    {
        return (int)(ntpTime ^ ntpTime >>> 32);
    }

    public long ntpValue()
    {
        return ntpTime;
    }

    public String toDateString()
    {
        if (simpleFormatter == null)
        {
            simpleFormatter = new SimpleDateFormat("EEE, MMM dd yyyy HH:mm:ss.SSS", Locale.US);
            simpleFormatter.setTimeZone(TimeZone.getDefault());
        }
        Date date = getDate();
        return simpleFormatter.format(date);
    }

    public String toString()
    {
        return toString(ntpTime);
    }

    public String toUTCString()
    {
        if (utcFormatter == null)
        {
            utcFormatter = new SimpleDateFormat("EEE, MMM dd yyyy HH:mm:ss.SSS 'UTC'", Locale.US);
            utcFormatter.setTimeZone(TimeZone.getTimeZone("UTC"));
        }
        Date date = getDate();
        return utcFormatter.format(date);
    }
}
