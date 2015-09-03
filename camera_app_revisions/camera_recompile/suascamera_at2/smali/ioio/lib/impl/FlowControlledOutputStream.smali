.class Lioio/lib/impl/FlowControlledOutputStream;
.super Ljava/io/OutputStream;
.source "FlowControlledOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/FlowControlledOutputStream$FlushThread;,
        Lioio/lib/impl/FlowControlledOutputStream$Sender;
    }
.end annotation


# instance fields
.field private closed_:Z

.field private final maxPacket_:I

.field private final packet_:[B

.field private final queue_:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field private readyToSend_:I

.field private final sender_:Lioio/lib/impl/FlowControlledOutputStream$Sender;

.field private final thread_:Lioio/lib/impl/FlowControlledOutputStream$FlushThread;


# direct methods
.method public constructor <init>(Lioio/lib/impl/FlowControlledOutputStream$Sender;I)V
    .locals 3
    .param p1, "sender"    # Lioio/lib/impl/FlowControlledOutputStream$Sender;
    .param p2, "maxPacket"    # I

    .prologue
    const/4 v2, 0x0

    .line 51
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 42
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 43
    const/16 v1, 0x400

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->queue_:Ljava/util/concurrent/BlockingQueue;

    .line 44
    new-instance v0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;

    invoke-direct {v0, p0}, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;-><init>(Lioio/lib/impl/FlowControlledOutputStream;)V

    iput-object v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->thread_:Lioio/lib/impl/FlowControlledOutputStream$FlushThread;

    .line 48
    iput v2, p0, Lioio/lib/impl/FlowControlledOutputStream;->readyToSend_:I

    .line 49
    iput-boolean v2, p0, Lioio/lib/impl/FlowControlledOutputStream;->closed_:Z

    .line 52
    iput-object p1, p0, Lioio/lib/impl/FlowControlledOutputStream;->sender_:Lioio/lib/impl/FlowControlledOutputStream$Sender;

    .line 53
    iput p2, p0, Lioio/lib/impl/FlowControlledOutputStream;->maxPacket_:I

    .line 54
    new-array v0, p2, [B

    iput-object v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->packet_:[B

    .line 55
    iget-object v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->thread_:Lioio/lib/impl/FlowControlledOutputStream$FlushThread;

    invoke-virtual {v0}, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->start()V

    .line 56
    return-void
.end method

.method static synthetic access$0(Lioio/lib/impl/FlowControlledOutputStream;)I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->readyToSend_:I

    return v0
.end method

.method static synthetic access$1(Lioio/lib/impl/FlowControlledOutputStream;)Ljava/util/concurrent/BlockingQueue;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->queue_:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method static synthetic access$2(Lioio/lib/impl/FlowControlledOutputStream;)I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->maxPacket_:I

    return v0
.end method

.method static synthetic access$3(Lioio/lib/impl/FlowControlledOutputStream;)[B
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->packet_:[B

    return-object v0
.end method

.method static synthetic access$4(Lioio/lib/impl/FlowControlledOutputStream;I)V
    .locals 0

    .prologue
    .line 48
    iput p1, p0, Lioio/lib/impl/FlowControlledOutputStream;->readyToSend_:I

    return-void
.end method

.method static synthetic access$5(Lioio/lib/impl/FlowControlledOutputStream;)Lioio/lib/impl/FlowControlledOutputStream$Sender;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->sender_:Lioio/lib/impl/FlowControlledOutputStream$Sender;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    .prologue
    .line 94
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->closed_:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 100
    :goto_0
    monitor-exit p0

    return-void

    .line 97
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->closed_:Z

    .line 98
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 99
    iget-object v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->thread_:Lioio/lib/impl/FlowControlledOutputStream$FlushThread;

    invoke-virtual {v0}, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 94
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized flush()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lioio/lib/impl/FlowControlledOutputStream;->closed_:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lioio/lib/impl/FlowControlledOutputStream;->queue_:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_1

    .line 67
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lioio/lib/impl/FlowControlledOutputStream;->closed_:Z

    if-eqz v1, :cond_2

    .line 68
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream has been closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 62
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 64
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Interrupted"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 70
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized readyToSend(I)V
    .locals 1
    .param p1, "numBytes"    # I

    .prologue
    .line 88
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->readyToSend_:I

    add-int/2addr v0, p1

    iput v0, p0, Lioio/lib/impl/FlowControlledOutputStream;->readyToSend_:I

    .line 89
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    monitor-exit p0

    return-void

    .line 88
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write(I)V
    .locals 3
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lioio/lib/impl/FlowControlledOutputStream;->closed_:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lioio/lib/impl/FlowControlledOutputStream;->queue_:Ljava/util/concurrent/BlockingQueue;

    int-to-byte v2, p1

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_1

    .line 81
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lioio/lib/impl/FlowControlledOutputStream;->closed_:Z

    if-eqz v1, :cond_2

    .line 82
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream has been closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 76
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 78
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Interrupted"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 84
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 85
    monitor-exit p0

    return-void
.end method
