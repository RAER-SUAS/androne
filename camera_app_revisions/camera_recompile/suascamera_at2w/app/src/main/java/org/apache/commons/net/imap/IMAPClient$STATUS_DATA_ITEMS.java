// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;


// Referenced classes of package org.apache.commons.net.imap:
//            IMAPClient

public static final class  extends Enum
{

    private static final UNSEEN $VALUES[];
    public static final UNSEEN MESSAGES;
    public static final UNSEEN RECENT;
    public static final UNSEEN UIDNEXT;
    public static final UNSEEN UIDVALIDITY;
    public static final UNSEEN UNSEEN;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(org/apache/commons/net/imap/IMAPClient$STATUS_DATA_ITEMS, s);
    }

    public static [] values()
    {
        return ([])$VALUES.clone();
    }

    static 
    {
        MESSAGES = new <init>("MESSAGES", 0);
        RECENT = new <init>("RECENT", 1);
        UIDNEXT = new <init>("UIDNEXT", 2);
        UIDVALIDITY = new <init>("UIDVALIDITY", 3);
        UNSEEN = new <init>("UNSEEN", 4);
        $VALUES = (new .VALUES[] {
            MESSAGES, RECENT, UIDNEXT, UIDVALIDITY, UNSEEN
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
