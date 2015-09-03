.class Lioio/lib/impl/TwiMasterImpl;
.super Lioio/lib/impl/AbstractResource;
.source "TwiMasterImpl.java"

# interfaces
.implements Lioio/lib/api/TwiMaster;
.implements Lioio/lib/impl/FlowControlledPacketSender$Sender;
.implements Lioio/lib/impl/IncomingState$DataModuleListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;,
        Lioio/lib/impl/TwiMasterImpl$TwiResult;
    }
.end annotation


# instance fields
.field private final outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

.field private final pendingRequests_:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lioio/lib/impl/TwiMasterImpl$TwiResult;",
            ">;"
        }
    .end annotation
.end field

.field private final twiNum_:I


# direct methods
.method constructor <init>(Lioio/lib/impl/IOIOImpl;I)V
    .locals 1
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .param p2, "twiNum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lioio/lib/impl/AbstractResource;-><init>(Lioio/lib/impl/IOIOImpl;)V

    .line 78
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/TwiMasterImpl;->pendingRequests_:Ljava/util/Queue;

    .line 79
    new-instance v0, Lioio/lib/impl/FlowControlledPacketSender;

    .line 80
    invoke-direct {v0, p0}, Lioio/lib/impl/FlowControlledPacketSender;-><init>(Lioio/lib/impl/FlowControlledPacketSender$Sender;)V

    iput-object v0, p0, Lioio/lib/impl/TwiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    .line 85
    iput p2, p0, Lioio/lib/impl/TwiMasterImpl;->twiNum_:I

    .line 86
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 153
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->close()V

    .line 154
    iget-object v0, p0, Lioio/lib/impl/TwiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v0}, Lioio/lib/impl/FlowControlledPacketSender;->close()V

    .line 155
    iget-object v0, p0, Lioio/lib/impl/TwiMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v1, p0, Lioio/lib/impl/TwiMasterImpl;->twiNum_:I

    invoke-virtual {v0, v1}, Lioio/lib/impl/IOIOImpl;->closeTwi(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    monitor-exit p0

    return-void

    .line 153
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public dataReceived([BI)V
    .locals 4
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 135
    iget-object v3, p0, Lioio/lib/impl/TwiMasterImpl;->pendingRequests_:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/TwiMasterImpl$TwiResult;

    .line 136
    .local v0, "result":Lioio/lib/impl/TwiMasterImpl$TwiResult;
    monitor-enter v0

    .line 137
    const/4 v3, 0x1

    :try_start_0
    iput-boolean v3, v0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->ready_:Z

    .line 138
    const/16 v3, 0xff

    if-eq p2, v3, :cond_1

    :goto_0
    iput-boolean v1, v0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->success_:Z

    .line 139
    iget-boolean v1, v0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->success_:Z

    if-eqz v1, :cond_0

    if-lez p2, :cond_0

    .line 140
    const/4 v1, 0x0

    iget-object v2, v0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->data_:[B

    const/4 v3, 0x0

    invoke-static {p1, v1, v2, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 142
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 136
    monitor-exit v0

    .line 144
    return-void

    :cond_1
    move v1, v2

    .line 138
    goto :goto_0

    .line 136
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public declared-synchronized disconnected()V
    .locals 3

    .prologue
    .line 90
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->disconnected()V

    .line 91
    iget-object v1, p0, Lioio/lib/impl/TwiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v1}, Lioio/lib/impl/FlowControlledPacketSender;->kill()V

    .line 92
    iget-object v1, p0, Lioio/lib/impl/TwiMasterImpl;->pendingRequests_:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v2

    if-nez v2, :cond_0

    .line 97
    monitor-exit p0

    return-void

    .line 92
    :cond_0
    :try_start_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/TwiMasterImpl$TwiResult;

    .line 93
    .local v0, "tr":Lioio/lib/impl/TwiMasterImpl$TwiResult;
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 94
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 93
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 90
    .end local v0    # "tr":Lioio/lib/impl/TwiMasterImpl$TwiResult;
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public reportAdditionalBuffer(I)V
    .locals 1
    .param p1, "bytesRemaining"    # I

    .prologue
    .line 148
    iget-object v0, p0, Lioio/lib/impl/TwiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v0, p1}, Lioio/lib/impl/FlowControlledPacketSender;->readyToSend(I)V

    .line 149
    return-void
.end method

.method public send(Lioio/lib/impl/FlowControlledPacketSender$Packet;)V
    .locals 9
    .param p1, "packet"    # Lioio/lib/impl/FlowControlledPacketSender$Packet;

    .prologue
    .line 160
    move-object v8, p1

    check-cast v8, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;

    .line 162
    .local v8, "p":Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;
    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/TwiMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v0, v0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v1, p0, Lioio/lib/impl/TwiMasterImpl;->twiNum_:I

    iget-boolean v2, v8, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->tenBitAddr_:Z

    iget v3, v8, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->addr_:I

    .line 163
    iget v4, v8, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->writeSize_:I

    iget v5, v8, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->readSize_:I

    iget-object v6, v8, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->writeData_:[B

    .line 162
    invoke-virtual/range {v0 .. v6}, Lioio/lib/impl/IOIOProtocol;->i2cWriteRead(IZIII[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    :goto_0
    return-void

    .line 164
    :catch_0
    move-exception v7

    .line 165
    .local v7, "e":Ljava/io/IOException;
    const-string v0, "TwiImpl"

    const-string v1, "Caught exception"

    invoke-static {v0, v1, v7}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public writeRead(IZ[BI[BI)Z
    .locals 2
    .param p1, "address"    # I
    .param p2, "tenBitAddr"    # Z
    .param p3, "writeData"    # [B
    .param p4, "writeSize"    # I
    .param p5, "readData"    # [B
    .param p6, "readSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-virtual/range {p0 .. p6}, Lioio/lib/impl/TwiMasterImpl;->writeReadAsync(IZ[BI[BI)Lioio/lib/api/TwiMaster$Result;

    move-result-object v0

    .line 105
    .local v0, "result":Lioio/lib/api/TwiMaster$Result;
    invoke-interface {v0}, Lioio/lib/api/TwiMaster$Result;->waitReady()Z

    move-result v1

    return v1
.end method

.method public writeReadAsync(IZ[BI[BI)Lioio/lib/api/TwiMaster$Result;
    .locals 5
    .param p1, "address"    # I
    .param p2, "tenBitAddr"    # Z
    .param p3, "writeData"    # [B
    .param p4, "writeSize"    # I
    .param p5, "readData"    # [B
    .param p6, "readSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 112
    invoke-virtual {p0}, Lioio/lib/impl/TwiMasterImpl;->checkState()V

    .line 113
    new-instance v2, Lioio/lib/impl/TwiMasterImpl$TwiResult;

    invoke-direct {v2, p0, p5}, Lioio/lib/impl/TwiMasterImpl$TwiResult;-><init>(Lioio/lib/impl/TwiMasterImpl;[B)V

    .line 115
    .local v2, "result":Lioio/lib/impl/TwiMasterImpl$TwiResult;
    new-instance v1, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;

    invoke-direct {v1, p0}, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;-><init>(Lioio/lib/impl/TwiMasterImpl;)V

    .line 116
    .local v1, "p":Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;
    iput p4, v1, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->writeSize_:I

    .line 117
    iput-object p3, v1, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->writeData_:[B

    .line 118
    iput-boolean p2, v1, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->tenBitAddr_:Z

    .line 119
    iput p6, v1, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->readSize_:I

    .line 120
    iput p1, v1, Lioio/lib/impl/TwiMasterImpl$OutgoingPacket;->addr_:I

    .line 122
    monitor-enter p0

    .line 123
    :try_start_0
    iget-object v3, p0, Lioio/lib/impl/TwiMasterImpl;->pendingRequests_:Ljava/util/Queue;

    invoke-interface {v3, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    :try_start_1
    iget-object v3, p0, Lioio/lib/impl/TwiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v3, v1}, Lioio/lib/impl/FlowControlledPacketSender;->write(Lioio/lib/impl/FlowControlledPacketSender$Packet;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 122
    :goto_0
    :try_start_2
    monitor-exit p0

    .line 130
    return-object v2

    .line 126
    :catch_0
    move-exception v0

    .line 127
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "SpiMasterImpl"

    const-string v4, "Exception caught"

    invoke-static {v3, v4, v0}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 122
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3
.end method
