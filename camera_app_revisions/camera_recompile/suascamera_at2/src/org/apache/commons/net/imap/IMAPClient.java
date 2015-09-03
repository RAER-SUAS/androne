// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;

import java.io.IOException;

// Referenced classes of package org.apache.commons.net.imap:
//            IMAP, IMAPCommand

public class IMAPClient extends IMAP
{
    public static final class FETCH_ITEM_NAMES extends Enum
    {

        private static final FETCH_ITEM_NAMES $VALUES[];
        public static final FETCH_ITEM_NAMES ALL;
        public static final FETCH_ITEM_NAMES BODY;
        public static final FETCH_ITEM_NAMES BODYSTRUCTURE;
        public static final FETCH_ITEM_NAMES ENVELOPE;
        public static final FETCH_ITEM_NAMES FAST;
        public static final FETCH_ITEM_NAMES FLAGS;
        public static final FETCH_ITEM_NAMES FULL;
        public static final FETCH_ITEM_NAMES INTERNALDATE;
        public static final FETCH_ITEM_NAMES RFC822;
        public static final FETCH_ITEM_NAMES UID;

        public static FETCH_ITEM_NAMES valueOf(String s)
        {
            return (FETCH_ITEM_NAMES)Enum.valueOf(org/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES, s);
        }

        public static FETCH_ITEM_NAMES[] values()
        {
            return (FETCH_ITEM_NAMES[])$VALUES.clone();
        }

        static 
        {
            ALL = new FETCH_ITEM_NAMES("ALL", 0);
            FAST = new FETCH_ITEM_NAMES("FAST", 1);
            FULL = new FETCH_ITEM_NAMES("FULL", 2);
            BODY = new FETCH_ITEM_NAMES("BODY", 3);
            BODYSTRUCTURE = new FETCH_ITEM_NAMES("BODYSTRUCTURE", 4);
            ENVELOPE = new FETCH_ITEM_NAMES("ENVELOPE", 5);
            FLAGS = new FETCH_ITEM_NAMES("FLAGS", 6);
            INTERNALDATE = new FETCH_ITEM_NAMES("INTERNALDATE", 7);
            RFC822 = new FETCH_ITEM_NAMES("RFC822", 8);
            UID = new FETCH_ITEM_NAMES("UID", 9);
            $VALUES = (new FETCH_ITEM_NAMES[] {
                ALL, FAST, FULL, BODY, BODYSTRUCTURE, ENVELOPE, FLAGS, INTERNALDATE, RFC822, UID
            });
        }

        private FETCH_ITEM_NAMES(String s, int i)
        {
            super(s, i);
        }
    }

    public static final class SEARCH_CRITERIA extends Enum
    {

        private static final SEARCH_CRITERIA $VALUES[];
        public static final SEARCH_CRITERIA ALL;
        public static final SEARCH_CRITERIA ANSWERED;
        public static final SEARCH_CRITERIA BCC;
        public static final SEARCH_CRITERIA BEFORE;
        public static final SEARCH_CRITERIA BODY;
        public static final SEARCH_CRITERIA CC;
        public static final SEARCH_CRITERIA DELETED;
        public static final SEARCH_CRITERIA DRAFT;
        public static final SEARCH_CRITERIA FLAGGED;
        public static final SEARCH_CRITERIA FROM;
        public static final SEARCH_CRITERIA HEADER;
        public static final SEARCH_CRITERIA KEYWORD;
        public static final SEARCH_CRITERIA LARGER;
        public static final SEARCH_CRITERIA NEW;
        public static final SEARCH_CRITERIA NOT;
        public static final SEARCH_CRITERIA OLD;
        public static final SEARCH_CRITERIA ON;
        public static final SEARCH_CRITERIA OR;
        public static final SEARCH_CRITERIA RECENT;
        public static final SEARCH_CRITERIA SEEN;
        public static final SEARCH_CRITERIA SENTBEFORE;
        public static final SEARCH_CRITERIA SENTON;
        public static final SEARCH_CRITERIA SENTSINCE;
        public static final SEARCH_CRITERIA SINCE;
        public static final SEARCH_CRITERIA SMALLER;
        public static final SEARCH_CRITERIA SUBJECT;
        public static final SEARCH_CRITERIA TEXT;
        public static final SEARCH_CRITERIA TO;
        public static final SEARCH_CRITERIA UID;
        public static final SEARCH_CRITERIA UNANSWERED;
        public static final SEARCH_CRITERIA UNDELETED;
        public static final SEARCH_CRITERIA UNDRAFT;
        public static final SEARCH_CRITERIA UNFLAGGED;
        public static final SEARCH_CRITERIA UNKEYWORD;
        public static final SEARCH_CRITERIA UNSEEN;

        public static SEARCH_CRITERIA valueOf(String s)
        {
            return (SEARCH_CRITERIA)Enum.valueOf(org/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA, s);
        }

        public static SEARCH_CRITERIA[] values()
        {
            return (SEARCH_CRITERIA[])$VALUES.clone();
        }

