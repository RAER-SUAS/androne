.class public interface abstract Lioio/lib/util/IOIOLooper;
.super Ljava/lang/Object;
.source "IOIOLooper.java"


# virtual methods
.method public abstract disconnected()V
.end method

.method public abstract incompatible()V
.end method

.method public abstract loop()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract setup(Lioio/lib/api/IOIO;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method
