// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.io.PrintStream;
import java.io.PrintWriter;

// Referenced classes of package org.apache.commons.net:
//            ProtocolCommandListener, ProtocolCommandEvent

public class PrintCommandListener
    implements ProtocolCommandListener
{

    private final boolean __directionMarker;
    private final char __eolMarker;
    private final boolean __nologin;
    private final PrintWriter __writer;

    public PrintCommandListener(PrintStream printstream)
    {
        this(new PrintWriter(printstream));
    }

    public PrintCommandListener(PrintStream printstream, boolean flag)
    {
        this(new PrintWriter(printstream), flag);
    }

    public PrintCommandListener(PrintStream printstream, boolean flag, char c)
    {
        this(new PrintWriter(printstream), flag, c);
    }

    public PrintCommandListener(PrintStream printstream, boolean flag, char c, boolean flag1)
    {
        this(new PrintWriter(printstream), flag, c, flag1);
    }

    public PrintCommandListener(PrintWriter printwriter)
    {
        this(printwriter, false);
    }

    public PrintCommandListener(PrintWriter printwriter, boolean flag)
    {
        this(printwriter, flag, '\0');
    }

    public PrintCommandListener(PrintWriter printwriter, boolean flag, char c)
    {
        this(printwriter, flag, c, false);
    }

    public PrintCommandListener(PrintWriter printwriter, boolean flag, char c, boolean flag1)
    {
        __writer = printwriter;
        __nologin = flag;
        __eolMarker = c;
        __directionMarker = flag1;
    }

    private String getPrintableString(String s)
    {
        int i;
        if (__eolMarker != 0)
        {
            if ((i = s.indexOf("\r\n")) > 0)
            {
                StringBuilder stringbuilder = new StringBuilder();
                stringbuilder.append(s.substring(0, i));
                stringbuilder.append(__eolMarker);
                stringbuilder.append(s.substring(i));
                return stringbuilder.toString();
            }
        }
        return s;
    }

    public void protocolCommandSent(ProtocolCommandEvent protocolcommandevent)
    {
        if (__directionMarker)
        {
            __writer.print("> ");
        }
        if (__nologin)
        {
            String s = protocolcommandevent.getCommand();
            if ("PASS".equalsIgnoreCase(s) || "USER".equalsIgnoreCase(s))
            {
                __writer.print(s);
                __writer.println(" *******");
            } else
            if ("LOGIN".equalsIgnoreCase(s))
            {
                protocolcommandevent = protocolcommandevent.getMessage();
                protocolcommandevent = protocolcommandevent.substring(0, protocolcommandevent.indexOf("LOGIN") + "LOGIN".length());
                __writer.print(protocolcommandevent);
                __writer.println(" *******");
            } else
            {
                __writer.print(getPrintableString(protocolcommandevent.getMessage()));
            }
        } else
        {
            __writer.print(getPrintableString(protocolcommandevent.getMessage()));
        }
        __writer.flush();
    }

    public void protocolReplyReceived(ProtocolCommandEvent protocolcommandevent)
    {
        if (__directionMarker)
        {
            __writer.print("< ");
        }
        __writer.print(protocolcommandevent.getMessage());
        __writer.flush();
    }
}
