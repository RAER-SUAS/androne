// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.util.EventListener;

// Referenced classes of package org.apache.commons.net.io:
//            CopyStreamEvent

public interface CopyStreamListener
    extends EventListener
{

    public abstract void bytesTransferred(long l, int i, long l1);

    public abstract void bytesTransferred(CopyStreamEvent copystreamevent);
}
