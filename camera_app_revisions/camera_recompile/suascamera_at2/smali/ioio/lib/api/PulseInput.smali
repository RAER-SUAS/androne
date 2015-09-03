.class public interface abstract Lioio/lib/api/PulseInput;
.super Ljava/lang/Object;
.source "PulseInput.java"

# interfaces
.implements Lioio/lib/api/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/api/PulseInput$ClockRate;,
        Lioio/lib/api/PulseInput$PulseMode;
    }
.end annotation


# virtual methods
.method public abstract getDuration()F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract getFrequency()F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract waitPulseGetDuration()F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method
