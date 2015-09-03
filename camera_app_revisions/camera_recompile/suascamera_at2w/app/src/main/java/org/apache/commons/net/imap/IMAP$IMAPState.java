// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.imap;


// Referenced classes of package org.apache.commons.net.imap:
//            IMAP

public static final class  extends Enum
{

    private static final LOGOUT_STATE $VALUES[];
    public static final LOGOUT_STATE AUTH_STATE;
    public static final LOGOUT_STATE DISCONNECTED_STATE;
    public static final LOGOUT_STATE LOGOUT_STATE;
    public static final LOGOUT_STATE NOT_AUTH_STATE;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(org/apache/commons/net/imap/IMAP$IMAPState, s);
    }

    public static [] values()
    {
        return ([])$VALUES.clone();
    }

    static 
    {
        DISCONNECTED_STATE = new <init>("DISCONNECTED_STATE", 0);
        NOT_AUTH_STATE = new <init>("NOT_AUTH_STATE", 1);
        AUTH_STATE = new <init>("AUTH_STATE", 2);
        LOGOUT_STATE = new <init>("LOGOUT_STATE", 3);
        $VALUES = (new .VALUES[] {
            DISCONNECTED_STATE, NOT_AUTH_STATE, AUTH_STATE, LOGOUT_STATE
        });
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
