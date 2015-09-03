// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.util.EventListener;

// Referenced classes of package org.apache.commons.net:
//            ProtocolCommandEvent

public interface ProtocolCommandListener
    extends EventListener
{

    public abstract void protocolCommandSent(ProtocolCommandEvent protocolcommandevent);

    public abstract void protocolReplyReceived(ProtocolCommandEvent protocolcommandevent);
}
