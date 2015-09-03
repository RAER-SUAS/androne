.class Lioio/lib/impl/FlowControlledPacketSender;
.super Ljava/lang/Object;
.source "FlowControlledPacketSender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/FlowControlledPacketSender$FlushThread;,
        Lioio/lib/impl/FlowControlledPacketSender$Packet;,
        Lioio/lib/impl/FlowControlledPacketSender$Sender;
    }
.end annotation


# instance fields
.field private closed_:Z

.field private final queue_:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lioio/lib/impl/FlowControlledPacketSender$Packet;",
            ">;"
        }
    .end annotation
.end field

.field private readyToSend_:I

.field private final sender_:Lioio/lib/impl/FlowControlledPacketSender$Sender;

.field private final thread_:Lioio/lib/impl/FlowControlledPacketSender$FlushThread;


# direct methods
.method public constructor <init>(Lioio/lib/impl/FlowControlledPacketSender$Sender;)V
    .locals 3
    .param p1, "sender"    # Lioio/lib/impl/FlowControlledPacketSender$Sender;

    .prologue
    const/4 v2, 0x0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 46
    const/16 v1, 0x100

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->queue_:Ljava/util/concurrent/BlockingQueue;

    .line 47
    new-instance v0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;

    invoke-direct {v0, p0}, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;-><init>(Lioio/lib/impl/FlowControlledPacketSender;)V

    iput-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->thread_:Lioio/lib/impl/FlowControlledPacketSender$FlushThread;

    .line 49
    iput v2, p0, Lioio/lib/impl/FlowControlledPacketSender;->readyToSend_:I

    .line 50
    iput-boolean v2, p0, Lioio/lib/impl/FlowControlledPacketSender;->closed_:Z

    .line 53
    iput-object p1, p0, Lioio/lib/impl/FlowControlledPacketSender;->sender_:Lioio/lib/impl/FlowControlledPacketSender$Sender;

    .line 54
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->thread_:Lioio/lib/impl/FlowControlledPacketSender$FlushThread;

    invoke-virtual {v0}, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->start()V

    .line 55
    return-void
.end method

.method static synthetic access$0(Lioio/lib/impl/FlowControlledPacketSender;)Ljava/util/concurrent/BlockingQueue;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->queue_:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method static synthetic access$1(Lioio/lib/impl/FlowControlledPacketSender;)I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->readyToSend_:I

    return v0
.end method

.method static synthetic access$2(Lioio/lib/impl/FlowControlledPacketSender;I)V
    .locals 0

    .prologue
    .line 49
    iput p1, p0, Lioio/lib/impl/FlowControlledPacketSender;->readyToSend_:I

    return-void
.end method

.method static synthetic access$3(Lioio/lib/impl/FlowControlledPacketSender;)Lioio/lib/impl/FlowControlledPacketSender$Sender;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->sender_:Lioio/lib/impl/FlowControlledPacketSender$Sender;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    .prologue
    .line 90
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->closed_:Z

    .line 91
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->thread_:Lioio/lib/impl/FlowControlledPacketSender$FlushThread;

    invoke-virtual {v0}, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->interrupt()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    monitor-exit p0

    return-void

    .line 90
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
    .line 59
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lioio/lib/impl/FlowControlledPacketSender;->closed_:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lioio/lib/impl/FlowControlledPacketSender;->queue_:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_1

    .line 65
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lioio/lib/impl/FlowControlledPacketSender;->closed_:Z

    if-eqz v1, :cond_2

    .line 66
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Stream has been closed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 60
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 62
    :catch_0
    move-exception v0

    .line 63
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Interrupted"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 68
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized kill()V
    .locals 1

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->thread_:Lioio/lib/impl/FlowControlledPacketSender$FlushThread;

    invoke-virtual {v0}, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->interrupt()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    monitor-exit p0

    return-void

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized readyToSend(I)V
    .locals 1
    .param p1, "numBytes"    # I

    .prologue
    .line 85
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->readyToSend_:I

    add-int/2addr v0, p1

    iput v0, p0, Lioio/lib/impl/FlowControlledPacketSender;->readyToSend_:I

    .line 86
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    monitor-exit p0

    return-void

    .line 85
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write(Lioio/lib/impl/FlowControlledPacketSender$Packet;)V
    .locals 3
    .param p1, "packet"    # Lioio/lib/impl/FlowControlledPacketSender$Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lioio/lib/impl/FlowControlledPacketSender;->closed_:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lioio/lib/impl/FlowControlledPacketSender;->queue_:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1, p1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_1

    .line 78
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lioio/lib/impl/FlowControlledPacketSender;->closed_:Z

    if-eqz v1, :cond_2

    .line 79
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Stream has been closed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 73
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Interrupted"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 81
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 82
    monitor-exit p0

    return-void
.end method
