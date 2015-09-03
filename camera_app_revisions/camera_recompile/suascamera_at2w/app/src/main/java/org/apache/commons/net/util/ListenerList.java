// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;

import java.io.Serializable;
import java.util.EventListener;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

public class ListenerList
    implements Serializable, Iterable
{

    private static final long serialVersionUID = 0xe5283e3d0ff14f0bL;
    private final CopyOnWriteArrayList __listeners = new CopyOnWriteArrayList();

    public ListenerList()
    {
    }

    public void addListener(EventListener eventlistener)
    {
        __listeners.add(eventlistener);
    }

    public int getListenerCount()
    {
        return __listeners.size();
    }

    public Iterator iterator()
    {
        return __listeners.iterator();
    }

    public void removeListener(EventListener eventlistener)
    {
        __listeners.remove(eventlistener);
    }
}
