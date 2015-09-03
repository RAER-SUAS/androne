.class Lioio/lib/impl/SpiMasterImpl;
.super Lioio/lib/impl/AbstractResource;
.source "SpiMasterImpl.java"

# interfaces
.implements Lioio/lib/api/SpiMaster;
.implements Lioio/lib/impl/FlowControlledPacketSender$Sender;
.implements Lioio/lib/impl/IncomingState$DataModuleListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;,
        Lioio/lib/impl/SpiMasterImpl$SpiResult;
    }
.end annotation


# instance fields
.field private final clkPinNum_:I

.field private final indexToSsPin_:[I

.field private final misoPinNum_:I

.field private final mosiPinNum_:I

.field private final outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

.field private final pendingRequests_:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lioio/lib/impl/SpiMasterImpl$SpiResult;",
            ">;"
        }
    .end annotation
.end field

.field private final spiNum_:I

.field private final ssPinToIndex_:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lioio/lib/impl/IOIOImpl;IIII[I)V
    .locals 4
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .param p2, "spiNum"    # I
    .param p3, "mosiPinNum"    # I
    .param p4, "misoPinNum"    # I
    .param p5, "clkPinNum"    # I
    .param p6, "ssPins"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lioio/lib/impl/AbstractResource;-><init>(Lioio/lib/impl/IOIOImpl;)V

    .line 77
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->pendingRequests_:Ljava/util/Queue;

    .line 78
    new-instance v1, Lioio/lib/impl/FlowControlledPacketSender;

    .line 79
    invoke-direct {v1, p0}, Lioio/lib/impl/FlowControlledPacketSender;-><init>(Lioio/lib/impl/FlowControlledPacketSender$Sender;)V

    iput-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    .line 91
    iput p2, p0, Lioio/lib/impl/SpiMasterImpl;->spiNum_:I

    .line 92
    iput p3, p0, Lioio/lib/impl/SpiMasterImpl;->mosiPinNum_:I

    .line 93
    iput p4, p0, Lioio/lib/impl/SpiMasterImpl;->misoPinNum_:I

    .line 94
    iput p5, p0, Lioio/lib/impl/SpiMasterImpl;->clkPinNum_:I

    .line 95
    invoke-virtual {p6}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->indexToSsPin_:[I

    .line 96
    new-instance v1, Ljava/util/HashMap;

    array-length v2, p6

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->ssPinToIndex_:Ljava/util/Map;

    .line 97
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p6

    if-lt v0, v1, :cond_0

    .line 100
    return-void

    .line 98
    :cond_0
    iget-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->ssPinToIndex_:Ljava/util/Map;

    aget v2, p6, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 5

    .prologue
    .line 175
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->close()V

    .line 176
    iget-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v1}, Lioio/lib/impl/FlowControlledPacketSender;->close()V

    .line 177
    iget-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v2, p0, Lioio/lib/impl/SpiMasterImpl;->spiNum_:I

    invoke-virtual {v1, v2}, Lioio/lib/impl/IOIOImpl;->closeSpi(I)V

    .line 178
    iget-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v2, p0, Lioio/lib/impl/SpiMasterImpl;->mosiPinNum_:I

    invoke-virtual {v1, v2}, Lioio/lib/impl/IOIOImpl;->closePin(I)V

    .line 179
    iget-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v2, p0, Lioio/lib/impl/SpiMasterImpl;->misoPinNum_:I

    invoke-virtual {v1, v2}, Lioio/lib/impl/IOIOImpl;->closePin(I)V

    .line 180
    iget-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v2, p0, Lioio/lib/impl/SpiMasterImpl;->clkPinNum_:I

    invoke-virtual {v1, v2}, Lioio/lib/impl/IOIOImpl;->closePin(I)V

    .line 181
    iget-object v2, p0, Lioio/lib/impl/SpiMasterImpl;->indexToSsPin_:[I

    array-length v3, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v3, :cond_0

    .line 184
    monitor-exit p0

    return-void

    .line 181
    :cond_0
    :try_start_1
    aget v0, v2, v1

    .line 182
    .local v0, "pin":I
    iget-object v4, p0, Lioio/lib/impl/SpiMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    invoke-virtual {v4, v0}, Lioio/lib/impl/IOIOImpl;->closePin(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 175
    .end local v0    # "pin":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public dataReceived([BI)V
    .locals 4
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    .line 160
    iget-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->pendingRequests_:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/SpiMasterImpl$SpiResult;

    .line 161
    .local v0, "result":Lioio/lib/impl/SpiMasterImpl$SpiResult;
    monitor-enter v0

    .line 162
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, v0, Lioio/lib/impl/SpiMasterImpl$SpiResult;->ready_:Z

    .line 163
    const/4 v1, 0x0

    iget-object v2, v0, Lioio/lib/impl/SpiMasterImpl$SpiResult;->data_:[B

    const/4 v3, 0x0

    invoke-static {p1, v1, v2, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 164
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 161
    monitor-exit v0

    .line 166
    return-void

    .line 161
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
    .line 104
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->disconnected()V

    .line 105
    iget-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v1}, Lioio/lib/impl/FlowControlledPacketSender;->kill()V

    .line 106
    iget-object v1, p0, Lioio/lib/impl/SpiMasterImpl;->pendingRequests_:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v2

    if-nez v2, :cond_0

    .line 111
    monitor-exit p0

    return-void

    .line 106
    :cond_0
    :try_start_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/SpiMasterImpl$SpiResult;

    .line 107
    .local v0, "tr":Lioio/lib/impl/SpiMasterImpl$SpiResult;
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 108
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 107
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

    .line 104
    .end local v0    # "tr":Lioio/lib/impl/SpiMasterImpl$SpiResult;
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public reportAdditionalBuffer(I)V
    .locals 1
    .param p1, "bytesRemaining"    # I

    .prologue
    .line 170
    iget-object v0, p0, Lioio/lib/impl/SpiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v0, p1}, Lioio/lib/impl/FlowControlledPacketSender;->readyToSend(I)V

    .line 171
    return-void
.end method

.method public send(Lioio/lib/impl/FlowControlledPacketSender$Packet;)V
    .locals 9
    .param p1, "packet"    # Lioio/lib/impl/FlowControlledPacketSender$Packet;

    .prologue
    .line 188
    move-object v8, p1

    check-cast v8, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;

    .line 190
    .local v8, "p":Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;
    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/SpiMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v0, v0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v1, p0, Lioio/lib/impl/SpiMasterImpl;->spiNum_:I

    iget v2, v8, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->ssPin_:I

    iget-object v3, v8, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->writeData_:[B

    .line 191
    iget v4, v8, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->writeSize_:I

    iget v5, v8, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->totalSize_:I

    iget v6, v8, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->readSize_:I

    .line 190
    invoke-virtual/range {v0 .. v6}, Lioio/lib/impl/IOIOProtocol;->spiMasterRequest(II[BIII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    :goto_0
    return-void

    .line 192
    :catch_0
    move-exception v7

    .line 193
    .local v7, "e":Ljava/io/IOException;
    const-string v0, "SpiImpl"

    const-string v1, "Caught exception"

    invoke-static {v0, v1, v7}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public writeRead(I[BII[BI)V
    .locals 1
    .param p1, "slave"    # I
    .param p2, "writeData"    # [B
    .param p3, "writeSize"    # I
    .param p4, "totalSize"    # I
    .param p5, "readData"    # [B
    .param p6, "readSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual/range {p0 .. p6}, Lioio/lib/impl/SpiMasterImpl;->writeReadAsync(I[BII[BI)Lioio/lib/impl/SpiMasterImpl$SpiResult;

    move-result-object v0

    .line 119
    .local v0, "result":Lioio/lib/api/SpiMaster$Result;
    invoke-interface {v0}, Lioio/lib/api/SpiMaster$Result;->waitReady()V

    .line 120
    return-void
.end method

.method public writeRead([BII[BI)V
    .locals 7
    .param p1, "writeData"    # [B
    .param p2, "writeSize"    # I
    .param p3, "totalSize"    # I
    .param p4, "readData"    # [B
    .param p5, "readSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 155
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lioio/lib/impl/SpiMasterImpl;->writeRead(I[BII[BI)V

    .line 156
    return-void
.end method

.method public bridge synthetic writeReadAsync(I[BII[BI)Lioio/lib/api/SpiMaster$Result;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual/range {p0 .. p6}, Lioio/lib/impl/SpiMasterImpl;->writeReadAsync(I[BII[BI)Lioio/lib/impl/SpiMasterImpl$SpiResult;

    move-result-object v0

    return-object v0
.end method

.method public writeReadAsync(I[BII[BI)Lioio/lib/impl/SpiMasterImpl$SpiResult;
    .locals 5
    .param p1, "slave"    # I
    .param p2, "writeData"    # [B
    .param p3, "writeSize"    # I
    .param p4, "totalSize"    # I
    .param p5, "readData"    # [B
    .param p6, "readSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-virtual {p0}, Lioio/lib/impl/SpiMasterImpl;->checkState()V

    .line 127
    new-instance v2, Lioio/lib/impl/SpiMasterImpl$SpiResult;

    invoke-direct {v2, p0, p5}, Lioio/lib/impl/SpiMasterImpl$SpiResult;-><init>(Lioio/lib/impl/SpiMasterImpl;[B)V

    .line 129
    .local v2, "result":Lioio/lib/impl/SpiMasterImpl$SpiResult;
    new-instance v1, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;

    invoke-direct {v1, p0}, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;-><init>(Lioio/lib/impl/SpiMasterImpl;)V

    .line 130
    .local v1, "p":Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;
    iput p3, v1, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->writeSize_:I

    .line 131
    iput-object p2, v1, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->writeData_:[B

    .line 132
    iput p6, v1, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->readSize_:I

    .line 133
    iget-object v3, p0, Lioio/lib/impl/SpiMasterImpl;->indexToSsPin_:[I

    aget v3, v3, p1

    iput v3, v1, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->ssPin_:I

    .line 134
    iput p4, v1, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->totalSize_:I

    .line 136
    iget v3, v1, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->readSize_:I

    if-lez v3, :cond_0

    .line 137
    monitor-enter p0

    .line 138
    :try_start_0
    iget-object v3, p0, Lioio/lib/impl/SpiMasterImpl;->pendingRequests_:Ljava/util/Queue;

    invoke-interface {v3, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 137
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    :goto_0
    :try_start_1
    iget-object v3, p0, Lioio/lib/impl/SpiMasterImpl;->outgoing_:Lioio/lib/impl/FlowControlledPacketSender;

    invoke-virtual {v3, v1}, Lioio/lib/impl/FlowControlledPacketSender;->write(Lioio/lib/impl/FlowControlledPacketSender$Packet;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 148
    :goto_1
    return-object v2

    .line 137
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 141
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, v2, Lioio/lib/impl/SpiMasterImpl$SpiResult;->ready_:Z

    goto :goto_0

    .line 145
    :catch_0
    move-exception v0

    .line 146
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "SpiMasterImpl"

    const-string v4, "Exception caught"

    invoke-static {v3, v4, v0}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
