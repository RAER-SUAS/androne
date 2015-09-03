// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;


public interface Threadable
{

    public abstract boolean isDummy();

    public abstract Threadable makeDummy();

    public abstract String messageThreadId();

    public abstract String[] messageThreadReferences();

    public abstract void setChild(Threadable threadable);

    public abstract void setNext(Threadable threadable);

    public abstract String simplifiedSubject();

    public abstract boolean subjectIsReply();
}
