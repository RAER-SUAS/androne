.class public interface abstract Lioio/lib/api/IcspMaster;
.super Ljava/lang/Object;
.source "IcspMaster.java"

# interfaces
.implements Lioio/lib/api/Closeable;


# virtual methods
.method public abstract enterProgramming()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract executeInstruction(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract exitProgramming()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract readVisi()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract waitVisiResult()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method
