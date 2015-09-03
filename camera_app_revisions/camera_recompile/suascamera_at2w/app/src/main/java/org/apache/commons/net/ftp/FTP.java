// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.Socket;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.ProtocolCommandSupport;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.CRLFLineReader;

// Referenced classes of package org.apache.commons.net.ftp:
//            FTPConnectionClosedException, FTPCmd, FTPReply, FTPCommand

public class FTP extends SocketClient
{

    public static final int ASCII_FILE_TYPE = 0;
    public static final int BINARY_FILE_TYPE = 2;
    public static final int BLOCK_TRANSFER_MODE = 11;
    public static final int CARRIAGE_CONTROL_TEXT_FORMAT = 6;
    public static final int COMPRESSED_TRANSFER_MODE = 12;
    public static final String DEFAULT_CONTROL_ENCODING = "ISO-8859-1";
    public static final int DEFAULT_DATA_PORT = 20;
    public static final int DEFAULT_PORT = 21;
    public static final int EBCDIC_FILE_TYPE = 1;
    public static final int FILE_STRUCTURE = 7;
    public static final int LOCAL_FILE_TYPE = 3;
    public static final int NON_PRINT_TEXT_FORMAT = 4;
    public static final int PAGE_STRUCTURE = 9;
    public static final int RECORD_STRUCTURE = 8;
    public static final int REPLY_CODE_LEN = 3;
    public static final int STREAM_TRANSFER_MODE = 10;
    public static final int TELNET_TEXT_FORMAT = 5;
    private static final String __modes = "AEILNTCFRPSBC";
    protected ProtocolCommandSupport _commandSupport_;
    protected String _controlEncoding;
    protected BufferedReader _controlInput_;
    protected BufferedWriter _controlOutput_;
    protected boolean _newReplyString;
    protected int _replyCode;
    protected ArrayList _replyLines;
    protected String _replyString;
    protected boolean strictMultilineParsing;

    public FTP()
    {
        strictMultilineParsing = false;
        setDefaultPort(21);
        _replyLines = new ArrayList();
        _newReplyString = false;
        _replyString = null;
        _controlEncoding = "ISO-8859-1";
        _commandSupport_ = new ProtocolCommandSupport(this);
    }

