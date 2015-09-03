// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net;

import java.io.Serializable;
import java.util.EventListener;
import java.util.Iterator;
import org.apache.commons.net.util.ListenerList;

// Referenced classes of package org.apache.commons.net:
//            ProtocolCommandEvent, ProtocolCommandListener

public class ProtocolCommandSupport
    implements Serializable
{

    private static final long serialVersionUID = 0x90bb6eeebac35896L;
    private final ListenerList __listeners = new ListenerList();
    private final Object __source;

    public ProtocolCommandSupport(Object obj)
    {
        __source = obj;
    }

    public void addProtocolCommandListener(ProtocolCommandListener protocolcommandlistener)
    {
        __listeners.addListener(protocolcommandlistener);
    }

    public void fireCommandSent(String s, String s1)
    {
        s = new ProtocolCommandEvent(__source, s, s1);
        for (s1 = __listeners.iterator(); s1.hasNext(); ((ProtocolCommandListener)(EventListener)s1.next()).protocolCommandSent(s)) { }
    }

    public void fireReplyReceived(int i, String s)
    {
        s = new ProtocolCommandEvent(__source, i, s);
        for (Iterator iterator = __listeners.iterator(); iterator.hasNext(); ((ProtocolCommandListener)(EventListener)iterator.next()).protocolReplyReceived(s)) { }
    }

    public int getListenerCount()
    {
        return __listeners.getListenerCount();
    }

    public void removeProtocolCommandListener(ProtocolCommandListener protocolcommandlistener)
    {
        __listeners.removeListener(protocolcommandlistener);
    }
}
