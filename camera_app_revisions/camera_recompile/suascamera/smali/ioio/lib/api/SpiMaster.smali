.class public interface abstract Lioio/lib/api/SpiMaster;
.super Ljava/lang/Object;
.source "SpiMaster.java"

# interfaces
.implements Lioio/lib/api/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/api/SpiMaster$Config;,
        Lioio/lib/api/SpiMaster$Rate;,
        Lioio/lib/api/SpiMaster$Result;
    }
.end annotation


# virtual methods
.method public abstract writeRead(I[BII[BI)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract writeRead([BII[BI)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract writeReadAsync(I[BII[BI)Lioio/lib/api/SpiMaster$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method
