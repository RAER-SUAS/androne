// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import org.apache.commons.net.ftp.Configurable;
import org.apache.commons.net.ftp.FTPClientConfig;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            FTPTimestampParser

public class FTPTimestampParserImpl
    implements FTPTimestampParser, Configurable
{

    private SimpleDateFormat defaultDateFormat;
    private boolean lenientFutureDates;
    private SimpleDateFormat recentDateFormat;

    public FTPTimestampParserImpl()
    {
        lenientFutureDates = false;
        setDefaultDateFormat("MMM d yyyy");
        setRecentDateFormat("MMM d HH:mm");
    }

    private void setDefaultDateFormat(String s)
    {
        if (s != null)
        {
            defaultDateFormat = new SimpleDateFormat(s);
            defaultDateFormat.setLenient(false);
        }
    }

    private void setRecentDateFormat(String s)
    {
        if (s != null)
        {
            recentDateFormat = new SimpleDateFormat(s);
            recentDateFormat.setLenient(false);
        }
    }

    private void setServerTimeZone(String s)
    {
        TimeZone timezone = TimeZone.getDefault();
        if (s != null)
        {
            timezone = TimeZone.getTimeZone(s);
        }
        defaultDateFormat.setTimeZone(timezone);
        if (recentDateFormat != null)
        {
            recentDateFormat.setTimeZone(timezone);
        }
    }

    public void configure(FTPClientConfig ftpclientconfig)
    {
        Object obj = ftpclientconfig.getServerLanguageCode();
        String s = ftpclientconfig.getShortMonthNames();
        if (s != null)
        {
            obj = FTPClientConfig.getDateFormatSymbols(s);
        } else
        if (obj != null)
        {
            obj = FTPClientConfig.lookupDateFormatSymbols(((String) (obj)));
        } else
        {
            obj = FTPClientConfig.lookupDateFormatSymbols("en");
        }
        s = ftpclientconfig.getRecentDateFormatStr();
        if (s == null)
        {
            recentDateFormat = null;
        } else
        {
            recentDateFormat = new SimpleDateFormat(s, ((DateFormatSymbols) (obj)));
            recentDateFormat.setLenient(false);
        }
        s = ftpclientconfig.getDefaultDateFormatStr();
        if (s == null)
        {
            throw new IllegalArgumentException("defaultFormatString cannot be null");
        } else
        {
            defaultDateFormat = new SimpleDateFormat(s, ((DateFormatSymbols) (obj)));
            defaultDateFormat.setLenient(false);
            setServerTimeZone(ftpclientconfig.getServerTimeZoneId());
            lenientFutureDates = ftpclientconfig.isLenientFutureDates();
            return;
        }
    }

    public SimpleDateFormat getDefaultDateFormat()
    {
        return defaultDateFormat;
    }

    public String getDefaultDateFormatString()
    {
        return defaultDateFormat.toPattern();
    }

    public SimpleDateFormat getRecentDateFormat()
    {
        return recentDateFormat;
    }

    public String getRecentDateFormatString()
    {
        return recentDateFormat.toPattern();
    }

    public TimeZone getServerTimeZone()
    {
        return defaultDateFormat.getTimeZone();
    }

    public String[] getShortMonths()
    {
        return defaultDateFormat.getDateFormatSymbols().getShortMonths();
    }

    boolean isLenientFutureDates()
    {
        return lenientFutureDates;
    }

    public Calendar parseTimestamp(String s)
        throws ParseException
    {
        return parseTimestamp(s, Calendar.getInstance());
    }

    public Calendar parseTimestamp(String s, Calendar calendar)
        throws ParseException
    {
        Calendar calendar1 = (Calendar)calendar.clone();
        calendar1.setTimeZone(getServerTimeZone());
        if (recentDateFormat != null)
        {
            Calendar calendar2 = (Calendar)calendar.clone();
            calendar2.setTimeZone(getServerTimeZone());
            if (lenientFutureDates)
            {
                calendar2.add(5, 1);
            }
            String s1 = Integer.toString(calendar2.get(1));
            s1 = (new StringBuilder()).append(s).append(" ").append(s1).toString();
            Object obj = new SimpleDateFormat((new StringBuilder()).append(recentDateFormat.toPattern()).append(" yyyy").toString(), recentDateFormat.getDateFormatSymbols());
            ((SimpleDateFormat) (obj)).setLenient(false);
            ((SimpleDateFormat) (obj)).setTimeZone(recentDateFormat.getTimeZone());
            ParsePosition parseposition1 = new ParsePosition(0);
            obj = ((SimpleDateFormat) (obj)).parse(s1, parseposition1);
            if (obj != null && parseposition1.getIndex() == s1.length())
            {
                calendar1.setTime(((Date) (obj)));
                if (calendar1.after(calendar2))
                {
                    calendar1.add(1, -1);
                }
                return calendar1;
            }
        }
        ParsePosition parseposition = new ParsePosition(0);
        Date date = defaultDateFormat.parse(s, parseposition);
        if (date != null && parseposition.getIndex() == s.length())
        {
            calendar1.setTime(date);
            return calendar1;
        } else
        {
            throw new ParseException((new StringBuilder()).append("Timestamp '").append(s).append("' could not be parsed using a server time of ").append(calendar.getTime().toString()).toString(), parseposition.getErrorIndex());
        }
    }

    void setLenientFutureDates(boolean flag)
    {
        lenientFutureDates = flag;
    }
}
