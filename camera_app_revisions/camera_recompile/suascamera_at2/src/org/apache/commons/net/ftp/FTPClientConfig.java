// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.text.DateFormatSymbols;
import java.util.Collection;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;

public class FTPClientConfig
{

    private static final Map LANGUAGE_CODE_MAP;
    public static final String SYST_AS400 = "AS/400";
    public static final String SYST_L8 = "TYPE: L8";
    public static final String SYST_MACOS_PETER = "MACOS PETER";
    public static final String SYST_MVS = "MVS";
    public static final String SYST_NETWARE = "NETWARE";
    public static final String SYST_NT = "WINDOWS";
    public static final String SYST_OS2 = "OS/2";
    public static final String SYST_OS400 = "OS/400";
    public static final String SYST_UNIX = "UNIX";
    public static final String SYST_VMS = "VMS";
    private String defaultDateFormatStr;
    private boolean lenientFutureDates;
    private String recentDateFormatStr;
    private String serverLanguageCode;
    private final String serverSystemKey;
    private String serverTimeZoneId;
    private String shortMonthNames;

    public FTPClientConfig()
    {
        this("UNIX");
    }

    public FTPClientConfig(String s)
    {
        defaultDateFormatStr = null;
        recentDateFormatStr = null;
        lenientFutureDates = true;
        serverLanguageCode = null;
        shortMonthNames = null;
        serverTimeZoneId = null;
        serverSystemKey = s;
    }

    public FTPClientConfig(String s, String s1, String s2, String s3, String s4, String s5)
    {
        this(s);
        defaultDateFormatStr = s1;
        recentDateFormatStr = s2;
        serverLanguageCode = s3;
        shortMonthNames = s4;
        serverTimeZoneId = s5;
    }

    public static DateFormatSymbols getDateFormatSymbols(String s)
    {
        s = splitShortMonthString(s);
        DateFormatSymbols dateformatsymbols = new DateFormatSymbols(Locale.US);
        dateformatsymbols.setShortMonths(s);
        return dateformatsymbols;
    }

    public static Collection getSupportedLanguageCodes()
    {
        return LANGUAGE_CODE_MAP.keySet();
    }

    public static DateFormatSymbols lookupDateFormatSymbols(String s)
    {
        s = ((String) (LANGUAGE_CODE_MAP.get(s)));
        if (s != null)
        {
            if (s instanceof Locale)
            {
                return new DateFormatSymbols((Locale)s);
            }
            if (s instanceof String)
            {
                return getDateFormatSymbols((String)s);
            }
        }
        return new DateFormatSymbols(Locale.US);
    }

    private static String[] splitShortMonthString(String s)
    {
        s = new StringTokenizer(s, "|");
        if (12 != s.countTokens())
        {
            throw new IllegalArgumentException("expecting a pipe-delimited string containing 12 tokens");
        }
        String as[] = new String[13];
        int i;
        for (i = 0; s.hasMoreTokens(); i++)
        {
            as[i] = s.nextToken();
        }

        as[i] = "";
        return as;
    }

    public String getDefaultDateFormatStr()
    {
        return defaultDateFormatStr;
    }

    public String getRecentDateFormatStr()
    {
        return recentDateFormatStr;
    }

    public String getServerLanguageCode()
    {
        return serverLanguageCode;
    }

    public String getServerSystemKey()
    {
        return serverSystemKey;
    }

    public String getServerTimeZoneId()
    {
        return serverTimeZoneId;
    }

    public String getShortMonthNames()
    {
        return shortMonthNames;
    }

    public boolean isLenientFutureDates()
    {
        return lenientFutureDates;
    }

    public void setDefaultDateFormatStr(String s)
    {
        defaultDateFormatStr = s;
    }

    public void setLenientFutureDates(boolean flag)
    {
        lenientFutureDates = flag;
    }

    public void setRecentDateFormatStr(String s)
    {
        recentDateFormatStr = s;
    }

    public void setServerLanguageCode(String s)
    {
        serverLanguageCode = s;
    }

    public void setServerTimeZoneId(String s)
    {
        serverTimeZoneId = s;
    }

    public void setShortMonthNames(String s)
    {
        shortMonthNames = s;
    }

    static 
    {
        LANGUAGE_CODE_MAP = new TreeMap();
        LANGUAGE_CODE_MAP.put("en", Locale.ENGLISH);
        LANGUAGE_CODE_MAP.put("de", Locale.GERMAN);
        LANGUAGE_CODE_MAP.put("it", Locale.ITALIAN);
        LANGUAGE_CODE_MAP.put("es", new Locale("es", "", ""));
        LANGUAGE_CODE_MAP.put("pt", new Locale("pt", "", ""));
        LANGUAGE_CODE_MAP.put("da", new Locale("da", "", ""));
        LANGUAGE_CODE_MAP.put("sv", new Locale("sv", "", ""));
        LANGUAGE_CODE_MAP.put("no", new Locale("no", "", ""));
        LANGUAGE_CODE_MAP.put("nl", new Locale("nl", "", ""));
        LANGUAGE_CODE_MAP.put("ro", new Locale("ro", "", ""));
        LANGUAGE_CODE_MAP.put("sq", new Locale("sq", "", ""));
        LANGUAGE_CODE_MAP.put("sh", new Locale("sh", "", ""));
        LANGUAGE_CODE_MAP.put("sk", new Locale("sk", "", ""));
        LANGUAGE_CODE_MAP.put("sl", new Locale("sl", "", ""));
        LANGUAGE_CODE_MAP.put("fr", "jan|f\351v|mar|avr|mai|jun|jui|ao\373|sep|oct|nov|d\351c");
    }
}
