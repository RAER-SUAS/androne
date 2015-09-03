// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ServerSocketFactory;
import javax.net.SocketFactory;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.ftp.parser.DefaultFTPFileEntryParserFactory;
import org.apache.commons.net.ftp.parser.FTPFileEntryParserFactory;
import org.apache.commons.net.ftp.parser.MLSxEntryParser;
import org.apache.commons.net.io.CRLFLineReader;
import org.apache.commons.net.io.CopyStreamAdapter;
import org.apache.commons.net.io.CopyStreamEvent;
import org.apache.commons.net.io.CopyStreamListener;
import org.apache.commons.net.io.FromNetASCIIInputStream;
import org.apache.commons.net.io.SocketInputStream;
import org.apache.commons.net.io.SocketOutputStream;
import org.apache.commons.net.io.ToNetASCIIOutputStream;
import org.apache.commons.net.io.Util;

// Referenced classes of package org.apache.commons.net.ftp:
//            FTP, Configurable, FTPCmd, FTPReply, 
//            FTPListParseEngine, FTPCommand, FTPClientConfig, FTPFileFilters, 
//            FTPFileEntryParser, FTPFile, FTPFileFilter

public class FTPClient extends FTP
    implements Configurable
{
    private static class CSL
        implements CopyStreamListener
    {

        private final int currentSoTimeout;
        private final long idle;
        private int notAcked;
        private final FTPClient parent;
        private long time;

        public void bytesTransferred(long l, int i, long l1)
        {
            l = System.currentTimeMillis();
            if (l - time > idle)
            {
                try
                {
                    parent.__noop();
                }
                catch (SocketTimeoutException sockettimeoutexception)
                {
                    notAcked = notAcked + 1;
                }
                catch (IOException ioexception) { }
                time = l;
            }
        }

        public void bytesTransferred(CopyStreamEvent copystreamevent)
        {
            bytesTransferred(copystreamevent.getTotalBytesTransferred(), copystreamevent.getBytesTransferred(), copystreamevent.getStreamSize());
        }

        void cleanUp()
            throws IOException
        {
_L2:
            int i;
            i = notAcked;
            notAcked = i - 1;
            if (i <= 0)
            {
                break; /* Loop/switch isn't completed */
            }
            parent.__getReplyNoReport();
            if (true) goto _L2; else goto _L1
            Exception exception;
            exception;
            parent.setSoTimeout(currentSoTimeout);
            throw exception;
_L1:
            parent.setSoTimeout(currentSoTimeout);
            return;
        }

        CSL(FTPClient ftpclient, long l, int i)
            throws SocketException
        {
            time = System.currentTimeMillis();
            idle = l;
            parent = ftpclient;
            currentSoTimeout = ftpclient.getSoTimeout();
            ftpclient.setSoTimeout(i);
        }
    }

    private static class PropertiesSingleton
    {

        static final Properties PROPERTIES;

        static 
        {
            Properties properties;
            Object obj;
            obj = org/apache/commons/net/ftp/FTPClient.getResourceAsStream("/systemType.properties");
            properties = null;
            if (obj == null)
            {
                break MISSING_BLOCK_LABEL_31;
            }
            properties = new Properties();
            properties.load(((InputStream) (obj)));
            Exception exception;
            IOException ioexception2;
            try
            {
                ((InputStream) (obj)).close();
            }
            catch (IOException ioexception) { }
            PROPERTIES = properties;
            return;
            ioexception2;
            try
            {
                ((InputStream) (obj)).close();
            }
            // Misplaced declaration of an exception variable
            catch (Object obj) { }
            if (true)
            {
                break MISSING_BLOCK_LABEL_31;
            }
            exception;
            try
            {
                ((InputStream) (obj)).close();
            }
            catch (IOException ioexception1) { }
            throw exception;
        }

        private PropertiesSingleton()
        {
        }
    }


    public static final int ACTIVE_LOCAL_DATA_CONNECTION_MODE = 0;
    public static final int ACTIVE_REMOTE_DATA_CONNECTION_MODE = 1;
    public static final String FTP_SYSTEM_TYPE = "org.apache.commons.net.ftp.systemType";
    public static final String FTP_SYSTEM_TYPE_DEFAULT = "org.apache.commons.net.ftp.systemType.default";
    public static final int PASSIVE_LOCAL_DATA_CONNECTION_MODE = 2;
    public static final int PASSIVE_REMOTE_DATA_CONNECTION_MODE = 3;
    public static final String SYSTEM_TYPE_PROPERTIES = "/systemType.properties";
    private static final Pattern __PARMS_PAT = Pattern.compile("(\\d{1,3},\\d{1,3},\\d{1,3},\\d{1,3}),(\\d{1,3}),(\\d{1,3})");
    private InetAddress __activeExternalHost;
    private int __activeMaxPort;
    private int __activeMinPort;
    private boolean __autodetectEncoding;
    private int __bufferSize;
    private FTPClientConfig __configuration;
    private int __controlKeepAliveReplyTimeout;
    private long __controlKeepAliveTimeout;
    private CopyStreamListener __copyStreamListener;
    private int __dataConnectionMode;
    private int __dataTimeout;
    private FTPFileEntryParser __entryParser;
    private String __entryParserKey;
    private HashMap __featuresMap;
    private int __fileFormat;
    private int __fileStructure;
    private int __fileTransferMode;
    private int __fileType;
    private boolean __listHiddenFiles;
    private FTPFileEntryParserFactory __parserFactory;
    private String __passiveHost;
    private InetAddress __passiveLocalHost;
    private boolean __passiveNatWorkaround;
    private int __passivePort;
    private final Random __random = new Random();
    private int __receiveDataSocketBufferSize;
    private boolean __remoteVerificationEnabled;
    private InetAddress __reportActiveExternalHost;
    private long __restartOffset;
    private int __sendDataSocketBufferSize;
    private String __systemName;
    private boolean __useEPSVwithIPv4;

    public FTPClient()
    {
        __controlKeepAliveReplyTimeout = 1000;
        __passiveNatWorkaround = true;
        __autodetectEncoding = false;
        __initDefaults();
        __dataTimeout = -1;
        __remoteVerificationEnabled = true;
        __parserFactory = new DefaultFTPFileEntryParserFactory();
        __configuration = null;
        __listHiddenFiles = false;
        __useEPSVwithIPv4 = false;
        __passiveLocalHost = null;
    }

    private void __initDefaults()
    {
        __dataConnectionMode = 0;
        __passiveHost = null;
        __passivePort = -1;
        __activeExternalHost = null;
        __reportActiveExternalHost = null;
        __activeMinPort = 0;
        __activeMaxPort = 0;
        __fileType = 0;
        __fileStructure = 7;
        __fileFormat = 4;
        __fileTransferMode = 10;
        __restartOffset = 0L;
        __systemName = null;
        __entryParser = null;
        __entryParserKey = "";
        __featuresMap = null;
    }

    private CopyStreamListener __mergeListeners(CopyStreamListener copystreamlistener)
    {
        CopyStreamListener copystreamlistener1;
        if (copystreamlistener == null)
        {
            copystreamlistener1 = __copyStreamListener;
        } else
        {
            copystreamlistener1 = copystreamlistener;
            if (__copyStreamListener != null)
            {
                CopyStreamAdapter copystreamadapter = new CopyStreamAdapter();
                copystreamadapter.addCopyStreamListener(copystreamlistener);
                copystreamadapter.addCopyStreamListener(__copyStreamListener);
                return copystreamadapter;
            }
        }
        return copystreamlistener1;
    }

    static String __parsePathname(String s)
    {
        String s1;
        s1 = s.substring(4);
        s = s1;
        if (!s1.startsWith("\"")) goto _L2; else goto _L1
_L1:
        StringBuilder stringbuilder;
        boolean flag;
        int i;
        stringbuilder = new StringBuilder();
        flag = false;
        i = 1;
_L7:
        if (i >= s1.length()) goto _L4; else goto _L3
_L3:
        char c = s1.charAt(i);
        if (c != '"') goto _L6; else goto _L5
_L5:
        if (flag)
        {
            stringbuilder.append(c);
            flag = false;
        } else
        {
            flag = true;
        }
_L10:
        i++;
          goto _L7
_L6:
        if (!flag) goto _L9; else goto _L8
_L8:
        s = stringbuilder.toString();
_L2:
        return s;
_L9:
        stringbuilder.append(c);
          goto _L10
_L4:
        s = s1;
        if (!flag) goto _L2; else goto _L11
_L11:
        return stringbuilder.toString();
          goto _L10
    }

    private boolean __storeFile(FTPCmd ftpcmd, String s, InputStream inputstream)
        throws IOException
    {
        return _storeFile(ftpcmd.getCommand(), s, inputstream);
    }

    private OutputStream __storeFileStream(FTPCmd ftpcmd, String s)
        throws IOException
    {
        return _storeFileStream(ftpcmd.getCommand(), s);
    }

    private int getActivePort()
    {
        if (__activeMinPort > 0 && __activeMaxPort >= __activeMinPort)
        {
            if (__activeMaxPort == __activeMinPort)
            {
                return __activeMaxPort;
            } else
            {
                return __random.nextInt((__activeMaxPort - __activeMinPort) + 1) + __activeMinPort;
            }
        } else
        {
            return 0;
        }
    }

    private InputStream getBufferedInputStream(InputStream inputstream)
    {
        if (__bufferSize > 0)
        {
            return new BufferedInputStream(inputstream, __bufferSize);
        } else
        {
            return new BufferedInputStream(inputstream);
        }
    }

    private OutputStream getBufferedOutputStream(OutputStream outputstream)
    {
        if (__bufferSize > 0)
        {
            return new BufferedOutputStream(outputstream, __bufferSize);
        } else
        {
            return new BufferedOutputStream(outputstream);
        }
    }

    private InetAddress getHostAddress()
    {
        if (__activeExternalHost != null)
        {
            return __activeExternalHost;
        } else
        {
            return getLocalAddress();
        }
    }

    private static Properties getOverrideProperties()
    {
        return PropertiesSingleton.PROPERTIES;
    }

    private InetAddress getReportHostAddress()
    {
        if (__reportActiveExternalHost != null)
        {
            return __reportActiveExternalHost;
        } else
        {
            return getHostAddress();
        }
    }

    private boolean initFeatureMap()
        throws IOException
    {
        boolean flag;
        boolean flag1;
        flag1 = true;
        flag = flag1;
        if (__featuresMap != null) goto _L2; else goto _L1
_L1:
        flag = FTPReply.isPositiveCompletion(feat());
        __featuresMap = new HashMap();
        if (flag) goto _L4; else goto _L3
_L3:
        flag = false;
_L2:
        return flag;
_L4:
        String as[] = getReplyStrings();
        int j = as.length;
        int i = 0;
        do
        {
            flag = flag1;
            if (i >= j)
            {
                continue;
            }
            Object obj1 = as[i];
            if (((String) (obj1)).startsWith(" "))
            {
                String s = "";
                int k = ((String) (obj1)).indexOf(' ', 1);
                Object obj;
                String s1;
                if (k > 0)
                {
                    obj = ((String) (obj1)).substring(1, k);
                    s = ((String) (obj1)).substring(k + 1);
                } else
                {
                    obj = ((String) (obj1)).substring(1);
                }
                s1 = ((String) (obj)).toUpperCase(Locale.ENGLISH);
                obj1 = (Set)__featuresMap.get(s1);
                obj = obj1;
                if (obj1 == null)
                {
                    obj = new HashSet();
                    __featuresMap.put(s1, obj);
                }
                ((Set) (obj)).add(s);
            }
            i++;
        } while (true);
        if (true) goto _L2; else goto _L5
_L5:
    }

    private FTPListParseEngine initiateListParsing(FTPFileEntryParser ftpfileentryparser, String s)
        throws IOException
    {
        s = _openDataConnection_(FTPCmd.LIST, getListArguments(s));
        ftpfileentryparser = new FTPListParseEngine(ftpfileentryparser);
        if (s == null)
        {
            return ftpfileentryparser;
        }
        ftpfileentryparser.readServerList(s.getInputStream(), getControlEncoding());
        Util.closeQuietly(s);
        completePendingCommand();
        return ftpfileentryparser;
        ftpfileentryparser;
        Util.closeQuietly(s);
        throw ftpfileentryparser;
    }

    private FTPListParseEngine initiateMListParsing(String s)
        throws IOException
    {
        FTPListParseEngine ftplistparseengine;
        s = _openDataConnection_(FTPCmd.MLSD, s);
        ftplistparseengine = new FTPListParseEngine(MLSxEntryParser.getInstance());
        if (s == null)
        {
            return ftplistparseengine;
        }
        ftplistparseengine.readServerList(s.getInputStream(), getControlEncoding());
        Util.closeQuietly(s);
        completePendingCommand();
        return ftplistparseengine;
        Exception exception;
        exception;
        Util.closeQuietly(s);
        completePendingCommand();
        throw exception;
    }

    protected void _connectAction_()
        throws IOException
    {
        super._connectAction_();
        __initDefaults();
        if (__autodetectEncoding)
        {
            ArrayList arraylist = new ArrayList(_replyLines);
            int i = _replyCode;
            if (hasFeature("UTF8") || hasFeature("UTF-8"))
            {
                setControlEncoding("UTF-8");
                _controlInput_ = new CRLFLineReader(new InputStreamReader(_input_, getControlEncoding()));
                _controlOutput_ = new BufferedWriter(new OutputStreamWriter(_output_, getControlEncoding()));
            }
            _replyLines.clear();
            _replyLines.addAll(arraylist);
            _replyCode = i;
        }
    }

    protected Socket _openDataConnection_(int i, String s)
        throws IOException
    {
        return _openDataConnection_(FTPCommand.getCommand(i), s);
    }

    protected Socket _openDataConnection_(String s, String s1)
        throws IOException
    {
        boolean flag1 = true;
        if (__dataConnectionMode == 0 || __dataConnectionMode == 2) goto _L2; else goto _L1
_L1:
        s = null;
_L4:
        return s;
_L2:
        ServerSocket serversocket;
        boolean flag2;
        flag2 = getRemoteAddress() instanceof Inet6Address;
        if (__dataConnectionMode != 0)
        {
            break MISSING_BLOCK_LABEL_328;
        }
        serversocket = _serverSocketFactory_.createServerSocket(getActivePort(), 1, getHostAddress());
        if (!flag2)
        {
            break MISSING_BLOCK_LABEL_91;
        }
        flag2 = FTPReply.isPositiveCompletion(eprt(getReportHostAddress(), serversocket.getLocalPort()));
        if (!flag2)
        {
            serversocket.close();
            return null;
        }
        break MISSING_BLOCK_LABEL_121;
        flag2 = FTPReply.isPositiveCompletion(port(getReportHostAddress(), serversocket.getLocalPort()));
        if (!flag2)
        {
            serversocket.close();
            return null;
        }
        if (__restartOffset <= 0L)
        {
            break MISSING_BLOCK_LABEL_152;
        }
        flag2 = restart(__restartOffset);
        if (!flag2)
        {
            serversocket.close();
            return null;
        }
        flag2 = FTPReply.isPositivePreliminary(sendCommand(s, s1));
        if (!flag2)
        {
            serversocket.close();
            return null;
        }
        Socket socket;
        if (__dataTimeout >= 0)
        {
            serversocket.setSoTimeout(__dataTimeout);
        }
        socket = serversocket.accept();
        if (__dataTimeout >= 0)
        {
            socket.setSoTimeout(__dataTimeout);
        }
        if (__receiveDataSocketBufferSize > 0)
        {
            socket.setReceiveBufferSize(__receiveDataSocketBufferSize);
        }
        if (__sendDataSocketBufferSize > 0)
        {
            socket.setSendBufferSize(__sendDataSocketBufferSize);
        }
        serversocket.close();
_L6:
        s = socket;
        if (!__remoteVerificationEnabled) goto _L4; else goto _L3
_L3:
        s = socket;
        if (verifyRemote(socket)) goto _L4; else goto _L5
_L5:
        socket.close();
        throw new IOException((new StringBuilder()).append("Host attempting data connection ").append(socket.getInetAddress().getHostAddress()).append(" is not same as server ").append(getRemoteAddress().getHostAddress()).toString());
        s;
        serversocket.close();
        throw s;
        boolean flag = flag1;
        Socket socket1;
        if (!isUseEPSVwithIPv4())
        {
            if (flag2)
            {
                flag = flag1;
            } else
            {
                flag = false;
            }
        }
        if (flag && epsv() == 229)
        {
            _parseExtendedPassiveModeReply((String)_replyLines.get(0));
        } else
        {
            if (flag2)
            {
                return null;
            }
            if (pasv() != 227)
            {
                return null;
            }
            _parsePassiveModeReply((String)_replyLines.get(0));
        }
        socket1 = _socketFactory_.createSocket();
        if (__receiveDataSocketBufferSize > 0)
        {
            socket1.setReceiveBufferSize(__receiveDataSocketBufferSize);
        }
        if (__sendDataSocketBufferSize > 0)
        {
            socket1.setSendBufferSize(__sendDataSocketBufferSize);
        }
        if (__passiveLocalHost != null)
        {
            socket1.bind(new InetSocketAddress(__passiveLocalHost, 0));
        }
        if (__dataTimeout >= 0)
        {
            socket1.setSoTimeout(__dataTimeout);
        }
        socket1.connect(new InetSocketAddress(__passiveHost, __passivePort), connectTimeout);
        if (__restartOffset > 0L && !restart(__restartOffset))
        {
            socket1.close();
            return null;
        }
        socket = socket1;
        if (!FTPReply.isPositivePreliminary(sendCommand(s, s1)))
        {
            socket1.close();
            return null;
        }
          goto _L6
    }

    protected Socket _openDataConnection_(FTPCmd ftpcmd, String s)
        throws IOException
    {
        return _openDataConnection_(ftpcmd.getCommand(), s);
    }

    protected void _parseExtendedPassiveModeReply(String s)
        throws MalformedServerReplyException
    {
        s = s.substring(s.indexOf('(') + 1, s.indexOf(')')).trim();
        int i = s.charAt(0);
        char c = s.charAt(1);
        char c1 = s.charAt(2);
        char c2 = s.charAt(s.length() - 1);
        if (i != c || c != c1 || c1 != c2)
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse extended passive host information.\nServer Reply: ").append(s).toString());
        }
        try
        {
            i = Integer.parseInt(s.substring(3, s.length() - 1));
        }
        catch (NumberFormatException numberformatexception)
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse extended passive host information.\nServer Reply: ").append(s).toString());
        }
        __passiveHost = getRemoteAddress().getHostAddress();
        __passivePort = i;
    }

    protected void _parsePassiveModeReply(String s)
        throws MalformedServerReplyException
    {
        Object obj = __PARMS_PAT.matcher(s);
        if (!((Matcher) (obj)).find())
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse passive host information.\nServer Reply: ").append(s).toString());
        }
        __passiveHost = ((Matcher) (obj)).group(1).replace(',', '.');
        try
        {
            __passivePort = Integer.parseInt(((Matcher) (obj)).group(2)) << 8 | Integer.parseInt(((Matcher) (obj)).group(3));
        }
        catch (NumberFormatException numberformatexception)
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse passive port information.\nServer Reply: ").append(s).toString());
        }
        if (!__passiveNatWorkaround)
        {
            break MISSING_BLOCK_LABEL_169;
        }
        if (InetAddress.getByName(__passiveHost).isSiteLocalAddress())
        {
            obj = getRemoteAddress();
            if (!((InetAddress) (obj)).isSiteLocalAddress())
            {
                obj = ((InetAddress) (obj)).getHostAddress();
                fireReplyReceived(0, (new StringBuilder()).append("[Replacing site local address ").append(__passiveHost).append(" with ").append(((String) (obj))).append("]\n").toString());
                __passiveHost = ((String) (obj));
            }
        }
        return;
        UnknownHostException unknownhostexception;
        unknownhostexception;
        throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse passive host information.\nServer Reply: ").append(s).toString());
    }

    protected boolean _retrieveFile(String s, String s1, OutputStream outputstream)
        throws IOException
    {
        Socket socket;
        socket = _openDataConnection_(s, s1);
        if (socket == null)
        {
            return false;
        }
        s1 = getBufferedInputStream(socket.getInputStream());
        s = s1;
        if (__fileType == 0)
        {
            s = new FromNetASCIIInputStream(s1);
        }
        s1 = null;
        if (__controlKeepAliveTimeout > 0L)
        {
            s1 = new CSL(this, __controlKeepAliveTimeout, __controlKeepAliveReplyTimeout);
        }
        Util.copyStream(s, outputstream, getBufferSize(), -1L, __mergeListeners(s1), false);
        Util.closeQuietly(s);
        Util.closeQuietly(socket);
        if (s1 != null)
        {
            s1.cleanUp();
        }
        return completePendingCommand();
        outputstream;
        Util.closeQuietly(s);
        Util.closeQuietly(socket);
        if (s1 != null)
        {
            s1.cleanUp();
        }
        throw outputstream;
    }

    protected InputStream _retrieveFileStream(String s, String s1)
        throws IOException
    {
        Socket socket = _openDataConnection_(s, s1);
        if (socket == null)
        {
            return null;
        }
        s1 = socket.getInputStream();
        s = s1;
        if (__fileType == 0)
        {
            s = new FromNetASCIIInputStream(getBufferedInputStream(s1));
        }
        return new SocketInputStream(socket, s);
    }

    protected boolean _storeFile(String s, String s1, InputStream inputstream)
        throws IOException
    {
        Socket socket = _openDataConnection_(s, s1);
        if (socket == null)
        {
            return false;
        }
        s1 = getBufferedOutputStream(socket.getOutputStream());
        s = s1;
        if (__fileType == 0)
        {
            s = new ToNetASCIIOutputStream(s1);
        }
        s1 = null;
        if (__controlKeepAliveTimeout > 0L)
        {
            s1 = new CSL(this, __controlKeepAliveTimeout, __controlKeepAliveReplyTimeout);
        }
        try
        {
            Util.copyStream(inputstream, s, getBufferSize(), -1L, __mergeListeners(s1), false);
        }
        // Misplaced declaration of an exception variable
        catch (String s)
        {
            Util.closeQuietly(socket);
            if (s1 != null)
            {
                s1.cleanUp();
            }
            throw s;
        }
        s.close();
        socket.close();
        if (s1 != null)
        {
            s1.cleanUp();
        }
        return completePendingCommand();
    }

    protected OutputStream _storeFileStream(String s, String s1)
        throws IOException
    {
        Socket socket = _openDataConnection_(s, s1);
        if (socket == null)
        {
            return null;
        }
        s1 = socket.getOutputStream();
        s = s1;
        if (__fileType == 0)
        {
            s = new ToNetASCIIOutputStream(getBufferedOutputStream(s1));
        }
        return new SocketOutputStream(socket, s);
    }

    public boolean abort()
        throws IOException
    {
        return FTPReply.isPositiveCompletion(abor());
    }

    public boolean allocate(int i)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(allo(i));
    }

    public boolean allocate(int i, int j)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(allo(i, j));
    }

    public boolean appendFile(String s, InputStream inputstream)
        throws IOException
    {
        return __storeFile(FTPCmd.APPE, s, inputstream);
    }

    public OutputStream appendFileStream(String s)
        throws IOException
    {
        return __storeFileStream(FTPCmd.APPE, s);
    }

    public boolean changeToParentDirectory()
        throws IOException
    {
        return FTPReply.isPositiveCompletion(cdup());
    }

    public boolean changeWorkingDirectory(String s)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(cwd(s));
    }

    public boolean completePendingCommand()
        throws IOException
    {
        return FTPReply.isPositiveCompletion(getReply());
    }

    public void configure(FTPClientConfig ftpclientconfig)
    {
        __configuration = ftpclientconfig;
    }

    public boolean deleteFile(String s)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(dele(s));
    }

    public void disconnect()
        throws IOException
    {
        super.disconnect();
        __initDefaults();
    }

    public boolean doCommand(String s, String s1)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(sendCommand(s, s1));
    }

    public String[] doCommandAsStrings(String s, String s1)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(sendCommand(s, s1)))
        {
            return getReplyStrings();
        } else
        {
            return null;
        }
    }

    public void enterLocalActiveMode()
    {
        __dataConnectionMode = 0;
        __passiveHost = null;
        __passivePort = -1;
    }

    public void enterLocalPassiveMode()
    {
        __dataConnectionMode = 2;
        __passiveHost = null;
        __passivePort = -1;
    }

    public boolean enterRemoteActiveMode(InetAddress inetaddress, int i)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(port(inetaddress, i)))
        {
            __dataConnectionMode = 1;
            __passiveHost = null;
            __passivePort = -1;
            return true;
        } else
        {
            return false;
        }
    }

    public boolean enterRemotePassiveMode()
        throws IOException
    {
        if (pasv() != 227)
        {
            return false;
        } else
        {
            __dataConnectionMode = 3;
            _parsePassiveModeReply((String)_replyLines.get(0));
            return true;
        }
    }

    public String featureValue(String s)
        throws IOException
    {
        s = featureValues(s);
        if (s != null)
        {
            return s[0];
        } else
        {
            return null;
        }
    }

    public String[] featureValues(String s)
        throws IOException
    {
        if (initFeatureMap())
        {
            if ((s = (Set)__featuresMap.get(s.toUpperCase(Locale.ENGLISH))) != null)
            {
                return (String[])s.toArray(new String[s.size()]);
            }
        }
        return null;
    }

    public boolean features()
        throws IOException
    {
        return FTPReply.isPositiveCompletion(feat());
    }

    public boolean getAutodetectUTF8()
    {
        return __autodetectEncoding;
    }

    public int getBufferSize()
    {
        return __bufferSize;
    }

    public int getControlKeepAliveReplyTimeout()
    {
        return __controlKeepAliveReplyTimeout;
    }

    public long getControlKeepAliveTimeout()
    {
        return __controlKeepAliveTimeout / 1000L;
    }

    public CopyStreamListener getCopyStreamListener()
    {
        return __copyStreamListener;
    }

    public int getDataConnectionMode()
    {
        return __dataConnectionMode;
    }

    protected String getListArguments(String s)
    {
label0:
        {
            Object obj = s;
            if (getListHiddenFiles())
            {
                if (s == null)
                {
                    break label0;
                }
                obj = new StringBuilder(s.length() + 3);
                ((StringBuilder) (obj)).append("-a ");
                ((StringBuilder) (obj)).append(s);
                obj = ((StringBuilder) (obj)).toString();
            }
            return ((String) (obj));
        }
        return "-a";
    }

    public boolean getListHiddenFiles()
    {
        return __listHiddenFiles;
    }

    public String getModificationTime(String s)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(mdtm(s)))
        {
            return getReplyString();
        } else
        {
            return null;
        }
    }

    public String getPassiveHost()
    {
        return __passiveHost;
    }

    public InetAddress getPassiveLocalIPAddress()
    {
        return __passiveLocalHost;
    }

    public int getPassivePort()
    {
        return __passivePort;
    }

    public int getReceiveDataSocketBufferSize()
    {
        return __receiveDataSocketBufferSize;
    }

    public long getRestartOffset()
    {
        return __restartOffset;
    }

    public int getSendDataSocketBufferSize()
    {
        return __sendDataSocketBufferSize;
    }

    public String getStatus()
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(stat()))
        {
            return getReplyString();
        } else
        {
            return null;
        }
    }

    public String getStatus(String s)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(stat(s)))
        {
            return getReplyString();
        } else
        {
            return null;
        }
    }

    public String getSystemName()
        throws IOException
    {
        if (__systemName == null && FTPReply.isPositiveCompletion(syst()))
        {
            __systemName = ((String)_replyLines.get(_replyLines.size() - 1)).substring(4);
        }
        return __systemName;
    }

    public String getSystemType()
        throws IOException
    {
        if (__systemName == null)
        {
            if (FTPReply.isPositiveCompletion(syst()))
            {
                __systemName = ((String)_replyLines.get(_replyLines.size() - 1)).substring(4);
            } else
            {
                String s = System.getProperty("org.apache.commons.net.ftp.systemType.default");
                if (s != null)
                {
                    __systemName = s;
                } else
                {
                    throw new IOException((new StringBuilder()).append("Unable to determine system type - response: ").append(getReplyString()).toString());
                }
            }
        }
        return __systemName;
    }

    public boolean hasFeature(String s)
        throws IOException
    {
        if (!initFeatureMap())
        {
            return false;
        } else
        {
            return __featuresMap.containsKey(s.toUpperCase(Locale.ENGLISH));
        }
    }

    public boolean hasFeature(String s, String s1)
        throws IOException
    {
        if (initFeatureMap())
        {
            if ((s = (Set)__featuresMap.get(s.toUpperCase(Locale.ENGLISH))) != null)
            {
                return s.contains(s1);
            }
        }
        return false;
    }

    public FTPListParseEngine initiateListParsing()
        throws IOException
    {
        return initiateListParsing((String)null);
    }

    public FTPListParseEngine initiateListParsing(String s)
        throws IOException
    {
        return initiateListParsing((String)null, s);
    }

    public FTPListParseEngine initiateListParsing(String s, String s1)
        throws IOException
    {
        if (__entryParser == null || !__entryParserKey.equals(s))
        {
            if (s != null)
            {
                __entryParser = __parserFactory.createFileEntryParser(s);
                __entryParserKey = s;
            } else
            if (__configuration != null)
            {
                __entryParser = __parserFactory.createFileEntryParser(__configuration);
                __entryParserKey = __configuration.getServerSystemKey();
            } else
            {
                String s2 = System.getProperty("org.apache.commons.net.ftp.systemType");
                s = s2;
                if (s2 == null)
                {
                    String s3 = getSystemType();
                    Object obj = getOverrideProperties();
                    s = s3;
                    if (obj != null)
                    {
                        obj = ((Properties) (obj)).getProperty(s3);
                        s = s3;
                        if (obj != null)
                        {
                            s = ((String) (obj));
                        }
                    }
                }
                __entryParser = __parserFactory.createFileEntryParser(s);
                __entryParserKey = s;
            }
        }
        return initiateListParsing(__entryParser, s1);
    }

    public boolean isRemoteVerificationEnabled()
    {
        return __remoteVerificationEnabled;
    }

    public boolean isUseEPSVwithIPv4()
    {
        return __useEPSVwithIPv4;
    }

    public FTPFile[] listDirectories()
        throws IOException
    {
        return listDirectories((String)null);
    }

    public FTPFile[] listDirectories(String s)
        throws IOException
    {
        return listFiles(s, FTPFileFilters.DIRECTORIES);
    }

    public FTPFile[] listFiles()
        throws IOException
    {
        return listFiles((String)null);
    }

    public FTPFile[] listFiles(String s)
        throws IOException
    {
        return initiateListParsing((String)null, s).getFiles();
    }

    public FTPFile[] listFiles(String s, FTPFileFilter ftpfilefilter)
        throws IOException
    {
        return initiateListParsing((String)null, s).getFiles(ftpfilefilter);
    }

    public String listHelp()
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(help()))
        {
            return getReplyString();
        } else
        {
            return null;
        }
    }

    public String listHelp(String s)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(help(s)))
        {
            return getReplyString();
        } else
        {
            return null;
        }
    }

    public String[] listNames()
        throws IOException
    {
        return listNames(null);
    }

    public String[] listNames(String s)
        throws IOException
    {
        s = _openDataConnection_(FTPCmd.NLST, getListArguments(s));
        if (s != null)
        {
            BufferedReader bufferedreader = new BufferedReader(new InputStreamReader(s.getInputStream(), getControlEncoding()));
            ArrayList arraylist = new ArrayList();
            do
            {
                String s1 = bufferedreader.readLine();
                if (s1 == null)
                {
                    break;
                }
                arraylist.add(s1);
            } while (true);
            bufferedreader.close();
            s.close();
            if (completePendingCommand())
            {
                return (String[])arraylist.toArray(new String[arraylist.size()]);
            }
        }
        return null;
    }

    public boolean login(String s, String s1)
        throws IOException
    {
        user(s);
        if (FTPReply.isPositiveCompletion(_replyCode))
        {
            return true;
        }
        if (!FTPReply.isPositiveIntermediate(_replyCode))
        {
            return false;
        } else
        {
            return FTPReply.isPositiveCompletion(pass(s1));
        }
    }

    public boolean login(String s, String s1, String s2)
        throws IOException
    {
        user(s);
        if (!FTPReply.isPositiveCompletion(_replyCode))
        {
            if (!FTPReply.isPositiveIntermediate(_replyCode))
            {
                return false;
            }
            pass(s1);
            if (!FTPReply.isPositiveCompletion(_replyCode))
            {
                if (!FTPReply.isPositiveIntermediate(_replyCode))
                {
                    return false;
                } else
                {
                    return FTPReply.isPositiveCompletion(acct(s2));
                }
            }
        }
        return true;
    }

    public boolean logout()
        throws IOException
    {
        return FTPReply.isPositiveCompletion(quit());
    }

    public boolean makeDirectory(String s)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(mkd(s));
    }

    public FTPFile[] mlistDir()
        throws IOException
    {
        return mlistDir(null);
    }

    public FTPFile[] mlistDir(String s)
        throws IOException
    {
        return initiateMListParsing(s).getFiles();
    }

    public FTPFile[] mlistDir(String s, FTPFileFilter ftpfilefilter)
        throws IOException
    {
        return initiateMListParsing(s).getFiles(ftpfilefilter);
    }

    public FTPFile mlistFile(String s)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(sendCommand(FTPCmd.MLST, s)))
        {
            return MLSxEntryParser.parseEntry(getReplyStrings()[1].substring(1));
        } else
        {
            return null;
        }
    }

    public String printWorkingDirectory()
        throws IOException
    {
        if (pwd() != 257)
        {
            return null;
        } else
        {
            return __parsePathname((String)_replyLines.get(_replyLines.size() - 1));
        }
    }

    boolean reinitialize()
        throws IOException
    {
        rein();
        if (FTPReply.isPositiveCompletion(_replyCode) || FTPReply.isPositivePreliminary(_replyCode) && FTPReply.isPositiveCompletion(getReply()))
        {
            __initDefaults();
            return true;
        } else
        {
            return false;
        }
    }

    public boolean remoteAppend(String s)
        throws IOException
    {
        if (__dataConnectionMode == 1 || __dataConnectionMode == 3)
        {
            return FTPReply.isPositivePreliminary(appe(s));
        } else
        {
            return false;
        }
    }

    public boolean remoteRetrieve(String s)
        throws IOException
    {
        if (__dataConnectionMode == 1 || __dataConnectionMode == 3)
        {
            return FTPReply.isPositivePreliminary(retr(s));
        } else
        {
            return false;
        }
    }

    public boolean remoteStore(String s)
        throws IOException
    {
        if (__dataConnectionMode == 1 || __dataConnectionMode == 3)
        {
            return FTPReply.isPositivePreliminary(stor(s));
        } else
        {
            return false;
        }
    }

    public boolean remoteStoreUnique()
        throws IOException
    {
        if (__dataConnectionMode == 1 || __dataConnectionMode == 3)
        {
            return FTPReply.isPositivePreliminary(stou());
        } else
        {
            return false;
        }
    }

    public boolean remoteStoreUnique(String s)
        throws IOException
    {
        if (__dataConnectionMode == 1 || __dataConnectionMode == 3)
        {
            return FTPReply.isPositivePreliminary(stou(s));
        } else
        {
            return false;
        }
    }

    public boolean removeDirectory(String s)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(rmd(s));
    }

    public boolean rename(String s, String s1)
        throws IOException
    {
        if (!FTPReply.isPositiveIntermediate(rnfr(s)))
        {
            return false;
        } else
        {
            return FTPReply.isPositiveCompletion(rnto(s1));
        }
    }

    protected boolean restart(long l)
        throws IOException
    {
        __restartOffset = 0L;
        return FTPReply.isPositiveIntermediate(rest(Long.toString(l)));
    }

    public boolean retrieveFile(String s, OutputStream outputstream)
        throws IOException
    {
        return _retrieveFile(FTPCmd.RETR.getCommand(), s, outputstream);
    }

    public InputStream retrieveFileStream(String s)
        throws IOException
    {
        return _retrieveFileStream(FTPCmd.RETR.getCommand(), s);
    }

    public boolean sendNoOp()
        throws IOException
    {
        return FTPReply.isPositiveCompletion(noop());
    }

    public boolean sendSiteCommand(String s)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(site(s));
    }

    public void setActiveExternalIPAddress(String s)
        throws UnknownHostException
    {
        __activeExternalHost = InetAddress.getByName(s);
    }

    public void setActivePortRange(int i, int j)
    {
        __activeMinPort = i;
        __activeMaxPort = j;
    }

    public void setAutodetectUTF8(boolean flag)
    {
        __autodetectEncoding = flag;
    }

    public void setBufferSize(int i)
    {
        __bufferSize = i;
    }

    public void setControlKeepAliveReplyTimeout(int i)
    {
        __controlKeepAliveReplyTimeout = i;
    }

    public void setControlKeepAliveTimeout(long l)
    {
        __controlKeepAliveTimeout = 1000L * l;
    }

    public void setCopyStreamListener(CopyStreamListener copystreamlistener)
    {
        __copyStreamListener = copystreamlistener;
    }

    public void setDataTimeout(int i)
    {
        __dataTimeout = i;
    }

    public boolean setFileStructure(int i)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(stru(i)))
        {
            __fileStructure = i;
            return true;
        } else
        {
            return false;
        }
    }

    public boolean setFileTransferMode(int i)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(mode(i)))
        {
            __fileTransferMode = i;
            return true;
        } else
        {
            return false;
        }
    }

    public boolean setFileType(int i)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(type(i)))
        {
            __fileType = i;
            __fileFormat = 4;
            return true;
        } else
        {
            return false;
        }
    }

    public boolean setFileType(int i, int j)
        throws IOException
    {
        if (FTPReply.isPositiveCompletion(type(i, j)))
        {
            __fileType = i;
            __fileFormat = j;
            return true;
        } else
        {
            return false;
        }
    }

    public void setListHiddenFiles(boolean flag)
    {
        __listHiddenFiles = flag;
    }

    public boolean setModificationTime(String s, String s1)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(mfmt(s, s1));
    }

    public void setParserFactory(FTPFileEntryParserFactory ftpfileentryparserfactory)
    {
        __parserFactory = ftpfileentryparserfactory;
    }

    public void setPassiveLocalIPAddress(String s)
        throws UnknownHostException
    {
        __passiveLocalHost = InetAddress.getByName(s);
    }

    public void setPassiveLocalIPAddress(InetAddress inetaddress)
    {
        __passiveLocalHost = inetaddress;
    }

    public void setPassiveNatWorkaround(boolean flag)
    {
        __passiveNatWorkaround = flag;
    }

    public void setReceieveDataSocketBufferSize(int i)
    {
        __receiveDataSocketBufferSize = i;
    }

    public void setRemoteVerificationEnabled(boolean flag)
    {
        __remoteVerificationEnabled = flag;
    }

    public void setReportActiveExternalIPAddress(String s)
        throws UnknownHostException
    {
        __reportActiveExternalHost = InetAddress.getByName(s);
    }

    public void setRestartOffset(long l)
    {
        if (l >= 0L)
        {
            __restartOffset = l;
        }
    }

    public void setSendDataSocketBufferSize(int i)
    {
        __sendDataSocketBufferSize = i;
    }

    public void setUseEPSVwithIPv4(boolean flag)
    {
        __useEPSVwithIPv4 = flag;
    }

    public boolean storeFile(String s, InputStream inputstream)
        throws IOException
    {
        return __storeFile(FTPCmd.STOR, s, inputstream);
    }

    public OutputStream storeFileStream(String s)
        throws IOException
    {
        return __storeFileStream(FTPCmd.STOR, s);
    }

    public boolean storeUniqueFile(InputStream inputstream)
        throws IOException
    {
        return __storeFile(FTPCmd.STOU, null, inputstream);
    }

    public boolean storeUniqueFile(String s, InputStream inputstream)
        throws IOException
    {
        return __storeFile(FTPCmd.STOU, s, inputstream);
    }

    public OutputStream storeUniqueFileStream()
        throws IOException
    {
        return __storeFileStream(FTPCmd.STOU, null);
    }

    public OutputStream storeUniqueFileStream(String s)
        throws IOException
    {
        return __storeFileStream(FTPCmd.STOU, s);
    }

    public boolean structureMount(String s)
        throws IOException
    {
        return FTPReply.isPositiveCompletion(smnt(s));
    }

}
