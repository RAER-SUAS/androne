// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;


// Referenced classes of package org.apache.commons.net.imap:
//            IMAPClient

public static final class  extends Enum
{

    private static final UID $VALUES[];
    public static final UID ALL;
    public static final UID BODY;
    public static final UID BODYSTRUCTURE;
    public static final UID ENVELOPE;
    public static final UID FAST;
    public static final UID FLAGS;
    public static final UID FULL;
    public static final UID INTERNALDATE;
    public static final UID RFC822;
    public static final UID UID;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(org/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES, s);
    }

    public static [] values()
    {
        return ([])$VALUES.clone();
    }

    static 
    {
        ALL = new <init>("ALL", 0);
        FAST = new <init>("FAST", 1);
        FULL = new <init>("FULL", 2);
        BODY = new <init>("BODY", 3);
        BODYSTRUCTURE = new <init>("BODYSTRUCTURE", 4);
        ENVELOPE = new <init>("ENVELOPE", 5);
        FLAGS = new <init>("FLAGS", 6);
        INTERNALDATE = new <init>("INTERNALDATE", 7);
        RFC822 = new <init>("RFC822", 8);
        UID = new <init>("UID", 9);
        $VALUES = (new .VALUES[] {
            ALL, FAST, FULL, BODY, BODYSTRUCTURE, ENVELOPE, FLAGS, INTERNALDATE, RFC822, UID
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
