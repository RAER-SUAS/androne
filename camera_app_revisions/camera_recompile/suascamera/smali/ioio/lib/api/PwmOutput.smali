.class public interface abstract Lioio/lib/api/PwmOutput;
.super Ljava/lang/Object;
.source "PwmOutput.java"

# interfaces
.implements Lioio/lib/api/Closeable;


# virtual methods
.method public abstract setDutyCycle(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract setPulseWidth(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract setPulseWidth(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method
