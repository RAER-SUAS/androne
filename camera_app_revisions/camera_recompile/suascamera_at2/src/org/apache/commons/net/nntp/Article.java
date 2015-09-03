// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.nntp;

import java.io.PrintStream;
import java.util.ArrayList;

// Referenced classes of package org.apache.commons.net.nntp:
//            Threadable

public class Article
    implements Threadable
{

    private String articleId;
    private long articleNumber;
    private String date;
    private String from;
    private boolean isReply;
    public Article kid;
    public Article next;
    private ArrayList references;
    private String simplifiedSubject;
    private String subject;

    public Article()
    {
        isReply = false;
        articleNumber = -1L;
    }

    private void flushSubjectCache()
    {
        simplifiedSubject = null;
    }

    public static void printThread(Article article, int i)
    {
        for (int j = 0; j < i; j++)
        {
            System.out.print("==>");
        }

        System.out.println((new StringBuilder()).append(article.getSubject()).append("\t").append(article.getFrom()).append("\t").append(article.getArticleId()).toString());
        if (article.kid != null)
        {
            printThread(article.kid, i + 1);
        }
        if (article.next != null)
        {
            printThread(article.next, i);
        }
    }

    private void simplifySubject()
    {
        String s;
        int i;
        boolean flag;
        int l;
        i = 0;
        s = getSubject();
        l = s.length();
        flag = false;
_L11:
        int j;
        boolean flag1;
        if (flag)
        {
            break; /* Loop/switch isn't completed */
        }
        flag1 = true;
        for (j = i; j < l && s.charAt(j) == ' '; j++) { }
        flag = flag1;
        i = j;
        if (j >= l - 2) goto _L2; else goto _L1
_L1:
        if (s.charAt(j) == 'r') goto _L4; else goto _L3
_L3:
        flag = flag1;
        i = j;
        if (s.charAt(j) != 'R') goto _L2; else goto _L4
_L4:
        if (s.charAt(j + 1) == 'e') goto _L6; else goto _L5
_L5:
        flag = flag1;
        i = j;
        if (s.charAt(j + 1) != 'E') goto _L2; else goto _L6
_L6:
        if (s.charAt(j + 2) != ':') goto _L8; else goto _L7
_L7:
        i = j + 3;
        flag = false;
_L2:
        if ("(no subject)".equals(simplifiedSubject))
        {
            simplifiedSubject = "";
        }
        for (j = l; j > i && s.charAt(j - 1) < ' '; j--) { }
        break; /* Loop/switch isn't completed */
_L8:
        flag = flag1;
        i = j;
        if (j >= l - 2)
        {
            continue; /* Loop/switch isn't completed */
        }
        if (s.charAt(j + 2) != '[')
        {
            flag = flag1;
            i = j;
            if (s.charAt(j + 2) != '(')
            {
                continue; /* Loop/switch isn't completed */
            }
        }
        int k;
        for (k = j + 3; k < l && s.charAt(k) >= '0' && s.charAt(k) <= '9'; k++) { }
        flag = flag1;
        i = j;
        if (k >= l - 1)
        {
            continue; /* Loop/switch isn't completed */
        }
        if (s.charAt(k) != ']')
        {
            flag = flag1;
            i = j;
            if (s.charAt(k) != ')')
            {
                continue; /* Loop/switch isn't completed */
            }
        }
        flag = flag1;
        i = j;
        if (s.charAt(k + 1) == ':')
        {
            i = k + 2;
            flag = false;
        }
        if (true) goto _L2; else goto _L9
_L9:
        if (i == 0 && j == l)
        {
            simplifiedSubject = s;
        } else
        {
            simplifiedSubject = s.substring(i, j);
        }
        if (true) goto _L11; else goto _L10
_L10:
    }

    public void addHeaderField(String s, String s1)
    {
    }

    public void addReference(String s)
    {
        if (s != null && s.length() != 0)
        {
            if (references == null)
            {
                references = new ArrayList();
            }
            isReply = true;
            s = s.split(" ");
            int j = s.length;
            int i = 0;
            while (i < j) 
            {
                Object obj = s[i];
                references.add(obj);
                i++;
            }
        }
    }

    public String getArticleId()
    {
        return articleId;
    }

    public int getArticleNumber()
    {
        return (int)articleNumber;
    }

    public long getArticleNumberLong()
    {
        return articleNumber;
    }

    public String getDate()
    {
        return date;
    }

    public String getFrom()
    {
        return from;
    }

    public String[] getReferences()
    {
        if (references == null)
        {
            return new String[0];
        } else
        {
            return (String[])references.toArray(new String[references.size()]);
        }
    }

    public String getSubject()
    {
        return subject;
    }

    public boolean isDummy()
    {
        return articleNumber == -1L;
    }

    public Threadable makeDummy()
    {
        return new Article();
    }

    public String messageThreadId()
    {
        return articleId;
    }

    public String[] messageThreadReferences()
    {
        return getReferences();
    }

    public void setArticleId(String s)
    {
        articleId = s;
    }

    public void setArticleNumber(int i)
    {
        articleNumber = i;
    }

    public void setArticleNumber(long l)
    {
        articleNumber = l;
    }

    public void setChild(Threadable threadable)
    {
        kid = (Article)threadable;
        flushSubjectCache();
    }

    public void setDate(String s)
    {
        date = s;
    }

    public void setFrom(String s)
    {
        from = s;
    }

    public void setNext(Threadable threadable)
    {
        next = (Article)threadable;
        flushSubjectCache();
    }

    public void setSubject(String s)
    {
        subject = s;
    }

    public String simplifiedSubject()
    {
        if (simplifiedSubject == null)
        {
            simplifySubject();
        }
        return simplifiedSubject;
    }

    public boolean subjectIsReply()
    {
        return isReply;
    }

    public String toString()
    {
        return (new StringBuilder()).append(articleNumber).append(" ").append(articleId).append(" ").append(subject).toString();
    }
}