        static 
        {
            ALL = new SEARCH_CRITERIA("ALL", 0);
            ANSWERED = new SEARCH_CRITERIA("ANSWERED", 1);
            BCC = new SEARCH_CRITERIA("BCC", 2);
            BEFORE = new SEARCH_CRITERIA("BEFORE", 3);
            BODY = new SEARCH_CRITERIA("BODY", 4);
            CC = new SEARCH_CRITERIA("CC", 5);
            DELETED = new SEARCH_CRITERIA("DELETED", 6);
            DRAFT = new SEARCH_CRITERIA("DRAFT", 7);
            FLAGGED = new SEARCH_CRITERIA("FLAGGED", 8);
            FROM = new SEARCH_CRITERIA("FROM", 9);
            HEADER = new SEARCH_CRITERIA("HEADER", 10);
            KEYWORD = new SEARCH_CRITERIA("KEYWORD", 11);
            LARGER = new SEARCH_CRITERIA("LARGER", 12);
            NEW = new SEARCH_CRITERIA("NEW", 13);
            NOT = new SEARCH_CRITERIA("NOT", 14);
            OLD = new SEARCH_CRITERIA("OLD", 15);
            ON = new SEARCH_CRITERIA("ON", 16);
            OR = new SEARCH_CRITERIA("OR", 17);
            RECENT = new SEARCH_CRITERIA("RECENT", 18);
            SEEN = new SEARCH_CRITERIA("SEEN", 19);
            SENTBEFORE = new SEARCH_CRITERIA("SENTBEFORE", 20);
            SENTON = new SEARCH_CRITERIA("SENTON", 21);
            SENTSINCE = new SEARCH_CRITERIA("SENTSINCE", 22);
            SINCE = new SEARCH_CRITERIA("SINCE", 23);
            SMALLER = new SEARCH_CRITERIA("SMALLER", 24);
            SUBJECT = new SEARCH_CRITERIA("SUBJECT", 25);
            TEXT = new SEARCH_CRITERIA("TEXT", 26);
            TO = new SEARCH_CRITERIA("TO", 27);
            UID = new SEARCH_CRITERIA("UID", 28);
            UNANSWERED = new SEARCH_CRITERIA("UNANSWERED", 29);
            UNDELETED = new SEARCH_CRITERIA("UNDELETED", 30);
            UNDRAFT = new SEARCH_CRITERIA("UNDRAFT", 31);
            UNFLAGGED = new SEARCH_CRITERIA("UNFLAGGED", 32);
            UNKEYWORD = new SEARCH_CRITERIA("UNKEYWORD", 33);
            UNSEEN = new SEARCH_CRITERIA("UNSEEN", 34);
            $VALUES = (new SEARCH_CRITERIA[] {
                ALL, ANSWERED, BCC, BEFORE, BODY, CC, DELETED, DRAFT, FLAGGED, FROM, 
                HEADER, KEYWORD, LARGER, NEW, NOT, OLD, ON, OR, RECENT, SEEN, 
                SENTBEFORE, SENTON, SENTSINCE, SINCE, SMALLER, SUBJECT, TEXT, TO, UID, UNANSWERED, 
                UNDELETED, UNDRAFT, UNFLAGGED, UNKEYWORD, UNSEEN
            });
        }

        private SEARCH_CRITERIA(String s, int i)
        {
            super(s, i);
        }
    }

    public static final class STATUS_DATA_ITEMS extends Enum
    {

        private static final STATUS_DATA_ITEMS $VALUES[];
        public static final STATUS_DATA_ITEMS MESSAGES;
        public static final STATUS_DATA_ITEMS RECENT;
        public static final STATUS_DATA_ITEMS UIDNEXT;
        public static final STATUS_DATA_ITEMS UIDVALIDITY;
        public static final STATUS_DATA_ITEMS UNSEEN;

        public static STATUS_DATA_ITEMS valueOf(String s)
        {
            return (STATUS_DATA_ITEMS)Enum.valueOf(org/apache/commons/net/imap/IMAPClient$STATUS_DATA_ITEMS, s);
        }

        public static STATUS_DATA_ITEMS[] values()
        {
            return (STATUS_DATA_ITEMS[])$VALUES.clone();
        }

        static 
        {
            MESSAGES = new STATUS_DATA_ITEMS("MESSAGES", 0);
            RECENT = new STATUS_DATA_ITEMS("RECENT", 1);
            UIDNEXT = new STATUS_DATA_ITEMS("UIDNEXT", 2);
            UIDVALIDITY = new STATUS_DATA_ITEMS("UIDVALIDITY", 3);
            UNSEEN = new STATUS_DATA_ITEMS("UNSEEN", 4);
            $VALUES = (new STATUS_DATA_ITEMS[] {
                MESSAGES, RECENT, UIDNEXT, UIDVALIDITY, UNSEEN
            });
        }

