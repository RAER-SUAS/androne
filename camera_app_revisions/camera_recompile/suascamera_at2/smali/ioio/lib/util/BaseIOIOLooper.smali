.class public Lioio/lib/util/BaseIOIOLooper;
.super Ljava/lang/Object;
.source "BaseIOIOLooper.java"

# interfaces
.implements Lioio/lib/util/IOIOLooper;


# instance fields
.field protected ioio_:Lioio/lib/api/IOIO;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public disconnected()V
    .locals 0

    .prologue
    .line 43
    return-void
.end method

.method public incompatible()V
    .locals 0

    .prologue
    .line 47
    return-void
.end method

.method public loop()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 38
    const-wide/16 v0, 0x14

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 39
    return-void
.end method

.method protected setup()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 34
    return-void
.end method

.method public final setup(Lioio/lib/api/IOIO;)V
    .locals 0
    .param p1, "ioio"    # Lioio/lib/api/IOIO;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 19
    iput-object p1, p0, Lioio/lib/util/BaseIOIOLooper;->ioio_:Lioio/lib/api/IOIO;

    .line 20
    invoke-virtual {p0}, Lioio/lib/util/BaseIOIOLooper;->setup()V

    .line 21
    return-void
.end method
