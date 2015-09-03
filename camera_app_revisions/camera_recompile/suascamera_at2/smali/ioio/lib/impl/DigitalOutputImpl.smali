.class Lioio/lib/impl/DigitalOutputImpl;
.super Lioio/lib/impl/AbstractPin;
.source "DigitalOutputImpl.java"

# interfaces
.implements Lioio/lib/api/DigitalOutput;


# instance fields
.field value_:Z


# direct methods
.method constructor <init>(Lioio/lib/impl/IOIOImpl;IZ)V
    .locals 0
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .param p2, "pin"    # I
    .param p3, "startValue"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lioio/lib/impl/AbstractPin;-><init>(Lioio/lib/impl/IOIOImpl;I)V

    .line 41
    iput-boolean p3, p0, Lioio/lib/impl/DigitalOutputImpl;->value_:Z

    .line 42
    return-void
.end method


# virtual methods
.method public declared-synchronized write(Z)V
    .locals 3
    .param p1, "val"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 46
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/DigitalOutputImpl;->checkState()V

    .line 47
    iget-boolean v1, p0, Lioio/lib/impl/DigitalOutputImpl;->value_:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq p1, v1, :cond_0

    .line 49
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/DigitalOutputImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v1, v1, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v2, p0, Lioio/lib/impl/DigitalOutputImpl;->pinNum_:I

    invoke-virtual {v1, v2, p1}, Lioio/lib/impl/IOIOProtocol;->setDigitalOutLevel(IZ)V

    .line 50
    iput-boolean p1, p0, Lioio/lib/impl/DigitalOutputImpl;->value_:Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    :cond_0
    monitor-exit p0

    return-void

    .line 51
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
