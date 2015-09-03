// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;


public final class NewsgroupInfo
{

    public static final int MODERATED_POSTING_PERMISSION = 1;
    public static final int PERMITTED_POSTING_PERMISSION = 2;
    public static final int PROHIBITED_POSTING_PERMISSION = 3;
    public static final int UNKNOWN_POSTING_PERMISSION = 0;
    private long __estimatedArticleCount;
    private long __firstArticle;
    private long __lastArticle;
    private String __newsgroup;
    private int __postingPermission;

    public NewsgroupInfo()
    {
    }

    void _setArticleCount(long l)
    {
        __estimatedArticleCount = l;
    }

    void _setFirstArticle(long l)
    {
        __firstArticle = l;
    }

    void _setLastArticle(long l)
    {
        __lastArticle = l;
    }

    void _setNewsgroup(String s)
    {
        __newsgroup = s;
    }

    void _setPostingPermission(int i)
    {
        __postingPermission = i;
    }

    public int getArticleCount()
    {
        return (int)__estimatedArticleCount;
    }

    public long getArticleCountLong()
    {
        return __estimatedArticleCount;
    }

    public int getFirstArticle()
    {
        return (int)__firstArticle;
    }

    public long getFirstArticleLong()
    {
        return __firstArticle;
    }

    public int getLastArticle()
    {
        return (int)__lastArticle;
    }

    public long getLastArticleLong()
    {
        return __lastArticle;
    }

    public String getNewsgroup()
    {
        return __newsgroup;
    }

    public int getPostingPermission()
    {
        return __postingPermission;
    }
}
