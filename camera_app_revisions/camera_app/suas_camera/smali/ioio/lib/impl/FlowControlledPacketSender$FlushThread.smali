.class Lioio/lib/impl/FlowControlledPacketSender$FlushThread;
.super Ljava/lang/Thread;
.source "FlowControlledPacketSender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/FlowControlledPacketSender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FlushThread"
.end annotation


# instance fields
.field final synthetic this$0:Lioio/lib/impl/FlowControlledPacketSender;


# direct methods
.method constructor <init>(Lioio/lib/impl/FlowControlledPacketSender;)V
    .locals 0

    .prologue
    .line 98
    iput-object p1, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 101
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 104
    :goto_0
    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    :goto_1
    :try_start_1
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    # getter for: Lioio/lib/impl/FlowControlledPacketSender;->queue_:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v0}, Lioio/lib/impl/FlowControlledPacketSender;->access$0(Lioio/lib/impl/FlowControlledPacketSender;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 106
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    # getter for: Lioio/lib/impl/FlowControlledPacketSender;->readyToSend_:I
    invoke-static {v0}, Lioio/lib/impl/FlowControlledPacketSender;->access$1(Lioio/lib/impl/FlowControlledPacketSender;)I

    move-result v2

    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    # getter for: Lioio/lib/impl/FlowControlledPacketSender;->queue_:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v0}, Lioio/lib/impl/FlowControlledPacketSender;->access$0(Lioio/lib/impl/FlowControlledPacketSender;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/FlowControlledPacketSender$Packet;

    invoke-interface {v0}, Lioio/lib/impl/FlowControlledPacketSender$Packet;->getSize()I

    move-result v0

    .line 105
    if-lt v2, v0, :cond_0

    .line 109
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 110
    iget-object v2, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    # getter for: Lioio/lib/impl/FlowControlledPacketSender;->readyToSend_:I
    invoke-static {v2}, Lioio/lib/impl/FlowControlledPacketSender;->access$1(Lioio/lib/impl/FlowControlledPacketSender;)I

    move-result v3

    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    # getter for: Lioio/lib/impl/FlowControlledPacketSender;->queue_:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v0}, Lioio/lib/impl/FlowControlledPacketSender;->access$0(Lioio/lib/impl/FlowControlledPacketSender;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/FlowControlledPacketSender$Packet;

    invoke-interface {v0}, Lioio/lib/impl/FlowControlledPacketSender$Packet;->getSize()I

    move-result v0

    sub-int v0, v3, v0

    invoke-static {v2, v0}, Lioio/lib/impl/FlowControlledPacketSender;->access$2(Lioio/lib/impl/FlowControlledPacketSender;I)V

    .line 104
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    :try_start_2
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    # getter for: Lioio/lib/impl/FlowControlledPacketSender;->sender_:Lioio/lib/impl/FlowControlledPacketSender$Sender;
    invoke-static {v0}, Lioio/lib/impl/FlowControlledPacketSender;->access$3(Lioio/lib/impl/FlowControlledPacketSender;)Lioio/lib/impl/FlowControlledPacketSender$Sender;

    move-result-object v1

    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    # getter for: Lioio/lib/impl/FlowControlledPacketSender;->queue_:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v0}, Lioio/lib/impl/FlowControlledPacketSender;->access$0(Lioio/lib/impl/FlowControlledPacketSender;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/FlowControlledPacketSender$Packet;

    invoke-interface {v1, v0}, Lioio/lib/impl/FlowControlledPacketSender$Sender;->send(Lioio/lib/impl/FlowControlledPacketSender$Packet;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 114
    :catch_0
    move-exception v0

    .line 116
    return-void

    .line 107
    :cond_0
    :try_start_3
    iget-object v0, p0, Lioio/lib/impl/FlowControlledPacketSender$FlushThread;->this$0:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    goto :goto_1

    .line 104
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
.end method
