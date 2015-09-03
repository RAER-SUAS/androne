.class Lioio/lib/impl/DigitalInputImpl;
.super Lioio/lib/impl/AbstractPin;
.source "DigitalInputImpl.java"

# interfaces
.implements Lioio/lib/api/DigitalInput;
.implements Lioio/lib/impl/IncomingState$InputPinListener;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private valid_:Z

.field private value_:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-class v0, Lioio/lib/impl/DigitalInputImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lioio/lib/impl/DigitalInputImpl;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lioio/lib/impl/IOIOImpl;I)V
    .locals 1
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .param p2, "pin"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lioio/lib/impl/AbstractPin;-><init>(Lioio/lib/impl/IOIOImpl;I)V

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/DigitalInputImpl;->valid_:Z

    .line 44
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 3

    .prologue
    .line 69
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractPin;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    :try_start_1
    iget-object v0, p0, Lioio/lib/impl/DigitalInputImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v0, v0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v1, p0, Lioio/lib/impl/DigitalInputImpl;->pinNum_:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lioio/lib/impl/IOIOProtocol;->setChangeNotify(IZ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    :goto_0
    monitor-exit p0

    return-void

    .line 69
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 72
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public declared-synchronized disconnected()V
    .locals 1

    .prologue
    .line 89
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractPin;->disconnected()V

    .line 90
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    monitor-exit p0

    return-void

    .line 89
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/DigitalInputImpl;->checkState()V

    .line 80
    :goto_0
    iget-boolean v0, p0, Lioio/lib/impl/DigitalInputImpl;->valid_:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lioio/lib/impl/DigitalInputImpl;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

    if-ne v0, v1, :cond_1

    .line 83
    :cond_0
    invoke-virtual {p0}, Lioio/lib/impl/DigitalInputImpl;->checkState()V

    .line 84
    iget-boolean v0, p0, Lioio/lib/impl/DigitalInputImpl;->value_:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 81
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setValue(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    const/4 v0, 0x1

    .line 49
    monitor-enter p0

    :try_start_0
    sget-boolean v1, Lioio/lib/impl/DigitalInputImpl;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-eqz p1, :cond_0

    if-eq p1, v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 50
    :cond_0
    if-ne p1, v0, :cond_2

    :goto_0
    :try_start_1
    iput-boolean v0, p0, Lioio/lib/impl/DigitalInputImpl;->value_:Z

    .line 51
    iget-boolean v0, p0, Lioio/lib/impl/DigitalInputImpl;->valid_:Z

    if-nez v0, :cond_1

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lioio/lib/impl/DigitalInputImpl;->valid_:Z

    .line 54
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    monitor-exit p0

    return-void

    .line 50
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized waitForValue(Z)V
    .locals 2
    .param p1, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 60
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/DigitalInputImpl;->checkState()V

    .line 61
    :goto_0
    iget-boolean v0, p0, Lioio/lib/impl/DigitalInputImpl;->valid_:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lioio/lib/impl/DigitalInputImpl;->value_:Z

    if-eq v0, p1, :cond_1

    :cond_0
    iget-object v0, p0, Lioio/lib/impl/DigitalInputImpl;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

    if-ne v0, v1, :cond_2

    .line 64
    :cond_1
    invoke-virtual {p0}, Lioio/lib/impl/DigitalInputImpl;->checkState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    monitor-exit p0

    return-void

    .line 62
    :cond_2
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 60
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
