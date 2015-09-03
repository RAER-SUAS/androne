// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;

import java.util.Iterator;

// Referenced classes of package org.apache.commons.net.nntp:
//            NNTPClient, Article

class ArticleIterator
    implements Iterator, Iterable
{

    private final Iterator stringIterator;

    public ArticleIterator(Iterable iterable)
    {
        stringIterator = iterable.iterator();
    }

    public boolean hasNext()
    {
        return stringIterator.hasNext();
    }

    public Iterator iterator()
    {
        return this;
    }

    public volatile Object next()
    {
        return next();
    }

    public Article next()
    {
        return NNTPClient.__parseArticleEntry((String)stringIterator.next());
    }

    public void remove()
    {
        stringIterator.remove();
    }
}
