// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.suascamera.app;

import android.os.Handler;
import android.os.Message;

// Referenced classes of package com.suascamera.app:
//            MainActivity

public class parent extends Handler
{

    private MainActivity parent;
    final MainActivity this$0;

    public void handleMessage(Message message)
    {
        parent.handleMessage(message);
    }

    public (MainActivity mainactivity1)
    {
        this$0 = MainActivity.this;
        super();
        parent = mainactivity1;
    }
}
