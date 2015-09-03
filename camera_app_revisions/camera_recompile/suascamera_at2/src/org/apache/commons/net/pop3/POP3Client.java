// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.pop3;

import java.io.IOException;
import java.io.Reader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.ListIterator;
import java.util.StringTokenizer;
import org.apache.commons.net.io.DotTerminatedMessageReader;

// Referenced classes of package org.apache.commons.net.pop3:
//            POP3, POP3MessageInfo

public class POP3Client extends POP3
{

    public POP3Client()
    {
    }

    private static POP3MessageInfo __parseStatus(String s)
    {
        s = new StringTokenizer(s);
        if (s.hasMoreElements()) goto _L2; else goto _L1
_L1:
        return null;
_L2:
        int i = Integer.parseInt(s.nextToken());
        if (!s.hasMoreElements()) goto _L1; else goto _L3
_L3:
        int j = Integer.parseInt(s.nextToken());
        return new POP3MessageInfo(i, j);
        s;
        return null;
    }

    private static POP3MessageInfo __parseUID(String s)
    {
        s = new StringTokenizer(s);
        if (s.hasMoreElements()) goto _L2; else goto _L1
_L1:
        return null;
_L2:
        int i = Integer.parseInt(s.nextToken());
        if (!s.hasMoreElements()) goto _L1; else goto _L3
_L3:
        s = s.nextToken();
        return new POP3MessageInfo(i, s);
        s;
        return null;
    }

    public boolean capa()
        throws IOException
    {
        if (sendCommand(12) == 0)
        {
            getAdditionalReply();
            return true;
        } else
        {
            return false;
        }
    }

    public boolean deleteMessage(int i)
        throws IOException
    {
        if (getState() == 1)
        {
            return sendCommand(6, Integer.toString(i)) == 0;
        } else
        {
            return false;
        }
    }

    public POP3MessageInfo listMessage(int i)
        throws IOException
    {
        while (getState() != 1 || sendCommand(4, Integer.toString(i)) != 0) 
        {
            return null;
        }
        return __parseStatus(_lastReplyLine.substring(3));
    }

    public POP3MessageInfo[] listMessages()
        throws IOException
    {
        POP3MessageInfo apop3messageinfo[];
        apop3messageinfo = null;
        break MISSING_BLOCK_LABEL_2;
_L2:
        do
        {
            return apop3messageinfo;
        } while (getState() != 1 || sendCommand(4) != 0);
        getAdditionalReply();
        POP3MessageInfo apop3messageinfo1[] = new POP3MessageInfo[_replyLines.size() - 2];
        ListIterator listiterator = _replyLines.listIterator(1);
        int i = 0;
        do
        {
            apop3messageinfo = apop3messageinfo1;
            if (i >= apop3messageinfo1.length)
            {
                continue;
            }
            apop3messageinfo1[i] = __parseStatus((String)listiterator.next());
            i++;
        } while (true);
        if (true) goto _L2; else goto _L1
_L1:
    }

    public POP3MessageInfo listUniqueIdentifier(int i)
        throws IOException
    {
        while (getState() != 1 || sendCommand(11, Integer.toString(i)) != 0) 
        {
            return null;
        }
        return __parseUID(_lastReplyLine.substring(3));
    }

    public POP3MessageInfo[] listUniqueIdentifiers()
        throws IOException
    {
        POP3MessageInfo apop3messageinfo[];
        apop3messageinfo = null;
        break MISSING_BLOCK_LABEL_2;
_L2:
        do
        {
            return apop3messageinfo;
        } while (getState() != 1 || sendCommand(11) != 0);
        getAdditionalReply();
        POP3MessageInfo apop3messageinfo1[] = new POP3MessageInfo[_replyLines.size() - 2];
        ListIterator listiterator = _replyLines.listIterator(1);
        int i = 0;
        do
        {
            apop3messageinfo = apop3messageinfo1;
            if (i >= apop3messageinfo1.length)
            {
                continue;
            }
            apop3messageinfo1[i] = __parseUID((String)listiterator.next());
            i++;
        } while (true);
        if (true) goto _L2; else goto _L1
_L1:
    }

    public boolean login(String s, String s1)
        throws IOException
    {
        while (getState() != 0 || sendCommand(0, s) != 0 || sendCommand(1, s1) != 0) 
        {
            return false;
        }
        setState(1);
        return true;
    }

    public boolean login(String s, String s1, String s2)
        throws IOException, NoSuchAlgorithmException
    {
        if (getState() == 0)
        {
            s2 = MessageDigest.getInstance("MD5").digest((new StringBuilder()).append(s1).append(s2).toString().getBytes(getCharsetName()));
            s1 = new StringBuilder(128);
            for (int i = 0; i < s2.length; i++)
            {
                int j = s2[i] & 0xff;
                if (j <= 15)
                {
                    s1.append("0");
                }
                s1.append(Integer.toHexString(j));
            }

            s2 = new StringBuilder(256);
            s2.append(s);
            s2.append(' ');
            s2.append(s1.toString());
            if (sendCommand(9, s2.toString()) == 0)
            {
                setState(1);
                return true;
            }
        }
        return false;
    }

    public boolean logout()
        throws IOException
    {
        if (getState() == 1)
        {
            setState(2);
        }
        sendCommand(2);
        return _replyCode == 0;
    }

    public boolean noop()
        throws IOException
    {
        if (getState() == 1)
        {
            return sendCommand(7) == 0;
        } else
        {
            return false;
        }
    }

    public boolean reset()
        throws IOException
    {
        if (getState() == 1)
        {
            return sendCommand(8) == 0;
        } else
        {
            return false;
        }
    }

    public Reader retrieveMessage(int i)
        throws IOException
    {
        while (getState() != 1 || sendCommand(5, Integer.toString(i)) != 0) 
        {
            return null;
        }
        return new DotTerminatedMessageReader(_reader);
    }

    public Reader retrieveMessageTop(int i, int j)
        throws IOException
    {
        while (j < 0 || getState() != 1 || sendCommand(10, (new StringBuilder()).append(Integer.toString(i)).append(" ").append(Integer.toString(j)).toString()) != 0) 
        {
            return null;
        }
        return new DotTerminatedMessageReader(_reader);
    }

    public POP3MessageInfo status()
        throws IOException
    {
        while (getState() != 1 || sendCommand(3) != 0) 
        {
            return null;
        }
        return __parseStatus(_lastReplyLine.substring(3));
    }
}
