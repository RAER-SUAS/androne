.class Lioio/lib/impl/FlowControlledOutputStream$FlushThread;
.super Ljava/lang/Thread;
.source "FlowControlledOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/FlowControlledOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FlushThread"
.end annotation


# instance fields
.field final synthetic this$0:Lioio/lib/impl/FlowControlledOutputStream;


# direct methods
.method constructor <init>(Lioio/lib/impl/FlowControlledOutputStream;)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 105
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 109
    :goto_0
    :try_start_0
    iget-object v3, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :goto_1
    :try_start_1
    iget-object v2, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->readyToSend_:I
    invoke-static {v2}, Lioio/lib/impl/FlowControlledOutputStream;->access$0(Lioio/lib/impl/FlowControlledOutputStream;)I

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->queue_:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v2}, Lioio/lib/impl/FlowControlledOutputStream;->access$1(Lioio/lib/impl/FlowControlledOutputStream;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 113
    iget-object v2, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->maxPacket_:I
    invoke-static {v2}, Lioio/lib/impl/FlowControlledOutputStream;->access$2(Lioio/lib/impl/FlowControlledOutputStream;)I

    move-result v2

    .line 114
    iget-object v4, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->readyToSend_:I
    invoke-static {v4}, Lioio/lib/impl/FlowControlledOutputStream;->access$0(Lioio/lib/impl/FlowControlledOutputStream;)I

    move-result v4

    iget-object v5, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->queue_:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v5}, Lioio/lib/impl/FlowControlledOutputStream;->access$1(Lioio/lib/impl/FlowControlledOutputStream;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 113
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 115
    .local v1, "toSend":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-lt v0, v1, :cond_1

    .line 118
    iget-object v2, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->readyToSend_:I
    invoke-static {v2}, Lioio/lib/impl/FlowControlledOutputStream;->access$0(Lioio/lib/impl/FlowControlledOutputStream;)I

    move-result v4

    sub-int/2addr v4, v1

    invoke-static {v2, v4}, Lioio/lib/impl/FlowControlledOutputStream;->access$4(Lioio/lib/impl/FlowControlledOutputStream;I)V

    .line 119
    iget-object v2, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 109
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    :try_start_2
    iget-object v2, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->sender_:Lioio/lib/impl/FlowControlledOutputStream$Sender;
    invoke-static {v2}, Lioio/lib/impl/FlowControlledOutputStream;->access$5(Lioio/lib/impl/FlowControlledOutputStream;)Lioio/lib/impl/FlowControlledOutputStream$Sender;

    move-result-object v2

    iget-object v3, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->packet_:[B
    invoke-static {v3}, Lioio/lib/impl/FlowControlledOutputStream;->access$3(Lioio/lib/impl/FlowControlledOutputStream;)[B

    move-result-object v3

    invoke-interface {v2, v3, v1}, Lioio/lib/impl/FlowControlledOutputStream$Sender;->send([BI)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 123
    .end local v0    # "i":I
    .end local v1    # "toSend":I
    :catch_0
    move-exception v2

    .line 125
    return-void

    .line 111
    :cond_0
    :try_start_3
    iget-object v2, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V

    goto :goto_1

    .line 109
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v2
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    .line 116
    .restart local v0    # "i":I
    .restart local v1    # "toSend":I
    :cond_1
    :try_start_5
    iget-object v2, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->packet_:[B
    invoke-static {v2}, Lioio/lib/impl/FlowControlledOutputStream;->access$3(Lioio/lib/impl/FlowControlledOutputStream;)[B

    move-result-object v4

    iget-object v2, p0, Lioio/lib/impl/FlowControlledOutputStream$FlushThread;->this$0:Lioio/lib/impl/FlowControlledOutputStream;

    # getter for: Lioio/lib/impl/FlowControlledOutputStream;->queue_:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v2}, Lioio/lib/impl/FlowControlledOutputStream;->access$1(Lioio/lib/impl/FlowControlledOutputStream;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->remove()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Byte;

    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v2

    aput-byte v2, v4, v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 115
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method
