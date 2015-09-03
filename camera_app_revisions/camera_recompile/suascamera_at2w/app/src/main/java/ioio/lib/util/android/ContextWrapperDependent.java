// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.util.android;

import android.content.ContextWrapper;

public interface ContextWrapperDependent
{

    public abstract void close();

    public abstract void onCreate(ContextWrapper contextwrapper);

    public abstract void onDestroy();

    public abstract void open();

    public abstract void reopen();
}
