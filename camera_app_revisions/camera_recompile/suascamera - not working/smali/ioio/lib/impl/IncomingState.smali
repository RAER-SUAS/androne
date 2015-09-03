.class Lioio/lib/impl/IncomingState;
.super Ljava/lang/Object;
.source "IncomingState.java"

# interfaces
.implements Lioio/lib/impl/IOIOProtocol$IncomingHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/IncomingState$ConnectionState;,
        Lioio/lib/impl/IncomingState$DataModuleListener;,
        Lioio/lib/impl/IncomingState$DataModuleState;,
        Lioio/lib/impl/IncomingState$DisconnectListener;,
        Lioio/lib/impl/IncomingState$InputPinListener;,
        Lioio/lib/impl/IncomingState$InputPinState;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final TAG:Ljava/lang/String; = "IncomingState"


# instance fields
.field public board_:Lioio/lib/impl/Board;

.field public bootloaderId_:Ljava/lang/String;

.field private connection_:Lioio/lib/impl/IncomingState$ConnectionState;

.field private final disconnectListeners_:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lioio/lib/impl/IncomingState$DisconnectListener;",
            ">;"
        }
    .end annotation
.end field

.field public firmwareId_:Ljava/lang/String;

.field public hardwareId_:Ljava/lang/String;

.field private icspState_:Lioio/lib/impl/IncomingState$DataModuleState;

.field private incapStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

.field private intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

.field private spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

.field private twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

.field private uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-class v0, Lioio/lib/impl/IncomingState;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lioio/lib/impl/IncomingState;->$assertionsDisabled:Z

    .line 43
    return-void

    .line 42
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IncomingState;->disconnectListeners_:Ljava/util/Set;

    .line 131
    sget-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->INIT:Lioio/lib/impl/IncomingState$ConnectionState;

    iput-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    .line 42
    return-void
.end method

.method private checkNotDisconnected()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 458
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->DISCONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    if-ne v0, v1, :cond_0

    .line 459
    new-instance v0, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v0

    .line 461
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V
    .locals 1
    .param p1, "listener"    # Lioio/lib/impl/IncomingState$DisconnectListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 194
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IncomingState;->checkNotDisconnected()V

    .line 195
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->disconnectListeners_:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    monitor-exit p0

    return-void

    .line 194
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public addIcspListener(Lioio/lib/impl/IncomingState$DataModuleListener;)V
    .locals 1
    .param p1, "listener"    # Lioio/lib/impl/IncomingState$DataModuleListener;

    .prologue
    .line 185
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->icspState_:Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-virtual {v0, p1}, Lioio/lib/impl/IncomingState$DataModuleState;->pushListener(Lioio/lib/impl/IncomingState$DataModuleListener;)V

    .line 186
    return-void
.end method

.method public addIncapListener(ILioio/lib/impl/IncomingState$DataModuleListener;)V
    .locals 1
    .param p1, "incapNum"    # I
    .param p2, "listener"    # Lioio/lib/impl/IncomingState$DataModuleListener;

    .prologue
    .line 181
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->incapStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->pushListener(Lioio/lib/impl/IncomingState$DataModuleListener;)V

    .line 182
    return-void
.end method

.method public addInputPinListener(ILioio/lib/impl/IncomingState$InputPinListener;)V
    .locals 1
    .param p1, "pin"    # I
    .param p2, "listener"    # Lioio/lib/impl/IncomingState$InputPinListener;

    .prologue
    .line 169
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lioio/lib/impl/IncomingState$InputPinState;->pushListener(Lioio/lib/impl/IncomingState$InputPinListener;)V

    .line 170
    return-void
.end method

.method public addSpiListener(ILioio/lib/impl/IncomingState$DataModuleListener;)V
    .locals 1
    .param p1, "spiNum"    # I
    .param p2, "listener"    # Lioio/lib/impl/IncomingState$DataModuleListener;

    .prologue
    .line 189
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->pushListener(Lioio/lib/impl/IncomingState$DataModuleListener;)V

    .line 190
    return-void
