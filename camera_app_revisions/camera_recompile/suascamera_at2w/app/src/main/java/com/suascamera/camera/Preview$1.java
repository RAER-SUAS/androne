// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.suascamera.camera;

import android.hardware.Camera;

// Referenced classes of package com.suascamera.camera:
//            Preview

class this._cls0
    implements android.hardware.oFocusCallback
{

    final Preview this$0;

    public void onAutoFocus(boolean flag, Camera camera)
    {
        focused = flag;
    }

    sCallback()
    {
        this$0 = Preview.this;
        super();
    }
}
