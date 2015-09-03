.class public interface abstract Lioio/lib/api/IOIOConnection;
.super Ljava/lang/Object;
.source "IOIOConnection.java"


# virtual methods
.method public abstract canClose()Z
.end method

.method public abstract disconnect()V
.end method

.method public abstract getInputStream()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract getOutputStream()Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract waitForConnect()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method