.end method

.method public addTwiListener(ILioio/lib/impl/IncomingState$DataModuleListener;)V
    .locals 1
    .param p1, "twiNum"    # I
    .param p2, "listener"    # Lioio/lib/impl/IncomingState$DataModuleListener;

    .prologue
    .line 177
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->pushListener(Lioio/lib/impl/IncomingState$DataModuleListener;)V

    .line 178
    return-void
.end method

.method public addUartListener(ILioio/lib/impl/IncomingState$DataModuleListener;)V
    .locals 1
    .param p1, "uartNum"    # I
    .param p2, "listener"    # Lioio/lib/impl/IncomingState$DataModuleListener;

    .prologue
    .line 173
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->pushListener(Lioio/lib/impl/IncomingState$DataModuleListener;)V

    .line 174
    return-void
.end method

.method public handleAnalogPinStatus(IZ)V
    .locals 1
    .param p1, "pin"    # I
    .param p2, "open"    # Z

    .prologue
    .line 268
    if-eqz p2, :cond_0

    .line 269
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$InputPinState;->openNextListener()V

    .line 273
    :goto_0
    return-void

    .line 271
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$InputPinState;->closeCurrentListener()V

    goto :goto_0
.end method

.method public declared-synchronized handleCheckInterfaceResponse(Z)V
    .locals 1
    .param p1, "supported"    # Z

    .prologue
    .line 244
    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    sget-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->CONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    :goto_0
    iput-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    .line 246
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 247
    monitor-exit p0

    return-void

    .line 245
    :cond_0
    :try_start_1
    sget-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->UNSUPPORTED_IID:Lioio/lib/impl/IncomingState$ConnectionState;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 244
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public handleConnectionLost()V
    .locals 3

    .prologue
    .line 208
    monitor-enter p0

    .line 209
    :try_start_0
    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->DISCONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    iput-object v1, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    .line 208
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 211
    iget-object v1, p0, Lioio/lib/impl/IncomingState;->disconnectListeners_:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 214
    iget-object v1, p0, Lioio/lib/impl/IncomingState;->disconnectListeners_:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 215
    monitor-enter p0

    .line 216
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 215
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 218
    return-void

    .line 208
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 211
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/IncomingState$DisconnectListener;

    .line 212
    .local v0, "listener":Lioio/lib/impl/IncomingState$DisconnectListener;
    invoke-interface {v0}, Lioio/lib/impl/IncomingState$DisconnectListener;->disconnected()V

    goto :goto_0

    .line 215
    .end local v0    # "listener":Lioio/lib/impl/IncomingState$DisconnectListener;
    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1
.end method

