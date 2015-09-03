// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.util.EventObject;

public class ProtocolCommandEvent extends EventObject
{

    private static final long serialVersionUID = 0x59a629bebd214a8L;
    private final String __command;
    private final boolean __isCommand;
    private final String __message;
    private final int __replyCode;

    public ProtocolCommandEvent(Object obj, int i, String s)
    {
        super(obj);
        __replyCode = i;
        __message = s;
        __isCommand = false;
        __command = null;
    }

    public ProtocolCommandEvent(Object obj, String s, String s1)
    {
        super(obj);
        __replyCode = 0;
        __message = s1;
        __isCommand = true;
        __command = s;
    }

    public String getCommand()
    {
        return __command;
    }

    public String getMessage()
    {
        return __message;
    }

    public int getReplyCode()
    {
        return __replyCode;
    }

    public boolean isCommand()
    {
        return __isCommand;
    }

    public boolean isReply()
    {
        return !isCommand();
    }
}
