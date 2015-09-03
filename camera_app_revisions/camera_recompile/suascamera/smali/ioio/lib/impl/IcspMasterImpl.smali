.class Lioio/lib/impl/IcspMasterImpl;
.super Lioio/lib/impl/AbstractResource;
.source "IcspMasterImpl.java"

# interfaces
.implements Lioio/lib/api/IcspMaster;
.implements Lioio/lib/impl/IncomingState$DataModuleListener;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private resultQueue_:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private rxRemaining_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lioio/lib/impl/IcspMasterImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lioio/lib/impl/IcspMasterImpl;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lioio/lib/impl/IOIOImpl;)V
    .locals 1
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lioio/lib/impl/AbstractResource;-><init>(Lioio/lib/impl/IOIOImpl;)V

    .line 41
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IcspMasterImpl;->resultQueue_:Ljava/util/Queue;

    .line 42
    const/4 v0, 0x0

    iput v0, p0, Lioio/lib/impl/IcspMasterImpl;->rxRemaining_:I

    .line 46
    return-void
.end method

.method private static byteToInt(B)I
    .locals 1
    .param p0, "b"    # B

    .prologue
    .line 122
    and-int/lit16 v0, p0, 0xff

    return v0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    .prologue
    .line 111
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->close()V

    .line 112
    iget-object v0, p0, Lioio/lib/impl/IcspMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    invoke-virtual {v0}, Lioio/lib/impl/IOIOImpl;->closeIcsp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    monitor-exit p0

    return-void

    .line 111
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
    .line 50
    monitor-enter p0

    :try_start_0
    sget-boolean v1, Lioio/lib/impl/IcspMasterImpl;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    const/4 v1, 0x2

    if-eq p2, v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 51
    :cond_0
    const/4 v1, 0x1

    :try_start_1
    aget-byte v1, p1, v1

    invoke-static {v1}, Lioio/lib/impl/IcspMasterImpl;->byteToInt(B)I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    const/4 v2, 0x0

    aget-byte v2, p1, v2

    invoke-static {v2}, Lioio/lib/impl/IcspMasterImpl;->byteToInt(B)I

    move-result v2

    or-int v0, v1, v2

    .line 52
    .local v0, "result":I
    iget-object v1, p0, Lioio/lib/impl/IcspMasterImpl;->resultQueue_:Ljava/util/Queue;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized disconnected()V
    .locals 1

    .prologue
    .line 117
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->disconnected()V

    .line 118
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    monitor-exit p0

    return-void

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized enterProgramming()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 64
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IcspMasterImpl;->checkState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/IcspMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v1, v1, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1}, Lioio/lib/impl/IOIOProtocol;->icspEnter()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    monitor-exit p0

    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized executeInstruction(I)V
    .locals 2
    .param p1, "instruction"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 85
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IcspMasterImpl;->checkState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/IcspMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v1, v1, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1, p1}, Lioio/lib/impl/IOIOProtocol;->icspSix(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    monitor-exit p0

    return-void

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized exitProgramming()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 74
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IcspMasterImpl;->checkState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/IcspMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v1, v1, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1}, Lioio/lib/impl/IOIOProtocol;->icspExit()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    monitor-exit p0

    return-void

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized readVisi()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 96
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IcspMasterImpl;->checkState()V

    .line 97
    :goto_0
    iget v1, p0, Lioio/lib/impl/IcspMasterImpl;->rxRemaining_:I

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    iget-object v1, p0, Lioio/lib/impl/IcspMasterImpl;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v2, Lioio/lib/impl/AbstractResource$State;->OPEN:Lioio/lib/impl/AbstractResource$State;

    if-eq v1, v2, :cond_1

    .line 100
    :cond_0
    invoke-virtual {p0}, Lioio/lib/impl/IcspMasterImpl;->checkState()V

    .line 101
    iget v1, p0, Lioio/lib/impl/IcspMasterImpl;->rxRemaining_:I

    add-int/lit8 v1, v1, -0x2

    iput v1, p0, Lioio/lib/impl/IcspMasterImpl;->rxRemaining_:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/IcspMasterImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v1, v1, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1}, Lioio/lib/impl/IOIOProtocol;->icspRegout()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    monitor-exit p0

    return-void

    .line 98
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 96
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method public declared-synchronized reportAdditionalBuffer(I)V
    .locals 1
    .param p1, "bytesToAdd"    # I

    .prologue
    .line 58
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lioio/lib/impl/IcspMasterImpl;->rxRemaining_:I

    add-int/2addr v0, p1

    iput v0, p0, Lioio/lib/impl/IcspMasterImpl;->rxRemaining_:I

    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    monitor-exit p0

    return-void

    .line 58
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized waitVisiResult()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 128
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IcspMasterImpl;->checkState()V

    .line 129
    :goto_0
    iget-object v0, p0, Lioio/lib/impl/IcspMasterImpl;->resultQueue_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lioio/lib/impl/IcspMasterImpl;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->OPEN:Lioio/lib/impl/AbstractResource$State;

    if-eq v0, v1, :cond_1

    .line 132
    :cond_0
    invoke-virtual {p0}, Lioio/lib/impl/IcspMasterImpl;->checkState()V

    .line 133
    iget-object v0, p0, Lioio/lib/impl/IcspMasterImpl;->resultQueue_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 130
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
