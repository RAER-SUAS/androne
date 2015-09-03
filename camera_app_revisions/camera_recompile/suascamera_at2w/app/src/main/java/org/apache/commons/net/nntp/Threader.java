// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

// Referenced classes of package org.apache.commons.net.nntp:
//            Threadable, ThreadContainer

public class Threader
{

    private int bogusIdCount;
    private HashMap idTable;
    private ThreadContainer root;

    public Threader()
    {
        bogusIdCount = 0;
    }

    private void buildContainer(Threadable threadable)
    {
        Object obj;
        Object obj1;
label0:
        {
            obj1 = threadable.messageThreadId();
            Object obj3 = (ThreadContainer)idTable.get(obj1);
            obj = obj3;
            Object obj2 = obj1;
            int j;
            int k;
            if (obj3 != null)
            {
                if (((ThreadContainer) (obj3)).threadable != null)
                {
                    obj = (new StringBuilder()).append("<Bogus-id:");
                    int i = bogusIdCount;
                    bogusIdCount = i + 1;
                    obj2 = ((StringBuilder) (obj)).append(i).append(">").toString();
                    obj = null;
                } else
                {
                    obj3.threadable = threadable;
                    obj = obj3;
                    obj2 = obj1;
                }
            }
            obj1 = obj;
            if (obj == null)
            {
                obj1 = new ThreadContainer();
                obj1.threadable = threadable;
                idTable.put(obj2, obj1);
            }
            obj = null;
            obj3 = threadable.messageThreadReferences();
            k = obj3.length;
            j = 0;
            threadable = ((Threadable) (obj));
            for (; j < k; j++)
            {
                Object obj4 = obj3[j];
                obj2 = (ThreadContainer)idTable.get(obj4);
                obj = obj2;
                if (obj2 == null)
                {
                    obj = new ThreadContainer();
                    idTable.put(obj4, obj);
                }
                if (threadable != null && ((ThreadContainer) (obj)).parent == null && threadable != obj && !((ThreadContainer) (obj)).findChild(threadable))
                {
                    obj.parent = threadable;
                    obj.next = ((ThreadContainer) (threadable)).child;
                    threadable.child = ((ThreadContainer) (obj));
                }
                threadable = ((Threadable) (obj));
            }

            obj = threadable;
            if (threadable == null)
            {
                break label0;
            }
            if (threadable != obj1)
            {
                obj = threadable;
                if (!((ThreadContainer) (obj1)).findChild(threadable))
                {
                    break label0;
                }
            }
            obj = null;
        }
        if (((ThreadContainer) (obj1)).parent != null)
        {
            Threadable threadable1 = null;
            threadable = ((ThreadContainer) (obj1)).parent.child;
            do
            {
                if (threadable == null || threadable == obj1)
                {
                    if (threadable == null)
                    {
                        throw new RuntimeException((new StringBuilder()).append("Didnt find ").append(obj1).append(" in parent").append(((ThreadContainer) (obj1)).parent).toString());
                    }
                    break;
                }
                threadable1 = threadable;
                threadable = ((ThreadContainer) (threadable)).next;
            } while (true);
            if (threadable1 == null)
            {
                ((ThreadContainer) (obj1)).parent.child = ((ThreadContainer) (obj1)).next;
            } else
            {
                threadable1.next = ((ThreadContainer) (obj1)).next;
            }
            obj1.next = null;
            obj1.parent = null;
        }
        if (obj != null)
        {
            obj1.parent = ((ThreadContainer) (obj));
            obj1.next = ((ThreadContainer) (obj)).child;
            obj.child = ((ThreadContainer) (obj1));
        }
    }

    private ThreadContainer findRootSet()
    {
        ThreadContainer threadcontainer = new ThreadContainer();
        Iterator iterator = idTable.keySet().iterator();
        do
        {
            if (!iterator.hasNext())
            {
                break;
            }
            Object obj = iterator.next();
            obj = (ThreadContainer)idTable.get(obj);
            if (((ThreadContainer) (obj)).parent == null)
            {
                if (((ThreadContainer) (obj)).next != null)
                {
                    throw new RuntimeException((new StringBuilder()).append("c.next is ").append(((ThreadContainer) (obj)).next.toString()).toString());
                }
                obj.next = threadcontainer.child;
                threadcontainer.child = ((ThreadContainer) (obj));
            }
        } while (true);
        return threadcontainer;
    }

