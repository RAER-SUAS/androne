// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp.parser;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.net.ftp.Configurable;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFileEntryParser;

// Referenced classes of package org.apache.commons.net.ftp.parser:
//            FTPFileEntryParserFactory, UnixFTPEntryParser, ParserInitializationException, VMSVersioningFTPEntryParser, 
//            OS2FTPEntryParser, MVSFTPEntryParser, NetwareFTPEntryParser, MacOsPeterFTPEntryParser, 
//            NTFTPEntryParser, CompositeFileEntryParser, OS400FTPEntryParser

public class DefaultFTPFileEntryParserFactory
    implements FTPFileEntryParserFactory
{

    private static final String JAVA_IDENTIFIER = "\\p{javaJavaIdentifierStart}(\\p{javaJavaIdentifierPart})*";
    private static final String JAVA_QUALIFIED_NAME = "(\\p{javaJavaIdentifierStart}(\\p{javaJavaIdentifierPart})*\\.)+\\p{javaJavaIdentifierStart}(\\p{javaJavaIdentifierPart})*";
    private static final Pattern JAVA_QUALIFIED_NAME_PATTERN = Pattern.compile("(\\p{javaJavaIdentifierStart}(\\p{javaJavaIdentifierPart})*\\.)+\\p{javaJavaIdentifierStart}(\\p{javaJavaIdentifierPart})*");

    public DefaultFTPFileEntryParserFactory()
    {
    }

    private FTPFileEntryParser createFileEntryParser(String s, FTPClientConfig ftpclientconfig)
    {
        Object obj;
        Object obj1;
        obj = null;
        obj1 = obj;
        if (!JAVA_QUALIFIED_NAME_PATTERN.matcher(s).matches())
        {
            break MISSING_BLOCK_LABEL_34;
        }
        Class class1 = Class.forName(s);
        obj1 = (FTPFileEntryParser)class1.newInstance();
_L7:
        obj = obj1;
        if (obj1 != null) goto _L2; else goto _L1
_L1:
        obj = s.toUpperCase(Locale.ENGLISH);
        if (((String) (obj)).indexOf("UNIX") < 0) goto _L4; else goto _L3
_L3:
        obj = new UnixFTPEntryParser(ftpclientconfig);
_L2:
        if (obj instanceof Configurable)
        {
            ((Configurable)obj).configure(ftpclientconfig);
        }
        return ((FTPFileEntryParser) (obj));
        obj1;
        try
        {
            throw new ParserInitializationException((new StringBuilder()).append(class1.getName()).append(" does not implement the interface ").append("org.apache.commons.net.ftp.FTPFileEntryParser.").toString(), ((Throwable) (obj1)));
        }
        catch (ClassNotFoundException classnotfoundexception)
        {
            classnotfoundexception = ((ClassNotFoundException) (obj));
        }
        continue; /* Loop/switch isn't completed */
        obj1;
        throw new ParserInitializationException("Error initializing parser", ((Throwable) (obj1)));
        obj1;
        throw new ParserInitializationException("Error initializing parser", ((Throwable) (obj1)));
_L4:
        if (((String) (obj)).indexOf("VMS") >= 0)
        {
            obj = new VMSVersioningFTPEntryParser(ftpclientconfig);
            continue; /* Loop/switch isn't completed */
        }
        if (((String) (obj)).indexOf("WINDOWS") >= 0)
        {
            obj = createNTFTPEntryParser(ftpclientconfig);
            continue; /* Loop/switch isn't completed */
        }
        if (((String) (obj)).indexOf("OS/2") >= 0)
        {
            obj = new OS2FTPEntryParser(ftpclientconfig);
            continue; /* Loop/switch isn't completed */
        }
        if (((String) (obj)).indexOf("OS/400") >= 0 || ((String) (obj)).indexOf("AS/400") >= 0)
        {
            obj = createOS400FTPEntryParser(ftpclientconfig);
            continue; /* Loop/switch isn't completed */
        }
        if (((String) (obj)).indexOf("MVS") >= 0)
        {
            obj = new MVSFTPEntryParser();
            continue; /* Loop/switch isn't completed */
        }
        if (((String) (obj)).indexOf("NETWARE") >= 0)
        {
            obj = new NetwareFTPEntryParser(ftpclientconfig);
            continue; /* Loop/switch isn't completed */
        }
        if (((String) (obj)).indexOf("MACOS PETER") >= 0)
        {
            obj = new MacOsPeterFTPEntryParser(ftpclientconfig);
            continue; /* Loop/switch isn't completed */
        }
        if (((String) (obj)).indexOf("TYPE: L8") < 0)
        {
            break; /* Loop/switch isn't completed */
        }
        obj = new UnixFTPEntryParser(ftpclientconfig);
        if (true) goto _L2; else goto _L5
_L5:
        throw new ParserInitializationException((new StringBuilder()).append("Unknown parser type: ").append(s).toString());
        if (true) goto _L7; else goto _L6
_L6:
    }

    private FTPFileEntryParser createNTFTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        if (ftpclientconfig != null && "WINDOWS".equals(ftpclientconfig.getServerSystemKey()))
        {
            return new NTFTPEntryParser(ftpclientconfig);
        } else
        {
            return new CompositeFileEntryParser(new FTPFileEntryParser[] {
                new NTFTPEntryParser(ftpclientconfig), new UnixFTPEntryParser(ftpclientconfig)
            });
        }
    }

    private FTPFileEntryParser createOS400FTPEntryParser(FTPClientConfig ftpclientconfig)
    {
        if (ftpclientconfig != null && "OS/400".equals(ftpclientconfig.getServerSystemKey()))
        {
            return new OS400FTPEntryParser(ftpclientconfig);
        } else
        {
            return new CompositeFileEntryParser(new FTPFileEntryParser[] {
                new OS400FTPEntryParser(ftpclientconfig), new UnixFTPEntryParser(ftpclientconfig)
            });
        }
    }

    public FTPFileEntryParser createFileEntryParser(String s)
    {
        if (s == null)
        {
            throw new ParserInitializationException("Parser key cannot be null");
        } else
        {
            return createFileEntryParser(s, null);
        }
    }

    public FTPFileEntryParser createFileEntryParser(FTPClientConfig ftpclientconfig)
        throws ParserInitializationException
    {
        return createFileEntryParser(ftpclientconfig.getServerSystemKey(), ftpclientconfig);
    }

    public FTPFileEntryParser createMVSEntryParser()
    {
        return new MVSFTPEntryParser();
    }

    public FTPFileEntryParser createNTFTPEntryParser()
    {
        return createNTFTPEntryParser(null);
    }

    public FTPFileEntryParser createNetwareFTPEntryParser()
    {
        return new NetwareFTPEntryParser();
    }

    public FTPFileEntryParser createOS2FTPEntryParser()
    {
        return new OS2FTPEntryParser();
    }

    public FTPFileEntryParser createOS400FTPEntryParser()
    {
        return createOS400FTPEntryParser(null);
    }

    public FTPFileEntryParser createUnixFTPEntryParser()
    {
        return new UnixFTPEntryParser();
    }

    public FTPFileEntryParser createVMSVersioningFTPEntryParser()
    {
        return new VMSVersioningFTPEntryParser();
    }

}
