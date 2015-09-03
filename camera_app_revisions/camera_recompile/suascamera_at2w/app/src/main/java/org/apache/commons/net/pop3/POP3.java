// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.pop3;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.ProtocolCommandListener;
import org.apache.commons.net.ProtocolCommandSupport;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.CRLFLineReader;

// Referenced classes of package org.apache.commons.net.pop3:
//            POP3Command

public class POP3 extends SocketClient
{

    public static final int AUTHORIZATION_STATE = 0;
    public static final int DEFAULT_PORT = 110;
    public static final int DISCONNECTED_STATE = -1;
    public static final int TRANSACTION_STATE = 1;
    public static final int UPDATE_STATE = 2;
    static final String _DEFAULT_ENCODING = "ISO-8859-1";
    static final String _ERROR = "-ERR";
    static final String _OK = "+OK";
    static final String _OK_INT = "+ ";
    private int __popState;
    protected ProtocolCommandSupport _commandSupport_;
    String _lastReplyLine;
    BufferedReader _reader;
    int _replyCode;
    List _replyLines;
    BufferedWriter _writer;

    public POP3()
    {
        setDefaultPort(110);
        __popState = -1;
        _reader = null;
        _writer = null;
        _replyLines = new ArrayList();
        _commandSupport_ = new ProtocolCommandSupport(this);
    }

    private void __getReply()
        throws IOException
    {
        _replyLines.clear();
        String s = _reader.readLine();
        if (s == null)
        {
            throw new EOFException("Connection closed without indication.");
        }
        if (s.startsWith("+OK"))
        {
            _replyCode = 0;
        } else
        if (s.startsWith("-ERR"))
        {
            _replyCode = 1;
        } else
        if (s.startsWith("+ "))
        {
            _replyCode = 2;
        } else
        {
            throw new MalformedServerReplyException((new StringBuilder()).append("Received invalid POP3 protocol response from server.").append(s).toString());
        }
        _replyLines.add(s);
        _lastReplyLine = s;
        fireReplyReceived(_replyCode, getReplyString());
    }

    protected void _connectAction_()
        throws IOException
    {
        super._connectAction_();
        _reader = new CRLFLineReader(new InputStreamReader(_input_, "ISO-8859-1"));
        _writer = new BufferedWriter(new OutputStreamWriter(_output_, "ISO-8859-1"));
        __getReply();
        setState(0);
    }

    public void disconnect()
        throws IOException
    {
        super.disconnect();
        _reader = null;
        _writer = null;
        _lastReplyLine = null;
        _replyLines.clear();
        setState(-1);
    }

    public void getAdditionalReply()
        throws IOException
    {
        String s = _reader.readLine();
        do
        {
label0:
            {
                if (s != null)
                {
                    _replyLines.add(s);
                    if (!s.equals("."))
                    {
                        break label0;
                    }
                }
                return;
            }
            s = _reader.readLine();
        } while (true);
    }

    protected ProtocolCommandSupport getCommandSupport()
    {
        return _commandSupport_;
    }

    public String getReplyString()
    {
        StringBuilder stringbuilder = new StringBuilder(256);
        for (Iterator iterator = _replyLines.iterator(); iterator.hasNext(); stringbuilder.append("\r\n"))
        {
            stringbuilder.append((String)iterator.next());
        }

        return stringbuilder.toString();
    }

    public String[] getReplyStrings()
    {
        return (String[])_replyLines.toArray(new String[_replyLines.size()]);
    }

    public int getState()
    {
        return __popState;
    }

    public void removeProtocolCommandistener(ProtocolCommandListener protocolcommandlistener)
    {
        removeProtocolCommandListener(protocolcommandlistener);
    }

    public int sendCommand(int i)
        throws IOException
    {
        return sendCommand(POP3Command._commands[i], null);
    }

    public int sendCommand(int i, String s)
        throws IOException
    {
        return sendCommand(POP3Command._commands[i], s);
    }

    public int sendCommand(String s)
        throws IOException
    {
        return sendCommand(s, null);
    }

    public int sendCommand(String s, String s1)
        throws IOException
    {
        if (_writer == null)
        {
            throw new IllegalStateException("Socket is not connected");
        }
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(s);
        if (s1 != null)
        {
            stringbuilder.append(' ');
            stringbuilder.append(s1);
        }
        stringbuilder.append("\r\n");
        s1 = stringbuilder.toString();
        _writer.write(s1);
        _writer.flush();
        fireCommandSent(s, s1);
        __getReply();
        return _replyCode;
    }

    public void setState(int i)
    {
        __popState = i;
    }
}
