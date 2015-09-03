// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;


// Referenced classes of package ioio.lib.impl:
//            TwiMasterImpl

class this._cls0
    implements cket
{

    int addr_;
    int readSize_;
    boolean tenBitAddr_;
    final TwiMasterImpl this$0;
    byte writeData_[];
    int writeSize_;

    public int getSize()
    {
        return writeSize_ + 4;
    }

    cket()
    {
        this$0 = TwiMasterImpl.this;
        super();
    }
}
