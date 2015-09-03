// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFileEntryParser;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            ParserInitializationException

public interface FTPFileEntryParserFactory
{

    public abstract FTPFileEntryParser createFileEntryParser(String s)
        throws ParserInitializationException;

    public abstract FTPFileEntryParser createFileEntryParser(FTPClientConfig ftpclientconfig)
        throws ParserInitializationException;
}
