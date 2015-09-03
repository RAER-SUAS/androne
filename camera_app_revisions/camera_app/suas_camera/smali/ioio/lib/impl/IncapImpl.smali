.class Lioio/lib/impl/IncapImpl;
.super Lioio/lib/impl/AbstractPin;
.source "IncapImpl.java"

# interfaces
.implements Lioio/lib/api/PulseInput;
.implements Lioio/lib/impl/IncomingState$DataModuleListener;


# static fields
.field private static final MAX_QUEUE_LEN:I = 0x20


# instance fields
.field private final doublePrecision_:Z

.field private final incapNum_:I

.field private lastDuration_:J

.field private final mode_:Lioio/lib/api/PulseInput$PulseMode;

.field private pulseQueue_:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final timeBase_:F

.field private valid_:Z


# direct methods
.method public constructor <init>(Lioio/lib/impl/IOIOImpl;Lioio/lib/api/PulseInput$PulseMode;IIIIZ)V
    .locals 2
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .param p2, "mode"    # Lioio/lib/api/PulseInput$PulseMode;
    .param p3, "incapNum"    # I
    .param p4, "pin"    # I
    .param p5, "clockRate"    # I
    .param p6, "scale"    # I
    .param p7, "doublePrecision"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-direct {p0, p1, p4}, Lioio/lib/impl/AbstractPin;-><init>(Lioio/lib/impl/IOIOImpl;I)V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/IncapImpl;->valid_:Z

    .line 20
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IncapImpl;->pulseQueue_:Ljava/util/Queue;

    .line 26
    iput-object p2, p0, Lioio/lib/impl/IncapImpl;->mode_:Lioio/lib/api/PulseInput$PulseMode;

    .line 27
    iput p3, p0, Lioio/lib/impl/IncapImpl;->incapNum_:I

    .line 28
    const/high16 v0, 0x3f800000

    mul-int v1, p6, p5

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lioio/lib/impl/IncapImpl;->timeBase_:F

    .line 29
    iput-boolean p7, p0, Lioio/lib/impl/IncapImpl;->doublePrecision_:Z

    .line 30
    return-void
.end method

.method private static ByteArrayToLong([BI)J
    .locals 6
    .param p0, "data"    # [B
    .param p1, "size"    # I

    .prologue
    .line 81
    const-wide/16 v2, 0x0

    .line 82
    .local v2, "result":J
    move v0, p1

    .local v0, "i":I
    move v1, v0

    .line 83
    .end local v0    # "i":I
    .local v1, "i":I
    :goto_0
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    if-gtz v1, :cond_1

    .line 87
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_0

    .line 88
    const/4 v4, 0x1

    mul-int/lit8 v5, p1, 0x8

    shl-int/2addr v4, v5

    int-to-long v2, v4

    .line 90
    :cond_0
    return-wide v2

    .line 84
    :cond_1
    const/16 v4, 0x8

    shl-long/2addr v2, v4

    .line 85
    aget-byte v4, p0, v0

    and-int/lit16 v4, v4, 0xff

    int-to-long v4, v4

    or-long/2addr v2, v4

    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 3

    .prologue
    .line 99
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v1, p0, Lioio/lib/impl/IncapImpl;->incapNum_:I

    iget-boolean v2, p0, Lioio/lib/impl/IncapImpl;->doublePrecision_:Z

    invoke-virtual {v0, v1, v2}, Lioio/lib/impl/IOIOImpl;->closeIncap(IZ)V

    .line 100
    invoke-super {p0}, Lioio/lib/impl/AbstractPin;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    monitor-exit p0

    return-void

    .line 99
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized dataReceived([BI)V
    .locals 3
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    .line 71
    monitor-enter p0

    :try_start_0
    invoke-static {p1, p2}, Lioio/lib/impl/IncapImpl;->ByteArrayToLong([BI)J

    move-result-wide v0

    iput-wide v0, p0, Lioio/lib/impl/IncapImpl;->lastDuration_:J

    .line 72
    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->pulseQueue_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    .line 73
    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->pulseQueue_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 75
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->pulseQueue_:Ljava/util/Queue;

    iget-wide v1, p0, Lioio/lib/impl/IncapImpl;->lastDuration_:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lioio/lib/impl/IncapImpl;->valid_:Z

    .line 77
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    monitor-exit p0

    return-void

    .line 71
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized disconnected()V
    .locals 1

    .prologue
    .line 105
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 106
    invoke-super {p0}, Lioio/lib/impl/AbstractPin;->disconnected()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    monitor-exit p0

    return-void

    .line 105
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDuration()F
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 46
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IncapImpl;->checkState()V

    .line 47
    :goto_0
    iget-boolean v0, p0, Lioio/lib/impl/IncapImpl;->valid_:Z

    if-eqz v0, :cond_0

    .line 51
    iget v0, p0, Lioio/lib/impl/IncapImpl;->timeBase_:F

    iget-wide v1, p0, Lioio/lib/impl/IncapImpl;->lastDuration_:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    long-to-float v1, v1

    mul-float/2addr v0, v1

    monitor-exit p0

    return v0

    .line 48
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 49
    invoke-virtual {p0}, Lioio/lib/impl/IncapImpl;->checkState()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getFrequency()F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 35
    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->mode_:Lioio/lib/api/PulseInput$PulseMode;

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->FREQ:Lioio/lib/api/PulseInput$PulseMode;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->mode_:Lioio/lib/api/PulseInput$PulseMode;

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->FREQ_SCALE_4:Lioio/lib/api/PulseInput$PulseMode;

    if-eq v0, v1, :cond_0

    .line 36
    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->mode_:Lioio/lib/api/PulseInput$PulseMode;

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->FREQ_SCALE_16:Lioio/lib/api/PulseInput$PulseMode;

    if-eq v0, v1, :cond_0

    .line 37
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 38
    const-string v1, "Cannot query frequency when module was not opened in frequency mode."

    .line 37
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_0
    const/high16 v0, 0x3f800000

    invoke-virtual {p0}, Lioio/lib/impl/IncapImpl;->getDuration()F

    move-result v1

    div-float/2addr v0, v1

    return v0
.end method

.method public declared-synchronized reportAdditionalBuffer(I)V
    .locals 0
    .param p1, "bytesToAdd"    # I

    .prologue
    .line 95
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method public declared-synchronized waitPulseGetDuration()F
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 57
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->mode_:Lioio/lib/api/PulseInput$PulseMode;

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->POSITIVE:Lioio/lib/api/PulseInput$PulseMode;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->mode_:Lioio/lib/api/PulseInput$PulseMode;

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->NEGATIVE:Lioio/lib/api/PulseInput$PulseMode;

    if-eq v0, v1, :cond_0

    .line 58
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 59
    const-string v1, "Cannot wait for pulse when module was not opened in pulse mode."

    .line 58
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 61
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lioio/lib/impl/IncapImpl;->checkState()V

    .line 62
    :goto_0
    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->pulseQueue_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->OPEN:Lioio/lib/impl/AbstractResource$State;

    if-eq v0, v1, :cond_2

    .line 65
    :cond_1
    invoke-virtual {p0}, Lioio/lib/impl/IncapImpl;->checkState()V

    .line 66
    iget v1, p0, Lioio/lib/impl/IncapImpl;->timeBase_:F

    iget-object v0, p0, Lioio/lib/impl/IncapImpl;->pulseQueue_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v2

    long-to-float v0, v2

    mul-float/2addr v0, v1

    monitor-exit p0

    return v0

    .line 63
    :cond_2
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method
