// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Vector;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.io.DotTerminatedMessageReader;
import org.apache.commons.net.io.DotTerminatedMessageWriter;
import org.apache.commons.net.io.Util;

// Referenced classes of package org.apache.commons.net.nntp:
//            NNTP, ArticleInfo, ArticlePointer, Article, 
//            NewsgroupInfo, NNTPReply, ArticleIterator, ReplyIterator, 
//            NewGroupsOrNewsQuery, NewsgroupIterator

public class NNTPClient extends NNTP
{

    public NNTPClient()
    {
    }

    private void __ai2ap(ArticleInfo articleinfo, ArticlePointer articlepointer)
    {
        if (articlepointer != null)
        {
            articlepointer.articleId = articleinfo.articleId;
            articlepointer.articleNumber = (int)articleinfo.articleNumber;
        }
    }

    private ArticleInfo __ap2ai(ArticlePointer articlepointer)
    {
        if (articlepointer == null)
        {
            return null;
        } else
        {
            return new ArticleInfo();
        }
    }

    static Article __parseArticleEntry(String s)
    {
        Article article = new Article();
        article.setSubject(s);
        s = s.split("\t");
        if (s.length <= 6)
        {
            break MISSING_BLOCK_LABEL_104;
        }
        int j = 0 + 1;
        int i = j;
        int k;
        try
        {
            article.setArticleNumber(Long.parseLong(s[0]));
        }
        // Misplaced declaration of an exception variable
        catch (String s)
        {
            return article;
        }
        k = j + 1;
        try
        {
            article.setSubject(s[j]);
        }
        // Misplaced declaration of an exception variable
        catch (String s)
        {
            return article;
        }
        j = k + 1;
        i = j;
        article.setFrom(s[k]);
        k = j + 1;
        article.setDate(s[j]);
        j = k + 1;
        i = j;
        article.setArticleId(s[k]);
        article.addReference(s[j]);
        return article;
    }

    private void __parseArticlePointer(String s, ArticleInfo articleinfo)
        throws MalformedServerReplyException
    {
        String as[];
        int i;
        as = s.split(" ");
        if (as.length < 3)
        {
            break MISSING_BLOCK_LABEL_38;
        }
        i = 1 + 1;
        articleinfo.articleNumber = Long.parseLong(as[1]);
        try
        {
            articleinfo.articleId = as[i];
            return;
        }
        // Misplaced declaration of an exception variable
        catch (ArticleInfo articleinfo) { }
        break MISSING_BLOCK_LABEL_38;
        articleinfo;
        throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse article pointer.\nServer reply: ").append(s).toString());
    }

    private static void __parseGroupReply(String s, NewsgroupInfo newsgroupinfo)
        throws MalformedServerReplyException
    {
        String as[];
        int k;
        as = s.split(" ");
        if (as.length < 5)
        {
            break MISSING_BLOCK_LABEL_83;
        }
        k = 1 + 1;
        int i = k;
        newsgroupinfo._setArticleCount(Long.parseLong(as[1]));
        int l = k + 1;
        newsgroupinfo._setFirstArticle(Long.parseLong(as[k]));
        k = l + 1;
        int j = k;
        newsgroupinfo._setLastArticle(Long.parseLong(as[l]));
        try
        {
            newsgroupinfo._setNewsgroup(as[k]);
            newsgroupinfo._setPostingPermission(0);
            return;
        }
        // Misplaced declaration of an exception variable
        catch (NewsgroupInfo newsgroupinfo) { }
        break MISSING_BLOCK_LABEL_83;
        newsgroupinfo;
        throw new MalformedServerReplyException((new StringBuilder()).append("Could not parse newsgroup info.\nServer reply: ").append(s).toString());
    }

