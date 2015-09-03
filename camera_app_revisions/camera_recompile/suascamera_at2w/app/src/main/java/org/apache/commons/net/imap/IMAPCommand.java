// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;


public final class IMAPCommand extends Enum
{

    private static final IMAPCommand $VALUES[];
    public static final IMAPCommand APPEND;
    public static final IMAPCommand AUTHENTICATE;
    public static final IMAPCommand CAPABILITY;
    public static final IMAPCommand CHECK;
    public static final IMAPCommand CLOSE;
    public static final IMAPCommand COPY;
    public static final IMAPCommand CREATE;
    public static final IMAPCommand DELETE;
    public static final IMAPCommand EXAMINE;
    public static final IMAPCommand EXPUNGE;
    public static final IMAPCommand FETCH;
    public static final IMAPCommand LIST;
    public static final IMAPCommand LOGIN;
    public static final IMAPCommand LOGOUT;
    public static final IMAPCommand LSUB;
    public static final IMAPCommand NOOP;
    public static final IMAPCommand RENAME;
    public static final IMAPCommand SEARCH;
    public static final IMAPCommand SELECT;
    public static final IMAPCommand STARTTLS;
    public static final IMAPCommand STATUS;
    public static final IMAPCommand STORE;
    public static final IMAPCommand SUBSCRIBE;
    public static final IMAPCommand UID;
    public static final IMAPCommand UNSUBSCRIBE;
    public static final IMAPCommand XOAUTH;
    private final String imapCommand;
    private final int maxParamCount;
    private final int minParamCount;

    private IMAPCommand(String s, int i)
    {
        this(s, i, ((String) (null)));
    }

    private IMAPCommand(String s, int i, int j)
    {
        this(s, i, null, j, j);
    }

    private IMAPCommand(String s, int i, int j, int k)
    {
        this(s, i, null, j, k);
    }

    private IMAPCommand(String s, int i, String s1)
    {
        this(s, i, s1, 0);
    }

    private IMAPCommand(String s, int i, String s1, int j)
    {
        this(s, i, s1, j, j);
    }

    private IMAPCommand(String s, int i, String s1, int j, int k)
    {
        super(s, i);
        imapCommand = s1;
        minParamCount = j;
        maxParamCount = k;
    }

    public static final String getCommand(IMAPCommand imapcommand)
    {
        return imapcommand.getIMAPCommand();
    }

    public static IMAPCommand valueOf(String s)
    {
        return (IMAPCommand)Enum.valueOf(org/apache/commons/net/imap/IMAPCommand, s);
    }

    public static IMAPCommand[] values()
    {
        return (IMAPCommand[])$VALUES.clone();
    }

    public String getIMAPCommand()
    {
        if (imapCommand != null)
        {
            return imapCommand;
        } else
        {
            return name();
        }
    }

    static 
    {
        CAPABILITY = new IMAPCommand("CAPABILITY", 0, 0);
        NOOP = new IMAPCommand("NOOP", 1, 0);
        LOGOUT = new IMAPCommand("LOGOUT", 2, 0);
        STARTTLS = new IMAPCommand("STARTTLS", 3, 0);
        AUTHENTICATE = new IMAPCommand("AUTHENTICATE", 4, 1);
        LOGIN = new IMAPCommand("LOGIN", 5, 2);
        XOAUTH = new IMAPCommand("XOAUTH", 6, 1);
        SELECT = new IMAPCommand("SELECT", 7, 1);
        EXAMINE = new IMAPCommand("EXAMINE", 8, 1);
        CREATE = new IMAPCommand("CREATE", 9, 1);
        DELETE = new IMAPCommand("DELETE", 10, 1);
        RENAME = new IMAPCommand("RENAME", 11, 2);
        SUBSCRIBE = new IMAPCommand("SUBSCRIBE", 12, 1);
        UNSUBSCRIBE = new IMAPCommand("UNSUBSCRIBE", 13, 1);
        LIST = new IMAPCommand("LIST", 14, 2);
        LSUB = new IMAPCommand("LSUB", 15, 2);
        STATUS = new IMAPCommand("STATUS", 16, 2);
        APPEND = new IMAPCommand("APPEND", 17, 2, 4);
        CHECK = new IMAPCommand("CHECK", 18, 0);
        CLOSE = new IMAPCommand("CLOSE", 19, 0);
        EXPUNGE = new IMAPCommand("EXPUNGE", 20, 0);
        SEARCH = new IMAPCommand("SEARCH", 21, 1, 0x7fffffff);
        FETCH = new IMAPCommand("FETCH", 22, 2);
        STORE = new IMAPCommand("STORE", 23, 3);
        COPY = new IMAPCommand("COPY", 24, 2);
        UID = new IMAPCommand("UID", 25, 2, 0x7fffffff);
        $VALUES = (new IMAPCommand[] {
            CAPABILITY, NOOP, LOGOUT, STARTTLS, AUTHENTICATE, LOGIN, XOAUTH, SELECT, EXAMINE, CREATE, 
            DELETE, RENAME, SUBSCRIBE, UNSUBSCRIBE, LIST, LSUB, STATUS, APPEND, CHECK, CLOSE, 
            EXPUNGE, SEARCH, FETCH, STORE, COPY, UID
        });
    }
}
