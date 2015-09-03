// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.telnet;


public abstract class TelnetOptionHandler
{

    private boolean acceptLocal;
    private boolean acceptRemote;
    private boolean doFlag;
    private boolean initialLocal;
    private boolean initialRemote;
    private int optionCode;
    private boolean willFlag;

    public TelnetOptionHandler(int i, boolean flag, boolean flag1, boolean flag2, boolean flag3)
    {
        optionCode = -1;
        initialLocal = false;
        initialRemote = false;
        acceptLocal = false;
        acceptRemote = false;
        doFlag = false;
        willFlag = false;
        optionCode = i;
        initialLocal = flag;
        initialRemote = flag1;
        acceptLocal = flag2;
        acceptRemote = flag3;
    }

    public abstract int[] answerSubnegotiation(int ai[], int i);

    public boolean getAcceptLocal()
    {
        return acceptLocal;
    }

    public boolean getAcceptRemote()
    {
        return acceptRemote;
    }

    boolean getDo()
    {
        return doFlag;
    }

    public boolean getInitLocal()
    {
        return initialLocal;
    }

    public boolean getInitRemote()
    {
        return initialRemote;
    }

    public int getOptionCode()
    {
        return optionCode;
    }

    boolean getWill()
    {
        return willFlag;
    }

    public void setAcceptLocal(boolean flag)
    {
        acceptLocal = flag;
    }

    public void setAcceptRemote(boolean flag)
    {
        acceptRemote = flag;
    }

    void setDo(boolean flag)
    {
        doFlag = flag;
    }

    public void setInitLocal(boolean flag)
    {
        initialLocal = flag;
    }

    public void setInitRemote(boolean flag)
    {
        initialRemote = flag;
    }

    void setWill(boolean flag)
    {
        willFlag = flag;
    }

    public abstract int[] startSubnegotiationLocal();

    public abstract int[] startSubnegotiationRemote();
}