        private STATUS_DATA_ITEMS(String s, int i)
        {
            super(s, i);
        }
    }


    public IMAPClient()
    {
    }

    public boolean append(String s)
        throws IOException
    {
        return append(s, null, null);
    }

    public boolean append(String s, String s1, String s2)
        throws IOException
    {
        String s3 = s;
        s = s3;
        if (s1 != null)
        {
            s = (new StringBuilder()).append(s3).append(" ").append(s1).toString();
        }
        s1 = s;
        if (s2 != null)
        {
            if (s2.charAt(0) == '{')
            {
                s1 = (new StringBuilder()).append(s).append(" ").append(s2).toString();
            } else
            {
                s1 = (new StringBuilder()).append(s).append(" {").append(s2).append("}").toString();
            }
        }
        return doCommand(IMAPCommand.APPEND, s1);
    }

    public boolean capability()
        throws IOException
    {
        return doCommand(IMAPCommand.CAPABILITY);
    }

    public boolean check()
        throws IOException
    {
        return doCommand(IMAPCommand.CHECK);
    }

    public boolean close()
        throws IOException
    {
        return doCommand(IMAPCommand.CLOSE);
    }

    public boolean copy(String s, String s1)
        throws IOException
    {
        return doCommand(IMAPCommand.COPY, (new StringBuilder()).append(s).append(" ").append(s1).toString());
    }

    public boolean create(String s)
        throws IOException
    {
        return doCommand(IMAPCommand.CREATE, s);
    }

    public boolean delete(String s)
        throws IOException
    {
        return doCommand(IMAPCommand.DELETE, s);
    }

    public boolean examine(String s)
        throws IOException
    {
        return doCommand(IMAPCommand.EXAMINE, s);
    }

    public boolean expunge()
        throws IOException
    {
        return doCommand(IMAPCommand.EXPUNGE);
    }

    public boolean fetch(String s, String s1)
        throws IOException
    {
        return doCommand(IMAPCommand.FETCH, (new StringBuilder()).append(s).append(" ").append(s1).toString());
    }

    public boolean list(String s, String s1)
        throws IOException
    {
        return doCommand(IMAPCommand.LIST, (new StringBuilder()).append(s).append(" ").append(s1).toString());
    }

    public boolean login(String s, String s1)
        throws IOException
    {
        while (getState() != IMAP.IMAPState.NOT_AUTH_STATE || !doCommand(IMAPCommand.LOGIN, (new StringBuilder()).append(s).append(" ").append(s1).toString())) 
        {
            return false;
        }
        setState(IMAP.IMAPState.AUTH_STATE);
        return true;
    }

    public boolean logout()
        throws IOException
    {
        return doCommand(IMAPCommand.LOGOUT);
    }

    public boolean lsub(String s, String s1)
        throws IOException
    {
        return doCommand(IMAPCommand.LSUB, (new StringBuilder()).append(s).append(" ").append(s1).toString());
    }

    public boolean noop()
        throws IOException
    {
        return doCommand(IMAPCommand.NOOP);
    }

    public boolean rename(String s, String s1)
        throws IOException
    {
        return doCommand(IMAPCommand.RENAME, (new StringBuilder()).append(s).append(" ").append(s1).toString());
    }

    public boolean search(String s)
        throws IOException
    {
        return search(null, s);
    }

    public boolean search(String s, String s1)
        throws IOException
    {
        String s2 = "";
        if (s != null)
        {
            s2 = (new StringBuilder()).append("").append("CHARSET ").append(s).toString();
        }
        s = (new StringBuilder()).append(s2).append(s1).toString();
        return doCommand(IMAPCommand.SEARCH, s);
    }

    public boolean select(String s)
        throws IOException
    {
        return doCommand(IMAPCommand.SELECT, s);
    }

    public boolean status(String s, String as[])
        throws IOException
    {
        if (as == null || as.length < 1)
        {
            throw new IllegalArgumentException("STATUS command requires at least one data item name");
        }
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(s);
        stringbuilder.append(" (");
        for (int i = 0; i < as.length; i++)
        {
            if (i > 0)
            {
                stringbuilder.append(" ");
            }
            stringbuilder.append(as[i]);
        }

        stringbuilder.append(")");
        return doCommand(IMAPCommand.STATUS, stringbuilder.toString());
    }

    public boolean store(String s, String s1, String s2)
        throws IOException
    {
        return doCommand(IMAPCommand.STORE, (new StringBuilder()).append(s).append(" ").append(s1).append(" ").append(s2).toString());
    }

    public boolean subscribe(String s)
        throws IOException
    {
        return doCommand(IMAPCommand.SUBSCRIBE, s);
    }

    public boolean uid(String s, String s1)
        throws IOException
    {
        return doCommand(IMAPCommand.UID, (new StringBuilder()).append(s).append(" ").append(s1).toString());
    }

    public boolean unsubscribe(String s)
        throws IOException
    {
        return doCommand(IMAPCommand.UNSUBSCRIBE, s);
    }
}
