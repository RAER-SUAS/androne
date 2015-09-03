.class public interface abstract Lioio/lib/impl/IOIOProtocol$IncomingHandler;
.super Ljava/lang/Object;
.source "IOIOProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/IOIOProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IncomingHandler"
.end annotation


# virtual methods
.method public abstract handleAnalogPinStatus(IZ)V
.end method

.method public abstract handleCheckInterfaceResponse(Z)V
.end method

.method public abstract handleConnectionLost()V
.end method

.method public abstract handleEstablishConnection([B[B[B)V
.end method

.method public abstract handleI2cClose(I)V
.end method

.method public abstract handleI2cOpen(I)V
.end method

.method public abstract handleI2cReportTxStatus(II)V
.end method

.method public abstract handleI2cResult(II[B)V
.end method

.method public abstract handleIcspClose()V
.end method

.method public abstract handleIcspOpen()V
.end method

.method public abstract handleIcspReportRxStatus(I)V
.end method

.method public abstract handleIcspResult(I[B)V
.end method

.method public abstract handleIncapClose(I)V
.end method

.method public abstract handleIncapOpen(I)V
.end method

.method public abstract handleIncapReport(II[B)V
.end method

.method public abstract handleRegisterPeriodicDigitalSampling(II)V
.end method

.method public abstract handleReportAnalogInStatus(Ljava/util/List;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract handleReportDigitalInStatus(IZ)V
.end method

.method public abstract handleReportPeriodicDigitalInStatus(I[Z)V
.end method

.method public abstract handleSetChangeNotify(IZ)V
.end method

.method public abstract handleSoftReset()V
.end method

.method public abstract handleSpiClose(I)V
.end method

.method public abstract handleSpiData(II[BI)V
.end method

.method public abstract handleSpiOpen(I)V
.end method

.method public abstract handleSpiReportTxStatus(II)V
.end method

.method public abstract handleUartClose(I)V
.end method

.method public abstract handleUartData(II[B)V
.end method

.method public abstract handleUartOpen(I)V
.end method

.method public abstract handleUartReportTxStatus(II)V
.end method
