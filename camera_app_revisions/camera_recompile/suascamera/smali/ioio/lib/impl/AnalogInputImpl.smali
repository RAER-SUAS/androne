.class Lioio/lib/impl/AnalogInputImpl;
.super Lioio/lib/impl/AbstractPin;
.source "AnalogInputImpl.java"

# interfaces
.implements Lioio/lib/api/AnalogInput;
.implements Lioio/lib/impl/IncomingState$InputPinListener;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field bufferCapacity_:I

.field bufferOverflowCount_:I

.field bufferReadCursor_:I

.field bufferSize_:I

.field bufferWriteCursor_:I

.field buffer_:[S

.field private valid_:Z

.field private value_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-class v0, Lioio/lib/impl/AnalogInputImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lioio/lib/impl/AnalogInputImpl;->$assertionsDisabled:Z

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
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0, p1, p2}, Lioio/lib/impl/AbstractPin;-><init>(Lioio/lib/impl/IOIOImpl;I)V

    .line 40
    iput-boolean v0, p0, Lioio/lib/impl/AnalogInputImpl;->valid_:Z

    .line 47
    iput v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferOverflowCount_:I

    .line 51
    return-void
.end method

.method private declared-synchronized bufferPull()S
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 149
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/AnalogInputImpl;->buffer_:[S

    if-nez v1, :cond_1

    .line 150
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 151
    const-string v2, "Need to call setBuffer() before reading buffered values."

    .line 150
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 154
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 153
    :cond_1
    iget v1, p0, Lioio/lib/impl/AnalogInputImpl;->bufferSize_:I

    if-nez v1, :cond_2

    iget-object v1, p0, Lioio/lib/impl/AnalogInputImpl;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v2, Lioio/lib/impl/AbstractResource$State;->OPEN:Lioio/lib/impl/AbstractResource$State;

    if-eq v1, v2, :cond_0

    .line 156
    :cond_2
    invoke-virtual {p0}, Lioio/lib/impl/AnalogInputImpl;->checkState()V

    .line 157
    iget-object v1, p0, Lioio/lib/impl/AnalogInputImpl;->buffer_:[S

    iget v2, p0, Lioio/lib/impl/AnalogInputImpl;->bufferReadCursor_:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lioio/lib/impl/AnalogInputImpl;->bufferReadCursor_:I

    aget-short v0, v1, v2

    .line 158
    .local v0, "result":S
    iget v1, p0, Lioio/lib/impl/AnalogInputImpl;->bufferReadCursor_:I

    iget v2, p0, Lioio/lib/impl/AnalogInputImpl;->bufferCapacity_:I

    if-ne v1, v2, :cond_3

    .line 159
    const/4 v1, 0x0

    iput v1, p0, Lioio/lib/impl/AnalogInputImpl;->bufferReadCursor_:I

    .line 161
    :cond_3
    iget v1, p0, Lioio/lib/impl/AnalogInputImpl;->bufferSize_:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lioio/lib/impl/AnalogInputImpl;->bufferSize_:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    monitor-exit p0

    return v0
.end method

.method private bufferPush(S)V
    .locals 3
    .param p1, "value"    # S

    .prologue
    .line 132
    iget-object v0, p0, Lioio/lib/impl/AnalogInputImpl;->buffer_:[S

    if-nez v0, :cond_0

    .line 145
    :goto_0
    return-void

    .line 135
    :cond_0
    iget v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferSize_:I

    iget v1, p0, Lioio/lib/impl/AnalogInputImpl;->bufferCapacity_:I

    if-ne v0, v1, :cond_2

    .line 136
    iget v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferOverflowCount_:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferOverflowCount_:I

    .line 140
    :goto_1
    iget-object v0, p0, Lioio/lib/impl/AnalogInputImpl;->buffer_:[S

    iget v1, p0, Lioio/lib/impl/AnalogInputImpl;->bufferWriteCursor_:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lioio/lib/impl/AnalogInputImpl;->bufferWriteCursor_:I

    aput-short p1, v0, v1

    .line 141
    iget v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferWriteCursor_:I

    iget v1, p0, Lioio/lib/impl/AnalogInputImpl;->bufferCapacity_:I

    if-ne v0, v1, :cond_1

    .line 142
    const/4 v0, 0x0

    iput v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferWriteCursor_:I

    .line 144
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    goto :goto_0

    .line 138
    :cond_2
    iget v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferSize_:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferSize_:I

    goto :goto_1
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 177
    iget v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferSize_:I

    return v0
.end method

.method public declared-synchronized close()V
    .locals 3

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractPin;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    :try_start_1
    iget-object v0, p0, Lioio/lib/impl/AnalogInputImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v0, v0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v1, p0, Lioio/lib/impl/AnalogInputImpl;->pinNum_:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lioio/lib/impl/IOIOProtocol;->setAnalogInSampling(IZ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    :goto_0
    monitor-exit p0

    return-void

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 98
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

.method public getOverflowCount()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 167
    iget v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferOverflowCount_:I

    return v0
.end method

.method public getReference()F
    .locals 1

    .prologue
    .line 61
    const v0, 0x40533333

    return v0
.end method

.method public getSampleRate()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 172
    const/high16 v0, 0x447a0000

    return v0
.end method

.method public getVoltage()F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-virtual {p0}, Lioio/lib/impl/AnalogInputImpl;->read()F

    move-result v0

    invoke-virtual {p0}, Lioio/lib/impl/AnalogInputImpl;->getReference()F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method public getVoltageBuffered()F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 128
    invoke-virtual {p0}, Lioio/lib/impl/AnalogInputImpl;->readBuffered()F

    move-result v0

    invoke-virtual {p0}, Lioio/lib/impl/AnalogInputImpl;->getReference()F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method public declared-synchronized read()F
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
    invoke-virtual {p0}, Lioio/lib/impl/AnalogInputImpl;->checkState()V

    .line 80
    :goto_0
    iget-boolean v0, p0, Lioio/lib/impl/AnalogInputImpl;->valid_:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lioio/lib/impl/AnalogInputImpl;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->OPEN:Lioio/lib/impl/AbstractResource$State;

    if-eq v0, v1, :cond_1

    .line 83
    :cond_0
    invoke-virtual {p0}, Lioio/lib/impl/AnalogInputImpl;->checkState()V

    .line 84
    iget v0, p0, Lioio/lib/impl/AnalogInputImpl;->value_:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-float v0, v0

    const v1, 0x447fc000

    div-float/2addr v0, v1

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

.method public readBuffered()F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-virtual {p0}, Lioio/lib/impl/AnalogInputImpl;->checkState()V

    .line 122
    invoke-direct {p0}, Lioio/lib/impl/AnalogInputImpl;->bufferPull()S

    move-result v0

    int-to-float v0, v0

    const v1, 0x447fc000

    div-float/2addr v0, v1

    return v0
.end method

.method public declared-synchronized setBuffer(I)V
    .locals 1
    .param p1, "capacity"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 105
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/AnalogInputImpl;->checkState()V

    .line 106
    if-gtz p1, :cond_0

    .line 107
    const/4 v0, 0x0

    iput-object v0, p0, Lioio/lib/impl/AnalogInputImpl;->buffer_:[S

    .line 111
    :goto_0
    iput p1, p0, Lioio/lib/impl/AnalogInputImpl;->bufferCapacity_:I

    .line 112
    const/4 v0, 0x0

    iput v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferSize_:I

    .line 113
    const/4 v0, 0x0

    iput v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferReadCursor_:I

    .line 114
    const/4 v0, 0x0

    iput v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferWriteCursor_:I

    .line 115
    const/4 v0, 0x0

    iput v0, p0, Lioio/lib/impl/AnalogInputImpl;->bufferOverflowCount_:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    monitor-exit p0

    return-void

    .line 109
    :cond_0
    :try_start_1
    new-array v0, p1, [S

    iput-object v0, p0, Lioio/lib/impl/AnalogInputImpl;->buffer_:[S
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 105
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setValue(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 67
    monitor-enter p0

    :try_start_0
    sget-boolean v0, Lioio/lib/impl/AnalogInputImpl;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-ltz p1, :cond_0

    const/16 v0, 0x400

    if-lt p1, v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 68
    :cond_1
    :try_start_1
    iput p1, p0, Lioio/lib/impl/AnalogInputImpl;->value_:I

    .line 69
    iget-boolean v0, p0, Lioio/lib/impl/AnalogInputImpl;->valid_:Z

    if-nez v0, :cond_2

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lioio/lib/impl/AnalogInputImpl;->valid_:Z

    .line 71
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 73
    :cond_2
    int-to-short v0, p1

    invoke-direct {p0, v0}, Lioio/lib/impl/AnalogInputImpl;->bufferPush(S)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    monitor-exit p0

    return-void
.end method
