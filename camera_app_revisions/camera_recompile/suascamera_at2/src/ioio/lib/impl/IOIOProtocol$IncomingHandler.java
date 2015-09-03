// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import java.util.List;

// Referenced classes of package ioio.lib.impl:
//            IOIOProtocol

public static interface 
{

    public abstract void handleAnalogPinStatus(int i, boolean flag);

    public abstract void handleCheckInterfaceResponse(boolean flag);

    public abstract void handleConnectionLost();

    public abstract void handleEstablishConnection(byte abyte0[], byte abyte1[], byte abyte2[]);

    public abstract void handleI2cClose(int i);

    public abstract void handleI2cOpen(int i);

    public abstract void handleI2cReportTxStatus(int i, int j);

    public abstract void handleI2cResult(int i, int j, byte abyte0[]);

    public abstract void handleIcspClose();

    public abstract void handleIcspOpen();

    public abstract void handleIcspReportRxStatus(int i);

    public abstract void handleIcspResult(int i, byte abyte0[]);

    public abstract void handleIncapClose(int i);

    public abstract void handleIncapOpen(int i);

    public abstract void handleIncapReport(int i, int j, byte abyte0[]);

    public abstract void handleRegisterPeriodicDigitalSampling(int i, int j);

    public abstract void handleReportAnalogInStatus(List list, List list1);

    public abstract void handleReportDigitalInStatus(int i, boolean flag);

    public abstract void handleReportPeriodicDigitalInStatus(int i, boolean aflag[]);

    public abstract void handleSetChangeNotify(int i, boolean flag);

    public abstract void handleSoftReset();

    public abstract void handleSpiClose(int i);

    public abstract void handleSpiData(int i, int j, byte abyte0[], int k);

    public abstract void handleSpiOpen(int i);

    public abstract void handleSpiReportTxStatus(int i, int j);

    public abstract void handleUartClose(int i);

    public abstract void handleUartData(int i, int j, byte abyte0[]);

    public abstract void handleUartOpen(int i);

    public abstract void handleUartReportTxStatus(int i, int j);
}
