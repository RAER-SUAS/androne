// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;


// Referenced classes of package org.apache.commons.net.ftp:
//            FTPFileFilter, FTPFileFilters, FTPFile

static final class 
    implements FTPFileFilter
{

    public boolean accept(FTPFile ftpfile)
    {
        return ftpfile != null && ftpfile.isDirectory();
    }

    ()
    {
    }
}