    static NewsgroupInfo __parseNewsgroupListEntry(String s)
    {
        NewsgroupInfo newsgroupinfo;
        int i;
        int j;
        s = s.split(" ");
        if (s.length < 4)
        {
            return null;
        }
        newsgroupinfo = new NewsgroupInfo();
        j = 0 + 1;
        newsgroupinfo._setNewsgroup(s[0]);
        i = j + 1;
        long l = Long.parseLong(s[j]);
        j = i + 1;
        long l1;
        l1 = Long.parseLong(s[i]);
        newsgroupinfo._setFirstArticle(l1);
        newsgroupinfo._setLastArticle(l);
        if (l1 != 0L || l != 0L)
        {
            break MISSING_BLOCK_LABEL_163;
        }
        newsgroupinfo._setArticleCount(0L);
_L1:
        switch (s[j].charAt(0))
        {
        default:
            newsgroupinfo._setPostingPermission(0);
            return newsgroupinfo;

        case 89: // 'Y'
        case 121: // 'y'
            newsgroupinfo._setPostingPermission(2);
            return newsgroupinfo;

        case 78: // 'N'
        case 110: // 'n'
            newsgroupinfo._setPostingPermission(3);
            return newsgroupinfo;

        case 77: // 'M'
        case 109: // 'm'
            newsgroupinfo._setPostingPermission(1);
            return newsgroupinfo;
        }
        newsgroupinfo._setArticleCount((l - l1) + 1L);
          goto _L1
        s;
_L3:
        return null;
        s;
        if (true) goto _L3; else goto _L2
_L2:
    }

    private NewsgroupInfo[] __readNewsgroupListing()
        throws IOException
    {
        DotTerminatedMessageReader dotterminatedmessagereader;
        Object obj;
        dotterminatedmessagereader = new DotTerminatedMessageReader(_reader_);
        obj = new Vector(2048);
_L1:
        String s = dotterminatedmessagereader.readLine();
        if (s == null)
        {
            break MISSING_BLOCK_LABEL_68;
        }
        NewsgroupInfo newsgroupinfo = __parseNewsgroupListEntry(s);
        if (newsgroupinfo == null)
        {
            break MISSING_BLOCK_LABEL_59;
        }
        ((Vector) (obj)).addElement(newsgroupinfo);
          goto _L1
        obj;
        dotterminatedmessagereader.close();
        throw obj;
        throw new MalformedServerReplyException(s);
        dotterminatedmessagereader.close();
        int i = ((Vector) (obj)).size();
        if (i < 1)
        {
            return new NewsgroupInfo[0];
        } else
        {
            NewsgroupInfo anewsgroupinfo[] = new NewsgroupInfo[i];
            ((Vector) (obj)).copyInto(anewsgroupinfo);
            return anewsgroupinfo;
        }
    }

