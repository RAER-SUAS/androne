// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;


// Referenced classes of package org.apache.commons.net.imap:
//            IMAPClient

public static final class  extends Enum
{

    private static final UNSEEN $VALUES[];
    public static final UNSEEN ALL;
    public static final UNSEEN ANSWERED;
    public static final UNSEEN BCC;
    public static final UNSEEN BEFORE;
    public static final UNSEEN BODY;
    public static final UNSEEN CC;
    public static final UNSEEN DELETED;
    public static final UNSEEN DRAFT;
    public static final UNSEEN FLAGGED;
    public static final UNSEEN FROM;
    public static final UNSEEN HEADER;
    public static final UNSEEN KEYWORD;
    public static final UNSEEN LARGER;
    public static final UNSEEN NEW;
    public static final UNSEEN NOT;
    public static final UNSEEN OLD;
    public static final UNSEEN ON;
    public static final UNSEEN OR;
    public static final UNSEEN RECENT;
    public static final UNSEEN SEEN;
    public static final UNSEEN SENTBEFORE;
    public static final UNSEEN SENTON;
    public static final UNSEEN SENTSINCE;
    public static final UNSEEN SINCE;
    public static final UNSEEN SMALLER;
    public static final UNSEEN SUBJECT;
    public static final UNSEEN TEXT;
    public static final UNSEEN TO;
    public static final UNSEEN UID;
    public static final UNSEEN UNANSWERED;
    public static final UNSEEN UNDELETED;
    public static final UNSEEN UNDRAFT;
    public static final UNSEEN UNFLAGGED;
    public static final UNSEEN UNKEYWORD;
    public static final UNSEEN UNSEEN;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(org/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA, s);
    }

    public static [] values()
    {
        return ([])$VALUES.clone();
    }

    static 
    {
        ALL = new <init>("ALL", 0);
        ANSWERED = new <init>("ANSWERED", 1);
        BCC = new <init>("BCC", 2);
        BEFORE = new <init>("BEFORE", 3);
        BODY = new <init>("BODY", 4);
        CC = new <init>("CC", 5);
        DELETED = new <init>("DELETED", 6);
        DRAFT = new <init>("DRAFT", 7);
        FLAGGED = new <init>("FLAGGED", 8);
        FROM = new <init>("FROM", 9);
        HEADER = new <init>("HEADER", 10);
        KEYWORD = new <init>("KEYWORD", 11);
        LARGER = new <init>("LARGER", 12);
        NEW = new <init>("NEW", 13);
        NOT = new <init>("NOT", 14);
        OLD = new <init>("OLD", 15);
        ON = new <init>("ON", 16);
        OR = new <init>("OR", 17);
        RECENT = new <init>("RECENT", 18);
        SEEN = new <init>("SEEN", 19);
        SENTBEFORE = new <init>("SENTBEFORE", 20);
        SENTON = new <init>("SENTON", 21);
        SENTSINCE = new <init>("SENTSINCE", 22);
        SINCE = new <init>("SINCE", 23);
        SMALLER = new <init>("SMALLER", 24);
        SUBJECT = new <init>("SUBJECT", 25);
        TEXT = new <init>("TEXT", 26);
        TO = new <init>("TO", 27);
        UID = new <init>("UID", 28);
        UNANSWERED = new <init>("UNANSWERED", 29);
        UNDELETED = new <init>("UNDELETED", 30);
        UNDRAFT = new <init>("UNDRAFT", 31);
        UNFLAGGED = new <init>("UNFLAGGED", 32);
        UNKEYWORD = new <init>("UNKEYWORD", 33);
        UNSEEN = new <init>("UNSEEN", 34);
        $VALUES = (new .VALUES[] {
            ALL, ANSWERED, BCC, BEFORE, BODY, CC, DELETED, DRAFT, FLAGGED, FROM, 
            HEADER, KEYWORD, LARGER, NEW, NOT, OLD, ON, OR, RECENT, SEEN, 
            SENTBEFORE, SENTON, SENTSINCE, SINCE, SMALLER, SUBJECT, TEXT, TO, UID, UNANSWERED, 
            UNDELETED, UNDRAFT, UNFLAGGED, UNKEYWORD, UNSEEN
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