    private String __buildMessage(String s, String s1)
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(s);
        if (s1 != null)
        {
            stringbuilder.append(' ');
            stringbuilder.append(s1);
        }
        stringbuilder.append("\r\n");
        return stringbuilder.toString();
    }

    private void __getReply()
        throws IOException
    {
        __getReply(true);
    }

    private void __getReply(boolean flag)
        throws IOException
    {
        _newReplyString = true;
        _replyLines.clear();
        String s = _controlInput_.readLine();
        if (s == null)
        {
            throw new FTPConnectionClosedException("Connection closed without indication.");
        }
        int i = s.length();
        if (i < 3)
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Truncated server reply: ").append(s).toString());
        }
        Object obj;
        try
        {
            obj = s.substring(0, 3);
            _replyCode = Integer.parseInt(((String) (obj)));
        }
        // Misplaced declaration of an exception variable
        catch (Object obj)
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse response code.\nServer Reply: ").append(s).toString());
        }
        _replyLines.add(s);
        if (i > 3 && s.charAt(3) == '-')
        {
            do
            {
                s = _controlInput_.readLine();
                if (s == null)
                {
                    throw new FTPConnectionClosedException("Connection closed without indication.");
                }
                _replyLines.add(s);
            } while (isStrictMultilineParsing() ? __strictCheck(s, ((String) (obj))) : __lenientCheck(s));
        }
        fireReplyReceived(_replyCode, getReplyString());
        if (_replyCode == 421)
        {
            throw new FTPConnectionClosedException("FTP response 421 received.  Server closed connection.");
        } else
        {
            return;
        }
    }

    private boolean __lenientCheck(String s)
    {
        boolean flag = false;
        if (s.length() <= 3 || s.charAt(3) == '-' || !Character.isDigit(s.charAt(0)))
        {
            flag = true;
        }
        return flag;
    }

    private void __send(String s)
        throws IOException, FTPConnectionClosedException, SocketException
    {
        try
        {
            _controlOutput_.write(s);
            _controlOutput_.flush();
            return;
        }
        // Misplaced declaration of an exception variable
        catch (String s) { }
        if (!isConnected())
        {
            throw new FTPConnectionClosedException("Connection unexpectedly closed.");
        } else
        {
            throw s;
        }
    }

    private boolean __strictCheck(String s, String s1)
    {
        return !s.startsWith(s1) || s.charAt(3) != ' ';
    }

    protected void __getReplyNoReport()
        throws IOException
    {
        __getReply(false);
    }

    protected void __noop()
        throws IOException
    {
        __send(__buildMessage(FTPCmd.NOOP.getCommand(), null));
        __getReplyNoReport();
    }

    protected void _connectAction_()
        throws IOException
    {
        super._connectAction_();
        _controlInput_ = new CRLFLineReader(new InputStreamReader(_input_, getControlEncoding()));
        _controlOutput_ = new BufferedWriter(new OutputStreamWriter(_output_, getControlEncoding()));
        if (connectTimeout <= 0) goto _L2; else goto _L1
_L1:
        int i;
        i = _socket_.getSoTimeout();
        _socket_.setSoTimeout(connectTimeout);
        __getReply();
        if (FTPReply.isPositivePreliminary(_replyCode))
        {
            __getReply();
        }
        _socket_.setSoTimeout(i);
_L4:
        return;
        Object obj;
        obj;
        IOException ioexception = new IOException("Timed out waiting for initial connect reply");
        ioexception.initCause(((Throwable) (obj)));
        throw ioexception;
        obj;
        _socket_.setSoTimeout(i);
        throw obj;
_L2:
        __getReply();
        if (FTPReply.isPositivePreliminary(_replyCode))
        {
            __getReply();
            return;
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public int abor()
        throws IOException
    {
        return sendCommand(FTPCmd.ABOR);
    }

    public int acct(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.ACCT, s);
    }

    public int allo(int i)
        throws IOException
    {
        return sendCommand(FTPCmd.ALLO, Integer.toString(i));
    }

    public int allo(int i, int j)
        throws IOException
    {
        return sendCommand(FTPCmd.ALLO, (new StringBuilder()).append(Integer.toString(i)).append(" R ").append(Integer.toString(j)).toString());
    }

    public int appe(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.APPE, s);
    }

    public int cdup()
        throws IOException
    {
        return sendCommand(FTPCmd.CDUP);
    }

    public int cwd(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.CWD, s);
    }

    public int dele(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.DELE, s);
    }

    public void disconnect()
        throws IOException
    {
        super.disconnect();
        _controlInput_ = null;
        _controlOutput_ = null;
        _newReplyString = false;
        _replyString = null;
    }

    public int eprt(InetAddress inetaddress, int i)
        throws IOException
    {
        String s;
        StringBuilder stringbuilder;
        stringbuilder = new StringBuilder();
        String s1 = inetaddress.getHostAddress();
        int j = s1.indexOf("%");
        s = s1;
        if (j > 0)
        {
            s = s1.substring(0, j);
        }
        stringbuilder.append("|");
        if (!(inetaddress instanceof Inet4Address)) goto _L2; else goto _L1
_L1:
        stringbuilder.append("1");
_L4:
        stringbuilder.append("|");
        stringbuilder.append(s);
        stringbuilder.append("|");
        stringbuilder.append(i);
        stringbuilder.append("|");
        return sendCommand(FTPCmd.EPRT, stringbuilder.toString());
_L2:
        if (inetaddress instanceof Inet6Address)
        {
            stringbuilder.append("2");
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public int epsv()
        throws IOException
    {
        return sendCommand(FTPCmd.EPSV);
    }

    public int feat()
        throws IOException
    {
        return sendCommand(FTPCmd.FEAT);
    }

    protected ProtocolCommandSupport getCommandSupport()
    {
        return _commandSupport_;
    }

    public String getControlEncoding()
    {
        return _controlEncoding;
    }

    public int getReply()
        throws IOException
    {
        __getReply();
        return _replyCode;
    }

    public int getReplyCode()
    {
        return _replyCode;
    }

    public String getReplyString()
    {
        if (!_newReplyString)
        {
            return _replyString;
        }
        Object obj = new StringBuilder(256);
        for (Iterator iterator = _replyLines.iterator(); iterator.hasNext(); ((StringBuilder) (obj)).append("\r\n"))
        {
            ((StringBuilder) (obj)).append((String)iterator.next());
        }

        _newReplyString = false;
        obj = ((StringBuilder) (obj)).toString();
        _replyString = ((String) (obj));
        return ((String) (obj));
    }

    public String[] getReplyStrings()
    {
        return (String[])_replyLines.toArray(new String[_replyLines.size()]);
    }

    public int help()
        throws IOException
    {
        return sendCommand(FTPCmd.HELP);
    }

    public int help(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.HELP, s);
    }

    public boolean isStrictMultilineParsing()
    {
        return strictMultilineParsing;
    }

    public int list()
        throws IOException
    {
        return sendCommand(FTPCmd.LIST);
    }

    public int list(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.LIST, s);
    }

    public int mdtm(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.MDTM, s);
    }

    public int mfmt(String s, String s1)
        throws IOException
    {
        return sendCommand(FTPCmd.MFMT, (new StringBuilder()).append(s1).append(" ").append(s).toString());
    }

    public int mkd(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.MKD, s);
    }

    public int mlsd()
        throws IOException
    {
        return sendCommand(FTPCmd.MLSD);
    }

    public int mlsd(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.MLSD, s);
    }

    public int mlst()
        throws IOException
    {
        return sendCommand(FTPCmd.MLST);
    }

    public int mlst(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.MLST, s);
    }

    public int mode(int i)
        throws IOException
    {
        return sendCommand(FTPCmd.MODE, "AEILNTCFRPSBC".substring(i, i + 1));
    }

    public int nlst()
        throws IOException
    {
        return sendCommand(FTPCmd.NLST);
    }

    public int nlst(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.NLST, s);
    }

    public int noop()
        throws IOException
    {
        return sendCommand(FTPCmd.NOOP);
    }

    public int pass(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.PASS, s);
    }

    public int pasv()
        throws IOException
    {
        return sendCommand(FTPCmd.PASV);
    }

    public int port(InetAddress inetaddress, int i)
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder(24);
        stringbuilder.append(inetaddress.getHostAddress().replace('.', ','));
        stringbuilder.append(',');
        stringbuilder.append(i >>> 8);
        stringbuilder.append(',');
        stringbuilder.append(i & 0xff);
        return sendCommand(FTPCmd.PORT, stringbuilder.toString());
    }

    public int pwd()
        throws IOException
    {
        return sendCommand(FTPCmd.PWD);
    }

    public int quit()
        throws IOException
    {
        return sendCommand(FTPCmd.QUIT);
    }

    public int rein()
        throws IOException
    {
        return sendCommand(FTPCmd.REIN);
    }

    public int rest(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.REST, s);
    }

    public int retr(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.RETR, s);
    }

    public int rmd(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.RMD, s);
    }

    public int rnfr(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.RNFR, s);
    }

    public int rnto(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.RNTO, s);
    }

    public int sendCommand(int i)
        throws IOException
    {
        return sendCommand(i, null);
    }

    public int sendCommand(int i, String s)
        throws IOException
    {
        return sendCommand(FTPCommand.getCommand(i), s);
    }

    public int sendCommand(String s)
        throws IOException
    {
        return sendCommand(s, null);
    }

    public int sendCommand(String s, String s1)
        throws IOException
    {
        if (_controlOutput_ == null)
        {
            throw new IOException("Connection is not open");
        } else
        {
            s1 = __buildMessage(s, s1);
            __send(s1);
            fireCommandSent(s, s1);
            __getReply();
            return _replyCode;
        }
    }

    public int sendCommand(FTPCmd ftpcmd)
        throws IOException
    {
        return sendCommand(ftpcmd, null);
    }

    public int sendCommand(FTPCmd ftpcmd, String s)
        throws IOException
    {
        return sendCommand(ftpcmd.getCommand(), s);
    }

    public void setControlEncoding(String s)
    {
        _controlEncoding = s;
    }

    public void setStrictMultilineParsing(boolean flag)
    {
        strictMultilineParsing = flag;
    }

    public int site(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.SITE, s);
    }

    public int smnt(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.SMNT, s);
    }

    public int stat()
        throws IOException
    {
        return sendCommand(FTPCmd.STAT);
    }

    public int stat(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.STAT, s);
    }

    public int stor(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.STOR, s);
    }

    public int stou()
        throws IOException
    {
        return sendCommand(FTPCmd.STOU);
    }

    public int stou(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.STOU, s);
    }

    public int stru(int i)
        throws IOException
    {
        return sendCommand(FTPCmd.STRU, "AEILNTCFRPSBC".substring(i, i + 1));
    }

    public int syst()
        throws IOException
    {
        return sendCommand(FTPCmd.SYST);
    }

    public int type(int i)
        throws IOException
    {
        return sendCommand(FTPCmd.TYPE, "AEILNTCFRPSBC".substring(i, i + 1));
    }

    public int type(int i, int j)
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("AEILNTCFRPSBC".charAt(i));
        stringbuilder.append(' ');
        if (i == 3)
        {
            stringbuilder.append(j);
        } else
        {
            stringbuilder.append("AEILNTCFRPSBC".charAt(j));
        }
        return sendCommand(FTPCmd.TYPE, stringbuilder.toString());
    }

    public int user(String s)
        throws IOException
    {
        return sendCommand(FTPCmd.USER, s);
    }
}
