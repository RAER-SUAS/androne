// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.api;

import ioio.lib.api.exception.ConnectionLostException;

// Referenced classes of package ioio.lib.api:
//            Closeable

public interface IcspMaster
    extends Closeable
{

    public abstract void enterProgramming()
        throws ConnectionLostException;

    public abstract void executeInstruction(int i)
        throws ConnectionLostException;

    public abstract void exitProgramming()
        throws ConnectionLostException;

    public abstract void readVisi()
        throws ConnectionLostException, InterruptedException;

    public abstract int waitVisiResult()
        throws ConnectionLostException, InterruptedException;
}