    private void gatherSubjects()
    {
        ThreadContainer threadcontainer1;
        HashMap hashmap;
        int i;
        i = 0;
        for (ThreadContainer threadcontainer = root.child; threadcontainer != null; threadcontainer = threadcontainer.next)
        {
            i++;
        }

        hashmap = new HashMap((int)((double)i * 1.2D), 0.9F);
        i = 0;
        threadcontainer1 = root.child;
_L2:
        Object obj;
        int j;
        if (threadcontainer1 == null)
        {
            break MISSING_BLOCK_LABEL_219;
        }
        Threadable threadable = threadcontainer1.threadable;
        obj = threadable;
        if (threadable == null)
        {
            obj = threadcontainer1.child.threadable;
        }
        obj = ((Threadable) (obj)).simplifiedSubject();
        j = i;
        if (obj != null)
        {
            if (((String) (obj)).length() != 0)
            {
                break; /* Loop/switch isn't completed */
            }
            j = i;
        }
_L6:
        threadcontainer1 = threadcontainer1.next;
        i = j;
        if (true) goto _L2; else goto _L1
_L1:
        ThreadContainer threadcontainer4 = (ThreadContainer)hashmap.get(obj);
        if (threadcontainer4 == null || threadcontainer1.threadable == null && threadcontainer4.threadable != null) goto _L4; else goto _L3
_L3:
        j = i;
        if (threadcontainer4.threadable == null) goto _L6; else goto _L5
_L5:
        j = i;
        if (!threadcontainer4.threadable.subjectIsReply()) goto _L6; else goto _L7
_L7:
        j = i;
        if (threadcontainer1.threadable == null) goto _L6; else goto _L8
_L8:
        j = i;
        if (threadcontainer1.threadable.subjectIsReply()) goto _L6; else goto _L4
_L4:
        hashmap.put(obj, threadcontainer1);
        j = i + 1;
          goto _L6
        if (i == 0)
        {
            return;
        }
        ThreadContainer threadcontainer5 = null;
        ThreadContainer threadcontainer3 = root.child;
        ThreadContainer threadcontainer2 = threadcontainer3.next;
        while (threadcontainer3 != null) 
        {
            Object obj2 = threadcontainer3.threadable;
            Object obj1 = obj2;
            if (obj2 == null)
            {
                obj1 = threadcontainer3.child.threadable;
            }
            obj2 = ((Threadable) (obj1)).simplifiedSubject();
            obj1 = threadcontainer3;
            if (obj2 != null)
            {
                if (((String) (obj2)).length() == 0)
                {
                    obj1 = threadcontainer3;
                } else
                {
                    obj2 = (ThreadContainer)hashmap.get(obj2);
                    obj1 = threadcontainer3;
                    if (obj2 != threadcontainer3)
                    {
                        if (threadcontainer5 == null)
                        {
                            root.child = threadcontainer3.next;
                        } else
                        {
                            threadcontainer5.next = threadcontainer3.next;
                        }
                        threadcontainer3.next = null;
                        if (((ThreadContainer) (obj2)).threadable == null && threadcontainer3.threadable == null)
                        {
                            for (obj1 = ((ThreadContainer) (obj2)).child; obj1 != null && ((ThreadContainer) (obj1)).next != null; obj1 = ((ThreadContainer) (obj1)).next) { }
                            if (obj1 != null)
                            {
                                obj1.next = threadcontainer3.child;
                            }
                            for (obj1 = threadcontainer3.child; obj1 != null; obj1 = ((ThreadContainer) (obj1)).next)
                            {
                                obj1.parent = ((ThreadContainer) (obj2));
                            }

                            threadcontainer3.child = null;
                        } else
                        if (((ThreadContainer) (obj2)).threadable == null || threadcontainer3.threadable != null && threadcontainer3.threadable.subjectIsReply() && !((ThreadContainer) (obj2)).threadable.subjectIsReply())
                        {
                            threadcontainer3.parent = ((ThreadContainer) (obj2));
                            threadcontainer3.next = ((ThreadContainer) (obj2)).child;
                            obj2.child = threadcontainer3;
                        } else
                        {
                            ThreadContainer threadcontainer7 = new ThreadContainer();
                            threadcontainer7.threadable = ((ThreadContainer) (obj2)).threadable;
                            threadcontainer7.child = ((ThreadContainer) (obj2)).child;
                            for (ThreadContainer threadcontainer6 = threadcontainer7.child; threadcontainer6 != null; threadcontainer6 = threadcontainer6.next)
                            {
                                threadcontainer6.parent = threadcontainer7;
                            }

                            obj2.threadable = null;
                            obj2.child = null;
                            threadcontainer3.parent = ((ThreadContainer) (obj2));
                            threadcontainer7.parent = ((ThreadContainer) (obj2));
                            obj2.child = threadcontainer3;
                            threadcontainer3.next = threadcontainer7;
                        }
                        obj1 = threadcontainer5;
                    }
                }
            }
            threadcontainer5 = ((ThreadContainer) (obj1));
            threadcontainer3 = threadcontainer2;
            if (threadcontainer2 == null)
            {
                threadcontainer2 = null;
            } else
            {
                threadcontainer2 = threadcontainer2.next;
            }
        }
        hashmap.clear();
        return;
    }

