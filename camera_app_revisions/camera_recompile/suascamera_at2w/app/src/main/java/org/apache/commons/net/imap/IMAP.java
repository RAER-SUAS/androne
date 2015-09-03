// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.CRLFLineReader;

// Referenced classes of package org.apache.commons.net.imap:
//            IMAPReply, IMAPCommand

public class IMAP extends SocketClient
{
    public static final class IMAPState extends Enum
    {

        private static final IMAPState $VALUES[];
        public static final IMAPState AUTH_STATE;
        public static final IMAPState DISCONNECTED_STATE;
        public static final IMAPState LOGOUT_STATE;
        public static final IMAPState NOT_AUTH_STATE;

        public static IMAPState valueOf(String s)
        {
            return (IMAPState)Enum.valueOf(org/apache/commons/net/imap/IMAP$IMAPState, s);
        }

        public static IMAPState[] values()
        {
            return (IMAPState[])$VALUES.clone();
        }

        static 
        {
            DISCONNECTED_STATE = new IMAPState("DISCONNECTED_STATE", 0);
            NOT_AUTH_STATE = new IMAPState("NOT_AUTH_STATE", 1);
            AUTH_STATE = new IMAPState("AUTH_STATE", 2);
            LOGOUT_STATE = new IMAPState("LOGOUT_STATE", 3);
            $VALUES = (new IMAPState[] {
                DISCONNECTED_STATE, NOT_AUTH_STATE, AUTH_STATE, LOGOUT_STATE
            });
        }

        private IMAPState(String s, int i)
        {
            super(s, i);
        }
    }


    public static final int DEFAULT_PORT = 143;
    protected static final String __DEFAULT_ENCODING = "ISO-8859-1";
    private IMAPState __state;
    protected BufferedWriter __writer;
    private final char _initialID[] = {
        'A', 'A', 'A', 'A'
    };
    protected BufferedReader _reader;
    private int _replyCode;
    private final List _replyLines = new ArrayList();

    public IMAP()
    {
        setDefaultPort(143);
        __state = IMAPState.DISCONNECTED_STATE;
        _reader = null;
        __writer = null;
        createCommandSupport();
    }

    private void __getReply()
        throws IOException
    {
        __getReply(true);
    }

    private void __getReply(boolean flag)
        throws IOException
    {
        _replyLines.clear();
        String s = _reader.readLine();
        if (s == null)
        {
            throw new EOFException("Connection closed without indication.");
        }
        _replyLines.add(s);
        if (flag)
        {
            for (; IMAPReply.isUntagged(s); _replyLines.add(s))
            {
                for (int i = IMAPReply.literalCount(s); i >= 0; i -= s.length() + 2)
                {
                    s = _reader.readLine();
                    if (s == null)
                    {
                        throw new EOFException("Connection closed without indication.");
                    }
                    _replyLines.add(s);
                }

                s = _reader.readLine();
                if (s == null)
                {
                    throw new EOFException("Connection closed without indication.");
                }
            }

            _replyCode = IMAPReply.getReplyCode(s);
        } else
        {
            _replyCode = IMAPReply.getUntaggedReplyCode(s);
        }
        fireReplyReceived(_replyCode, getReplyString());
    }

    private int sendCommandWithID(String s, String s1, String s2)
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder();
        if (s != null)
        {
            stringbuilder.append(s);
            stringbuilder.append(' ');
        }
        stringbuilder.append(s1);
        if (s2 != null)
        {
            stringbuilder.append(' ');
            stringbuilder.append(s2);
        }
        stringbuilder.append("\r\n");
        s = stringbuilder.toString();
        __writer.write(s);
        __writer.flush();
        fireCommandSent(s1, s);
        __getReply();
        return _replyCode;
    }

    protected void _connectAction_()
        throws IOException
    {
        super._connectAction_();
        _reader = new CRLFLineReader(new InputStreamReader(_input_, "ISO-8859-1"));
        __writer = new BufferedWriter(new OutputStreamWriter(_output_, "ISO-8859-1"));
        int i = getSoTimeout();
        if (i <= 0)
        {
            setSoTimeout(connectTimeout);
        }
        __getReply(false);
        if (i <= 0)
        {
            setSoTimeout(i);
        }
        setState(IMAPState.NOT_AUTH_STATE);
    }

    public void disconnect()
        throws IOException
    {
        super.disconnect();
        _reader = null;
        __writer = null;
        _replyLines.clear();
        setState(IMAPState.DISCONNECTED_STATE);
    }

    public boolean doCommand(IMAPCommand imapcommand)
        throws IOException
    {
        return IMAPReply.isSuccess(sendCommand(imapcommand));
    }

    public boolean doCommand(IMAPCommand imapcommand, String s)
        throws IOException
    {
        return IMAPReply.isSuccess(sendCommand(imapcommand, s));
    }

    protected String generateCommandID()
    {
        String s = new String(_initialID);
        boolean flag = true;
        int i = _initialID.length - 1;
        while (flag && i >= 0) 
        {
            if (_initialID[i] == 'Z')
            {
                _initialID[i] = 'A';
            } else
            {
                char ac[] = _initialID;
                ac[i] = (char)(ac[i] + 1);
                flag = false;
            }
            i--;
        }
        return s;
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

    public IMAPState getState()
    {
        return __state;
    }

    public int sendCommand(String s)
        throws IOException
    {
        return sendCommand(s, null);
    }

    public int sendCommand(String s, String s1)
        throws IOException
    {
        return sendCommandWithID(generateCommandID(), s, s1);
    }

    public int sendCommand(IMAPCommand imapcommand)
        throws IOException
    {
        return sendCommand(imapcommand, null);
    }

    public int sendCommand(IMAPCommand imapcommand, String s)
        throws IOException
    {
        return sendCommand(imapcommand.getIMAPCommand(), s);
    }

    public int sendData(String s)
        throws IOException
    {
        return sendCommandWithID(null, s, null);
    }

    protected void setState(IMAPState imapstate)
    {
        __state = imapstate;
    }
}
