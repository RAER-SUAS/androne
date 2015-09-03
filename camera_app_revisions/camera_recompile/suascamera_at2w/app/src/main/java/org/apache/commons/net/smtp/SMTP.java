// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.smtp;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.ProtocolCommandListener;
import org.apache.commons.net.ProtocolCommandSupport;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.CRLFLineReader;

// Referenced classes of package org.apache.commons.net.smtp:
//            SMTPConnectionClosedException, SMTPCommand

public class SMTP extends SocketClient
{

    public static final int DEFAULT_PORT = 25;
    private static final String __DEFAULT_ENCODING = "ISO-8859-1";
    protected ProtocolCommandSupport _commandSupport_;
    private boolean _newReplyString;
    BufferedReader _reader;
    private int _replyCode;
    private final ArrayList _replyLines;
    private String _replyString;
    BufferedWriter _writer;
    protected final String encoding;

    public SMTP()
    {
        this("ISO-8859-1");
    }

    public SMTP(String s)
    {
        setDefaultPort(25);
        _replyLines = new ArrayList();
        _newReplyString = false;
        _replyString = null;
        _commandSupport_ = new ProtocolCommandSupport(this);
        encoding = s;
    }

    private void __getReply()
        throws IOException
    {
        _newReplyString = true;
        _replyLines.clear();
        String s = _reader.readLine();
        if (s == null)
        {
            throw new SMTPConnectionClosedException("Connection closed without indication.");
        }
        int i = s.length();
        if (i < 3)
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Truncated server reply: ").append(s).toString());
        }
        try
        {
            _replyCode = Integer.parseInt(s.substring(0, 3));
        }
        catch (NumberFormatException numberformatexception)
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse response code.\nServer Reply: ").append(s).toString());
        }
        _replyLines.add(s);
        if (i > 3 && s.charAt(3) == '-')
        {
            do
            {
                s = _reader.readLine();
                if (s == null)
                {
                    throw new SMTPConnectionClosedException("Connection closed without indication.");
                }
                _replyLines.add(s);
            } while (s.length() < 4 || s.charAt(3) == '-' || !Character.isDigit(s.charAt(0)));
        }
        fireReplyReceived(_replyCode, getReplyString());
        if (_replyCode == 421)
        {
            throw new SMTPConnectionClosedException("SMTP response 421 received.  Server closed connection.");
        } else
        {
            return;
        }
    }

    private int __sendCommand(int i, String s, boolean flag)
        throws IOException
    {
        return __sendCommand(SMTPCommand.getCommand(i), s, flag);
    }

    private int __sendCommand(String s, String s1, boolean flag)
        throws IOException
    {
        Object obj = new StringBuilder();
        ((StringBuilder) (obj)).append(s);
        if (s1 != null)
        {
            if (flag)
            {
                ((StringBuilder) (obj)).append(' ');
            }
            ((StringBuilder) (obj)).append(s1);
        }
        ((StringBuilder) (obj)).append("\r\n");
        s1 = _writer;
        obj = ((StringBuilder) (obj)).toString();
        s1.write(((String) (obj)));
        _writer.flush();
        fireCommandSent(s, ((String) (obj)));
        __getReply();
        return _replyCode;
    }

    protected void _connectAction_()
        throws IOException
    {
        super._connectAction_();
        _reader = new CRLFLineReader(new InputStreamReader(_input_, encoding));
        _writer = new BufferedWriter(new OutputStreamWriter(_output_, encoding));
        __getReply();
    }

    public int data()
        throws IOException
    {
        return sendCommand(3);
    }

    public void disconnect()
        throws IOException
    {
        super.disconnect();
        _reader = null;
        _writer = null;
        _replyString = null;
        _replyLines.clear();
        _newReplyString = false;
    }

    public int expn(String s)
        throws IOException
    {
        return sendCommand(9, s);
    }

    protected ProtocolCommandSupport getCommandSupport()
    {
        return _commandSupport_;
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
        Object obj = new StringBuilder();
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

    public int helo(String s)
        throws IOException
    {
        return sendCommand(0, s);
    }

    public int help()
        throws IOException
    {
        return sendCommand(10);
    }

    public int help(String s)
        throws IOException
    {
        return sendCommand(10, s);
    }

    public int mail(String s)
        throws IOException
    {
        return __sendCommand(1, s, false);
    }

    public int noop()
        throws IOException
    {
        return sendCommand(11);
    }

    public int quit()
        throws IOException
    {
        return sendCommand(13);
    }

    public int rcpt(String s)
        throws IOException
    {
        return __sendCommand(2, s, false);
    }

    public void removeProtocolCommandistener(ProtocolCommandListener protocolcommandlistener)
    {
        removeProtocolCommandListener(protocolcommandlistener);
    }

    public int rset()
        throws IOException
    {
        return sendCommand(7);
    }

    public int saml(String s)
        throws IOException
    {
        return sendCommand(6, s);
    }

    public int send(String s)
        throws IOException
    {
        return sendCommand(4, s);
    }

    public int sendCommand(int i)
        throws IOException
    {
        return sendCommand(i, null);
    }

    public int sendCommand(int i, String s)
        throws IOException
    {
        return sendCommand(SMTPCommand.getCommand(i), s);
    }

    public int sendCommand(String s)
        throws IOException
    {
        return sendCommand(s, null);
    }

    public int sendCommand(String s, String s1)
        throws IOException
    {
        return __sendCommand(s, s1, true);
    }

    public int soml(String s)
        throws IOException
    {
        return sendCommand(5, s);
    }

    public int turn()
        throws IOException
    {
        return sendCommand(12);
    }

    public int vrfy(String s)
        throws IOException
    {
        return sendCommand(8, s);
    }
}
