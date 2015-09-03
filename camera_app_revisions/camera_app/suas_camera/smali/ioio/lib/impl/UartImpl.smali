.class Lioio/lib/impl/UartImpl;
.super Lioio/lib/impl/AbstractResource;
.source "UartImpl.java"

# interfaces
.implements Lioio/lib/api/Uart;
.implements Lioio/lib/impl/FlowControlledOutputStream$Sender;
.implements Lioio/lib/impl/IncomingState$DataModuleListener;


# static fields
.field private static final MAX_PACKET:I = 0x40


# instance fields
.field private final incoming_:Lioio/lib/impl/QueueInputStream;

.field private final outgoing_:Lioio/lib/impl/FlowControlledOutputStream;

.field private final rxPinNum_:I

.field private final txPinNum_:I

.field private final uartNum_:I


# direct methods
.method public constructor <init>(Lioio/lib/impl/IOIOImpl;III)V
    .locals 2
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .param p2, "txPin"    # I
    .param p3, "rxPin"    # I
    .param p4, "uartNum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lioio/lib/impl/AbstractResource;-><init>(Lioio/lib/impl/IOIOImpl;)V

    .line 48
    new-instance v0, Lioio/lib/impl/FlowControlledOutputStream;

    const/16 v1, 0x40

    invoke-direct {v0, p0, v1}, Lioio/lib/impl/FlowControlledOutputStream;-><init>(Lioio/lib/impl/FlowControlledOutputStream$Sender;I)V

    iput-object v0, p0, Lioio/lib/impl/UartImpl;->outgoing_:Lioio/lib/impl/FlowControlledOutputStream;

    .line 49
    new-instance v0, Lioio/lib/impl/QueueInputStream;

    invoke-direct {v0}, Lioio/lib/impl/QueueInputStream;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/UartImpl;->incoming_:Lioio/lib/impl/QueueInputStream;

    .line 53
    iput p4, p0, Lioio/lib/impl/UartImpl;->uartNum_:I

    .line 54
    iput p3, p0, Lioio/lib/impl/UartImpl;->rxPinNum_:I

    .line 55
    iput p2, p0, Lioio/lib/impl/UartImpl;->txPinNum_:I

    .line 56
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 74
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->close()V

    .line 75
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->incoming_:Lioio/lib/impl/QueueInputStream;

    invoke-virtual {v0}, Lioio/lib/impl/QueueInputStream;->close()V

    .line 76
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->outgoing_:Lioio/lib/impl/FlowControlledOutputStream;

    invoke-virtual {v0}, Lioio/lib/impl/FlowControlledOutputStream;->close()V

    .line 77
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v1, p0, Lioio/lib/impl/UartImpl;->uartNum_:I

    invoke-virtual {v0, v1}, Lioio/lib/impl/IOIOImpl;->closeUart(I)V

    .line 78
    iget v0, p0, Lioio/lib/impl/UartImpl;->rxPinNum_:I

    if-eq v0, v2, :cond_0

    .line 79
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v1, p0, Lioio/lib/impl/UartImpl;->rxPinNum_:I

    invoke-virtual {v0, v1}, Lioio/lib/impl/IOIOImpl;->closePin(I)V

    .line 81
    :cond_0
    iget v0, p0, Lioio/lib/impl/UartImpl;->txPinNum_:I

    if-eq v0, v2, :cond_1

    .line 82
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v1, p0, Lioio/lib/impl/UartImpl;->txPinNum_:I

    invoke-virtual {v0, v1}, Lioio/lib/impl/IOIOImpl;->closePin(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    :cond_1
    monitor-exit p0

    return-void

    .line 74
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public dataReceived([BI)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    .line 60
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->incoming_:Lioio/lib/impl/QueueInputStream;

    invoke-virtual {v0, p1, p2}, Lioio/lib/impl/QueueInputStream;->write([BI)V

    .line 61
    return-void
.end method

.method public declared-synchronized disconnected()V
    .locals 1

    .prologue
    .line 88
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->disconnected()V

    .line 89
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->incoming_:Lioio/lib/impl/QueueInputStream;

    invoke-virtual {v0}, Lioio/lib/impl/QueueInputStream;->kill()V

    .line 90
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->outgoing_:Lioio/lib/impl/FlowControlledOutputStream;

    invoke-virtual {v0}, Lioio/lib/impl/FlowControlledOutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    monitor-exit p0

    return-void

    .line 88
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->incoming_:Lioio/lib/impl/QueueInputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->outgoing_:Lioio/lib/impl/FlowControlledOutputStream;

    return-object v0
.end method

.method public reportAdditionalBuffer(I)V
    .locals 1
    .param p1, "bytesRemaining"    # I

    .prologue
    .line 105
    iget-object v0, p0, Lioio/lib/impl/UartImpl;->outgoing_:Lioio/lib/impl/FlowControlledOutputStream;

    invoke-virtual {v0, p1}, Lioio/lib/impl/FlowControlledOutputStream;->readyToSend(I)V

    .line 106
    return-void
.end method

.method public send([BI)V
    .locals 3
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    .line 66
    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/UartImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v1, v1, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v2, p0, Lioio/lib/impl/UartImpl;->uartNum_:I

    invoke-virtual {v1, v2, p2, p1}, Lioio/lib/impl/IOIOProtocol;->uartData(II[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "UartImpl"

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
