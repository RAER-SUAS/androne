.class public interface abstract Lioio/lib/api/IOIO;
.super Ljava/lang/Object;
.source "IOIO.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/api/IOIO$State;,
        Lioio/lib/api/IOIO$VersionType;
    }
.end annotation


# static fields
.field public static final INVALID_PIN:I = -0x1

.field public static final LED_PIN:I


# virtual methods
.method public abstract beginBatch()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract disconnect()V
.end method

.method public abstract endBatch()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract getImplVersion(Lioio/lib/api/IOIO$VersionType;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract getState()Lioio/lib/api/IOIO$State;
.end method

.method public abstract hardReset()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openAnalogInput(I)Lioio/lib/api/AnalogInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openDigitalInput(I)Lioio/lib/api/DigitalInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openDigitalInput(ILioio/lib/api/DigitalInput$Spec$Mode;)Lioio/lib/api/DigitalInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openDigitalInput(Lioio/lib/api/DigitalInput$Spec;)Lioio/lib/api/DigitalInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openDigitalOutput(I)Lioio/lib/api/DigitalOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openDigitalOutput(ILioio/lib/api/DigitalOutput$Spec$Mode;Z)Lioio/lib/api/DigitalOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openDigitalOutput(IZ)Lioio/lib/api/DigitalOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openDigitalOutput(Lioio/lib/api/DigitalOutput$Spec;Z)Lioio/lib/api/DigitalOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openIcspMaster()Lioio/lib/api/IcspMaster;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openPulseInput(ILioio/lib/api/PulseInput$PulseMode;)Lioio/lib/api/PulseInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openPulseInput(Lioio/lib/api/DigitalInput$Spec;Lioio/lib/api/PulseInput$ClockRate;Lioio/lib/api/PulseInput$PulseMode;Z)Lioio/lib/api/PulseInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openPwmOutput(II)Lioio/lib/api/PwmOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openPwmOutput(Lioio/lib/api/DigitalOutput$Spec;I)Lioio/lib/api/PwmOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openSpiMaster(IIIILioio/lib/api/SpiMaster$Rate;)Lioio/lib/api/SpiMaster;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openSpiMaster(III[ILioio/lib/api/SpiMaster$Rate;)Lioio/lib/api/SpiMaster;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openSpiMaster(Lioio/lib/api/DigitalInput$Spec;Lioio/lib/api/DigitalOutput$Spec;Lioio/lib/api/DigitalOutput$Spec;[Lioio/lib/api/DigitalOutput$Spec;Lioio/lib/api/SpiMaster$Config;)Lioio/lib/api/SpiMaster;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openTwiMaster(ILioio/lib/api/TwiMaster$Rate;Z)Lioio/lib/api/TwiMaster;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openUart(IIILioio/lib/api/Uart$Parity;Lioio/lib/api/Uart$StopBits;)Lioio/lib/api/Uart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract openUart(Lioio/lib/api/DigitalInput$Spec;Lioio/lib/api/DigitalOutput$Spec;ILioio/lib/api/Uart$Parity;Lioio/lib/api/Uart$StopBits;)Lioio/lib/api/Uart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract softReset()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract waitForConnect()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Lioio/lib/api/exception/IncompatibilityException;
        }
    .end annotation
.end method

.method public abstract waitForDisconnect()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method
