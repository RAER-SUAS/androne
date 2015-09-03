// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;


// Referenced classes of package org.apache.commons.net.nntp:
//            Threadable

class ThreadContainer
{

    ThreadContainer child;
    ThreadContainer next;
    ThreadContainer parent;
    Threadable threadable;

    ThreadContainer()
    {
    }

    boolean findChild(ThreadContainer threadcontainer)
    {
        if (child == null)
        {
            return false;
        }
        if (child == threadcontainer)
        {
            return true;
        } else
        {
            return child.findChild(threadcontainer);
        }
    }

    void flush()
    {
        if (parent != null && threadable == null)
        {
            throw new RuntimeException((new StringBuilder()).append("no threadable in ").append(toString()).toString());
        }
        parent = null;
        Threadable threadable1;
        if (threadable != null)
        {
            Threadable threadable2 = threadable;
            if (child == null)
            {
                threadable1 = null;
            } else
            {
                threadable1 = child.threadable;
            }
            threadable2.setChild(threadable1);
        }
        if (child != null)
        {
            child.flush();
            child = null;
        }
        if (threadable != null)
        {
            threadable2 = threadable;
            if (next == null)
            {
                threadable1 = null;
            } else
            {
                threadable1 = next.threadable;
            }
            threadable2.setNext(threadable1);
        }
        if (next != null)
        {
            next.flush();
            next = null;
        }
        threadable = null;
    }

    void reverseChildren()
    {
        if (child != null)
        {
            ThreadContainer threadcontainer3 = null;
            ThreadContainer threadcontainer2 = child;
            ThreadContainer threadcontainer = threadcontainer2.next;
            while (threadcontainer2 != null) 
            {
                threadcontainer2.next = threadcontainer3;
                threadcontainer3 = threadcontainer2;
                threadcontainer2 = threadcontainer;
                if (threadcontainer == null)
                {
                    threadcontainer = null;
                } else
                {
                    threadcontainer = threadcontainer.next;
                }
            }
            child = threadcontainer3;
            for (ThreadContainer threadcontainer1 = child; threadcontainer1 != null; threadcontainer1 = threadcontainer1.next)
            {
                threadcontainer1.reverseChildren();
            }

        }
    }
}