.method public handleEstablishConnection([B[B[B)V
    .locals 6
    .param p1, "hardwareId"    # [B
    .param p2, "bootloaderId"    # [B
    .param p3, "firmwareId"    # [B

    .prologue
    .line 332
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1}, Ljava/lang/String;-><init>([B)V

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->hardwareId_:Ljava/lang/String;

    .line 333
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p2}, Ljava/lang/String;-><init>([B)V

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->bootloaderId_:Ljava/lang/String;

    .line 334
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p3}, Ljava/lang/String;-><init>([B)V

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->firmwareId_:Ljava/lang/String;

    .line 336
    const-string v3, "IncomingState"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "IOIO Connection established. Hardware ID: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 337
    iget-object v5, p0, Lioio/lib/impl/IncomingState;->hardwareId_:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Bootloader ID: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lioio/lib/impl/IncomingState;->bootloaderId_:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 338
    const-string v5, " Firmware ID: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lioio/lib/impl/IncomingState;->firmwareId_:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 336
    invoke-static {v3, v4}, Lioio/lib/spi/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    :try_start_0
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->hardwareId_:Ljava/lang/String;

    invoke-static {v3}, Lioio/lib/impl/Board;->valueOf(Ljava/lang/String;)Lioio/lib/impl/Board;

    move-result-object v3

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->board_:Lioio/lib/impl/Board;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    :goto_0
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->board_:Lioio/lib/impl/Board;

    if-eqz v3, :cond_0

    .line 345
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->board_:Lioio/lib/impl/Board;

    iget-object v1, v3, Lioio/lib/impl/Board;->hardware:Lioio/lib/impl/Board$Hardware;

    .line 346
    .local v1, "hw":Lioio/lib/impl/Board$Hardware;
    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->numPins()I

    move-result v3

    new-array v3, v3, [Lioio/lib/impl/IncomingState$InputPinState;

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    .line 347
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    array-length v3, v3

    if-lt v2, v3, :cond_1

    .line 350
    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->numUartModules()I

    move-result v3

    new-array v3, v3, [Lioio/lib/impl/IncomingState$DataModuleState;

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    .line 351
    const/4 v2, 0x0

    :goto_2
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    array-length v3, v3

    if-lt v2, v3, :cond_2

    .line 354
    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->numTwiModules()I

    move-result v3

    new-array v3, v3, [Lioio/lib/impl/IncomingState$DataModuleState;

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    .line 355
    const/4 v2, 0x0

    :goto_3
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    array-length v3, v3

    if-lt v2, v3, :cond_3

    .line 358
    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->numSpiModules()I

    move-result v3

    new-array v3, v3, [Lioio/lib/impl/IncomingState$DataModuleState;

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    .line 359
    const/4 v2, 0x0

    :goto_4
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    array-length v3, v3

    if-lt v2, v3, :cond_4

    .line 363
    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->incapDoubleModules()[I

    move-result-object v3

    array-length v3, v3

    mul-int/lit8 v3, v3, 0x2

    .line 364
    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->incapSingleModules()[I

    move-result-object v4

    array-length v4, v4

    add-int/2addr v3, v4

    new-array v3, v3, [Lioio/lib/impl/IncomingState$DataModuleState;

    .line 362
    iput-object v3, p0, Lioio/lib/impl/IncomingState;->incapStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    .line 365
    const/4 v2, 0x0

    :goto_5
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->incapStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    array-length v3, v3

    if-lt v2, v3, :cond_5

    .line 368
    new-instance v3, Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-direct {v3, p0}, Lioio/lib/impl/IncomingState$DataModuleState;-><init>(Lioio/lib/impl/IncomingState;)V

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->icspState_:Lioio/lib/impl/IncomingState$DataModuleState;

    .line 370
    .end local v1    # "hw":Lioio/lib/impl/Board$Hardware;
    .end local v2    # "i":I
    :cond_0
    monitor-enter p0

    .line 371
    :try_start_1
    sget-object v3, Lioio/lib/impl/IncomingState$ConnectionState;->ESTABLISHED:Lioio/lib/impl/IncomingState$ConnectionState;

    iput-object v3, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    .line 372
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 370
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 374
    return-void

    .line 341
    :catch_0
    move-exception v0

    .line 342
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v3, "IncomingState"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Unknown board: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lioio/lib/impl/IncomingState;->hardwareId_:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 348
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "hw":Lioio/lib/impl/Board$Hardware;
    .restart local v2    # "i":I
    :cond_1
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    new-instance v4, Lioio/lib/impl/IncomingState$InputPinState;

    invoke-direct {v4, p0}, Lioio/lib/impl/IncomingState$InputPinState;-><init>(Lioio/lib/impl/IncomingState;)V

    aput-object v4, v3, v2

    .line 347
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 352
    :cond_2
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    new-instance v4, Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-direct {v4, p0}, Lioio/lib/impl/IncomingState$DataModuleState;-><init>(Lioio/lib/impl/IncomingState;)V

    aput-object v4, v3, v2

    .line 351
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 356
    :cond_3
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    new-instance v4, Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-direct {v4, p0}, Lioio/lib/impl/IncomingState$DataModuleState;-><init>(Lioio/lib/impl/IncomingState;)V

    aput-object v4, v3, v2

    .line 355
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 360
    :cond_4
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    new-instance v4, Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-direct {v4, p0}, Lioio/lib/impl/IncomingState$DataModuleState;-><init>(Lioio/lib/impl/IncomingState;)V

    aput-object v4, v3, v2

    .line 359
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 366
    :cond_5
    iget-object v3, p0, Lioio/lib/impl/IncomingState;->incapStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    new-instance v4, Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-direct {v4, p0}, Lioio/lib/impl/IncomingState$DataModuleState;-><init>(Lioio/lib/impl/IncomingState;)V

    aput-object v4, v3, v2

    .line 365
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 370
    .end local v1    # "hw":Lioio/lib/impl/Board$Hardware;
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3
.end method

.method public handleI2cClose(I)V
    .locals 1
    .param p1, "i2cNum"    # I

    .prologue
    .line 314
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 315
    return-void
.end method

.method public handleI2cOpen(I)V
    .locals 1
    .param p1, "i2cNum"    # I

    .prologue
    .line 308
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->openNextListener()V

    .line 309
    return-void
.end method

.method public handleI2cReportTxStatus(II)V
    .locals 1
    .param p1, "i2cNum"    # I
    .param p2, "bytesRemaining"    # I

    .prologue
    .line 385
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->reportAdditionalBuffer(I)V

    .line 386
    return-void
.end method

.method public handleI2cResult(II[B)V
    .locals 1
    .param p1, "i2cNum"    # I
    .param p2, "size"    # I
    .param p3, "data"    # [B

    .prologue
    .line 430
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p3, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->dataReceived([BI)V

    .line 431
    return-void
.end method

.method public handleIcspClose()V
    .locals 1

    .prologue
    .line 326
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->icspState_:Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 327
    return-void
.end method

.method public handleIcspOpen()V
    .locals 1

    .prologue
    .line 320
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->icspState_:Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->openNextListener()V

    .line 321
    return-void
.end method

.method public handleIcspReportRxStatus(I)V
    .locals 1
    .param p1, "bytesRemaining"    # I

    .prologue
    .line 397
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->icspState_:Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-virtual {v0, p1}, Lioio/lib/impl/IncomingState$DataModuleState;->reportAdditionalBuffer(I)V

    .line 398
    return-void
.end method

.method public handleIcspResult(I[B)V
    .locals 1
    .param p1, "size"    # I
    .param p2, "data"    # [B

    .prologue
    .line 454
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->icspState_:Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-virtual {v0, p2, p1}, Lioio/lib/impl/IncomingState$DataModuleState;->dataReceived([BI)V

    .line 455
    return-void
.end method

.method public handleIncapClose(I)V
    .locals 1
    .param p1, "incapNum"    # I

    .prologue
    .line 442
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->incapStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 443
    return-void
.end method

.method public handleIncapOpen(I)V
    .locals 1
    .param p1, "incapNum"    # I

    .prologue
    .line 448
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->incapStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->openNextListener()V

    .line 449
    return-void
.end method

.method public handleIncapReport(II[B)V
    .locals 1
    .param p1, "incapNum"    # I
    .param p2, "size"    # I
    .param p3, "data"    # [B

    .prologue
    .line 436
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->incapStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p3, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->dataReceived([BI)V

    .line 437
    return-void
.end method

.method public handleRegisterPeriodicDigitalSampling(II)V
    .locals 1
    .param p1, "pin"    # I
    .param p2, "freqScale"    # I

    .prologue
    .line 262
    sget-boolean v0, Lioio/lib/impl/IncomingState;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 263
    :cond_0
    return-void
.end method

.method public handleReportAnalogInStatus(Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 416
    .local p1, "pins":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 419
    return-void

    .line 417
    :cond_0
    iget-object v2, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v2, v2, v1

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v2, v1}, Lioio/lib/impl/IncomingState$InputPinState;->setValue(I)V

    .line 416
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public handleReportDigitalInStatus(IZ)V
    .locals 2
    .param p1, "pin"    # I
    .param p2, "level"    # Z

    .prologue
    .line 403
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    aget-object v1, v0, p1

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lioio/lib/impl/IncomingState$InputPinState;->setValue(I)V

    .line 404
    return-void

    .line 403
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public handleReportPeriodicDigitalInStatus(I[Z)V
    .locals 0
    .param p1, "frameNum"    # I
    .param p2, "values"    # [Z

    .prologue
    .line 410
    return-void
.end method

.method public handleSetChangeNotify(IZ)V
    .locals 1
    .param p1, "pin"    # I
    .param p2, "changeNotify"    # Z

    .prologue
    .line 252
    if-eqz p2, :cond_0

    .line 253
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$InputPinState;->openNextListener()V

    .line 257
    :goto_0
    return-void

    .line 255
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$InputPinState;->closeCurrentListener()V

    goto :goto_0
.end method

.method public handleSoftReset()V
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 223
    iget-object v7, p0, Lioio/lib/impl/IncomingState;->intputPinStates_:[Lioio/lib/impl/IncomingState$InputPinState;

    array-length v8, v7

    move v6, v5

    :goto_0
    if-lt v6, v8, :cond_0

    .line 226
    iget-object v7, p0, Lioio/lib/impl/IncomingState;->uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    array-length v8, v7

    move v6, v5

    :goto_1
    if-lt v6, v8, :cond_1

    .line 229
    iget-object v7, p0, Lioio/lib/impl/IncomingState;->twiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    array-length v8, v7

    move v6, v5

    :goto_2
    if-lt v6, v8, :cond_2

    .line 232
    iget-object v7, p0, Lioio/lib/impl/IncomingState;->spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    array-length v8, v7

    move v6, v5

    :goto_3
    if-lt v6, v8, :cond_3

    .line 235
    iget-object v6, p0, Lioio/lib/impl/IncomingState;->incapStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    array-length v7, v6

    :goto_4
    if-lt v5, v7, :cond_4

    .line 238
    iget-object v5, p0, Lioio/lib/impl/IncomingState;->icspState_:Lioio/lib/impl/IncomingState$DataModuleState;

    invoke-virtual {v5}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 239
    return-void

    .line 223
    :cond_0
    aget-object v1, v7, v6

    .line 224
    .local v1, "pinState":Lioio/lib/impl/IncomingState$InputPinState;
    invoke-virtual {v1}, Lioio/lib/impl/IncomingState$InputPinState;->closeCurrentListener()V

    .line 223
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 226
    .end local v1    # "pinState":Lioio/lib/impl/IncomingState$InputPinState;
    :cond_1
    aget-object v4, v7, v6

    .line 227
    .local v4, "uartState":Lioio/lib/impl/IncomingState$DataModuleState;
    invoke-virtual {v4}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 226
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 229
    .end local v4    # "uartState":Lioio/lib/impl/IncomingState$DataModuleState;
    :cond_2
    aget-object v3, v7, v6

    .line 230
    .local v3, "twiState":Lioio/lib/impl/IncomingState$DataModuleState;
    invoke-virtual {v3}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 229
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 232
    .end local v3    # "twiState":Lioio/lib/impl/IncomingState$DataModuleState;
    :cond_3
    aget-object v2, v7, v6

    .line 233
    .local v2, "spiState":Lioio/lib/impl/IncomingState$DataModuleState;
    invoke-virtual {v2}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 232
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 235
    .end local v2    # "spiState":Lioio/lib/impl/IncomingState$DataModuleState;
    :cond_4
    aget-object v0, v6, v5

    .line 236
    .local v0, "incapState":Lioio/lib/impl/IncomingState$DataModuleState;
    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 235
    add-int/lit8 v5, v5, 0x1

    goto :goto_4
.end method

.method public handleSpiClose(I)V
    .locals 1
    .param p1, "spiNum"    # I

    .prologue
    .line 302
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 303
    return-void
.end method

.method public handleSpiData(II[BI)V
    .locals 1
    .param p1, "spiNum"    # I
    .param p2, "ssPin"    # I
    .param p3, "data"    # [B
    .param p4, "dataBytes"    # I

    .prologue
    .line 391
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p3, p4}, Lioio/lib/impl/IncomingState$DataModuleState;->dataReceived([BI)V

    .line 392
    return-void
.end method

.method public handleSpiOpen(I)V
    .locals 1
    .param p1, "spiNum"    # I

    .prologue
    .line 296
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->openNextListener()V

    .line 297
    return-void
.end method

.method public handleSpiReportTxStatus(II)V
    .locals 1
    .param p1, "spiNum"    # I
    .param p2, "bytesRemaining"    # I

    .prologue
    .line 424
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->spiStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->reportAdditionalBuffer(I)V

    .line 425
    return-void
.end method

.method public handleUartClose(I)V
    .locals 1
    .param p1, "uartNum"    # I

    .prologue
    .line 290
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->closeCurrentListener()V

    .line 291
    return-void
.end method

.method public handleUartData(II[B)V
    .locals 1
    .param p1, "uartNum"    # I
    .param p2, "numBytes"    # I
    .param p3, "data"    # [B

    .prologue
    .line 278
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p3, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->dataReceived([BI)V

    .line 279
    return-void
.end method

.method public handleUartOpen(I)V
    .locals 1
    .param p1, "uartNum"    # I

    .prologue
    .line 284
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState$DataModuleState;->openNextListener()V

    .line 285
    return-void
.end method

.method public handleUartReportTxStatus(II)V
    .locals 1
    .param p1, "uartNum"    # I
    .param p2, "bytesRemaining"    # I

    .prologue
    .line 379
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->uartStates_:[Lioio/lib/impl/IncomingState$DataModuleState;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lioio/lib/impl/IncomingState$DataModuleState;->reportAdditionalBuffer(I)V

    .line 380
    return-void
.end method

.method public declared-synchronized removeDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V
    .locals 2
    .param p1, "listener"    # Lioio/lib/impl/IncomingState$DisconnectListener;

    .prologue
    .line 200
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->DISCONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    if-eq v0, v1, :cond_0

    .line 201
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->disconnectListeners_:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    :cond_0
    monitor-exit p0

    return-void

    .line 200
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized waitConnectionEstablished()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 139
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->INIT:Lioio/lib/impl/IncomingState$ConnectionState;

    if-eq v0, v1, :cond_0

    .line 142
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->DISCONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    if-ne v0, v1, :cond_1

    .line 143
    new-instance v0, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 140
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 145
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized waitDisconnect()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 163
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->DISCONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_0

    .line 166
    monitor-exit p0

    return-void

    .line 164
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 163
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized waitForInterfaceSupport()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 149
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->INIT:Lioio/lib/impl/IncomingState$ConnectionState;

    if-ne v0, v1, :cond_1

    .line 150
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 151
    const-string v1, "Have to connect before waiting for interface support"

    .line 150
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 154
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 153
    :cond_1
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->ESTABLISHED:Lioio/lib/impl/IncomingState$ConnectionState;

    if-eq v0, v1, :cond_0

    .line 156
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->DISCONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    if-ne v0, v1, :cond_2

    .line 157
    new-instance v0, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v0

    .line 159
    :cond_2
    iget-object v0, p0, Lioio/lib/impl/IncomingState;->connection_:Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->CONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v0, v1, :cond_3

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method
