.class Lioio/lib/impl/QueueInputStream;
.super Ljava/io/InputStream;
.source "QueueInputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/QueueInputStream$State;
    }
.end annotation


# instance fields
.field private final queue_:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field private state_:Lioio/lib/impl/QueueInputStream$State;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 43
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 44
    const/16 v1, 0x400

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    .line 45
    sget-object v0, Lioio/lib/impl/QueueInputStream$State;->OPEN:Lioio/lib/impl/QueueInputStream$State;

    iput-object v0, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    .line 38
    return-void
.end method


# virtual methods
.method public declared-synchronized available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 110
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    sget-object v1, Lioio/lib/impl/QueueInputStream$State;->OPEN:Lioio/lib/impl/QueueInputStream$State;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq v0, v1, :cond_0

    .line 115
    :goto_0
    monitor-exit p0

    return-void

    .line 113
    :cond_0
    :try_start_1
    sget-object v0, Lioio/lib/impl/QueueInputStream$State;->CLOSED:Lioio/lib/impl/QueueInputStream$State;

    iput-object v0, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    .line 114
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 110
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized kill()V
    .locals 2

    .prologue
    .line 118
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    sget-object v1, Lioio/lib/impl/QueueInputStream$State;->OPEN:Lioio/lib/impl/QueueInputStream$State;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq v0, v1, :cond_0

    .line 123
    :goto_0
    monitor-exit p0

    return-void

    .line 121
    :cond_0
    :try_start_1
    sget-object v0, Lioio/lib/impl/QueueInputStream$State;->KILLED:Lioio/lib/impl/QueueInputStream$State;

    iput-object v0, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    .line 122
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 118
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    sget-object v2, Lioio/lib/impl/QueueInputStream$State;->OPEN:Lioio/lib/impl/QueueInputStream$State;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 53
    :cond_0
    iget-object v1, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    sget-object v2, Lioio/lib/impl/QueueInputStream$State;->KILLED:Lioio/lib/impl/QueueInputStream$State;

    if-ne v1, v2, :cond_2

    .line 54
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream has been closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Interrupted"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 51
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    goto :goto_0

    .line 56
    :cond_2
    iget-object v1, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    sget-object v2, Lioio/lib/impl/QueueInputStream$State;->CLOSED:Lioio/lib/impl/QueueInputStream$State;

    if-ne v1, v2, :cond_3

    iget-object v1, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v1

    if-eqz v1, :cond_3

    .line 57
    const/4 v1, -0x1

    .line 59
    :goto_1
    monitor-exit p0

    return v1

    :cond_3
    :try_start_3
    iget-object v1, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Byte;

    invoke-virtual {v1}, Ljava/lang/Byte;->byteValue()B
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v1

    and-int/lit16 v1, v1, 0xff

    goto :goto_1
.end method

.method public declared-synchronized read([BII)I
    .locals 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    monitor-enter p0

    if-nez p3, :cond_1

    .line 68
    const/4 v3, 0x0

    .line 86
    :goto_0
    monitor-exit p0

    return v3

    .line 72
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 71
    :cond_1
    iget-object v3, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    sget-object v4, Lioio/lib/impl/QueueInputStream$State;->OPEN:Lioio/lib/impl/QueueInputStream$State;

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 74
    :cond_2
    iget-object v3, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    sget-object v4, Lioio/lib/impl/QueueInputStream$State;->KILLED:Lioio/lib/impl/QueueInputStream$State;

    if-ne v3, v4, :cond_3

    .line 75
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Stream has been closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_1
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Interrupted"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 77
    :cond_3
    :try_start_2
    iget-object v3, p0, Lioio/lib/impl/QueueInputStream;->state_:Lioio/lib/impl/QueueInputStream$State;

    sget-object v4, Lioio/lib/impl/QueueInputStream$State;->CLOSED:Lioio/lib/impl/QueueInputStream$State;

    if-ne v3, v4, :cond_4

    iget-object v3, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 78
    const/4 v3, -0x1

    goto :goto_0

    .line 80
    :cond_4
    iget-object v3, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->size()I

    move-result v3

    if-le p3, v3, :cond_5

    .line 81
    iget-object v3, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->size()I

    move-result p3

    .line 83
    :cond_5
    const/4 v1, 0x0

    .local v1, "i":I
    move v2, p2

    .end local p2    # "off":I
    .local v2, "off":I
    :goto_1
    if-lt v1, p3, :cond_6

    move p2, v2

    .end local v2    # "off":I
    .restart local p2    # "off":I
    move v3, p3

    .line 86
    goto :goto_0

    .line 84
    .end local p2    # "off":I
    .restart local v2    # "off":I
    :cond_6
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "off":I
    .restart local p2    # "off":I
    iget-object v3, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Byte;

    invoke-virtual {v3}, Ljava/lang/Byte;->byteValue()B

    move-result v3

    aput-byte v3, p1, v2
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    add-int/lit8 v1, v1, 0x1

    move v2, p2

    .end local p2    # "off":I
    .restart local v2    # "off":I
    goto :goto_1
.end method

.method public declared-synchronized write([BI)V
    .locals 3
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    .line 93
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p2, :cond_0

    .line 100
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    monitor-exit p0

    return-void

    .line 94
    :cond_0
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    const/16 v2, 0x400

    if-ne v1, v2, :cond_1

    .line 95
    const-string v1, "QueueInputStream"

    const-string v2, "Buffer overflow, discarding data"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 93
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 98
    :cond_1
    :try_start_2
    iget-object v1, p0, Lioio/lib/impl/QueueInputStream;->queue_:Ljava/util/Queue;

    aget-byte v2, p1, v0

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 93
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