    private void pruneEmptyContainers(ThreadContainer threadcontainer)
    {
        ThreadContainer threadcontainer1 = null;
        ThreadContainer threadcontainer2 = threadcontainer.child;
        ThreadContainer threadcontainer3 = threadcontainer2.next;
        while (threadcontainer2 != null) 
        {
            ThreadContainer threadcontainer4;
            if (threadcontainer2.threadable == null && threadcontainer2.child == null)
            {
                if (threadcontainer1 == null)
                {
                    threadcontainer.child = threadcontainer2.next;
                } else
                {
                    threadcontainer1.next = threadcontainer2.next;
                }
                threadcontainer4 = threadcontainer3;
            } else
            if (threadcontainer2.threadable == null && threadcontainer2.child != null && (threadcontainer2.parent != null || threadcontainer2.child.next == null))
            {
                threadcontainer3 = threadcontainer2.child;
                if (threadcontainer1 == null)
                {
                    threadcontainer.child = threadcontainer3;
                } else
                {
                    threadcontainer1.next = threadcontainer3;
                }
                for (threadcontainer4 = threadcontainer3; threadcontainer4.next != null; threadcontainer4 = threadcontainer4.next)
                {
                    threadcontainer4.parent = threadcontainer2.parent;
                }

                threadcontainer4.parent = threadcontainer2.parent;
                threadcontainer4.next = threadcontainer2.next;
                threadcontainer4 = threadcontainer3;
            } else
            {
                threadcontainer1 = threadcontainer2;
                threadcontainer4 = threadcontainer3;
                if (threadcontainer2.child != null)
                {
                    pruneEmptyContainers(threadcontainer2);
                    threadcontainer1 = threadcontainer2;
                    threadcontainer4 = threadcontainer3;
                }
            }
            threadcontainer2 = threadcontainer4;
            if (threadcontainer2 == null)
            {
                threadcontainer3 = null;
            } else
            {
                threadcontainer3 = threadcontainer2.next;
            }
        }
    }

    public Threadable thread(Iterable iterable)
    {
        if (iterable == null)
        {
            return null;
        }
        idTable = new HashMap();
        iterable = iterable.iterator();
        do
        {
            if (!iterable.hasNext())
            {
                break;
            }
            Threadable threadable = (Threadable)iterable.next();
            if (!threadable.isDummy())
            {
                buildContainer(threadable);
            }
        } while (true);
        root = findRootSet();
        idTable.clear();
        idTable = null;
        pruneEmptyContainers(root);
        root.reverseChildren();
        gatherSubjects();
        if (root.next != null)
        {
            throw new RuntimeException((new StringBuilder()).append("root node has a next:").append(root).toString());
        }
        for (iterable = root.child; iterable != null; iterable = ((ThreadContainer) (iterable)).next)
        {
            if (((ThreadContainer) (iterable)).threadable == null)
            {
                iterable.threadable = ((ThreadContainer) (iterable)).child.threadable.makeDummy();
            }
        }

        if (root.child == null)
        {
            iterable = null;
        } else
        {
            iterable = root.child.threadable;
        }
        root.flush();
        root = null;
        return iterable;
    }

    public Threadable thread(List list)
    {
        return thread(((Iterable) (list)));
    }

    public Threadable thread(Threadable athreadable[])
    {
        return thread(Arrays.asList(athreadable));
    }
}
