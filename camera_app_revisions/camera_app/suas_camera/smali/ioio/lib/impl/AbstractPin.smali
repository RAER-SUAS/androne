.class abstract Lioio/lib/impl/AbstractPin;
.super Lioio/lib/impl/AbstractResource;
.source "AbstractPin.java"


# instance fields
.field protected final pinNum_:I


# direct methods
.method constructor <init>(Lioio/lib/impl/IOIOImpl;I)V
    .locals 0
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .param p2, "pinNum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lioio/lib/impl/AbstractResource;-><init>(Lioio/lib/impl/IOIOImpl;)V

    .line 38
    iput p2, p0, Lioio/lib/impl/AbstractPin;->pinNum_:I

    .line 39
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 43
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->close()V

    .line 44
    iget-object v0, p0, Lioio/lib/impl/AbstractPin;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v1, p0, Lioio/lib/impl/AbstractPin;->pinNum_:I

    invoke-virtual {v0, v1}, Lioio/lib/impl/IOIOImpl;->closePin(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    monitor-exit p0

    return-void

    .line 43
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
