// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.telnet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.net.SocketClient;

// Referenced classes of package org.apache.commons.net.telnet:
//            TelnetOptionHandler, TelnetNotificationHandler, InvalidTelnetOptionException, TelnetOption

class Telnet extends SocketClient
{

    static final int DEFAULT_PORT = 23;
    protected static final int TERMINAL_TYPE = 24;
    protected static final int TERMINAL_TYPE_IS = 0;
    protected static final int TERMINAL_TYPE_SEND = 1;
    static final byte _COMMAND_AYT[] = {
        -1, -10
    };
    static final byte _COMMAND_DO[] = {
        -1, -3
    };
    static final byte _COMMAND_DONT[] = {
        -1, -2
    };
    static final byte _COMMAND_IS[] = {
        24, 0
    };
    static final byte _COMMAND_SB[] = {
        -1, -6
    };
    static final byte _COMMAND_SE[] = {
        -1, -16
    };
    static final byte _COMMAND_WILL[] = {
        -1, -5
    };
    static final byte _COMMAND_WONT[] = {
        -1, -4
    };
    static final int _DO_MASK = 2;
    static final int _REQUESTED_DO_MASK = 8;
    static final int _REQUESTED_WILL_MASK = 4;
    static final int _WILL_MASK = 1;
    static final boolean debug = false;
    static final boolean debugoptions = false;
    private TelnetNotificationHandler __notifhand;
    int _doResponse[];
    int _options[];
    int _willResponse[];
    private volatile boolean aytFlag;
    private final Object aytMonitor;
    private final TelnetOptionHandler optionHandlers[];
    private volatile OutputStream spyStream;
    private String terminalType;

    Telnet()
    {
        terminalType = null;
        aytMonitor = new Object();
        aytFlag = true;
        spyStream = null;
        __notifhand = null;
        setDefaultPort(23);
        _doResponse = new int[256];
        _willResponse = new int[256];
        _options = new int[256];
        optionHandlers = new TelnetOptionHandler[256];
    }

    Telnet(String s)
    {
        terminalType = null;
        aytMonitor = new Object();
        aytFlag = true;
        spyStream = null;
        __notifhand = null;
        setDefaultPort(23);
        _doResponse = new int[256];
        _willResponse = new int[256];
        _options = new int[256];
        terminalType = s;
        optionHandlers = new TelnetOptionHandler[256];
    }

    protected void _connectAction_()
        throws IOException
    {
        for (int i = 0; i < 256; i++)
        {
            _doResponse[i] = 0;
            _willResponse[i] = 0;
            _options[i] = 0;
            if (optionHandlers[i] != null)
            {
                optionHandlers[i].setDo(false);
                optionHandlers[i].setWill(false);
            }
        }

        super._connectAction_();
        _input_ = new BufferedInputStream(_input_);
        _output_ = new BufferedOutputStream(_output_);
        for (int j = 0; j < 256; j++)
        {
            if (optionHandlers[j] == null)
            {
                continue;
            }
            if (optionHandlers[j].getInitLocal())
            {
                _requestWill(optionHandlers[j].getOptionCode());
            }
            if (optionHandlers[j].getInitRemote())
            {
                _requestDo(optionHandlers[j].getOptionCode());
            }
        }

    }

