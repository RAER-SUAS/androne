// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.ProtocolCommandSupport;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.CRLFLineReader;

// Referenced classes of package org.apache.commons.net.nntp:
//            NNTPConnectionClosedException, NNTPCommand

public class NNTP extends SocketClient
{

    public static final int DEFAULT_PORT = 119;
    private static final String __DEFAULT_ENCODING = "ISO-8859-1";
    protected ProtocolCommandSupport _commandSupport_;
    boolean _isAllowedToPost;
    protected BufferedReader _reader_;
    int _replyCode;
    String _replyString;
    protected BufferedWriter _writer_;

    public NNTP()
    {
        setDefaultPort(119);
        _replyString = null;
        _reader_ = null;
        _writer_ = null;
        _isAllowedToPost = false;
        _commandSupport_ = new ProtocolCommandSupport(this);
    }

    private void __getReply()
        throws IOException
    {
        _replyString = _reader_.readLine();
        if (_replyString == null)
        {
            throw new NNTPConnectionClosedException("Connection closed without indication.");
        }
        if (_replyString.length() < 3)
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Truncated server reply: ").append(_replyString).toString());
        }
        try
        {
            _replyCode = Integer.parseInt(_replyString.substring(0, 3));
        }
        catch (NumberFormatException numberformatexception)
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse response code.\nServer Reply: ").append(_replyString).toString());
        }
        fireReplyReceived(_replyCode, (new StringBuilder()).append(_replyString).append("\r\n").toString());
        if (_replyCode == 400)
        {
            throw new NNTPConnectionClosedException("NNTP response 400 received.  Server closed connection.");
        } else
        {
            return;
        }
    }

    protected void _connectAction_()
        throws IOException
    {
        super._connectAction_();
        _reader_ = new CRLFLineReader(new InputStreamReader(_input_, "ISO-8859-1"));
        _writer_ = new BufferedWriter(new OutputStreamWriter(_output_, "ISO-8859-1"));
        __getReply();
        boolean flag;
        if (_replyCode == 200)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        _isAllowedToPost = flag;
    }

    public int article()
        throws IOException
    {
        return sendCommand(0);
    }

    public int article(int i)
        throws IOException
    {
        return article(i);
    }

    public int article(long l)
        throws IOException
    {
        return sendCommand(0, Long.toString(l));
    }

    public int article(String s)
        throws IOException
    {
        return sendCommand(0, s);
    }

    public int authinfoPass(String s)
        throws IOException
    {
        return sendCommand(15, (new StringBuilder()).append("PASS ").append(s).toString());
    }

    public int authinfoUser(String s)
        throws IOException
    {
        return sendCommand(15, (new StringBuilder()).append("USER ").append(s).toString());
    }

    public int body()
        throws IOException
    {
        return sendCommand(1);
    }

    public int body(int i)
        throws IOException
    {
        return body(i);
    }

    public int body(long l)
        throws IOException
    {
        return sendCommand(1, Long.toString(l));
    }

    public int body(String s)
        throws IOException
    {
        return sendCommand(1, s);
    }

    public void disconnect()
        throws IOException
    {
        super.disconnect();
        _reader_ = null;
        _writer_ = null;
        _replyString = null;
        _isAllowedToPost = false;
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
        return _replyString;
    }

    public int group(String s)
        throws IOException
    {
        return sendCommand(2, s);
    }

    public int head()
        throws IOException
    {
        return sendCommand(3);
    }

    public int head(int i)
        throws IOException
    {
        return head(i);
    }

    public int head(long l)
        throws IOException
    {
        return sendCommand(3, Long.toString(l));
    }

    public int head(String s)
        throws IOException
    {
        return sendCommand(3, s);
    }

    public int help()
        throws IOException
    {
        return sendCommand(4);
    }

    public int ihave(String s)
        throws IOException
    {
        return sendCommand(5, s);
    }

    public boolean isAllowedToPost()
    {
        return _isAllowedToPost;
    }

    public int last()
        throws IOException
    {
        return sendCommand(6);
    }

    public int list()
        throws IOException
    {
        return sendCommand(7);
    }

    public int listActive(String s)
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder("ACTIVE ");
        stringbuilder.append(s);
        return sendCommand(7, stringbuilder.toString());
    }

    public int newgroups(String s, String s1, boolean flag, String s2)
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(s);
        stringbuilder.append(' ');
        stringbuilder.append(s1);
        if (flag)
        {
            stringbuilder.append(' ');
            stringbuilder.append("GMT");
        }
        if (s2 != null)
        {
            stringbuilder.append(" <");
            stringbuilder.append(s2);
            stringbuilder.append('>');
        }
        return sendCommand(8, stringbuilder.toString());
    }

    public int newnews(String s, String s1, String s2, boolean flag, String s3)
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(s);
        stringbuilder.append(' ');
        stringbuilder.append(s1);
        stringbuilder.append(' ');
        stringbuilder.append(s2);
        if (flag)
        {
            stringbuilder.append(' ');
            stringbuilder.append("GMT");
        }
        if (s3 != null)
        {
            stringbuilder.append(" <");
            stringbuilder.append(s3);
            stringbuilder.append('>');
        }
        return sendCommand(9, stringbuilder.toString());
    }

    public int next()
        throws IOException
    {
        return sendCommand(10);
    }

    public int post()
        throws IOException
    {
        return sendCommand(11);
    }

    public int quit()
        throws IOException
    {
        return sendCommand(12);
    }

    public int sendCommand(int i)
        throws IOException
    {
        return sendCommand(i, null);
    }

    public int sendCommand(int i, String s)
        throws IOException
    {
        return sendCommand(NNTPCommand.getCommand(i), s);
    }

    public int sendCommand(String s)
        throws IOException
    {
        return sendCommand(s, null);
    }

    public int sendCommand(String s, String s1)
        throws IOException
    {
        Object obj = new StringBuilder();
        ((StringBuilder) (obj)).append(s);
        if (s1 != null)
        {
            ((StringBuilder) (obj)).append(' ');
            ((StringBuilder) (obj)).append(s1);
        }
        ((StringBuilder) (obj)).append("\r\n");
        s1 = _writer_;
        obj = ((StringBuilder) (obj)).toString();
        s1.write(((String) (obj)));
        _writer_.flush();
        fireCommandSent(s, ((String) (obj)));
        __getReply();
        return _replyCode;
    }

    public int stat()
        throws IOException
    {
        return sendCommand(14);
    }

    public int stat(int i)
        throws IOException
    {
        return stat(i);
    }

    public int stat(long l)
        throws IOException
    {
        return sendCommand(14, Long.toString(l));
    }

    public int stat(String s)
        throws IOException
    {
        return sendCommand(14, s);
    }

    public int xhdr(String s, String s1)
        throws IOException
    {
        s = new StringBuilder(s);
        s.append(" ");
        s.append(s1);
        return sendCommand(17, s.toString());
    }

    public int xover(String s)
        throws IOException
    {
        return sendCommand(16, s);
    }
}
