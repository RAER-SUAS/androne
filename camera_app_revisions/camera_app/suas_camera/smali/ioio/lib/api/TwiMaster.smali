.class public interface abstract Lioio/lib/api/TwiMaster;
.super Ljava/lang/Object;
.source "TwiMaster.java"

# interfaces
.implements Lioio/lib/api/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/api/TwiMaster$Rate;,
        Lioio/lib/api/TwiMaster$Result;
    }
.end annotation


# virtual methods
.method public abstract writeRead(IZ[BI[BI)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract writeReadAsync(IZ[BI[BI)Lioio/lib/api/TwiMaster$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method