    private BufferedReader __retrieve(int i, long l, ArticleInfo articleinfo)
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(sendCommand(i, Long.toString(l))))
        {
            return null;
        }
        if (articleinfo != null)
        {
            __parseArticlePointer(getReplyString(), articleinfo);
        }
        return new DotTerminatedMessageReader(_reader_);
    }

    private BufferedReader __retrieve(int i, String s, ArticleInfo articleinfo)
        throws IOException
    {
        if (s == null ? !NNTPReply.isPositiveCompletion(sendCommand(i)) : !NNTPReply.isPositiveCompletion(sendCommand(i, s)))
        {
            return null;
        }
        if (articleinfo != null)
        {
            __parseArticlePointer(getReplyString(), articleinfo);
        }
        return new DotTerminatedMessageReader(_reader_);
    }

    private BufferedReader __retrieveArticleInfo(String s)
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(xover(s)))
        {
            return null;
        } else
        {
            return new DotTerminatedMessageReader(_reader_);
        }
    }

    private BufferedReader __retrieveHeader(String s, String s1)
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(xhdr(s, s1)))
        {
            return null;
        } else
        {
            return new DotTerminatedMessageReader(_reader_);
        }
    }

    public boolean authenticate(String s, String s1)
        throws IOException
    {
        if (authinfoUser(s) == 381 && authinfoPass(s1) == 281)
        {
            _isAllowedToPost = true;
            return true;
        } else
        {
            return false;
        }
    }

    public boolean completePendingCommand()
        throws IOException
    {
        return NNTPReply.isPositiveCompletion(getReply());
    }

    public Writer forwardArticle(String s)
        throws IOException
    {
        if (!NNTPReply.isPositiveIntermediate(ihave(s)))
        {
            return null;
        } else
        {
            return new DotTerminatedMessageWriter(_writer_);
        }
    }

    public Iterable iterateArticleInfo(long l, long l1)
        throws IOException
    {
        BufferedReader bufferedreader = retrieveArticleInfo(l, l1);
        if (bufferedreader == null)
        {
            throw new IOException((new StringBuilder()).append("XOVER command failed: ").append(getReplyString()).toString());
        } else
        {
            return new ArticleIterator(new ReplyIterator(bufferedreader, false));
        }
    }

    public Iterable iterateNewNews(NewGroupsOrNewsQuery newgroupsornewsquery)
        throws IOException
    {
        if (NNTPReply.isPositiveCompletion(newnews(newgroupsornewsquery.getNewsgroups(), newgroupsornewsquery.getDate(), newgroupsornewsquery.getTime(), newgroupsornewsquery.isGMT(), newgroupsornewsquery.getDistributions())))
        {
            return new ReplyIterator(_reader_);
        } else
        {
            throw new IOException((new StringBuilder()).append("NEWNEWS command failed: ").append(getReplyString()).toString());
        }
    }

    public Iterable iterateNewNewsgroupListing(NewGroupsOrNewsQuery newgroupsornewsquery)
        throws IOException
    {
        if (NNTPReply.isPositiveCompletion(newgroups(newgroupsornewsquery.getDate(), newgroupsornewsquery.getTime(), newgroupsornewsquery.isGMT(), newgroupsornewsquery.getDistributions())))
        {
            return new ReplyIterator(_reader_);
        } else
        {
            throw new IOException((new StringBuilder()).append("NEWGROUPS command failed: ").append(getReplyString()).toString());
        }
    }

    public Iterable iterateNewNewsgroups(NewGroupsOrNewsQuery newgroupsornewsquery)
        throws IOException
    {
        return new NewsgroupIterator(iterateNewNewsgroupListing(newgroupsornewsquery));
    }

    public Iterable iterateNewsgroupListing()
        throws IOException
    {
        if (NNTPReply.isPositiveCompletion(list()))
        {
            return new ReplyIterator(_reader_);
        } else
        {
            throw new IOException((new StringBuilder()).append("LIST command failed: ").append(getReplyString()).toString());
        }
    }

    public Iterable iterateNewsgroupListing(String s)
        throws IOException
    {
        if (NNTPReply.isPositiveCompletion(listActive(s)))
        {
            return new ReplyIterator(_reader_);
        } else
        {
            throw new IOException((new StringBuilder()).append("LIST ACTIVE ").append(s).append(" command failed: ").append(getReplyString()).toString());
        }
    }

    public Iterable iterateNewsgroups()
        throws IOException
    {
        return new NewsgroupIterator(iterateNewsgroupListing());
    }

    public Iterable iterateNewsgroups(String s)
        throws IOException
    {
        return new NewsgroupIterator(iterateNewsgroupListing(s));
    }

    public String listHelp()
        throws IOException
    {
        if (!NNTPReply.isInformational(help()))
        {
            return null;
        } else
        {
            StringWriter stringwriter = new StringWriter();
            DotTerminatedMessageReader dotterminatedmessagereader = new DotTerminatedMessageReader(_reader_);
            Util.copyReader(dotterminatedmessagereader, stringwriter);
            dotterminatedmessagereader.close();
            stringwriter.close();
            return stringwriter.toString();
        }
    }

    public String[] listNewNews(NewGroupsOrNewsQuery newgroupsornewsquery)
        throws IOException
    {
        DotTerminatedMessageReader dotterminatedmessagereader;
        if (!NNTPReply.isPositiveCompletion(newnews(newgroupsornewsquery.getNewsgroups(), newgroupsornewsquery.getDate(), newgroupsornewsquery.getTime(), newgroupsornewsquery.isGMT(), newgroupsornewsquery.getDistributions())))
        {
            return null;
        }
        newgroupsornewsquery = new Vector();
        dotterminatedmessagereader = new DotTerminatedMessageReader(_reader_);
_L1:
        String s = dotterminatedmessagereader.readLine();
        if (s == null)
        {
            break MISSING_BLOCK_LABEL_76;
        }
        newgroupsornewsquery.addElement(s);
          goto _L1
        newgroupsornewsquery;
        dotterminatedmessagereader.close();
        throw newgroupsornewsquery;
        dotterminatedmessagereader.close();
        int i = newgroupsornewsquery.size();
        if (i < 1)
        {
            return new String[0];
        } else
        {
            String as[] = new String[i];
            newgroupsornewsquery.copyInto(as);
            return as;
        }
    }

    public NewsgroupInfo[] listNewNewsgroups(NewGroupsOrNewsQuery newgroupsornewsquery)
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(newgroups(newgroupsornewsquery.getDate(), newgroupsornewsquery.getTime(), newgroupsornewsquery.isGMT(), newgroupsornewsquery.getDistributions())))
        {
            return null;
        } else
        {
            return __readNewsgroupListing();
        }
    }

    public NewsgroupInfo[] listNewsgroups()
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(list()))
        {
            return null;
        } else
        {
            return __readNewsgroupListing();
        }
    }

    public NewsgroupInfo[] listNewsgroups(String s)
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(listActive(s)))
        {
            return null;
        } else
        {
            return __readNewsgroupListing();
        }
    }

    public String[] listOverviewFmt()
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(sendCommand("LIST", "OVERVIEW.FMT")))
        {
            return null;
        }
        DotTerminatedMessageReader dotterminatedmessagereader = new DotTerminatedMessageReader(_reader_);
        ArrayList arraylist = new ArrayList();
        do
        {
            String s = dotterminatedmessagereader.readLine();
            if (s != null)
            {
                arraylist.add(s);
            } else
            {
                dotterminatedmessagereader.close();
                return (String[])arraylist.toArray(new String[arraylist.size()]);
            }
        } while (true);
    }

    public boolean logout()
        throws IOException
    {
        return NNTPReply.isPositiveCompletion(quit());
    }

    public Writer postArticle()
        throws IOException
    {
        if (!NNTPReply.isPositiveIntermediate(post()))
        {
            return null;
        } else
        {
            return new DotTerminatedMessageWriter(_writer_);
        }
    }

    public BufferedReader retrieveArticle(long l)
        throws IOException
    {
        return retrieveArticle(l, ((ArticleInfo) (null)));
    }

    public BufferedReader retrieveArticle(long l, ArticleInfo articleinfo)
        throws IOException
    {
        return __retrieve(0, l, articleinfo);
    }

    public BufferedReader retrieveArticle(String s, ArticleInfo articleinfo)
        throws IOException
    {
        return __retrieve(0, s, articleinfo);
    }

    public Reader retrieveArticle()
        throws IOException
    {
        return retrieveArticle((String)null);
    }

    public Reader retrieveArticle(int i)
        throws IOException
    {
        return retrieveArticle(i);
    }

    public Reader retrieveArticle(int i, ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        BufferedReader bufferedreader = retrieveArticle(i, articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return bufferedreader;
    }

    public Reader retrieveArticle(String s)
        throws IOException
    {
        return retrieveArticle(s, (ArticleInfo)null);
    }

    public Reader retrieveArticle(String s, ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        s = retrieveArticle(s, articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return s;
    }

    public BufferedReader retrieveArticleBody(long l)
        throws IOException
    {
        return retrieveArticleBody(l, ((ArticleInfo) (null)));
    }

    public BufferedReader retrieveArticleBody(long l, ArticleInfo articleinfo)
        throws IOException
    {
        return __retrieve(1, l, articleinfo);
    }

    public BufferedReader retrieveArticleBody(String s, ArticleInfo articleinfo)
        throws IOException
    {
        return __retrieve(1, s, articleinfo);
    }

    public Reader retrieveArticleBody()
        throws IOException
    {
        return retrieveArticleBody(((String) (null)));
    }

    public Reader retrieveArticleBody(int i)
        throws IOException
    {
        return retrieveArticleBody(i);
    }

    public Reader retrieveArticleBody(int i, ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        BufferedReader bufferedreader = retrieveArticleBody(i, articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return bufferedreader;
    }

    public Reader retrieveArticleBody(String s)
        throws IOException
    {
        return retrieveArticleBody(s, (ArticleInfo)null);
    }

    public Reader retrieveArticleBody(String s, ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        s = retrieveArticleBody(s, articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return s;
    }

    public BufferedReader retrieveArticleHeader(long l)
        throws IOException
    {
        return retrieveArticleHeader(l, ((ArticleInfo) (null)));
    }

    public BufferedReader retrieveArticleHeader(long l, ArticleInfo articleinfo)
        throws IOException
    {
        return __retrieve(3, l, articleinfo);
    }

    public BufferedReader retrieveArticleHeader(String s, ArticleInfo articleinfo)
        throws IOException
    {
        return __retrieve(3, s, articleinfo);
    }

    public Reader retrieveArticleHeader()
        throws IOException
    {
        return retrieveArticleHeader((String)null);
    }

    public Reader retrieveArticleHeader(int i)
        throws IOException
    {
        return retrieveArticleHeader(i);
    }

    public Reader retrieveArticleHeader(int i, ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        BufferedReader bufferedreader = retrieveArticleHeader(i, articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return bufferedreader;
    }

    public Reader retrieveArticleHeader(String s)
        throws IOException
    {
        return retrieveArticleHeader(s, (ArticleInfo)null);
    }

    public Reader retrieveArticleHeader(String s, ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        s = retrieveArticleHeader(s, articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return s;
    }

    public BufferedReader retrieveArticleInfo(long l)
        throws IOException
    {
        return __retrieveArticleInfo(Long.toString(l));
    }

    public BufferedReader retrieveArticleInfo(long l, long l1)
        throws IOException
    {
        return __retrieveArticleInfo((new StringBuilder()).append(l).append("-").append(l1).toString());
    }

    public Reader retrieveArticleInfo(int i)
        throws IOException
    {
        return retrieveArticleInfo(i);
    }

    public Reader retrieveArticleInfo(int i, int j)
        throws IOException
    {
        return retrieveArticleInfo(i, j);
    }

    public BufferedReader retrieveHeader(String s, long l)
        throws IOException
    {
        return __retrieveHeader(s, Long.toString(l));
    }

    public BufferedReader retrieveHeader(String s, long l, long l1)
        throws IOException
    {
        return __retrieveHeader(s, (new StringBuilder()).append(l).append("-").append(l1).toString());
    }

    public Reader retrieveHeader(String s, int i)
        throws IOException
    {
        return retrieveHeader(s, i);
    }

    public Reader retrieveHeader(String s, int i, int j)
        throws IOException
    {
        return retrieveHeader(s, i, j);
    }

    public boolean selectArticle(int i)
        throws IOException
    {
        return selectArticle(i);
    }

    public boolean selectArticle(int i, ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        boolean flag = selectArticle(i, articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return flag;
    }

    public boolean selectArticle(long l)
        throws IOException
    {
        return selectArticle(l, ((ArticleInfo) (null)));
    }

    public boolean selectArticle(long l, ArticleInfo articleinfo)
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(stat(l)))
        {
            return false;
        }
        if (articleinfo != null)
        {
            __parseArticlePointer(getReplyString(), articleinfo);
        }
        return true;
    }

    public boolean selectArticle(String s)
        throws IOException
    {
        return selectArticle(s, (ArticleInfo)null);
    }

    public boolean selectArticle(String s, ArticleInfo articleinfo)
        throws IOException
    {
        if (s == null ? !NNTPReply.isPositiveCompletion(stat()) : !NNTPReply.isPositiveCompletion(stat(s)))
        {
            return false;
        }
        if (articleinfo != null)
        {
            __parseArticlePointer(getReplyString(), articleinfo);
        }
        return true;
    }

    public boolean selectArticle(String s, ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        boolean flag = selectArticle(s, articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return flag;
    }

    public boolean selectArticle(ArticleInfo articleinfo)
        throws IOException
    {
        return selectArticle(((String) (null)), articleinfo);
    }

    public boolean selectArticle(ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        boolean flag = selectArticle(articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return flag;
    }

    public boolean selectNewsgroup(String s)
        throws IOException
    {
        return selectNewsgroup(s, null);
    }

    public boolean selectNewsgroup(String s, NewsgroupInfo newsgroupinfo)
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(group(s)))
        {
            return false;
        }
        if (newsgroupinfo != null)
        {
            __parseGroupReply(getReplyString(), newsgroupinfo);
        }
        return true;
    }

    public boolean selectNextArticle()
        throws IOException
    {
        return selectNextArticle((ArticleInfo)null);
    }

    public boolean selectNextArticle(ArticleInfo articleinfo)
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(next()))
        {
            return false;
        }
        if (articleinfo != null)
        {
            __parseArticlePointer(getReplyString(), articleinfo);
        }
        return true;
    }

    public boolean selectNextArticle(ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        boolean flag = selectNextArticle(articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return flag;
    }

    public boolean selectPreviousArticle()
        throws IOException
    {
        return selectPreviousArticle((ArticleInfo)null);
    }

    public boolean selectPreviousArticle(ArticleInfo articleinfo)
        throws IOException
    {
        if (!NNTPReply.isPositiveCompletion(last()))
        {
            return false;
        }
        if (articleinfo != null)
        {
            __parseArticlePointer(getReplyString(), articleinfo);
        }
        return true;
    }

    public boolean selectPreviousArticle(ArticlePointer articlepointer)
        throws IOException
    {
        ArticleInfo articleinfo = __ap2ai(articlepointer);
        boolean flag = selectPreviousArticle(articleinfo);
        __ai2ap(articleinfo, articlepointer);
        return flag;
    }
}