    final void _processAYTResponse()
    {
        this;
        JVM INSTR monitorenter ;
        if (!aytFlag)
        {
            synchronized (aytMonitor)
            {
                aytFlag = true;
                aytMonitor.notifyAll();
            }
        }
        this;
        JVM INSTR monitorexit ;
        return;
        exception1;
        obj;
        JVM INSTR monitorexit ;
        throw exception1;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void _processCommand(int i)
    {
        if (__notifhand != null)
        {
            __notifhand.receivedNegotiation(5, i);
        }
    }

    void _processDo(int i)
        throws IOException
    {
        if (__notifhand != null)
        {
            __notifhand.receivedNegotiation(1, i);
        }
        boolean flag1 = false;
        boolean flag;
        if (optionHandlers[i] != null)
        {
            flag = optionHandlers[i].getAcceptLocal();
        } else
        {
            flag = flag1;
            if (i == 24)
            {
                flag = flag1;
                if (terminalType != null)
                {
                    flag = flag1;
                    if (terminalType.length() > 0)
                    {
                        flag = true;
                    }
                }
            }
        }
        if (_willResponse[i] > 0)
        {
            int ai[] = _willResponse;
            ai[i] = ai[i] - 1;
            if (_willResponse[i] > 0 && _stateIsWill(i))
            {
                int ai1[] = _willResponse;
                ai1[i] = ai1[i] - 1;
            }
        }
        if (_willResponse[i] == 0 && _requestedWont(i))
        {
            if (flag)
            {
                _setWantWill(i);
                _sendWill(i);
            } else
            {
                int ai2[] = _willResponse;
                ai2[i] = ai2[i] + 1;
                _sendWont(i);
            }
        }
        _setWill(i);
    }

    void _processDont(int i)
        throws IOException
    {
        if (__notifhand != null)
        {
            __notifhand.receivedNegotiation(2, i);
        }
        if (_willResponse[i] > 0)
        {
            int ai[] = _willResponse;
            ai[i] = ai[i] - 1;
            if (_willResponse[i] > 0 && _stateIsWont(i))
            {
                int ai1[] = _willResponse;
                ai1[i] = ai1[i] - 1;
            }
        }
        if (_willResponse[i] == 0 && _requestedWill(i))
        {
            if (_stateIsWill(i) || _requestedWill(i))
            {
                _sendWont(i);
            }
            _setWantWont(i);
        }
        _setWont(i);
    }

    void _processSuboption(int ai[], int i)
        throws IOException
    {
        if (i > 0)
        {
            if (optionHandlers[ai[0]] != null)
            {
                _sendSubnegotiation(optionHandlers[ai[0]].answerSubnegotiation(ai, i));
            } else
            if (i > 1 && ai[0] == 24 && ai[1] == 1)
            {
                _sendTerminalType();
                return;
            }
        }
    }

    void _processWill(int i)
        throws IOException
    {
        if (__notifhand != null)
        {
            __notifhand.receivedNegotiation(3, i);
        }
        boolean flag = false;
        if (optionHandlers[i] != null)
        {
            flag = optionHandlers[i].getAcceptRemote();
        }
        if (_doResponse[i] > 0)
        {
            int ai[] = _doResponse;
            ai[i] = ai[i] - 1;
            if (_doResponse[i] > 0 && _stateIsDo(i))
            {
                int ai1[] = _doResponse;
                ai1[i] = ai1[i] - 1;
            }
        }
        if (_doResponse[i] == 0 && _requestedDont(i))
        {
            if (flag)
            {
                _setWantDo(i);
                _sendDo(i);
            } else
            {
                int ai2[] = _doResponse;
                ai2[i] = ai2[i] + 1;
                _sendDont(i);
            }
        }
        _setDo(i);
    }

    void _processWont(int i)
        throws IOException
    {
        if (__notifhand != null)
        {
            __notifhand.receivedNegotiation(4, i);
        }
        if (_doResponse[i] > 0)
        {
            int ai[] = _doResponse;
            ai[i] = ai[i] - 1;
            if (_doResponse[i] > 0 && _stateIsDont(i))
            {
                int ai1[] = _doResponse;
                ai1[i] = ai1[i] - 1;
            }
        }
        if (_doResponse[i] == 0 && _requestedDo(i))
        {
            if (_stateIsDo(i) || _requestedDo(i))
            {
                _sendDont(i);
            }
            _setWantDont(i);
        }
        _setDont(i);
    }

    void _registerSpyStream(OutputStream outputstream)
    {
        spyStream = outputstream;
    }

    final void _requestDo(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (_doResponse[i] == 0 && _stateIsDo(i)) goto _L2; else goto _L1
_L1:
        boolean flag = _requestedDo(i);
        if (!flag) goto _L3; else goto _L2
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L3:
        int ai[];
        _setWantDo(i);
        ai = _doResponse;
        ai[i] = ai[i] + 1;
        _sendDo(i);
        if (true) goto _L2; else goto _L4
_L4:
        Exception exception;
        exception;
        throw exception;
    }

    final void _requestDont(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (_doResponse[i] == 0 && _stateIsDont(i)) goto _L2; else goto _L1
_L1:
        boolean flag = _requestedDont(i);
        if (!flag) goto _L3; else goto _L2
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L3:
        int ai[];
        _setWantDont(i);
        ai = _doResponse;
        ai[i] = ai[i] + 1;
        _sendDont(i);
        if (true) goto _L2; else goto _L4
_L4:
        Exception exception;
        exception;
        throw exception;
    }

    final void _requestWill(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (_willResponse[i] == 0 && _stateIsWill(i)) goto _L2; else goto _L1
_L1:
        boolean flag = _requestedWill(i);
        if (!flag) goto _L3; else goto _L2
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L3:
        int ai[];
        _setWantWill(i);
        ai = _doResponse;
        ai[i] = ai[i] + 1;
        _sendWill(i);
        if (true) goto _L2; else goto _L4
_L4:
        Exception exception;
        exception;
        throw exception;
    }

    final void _requestWont(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (_willResponse[i] == 0 && _stateIsWont(i)) goto _L2; else goto _L1
_L1:
        boolean flag = _requestedWont(i);
        if (!flag) goto _L3; else goto _L2
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L3:
        int ai[];
        _setWantWont(i);
        ai = _doResponse;
        ai[i] = ai[i] + 1;
        _sendWont(i);
        if (true) goto _L2; else goto _L4
_L4:
        Exception exception;
        exception;
        throw exception;
    }

    boolean _requestedDo(int i)
    {
        return (_options[i] & 8) != 0;
    }

    boolean _requestedDont(int i)
    {
        return !_requestedDo(i);
    }

    boolean _requestedWill(int i)
    {
        return (_options[i] & 4) != 0;
    }

    boolean _requestedWont(int i)
    {
        return !_requestedWill(i);
    }

    final boolean _sendAYT(long l)
        throws IOException, IllegalArgumentException, InterruptedException
    {
        Object obj = aytMonitor;
        obj;
        JVM INSTR monitorenter ;
        this;
        JVM INSTR monitorenter ;
        aytFlag = false;
        _output_.write(_COMMAND_AYT);
        _output_.flush();
        this;
        JVM INSTR monitorexit ;
        aytMonitor.wait(l);
        if (aytFlag)
        {
            break MISSING_BLOCK_LABEL_75;
        }
        boolean flag = false;
        aytFlag = true;
_L1:
        obj;
        JVM INSTR monitorexit ;
        return flag;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        flag = true;
          goto _L1
    }

    final void _sendByte(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        _output_.write(i);
        _spyWrite(i);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    final void _sendCommand(byte byte0)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        _output_.write(255);
        _output_.write(byte0);
        _output_.flush();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    final void _sendDo(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        _output_.write(_COMMAND_DO);
        _output_.write(i);
        _output_.flush();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    final void _sendDont(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        _output_.write(_COMMAND_DONT);
        _output_.write(i);
        _output_.flush();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    final void _sendSubnegotiation(int ai[])
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (ai == null)
        {
            break MISSING_BLOCK_LABEL_80;
        }
        int j;
        _output_.write(_COMMAND_SB);
        j = ai.length;
        int i = 0;
_L2:
        byte byte0;
        if (i >= j)
        {
            break; /* Loop/switch isn't completed */
        }
        byte0 = (byte)ai[i];
        if (byte0 != -1)
        {
            break MISSING_BLOCK_LABEL_47;
        }
        _output_.write(byte0);
        _output_.write(byte0);
        i++;
        if (true) goto _L2; else goto _L1
_L1:
        _output_.write(_COMMAND_SE);
        _output_.flush();
        this;
        JVM INSTR monitorexit ;
        return;
        ai;
        throw ai;
    }

    final void _sendTerminalType()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (terminalType != null)
        {
            _output_.write(_COMMAND_SB);
            _output_.write(_COMMAND_IS);
            _output_.write(terminalType.getBytes(getCharsetName()));
            _output_.write(_COMMAND_SE);
            _output_.flush();
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    final void _sendWill(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        _output_.write(_COMMAND_WILL);
        _output_.write(i);
        _output_.flush();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    final void _sendWont(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        _output_.write(_COMMAND_WONT);
        _output_.write(i);
        _output_.flush();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    void _setDo(int i)
        throws IOException
    {
        int ai[] = _options;
        ai[i] = ai[i] | 2;
        if (_requestedDo(i) && optionHandlers[i] != null)
        {
            optionHandlers[i].setDo(true);
            int ai1[] = optionHandlers[i].startSubnegotiationRemote();
            if (ai1 != null)
            {
                _sendSubnegotiation(ai1);
            }
        }
    }

    void _setDont(int i)
    {
        int ai[] = _options;
        ai[i] = ai[i] & -3;
        if (optionHandlers[i] != null)
        {
            optionHandlers[i].setDo(false);
        }
    }

    void _setWantDo(int i)
    {
        int ai[] = _options;
        ai[i] = ai[i] | 8;
    }

    void _setWantDont(int i)
    {
        int ai[] = _options;
        ai[i] = ai[i] & -9;
    }

    void _setWantWill(int i)
    {
        int ai[] = _options;
        ai[i] = ai[i] | 4;
    }

    void _setWantWont(int i)
    {
        int ai[] = _options;
        ai[i] = ai[i] & -5;
    }

    void _setWill(int i)
        throws IOException
    {
        int ai[] = _options;
        ai[i] = ai[i] | 1;
        if (_requestedWill(i) && optionHandlers[i] != null)
        {
            optionHandlers[i].setWill(true);
            int ai1[] = optionHandlers[i].startSubnegotiationLocal();
            if (ai1 != null)
            {
                _sendSubnegotiation(ai1);
            }
        }
    }

    void _setWont(int i)
    {
        int ai[] = _options;
        ai[i] = ai[i] & -2;
        if (optionHandlers[i] != null)
        {
            optionHandlers[i].setWill(false);
        }
    }

    void _spyRead(int i)
    {
        OutputStream outputstream = spyStream;
        if (outputstream == null || i == 13)
        {
            break MISSING_BLOCK_LABEL_36;
        }
        try
        {
            outputstream.write(i);
        }
        catch (IOException ioexception)
        {
            spyStream = null;
            return;
        }
        if (i != 10)
        {
            break MISSING_BLOCK_LABEL_32;
        }
        outputstream.write(13);
        outputstream.flush();
    }

    void _spyWrite(int i)
    {
        OutputStream outputstream;
        if (_stateIsDo(1) && _requestedDo(1))
        {
            break MISSING_BLOCK_LABEL_34;
        }
        outputstream = spyStream;
        if (outputstream == null)
        {
            break MISSING_BLOCK_LABEL_34;
        }
        outputstream.write(i);
        outputstream.flush();
        return;
        IOException ioexception;
        ioexception;
        spyStream = null;
        return;
    }

    boolean _stateIsDo(int i)
    {
        return (_options[i] & 2) != 0;
    }

    boolean _stateIsDont(int i)
    {
        return !_stateIsDo(i);
    }

    boolean _stateIsWill(int i)
    {
        return (_options[i] & 1) != 0;
    }

    boolean _stateIsWont(int i)
    {
        return !_stateIsWill(i);
    }

    void _stopSpyStream()
    {
        spyStream = null;
    }

    void addOptionHandler(TelnetOptionHandler telnetoptionhandler)
        throws InvalidTelnetOptionException, IOException
    {
        int i = telnetoptionhandler.getOptionCode();
        if (TelnetOption.isValidOption(i))
        {
            if (optionHandlers[i] == null)
            {
                optionHandlers[i] = telnetoptionhandler;
                if (isConnected())
                {
                    if (telnetoptionhandler.getInitLocal())
                    {
                        _requestWill(i);
                    }
                    if (telnetoptionhandler.getInitRemote())
                    {
                        _requestDo(i);
                    }
                }
                return;
            } else
            {
                throw new InvalidTelnetOptionException("Already registered option", i);
            }
        } else
        {
            throw new InvalidTelnetOptionException("Invalid Option Code", i);
        }
    }

    void deleteOptionHandler(int i)
        throws InvalidTelnetOptionException, IOException
    {
        if (TelnetOption.isValidOption(i))
        {
            if (optionHandlers[i] == null)
            {
                throw new InvalidTelnetOptionException("Unregistered option", i);
            }
            TelnetOptionHandler telnetoptionhandler = optionHandlers[i];
            optionHandlers[i] = null;
            if (telnetoptionhandler.getWill())
            {
                _requestWont(i);
            }
            if (telnetoptionhandler.getDo())
            {
                _requestDont(i);
            }
            return;
        } else
        {
            throw new InvalidTelnetOptionException("Invalid Option Code", i);
        }
    }

    public void registerNotifHandler(TelnetNotificationHandler telnetnotificationhandler)
    {
        __notifhand = telnetnotificationhandler;
    }

    public void unregisterNotifHandler()
    {
        __notifhand = null;
    }

}
