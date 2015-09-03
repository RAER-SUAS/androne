// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.smtp;

import java.io.IOException;
import java.io.Writer;
import java.net.InetAddress;
import org.apache.commons.net.io.DotTerminatedMessageWriter;

// Referenced classes of package org.apache.commons.net.smtp:
//            SMTP, SMTPReply, RelayPath

public class SMTPClient extends SMTP
{

    public SMTPClient()
    {
    }

    public SMTPClient(String s)
    {
        super(s);
    }

    public boolean addRecipient(String s)
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(rcpt((new StringBuilder()).append("<").append(s).append(">").toString()));
    }

    public boolean addRecipient(RelayPath relaypath)
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(rcpt(relaypath.toString()));
    }

    public boolean completePendingCommand()
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(getReply());
    }

    public String listHelp()
        throws IOException
    {
        if (SMTPReply.isPositiveCompletion(help()))
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
        if (SMTPReply.isPositiveCompletion(help(s)))
        {
            return getReplyString();
        } else
        {
            return null;
        }
    }

    public boolean login()
        throws IOException
    {
        String s = getLocalAddress().getHostName();
        if (s == null)
        {
            return false;
        } else
        {
            return SMTPReply.isPositiveCompletion(helo(s));
        }
    }

    public boolean login(String s)
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(helo(s));
    }

    public boolean logout()
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(quit());
    }

    public boolean reset()
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(rset());
    }

    public Writer sendMessageData()
        throws IOException
    {
        if (!SMTPReply.isPositiveIntermediate(data()))
        {
            return null;
        } else
        {
            return new DotTerminatedMessageWriter(_writer);
        }
    }

    public boolean sendNoOp()
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(noop());
    }

    public boolean sendShortMessageData(String s)
        throws IOException
    {
        Writer writer = sendMessageData();
        if (writer == null)
        {
            return false;
        } else
        {
            writer.write(s);
            writer.close();
            return completePendingCommand();
        }
    }

    public boolean sendSimpleMessage(String s, String s1, String s2)
        throws IOException
    {
        while (!setSender(s) || !addRecipient(s1)) 
        {
            return false;
        }
        return sendShortMessageData(s2);
    }

    public boolean sendSimpleMessage(String s, String as[], String s1)
        throws IOException
    {
        boolean flag = false;
        if (setSender(s))
        {
            for (int i = 0; i < as.length; i++)
            {
                if (addRecipient(as[i]))
                {
                    flag = true;
                }
            }

            if (flag)
            {
                return sendShortMessageData(s1);
            }
        }
        return false;
    }

    public boolean setSender(String s)
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(mail((new StringBuilder()).append("<").append(s).append(">").toString()));
    }

    public boolean setSender(RelayPath relaypath)
        throws IOException
    {
        return SMTPReply.isPositiveCompletion(mail(relaypath.toString()));
    }

    public boolean verify(String s)
        throws IOException
    {
        int i = vrfy(s);
        return i == 250 || i == 251;
    }
}
