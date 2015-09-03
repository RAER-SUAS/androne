// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.util.EventListener;
import java.util.Iterator;
import org.apache.commons.net.util.ListenerList;

// Referenced classes of package org.apache.commons.net.io:
//            CopyStreamListener, CopyStreamEvent

public class CopyStreamAdapter
    implements CopyStreamListener
{

    private final ListenerList internalListeners = new ListenerList();

    public CopyStreamAdapter()
    {
    }

    public void addCopyStreamListener(CopyStreamListener copystreamlistener)
    {
        internalListeners.addListener(copystreamlistener);
    }

    public void bytesTransferred(long l, int i, long l1)
    {
        for (Iterator iterator = internalListeners.iterator(); iterator.hasNext(); ((CopyStreamListener)(CopyStreamListener)(EventListener)iterator.next()).bytesTransferred(l, i, l1)) { }
    }

    public void bytesTransferred(CopyStreamEvent copystreamevent)
    {
        for (Iterator iterator = internalListeners.iterator(); iterator.hasNext(); ((CopyStreamListener)(CopyStreamListener)(EventListener)iterator.next()).bytesTransferred(copystreamevent)) { }
    }

    public void removeCopyStreamListener(CopyStreamListener copystreamlistener)
    {
        internalListeners.removeListener(copystreamlistener);
    }
}
