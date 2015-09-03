// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import java.util.Calendar;
import org.apache.commons.net.ftp.Configurable;
import org.apache.commons.net.ftp.FTPClientConfig;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            RegexFTPFileEntryParserImpl, FTPTimestampParserImpl, FTPTimestampParser

public abstract class ConfigurableFTPFileEntryParserImpl extends RegexFTPFileEntryParserImpl
    implements Configurable
{

    private final FTPTimestampParser timestampParser = new FTPTimestampParserImpl();

    public ConfigurableFTPFileEntryParserImpl(String s)
    {
        super(s);
    }

    public void configure(FTPClientConfig ftpclientconfig)
    {
        FTPClientConfig ftpclientconfig1;
label0:
        {
            if (timestampParser instanceof Configurable)
            {
                ftpclientconfig1 = getDefaultConfiguration();
                if (ftpclientconfig == null)
                {
                    break label0;
                }
                if (ftpclientconfig.getDefaultDateFormatStr() == null)
                {
                    ftpclientconfig.setDefaultDateFormatStr(ftpclientconfig1.getDefaultDateFormatStr());
                }
                if (ftpclientconfig.getRecentDateFormatStr() == null)
                {
                    ftpclientconfig.setRecentDateFormatStr(ftpclientconfig1.getRecentDateFormatStr());
                }
                ((Configurable)timestampParser).configure(ftpclientconfig);
            }
            return;
        }
        ((Configurable)timestampParser).configure(ftpclientconfig1);
    }

    protected abstract FTPClientConfig getDefaultConfiguration();

    public Calendar parseTimestamp(String s)
        throws ParseException
    {
        return timestampParser.parseTimestamp(s);
    }
}
