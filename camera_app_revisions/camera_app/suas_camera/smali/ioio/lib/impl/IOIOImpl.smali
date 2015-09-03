.class public Lioio/lib/impl/IOIOImpl;
.super Ljava/lang/Object;
.source "IOIOImpl.java"

# interfaces
.implements Lioio/lib/api/IOIO;
.implements Lioio/lib/impl/IncomingState$DisconnectListener;


# static fields
.field private static synthetic $SWITCH_TABLE$ioio$lib$api$IOIO$VersionType:[I = null

.field private static final REQUIRED_INTERFACE_ID:[B

.field private static final TAG:Ljava/lang/String; = "IOIOImpl"


# instance fields
.field private connection_:Lioio/lib/api/IOIOConnection;

.field private disconnect_:Z

.field private hardware_:Lioio/lib/impl/Board$Hardware;

.field private incapAllocatorDouble_:Lioio/lib/impl/ModuleAllocator;

.field private incapAllocatorSingle_:Lioio/lib/impl/ModuleAllocator;

.field private incomingState_:Lioio/lib/impl/IncomingState;

.field private openIcsp_:Z

.field private openPins_:[Z

.field private openTwi_:[Z

.field protocol_:Lioio/lib/impl/IOIOProtocol;

.field private pwmAllocator_:Lioio/lib/impl/ModuleAllocator;

.field private spiAllocator_:Lioio/lib/impl/ModuleAllocator;

.field private state_:Lioio/lib/api/IOIO$State;

.field private uartAllocator_:Lioio/lib/impl/ModuleAllocator;


# direct methods
.method static synthetic $SWITCH_TABLE$ioio$lib$api$IOIO$VersionType()[I
    .locals 3

    .prologue
    .line 55
    sget-object v0, Lioio/lib/impl/IOIOImpl;->$SWITCH_TABLE$ioio$lib$api$IOIO$VersionType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lioio/lib/api/IOIO$VersionType;->values()[Lioio/lib/api/IOIO$VersionType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lioio/lib/api/IOIO$VersionType;->APP_FIRMWARE_VER:Lioio/lib/api/IOIO$VersionType;

    invoke-virtual {v1}, Lioio/lib/api/IOIO$VersionType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_1
    :try_start_1
    sget-object v1, Lioio/lib/api/IOIO$VersionType;->BOOTLOADER_VER:Lioio/lib/api/IOIO$VersionType;

    invoke-virtual {v1}, Lioio/lib/api/IOIO$VersionType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_2
    :try_start_2
    sget-object v1, Lioio/lib/api/IOIO$VersionType;->HARDWARE_VER:Lioio/lib/api/IOIO$VersionType;

    invoke-virtual {v1}, Lioio/lib/api/IOIO$VersionType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_3
    :try_start_3
    sget-object v1, Lioio/lib/api/IOIO$VersionType;->IOIOLIB_VER:Lioio/lib/api/IOIO$VersionType;

    invoke-virtual {v1}, Lioio/lib/api/IOIO$VersionType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_4
    sput-object v0, Lioio/lib/impl/IOIOImpl;->$SWITCH_TABLE$ioio$lib$api$IOIO$VersionType:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    const/16 v0, 0x8

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lioio/lib/impl/IOIOImpl;->REQUIRED_INTERFACE_ID:[B

    .line 60
    return-void

    .line 59
    :array_0
    .array-data 1
        0x49t
        0x4ft
        0x49t
        0x4ft
        0x30t
        0x30t
        0x30t
        0x33t
    .end array-data
.end method

.method public constructor <init>(Lioio/lib/api/IOIOConnection;)V
    .locals 1
    .param p1, "con"    # Lioio/lib/api/IOIOConnection;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/IOIOImpl;->disconnect_:Z

    .line 63
    new-instance v0, Lioio/lib/impl/IncomingState;

    invoke-direct {v0}, Lioio/lib/impl/IncomingState;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    .line 73
    sget-object v0, Lioio/lib/api/IOIO$State;->INIT:Lioio/lib/api/IOIO$State;

    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    .line 77
    iput-object p1, p0, Lioio/lib/impl/IOIOImpl;->connection_:Lioio/lib/api/IOIOConnection;

    .line 78
    return-void
.end method

.method private checkIcspFree()V
    .locals 2

    .prologue
    .line 686
    iget-boolean v0, p0, Lioio/lib/impl/IOIOImpl;->openIcsp_:Z

    if-eqz v0, :cond_0

    .line 687
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ICSP already open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 689
    :cond_0
    return-void
.end method

.method private checkInterfaceVersion()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/IncompatibilityException;,
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 187
    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    sget-object v2, Lioio/lib/impl/IOIOImpl;->REQUIRED_INTERFACE_ID:[B

    invoke-virtual {v1, v2}, Lioio/lib/impl/IOIOProtocol;->checkInterface([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v1}, Lioio/lib/impl/IncomingState;->waitForInterfaceSupport()Z

    move-result v1

    if-nez v1, :cond_0

    .line 192
    sget-object v1, Lioio/lib/api/IOIO$State;->INCOMPATIBLE:Lioio/lib/api/IOIO$State;

    iput-object v1, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    .line 193
    const-string v1, "IOIOImpl"

    const-string v2, "Required interface ID is not supported"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    new-instance v1, Lioio/lib/api/exception/IncompatibilityException;

    .line 195
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "IOIO firmware does not support required firmware: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    new-instance v3, Ljava/lang/String;

    sget-object v4, Lioio/lib/impl/IOIOImpl;->REQUIRED_INTERFACE_ID:[B

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 195
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 194
    invoke-direct {v1, v2}, Lioio/lib/api/exception/IncompatibilityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 188
    :catch_0
    move-exception v0

    .line 189
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1

    .line 198
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    return-void
.end method

.method private checkPinFree(I)V
    .locals 3
    .param p1, "pin"    # I

    .prologue
    .line 674
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_0

    .line 675
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Pin already open: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 677
    :cond_0
    return-void
.end method

.method private checkState()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 692
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    sget-object v1, Lioio/lib/api/IOIO$State;->DEAD:Lioio/lib/api/IOIO$State;

    if-ne v0, v1, :cond_0

    .line 693
    new-instance v0, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v0

    .line 695
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    sget-object v1, Lioio/lib/api/IOIO$State;->INCOMPATIBLE:Lioio/lib/api/IOIO$State;

    if-ne v0, v1, :cond_1

    .line 696
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 697
    const-string v1, "Incompatibility has been reported - IOIO cannot be used"

    .line 696
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 699
    :cond_1
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    sget-object v1, Lioio/lib/api/IOIO$State;->CONNECTED:Lioio/lib/api/IOIO$State;

    if-eq v0, v1, :cond_2

    .line 700
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 701
    const-string v1, "Connection has not yet been established"

    .line 700
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 703
    :cond_2
    return-void
.end method

.method private checkTwiFree(I)V
    .locals 3
    .param p1, "twi"    # I

    .prologue
    .line 680
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->openTwi_:[Z

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_0

    .line 681
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "TWI already open: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 683
    :cond_0
    return-void
.end method

.method private initBoard()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/IncompatibilityException;
        }
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    iget-object v0, v0, Lioio/lib/impl/IncomingState;->board_:Lioio/lib/impl/Board;

    if-nez v0, :cond_0

    .line 168
    new-instance v0, Lioio/lib/api/exception/IncompatibilityException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown board: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    iget-object v2, v2, Lioio/lib/impl/IncomingState;->hardwareId_:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 168
    invoke-direct {v0, v1}, Lioio/lib/api/exception/IncompatibilityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 171
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    iget-object v0, v0, Lioio/lib/impl/IncomingState;->board_:Lioio/lib/impl/Board;

    iget-object v0, v0, Lioio/lib/impl/Board;->hardware:Lioio/lib/impl/Board$Hardware;

    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    .line 172
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v0}, Lioio/lib/impl/Board$Hardware;->numPins()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    .line 173
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v0}, Lioio/lib/impl/Board$Hardware;->numTwiModules()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->openTwi_:[Z

    .line 174
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/IOIOImpl;->openIcsp_:Z

    .line 175
    new-instance v0, Lioio/lib/impl/ModuleAllocator;

    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->numPwmModules()I

    move-result v1

    const-string v2, "PWM"

    invoke-direct {v0, v1, v2}, Lioio/lib/impl/ModuleAllocator;-><init>(ILjava/lang/String;)V

    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->pwmAllocator_:Lioio/lib/impl/ModuleAllocator;

    .line 176
    new-instance v0, Lioio/lib/impl/ModuleAllocator;

    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->numUartModules()I

    move-result v1

    const-string v2, "UART"

    invoke-direct {v0, v1, v2}, Lioio/lib/impl/ModuleAllocator;-><init>(ILjava/lang/String;)V

    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->uartAllocator_:Lioio/lib/impl/ModuleAllocator;

    .line 177
    new-instance v0, Lioio/lib/impl/ModuleAllocator;

    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->numSpiModules()I

    move-result v1

    const-string v2, "SPI"

    invoke-direct {v0, v1, v2}, Lioio/lib/impl/ModuleAllocator;-><init>(ILjava/lang/String;)V

    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->spiAllocator_:Lioio/lib/impl/ModuleAllocator;

    .line 178
    new-instance v0, Lioio/lib/impl/ModuleAllocator;

    .line 179
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->incapDoubleModules()[I

    move-result-object v1

    const-string v2, "INCAP_DOUBLE"

    invoke-direct {v0, v1, v2}, Lioio/lib/impl/ModuleAllocator;-><init>([ILjava/lang/String;)V

    .line 178
    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->incapAllocatorDouble_:Lioio/lib/impl/ModuleAllocator;

    .line 180
    new-instance v0, Lioio/lib/impl/ModuleAllocator;

    .line 181
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->incapSingleModules()[I

    move-result-object v1

    const-string v2, "INCAP_SINGLE"

    invoke-direct {v0, v1, v2}, Lioio/lib/impl/ModuleAllocator;-><init>([ILjava/lang/String;)V

    .line 180
    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->incapAllocatorSingle_:Lioio/lib/impl/ModuleAllocator;

    .line 182
    return-void
.end method


# virtual methods
.method declared-synchronized addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V
    .locals 1
    .param p1, "listener"    # Lioio/lib/impl/IncomingState$DisconnectListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 206
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v0, p1}, Lioio/lib/impl/IncomingState;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 207
    monitor-exit p0

    return-void

    .line 206
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized beginBatch()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 707
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 708
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 709
    monitor-exit p0

    return-void

    .line 707
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized closeIcsp()V
    .locals 4

    .prologue
    .line 260
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 261
    iget-boolean v1, p0, Lioio/lib/impl/IOIOImpl;->openIcsp_:Z

    if-nez v1, :cond_0

    .line 262
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "ICSP not open"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    :catch_0
    move-exception v1

    .line 272
    :goto_0
    monitor-exit p0

    return-void

    .line 264
    :cond_0
    const/4 v1, 0x0

    :try_start_1
    iput-boolean v1, p0, Lioio/lib/impl/IOIOImpl;->openIcsp_:Z

    .line 265
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->icspPins()[I

    move-result-object v0

    .line 266
    .local v0, "icspPins":[I
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x0

    aput-boolean v3, v1, v2

    .line 267
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    const/4 v2, 0x1

    aget v2, v0, v2

    const/4 v3, 0x0

    aput-boolean v3, v1, v2

    .line 268
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1}, Lioio/lib/impl/IOIOProtocol;->icspClose()V
    :try_end_1
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 270
    .end local v0    # "icspPins":[I
    :catch_1
    move-exception v1

    goto :goto_0

    .line 260
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized closeIncap(IZ)V
    .locals 1
    .param p1, "incapNum"    # I
    .param p2, "doublePrecision"    # Z

    .prologue
    .line 286
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 287
    if-eqz p2, :cond_0

    .line 288
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incapAllocatorDouble_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v0, p1}, Lioio/lib/impl/ModuleAllocator;->releaseModule(I)V

    .line 292
    :goto_0
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v0, p1, p2}, Lioio/lib/impl/IOIOProtocol;->incapClose(IZ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 296
    :goto_1
    monitor-exit p0

    return-void

    .line 290
    :cond_0
    :try_start_1
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incapAllocatorSingle_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v0, p1}, Lioio/lib/impl/ModuleAllocator;->releaseModule(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 293
    :catch_0
    move-exception v0

    goto :goto_1

    .line 286
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 294
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method declared-synchronized closePin(I)V
    .locals 3
    .param p1, "pin"    # I

    .prologue
    .line 211
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 212
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    aget-boolean v0, v0, p1

    if-nez v0, :cond_0

    .line 213
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Pin not open: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    :catch_0
    move-exception v0

    .line 220
    :goto_0
    monitor-exit p0

    return-void

    .line 215
    :cond_0
    :try_start_1
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    sget-object v1, Lioio/lib/api/DigitalInput$Spec$Mode;->FLOATING:Lioio/lib/api/DigitalInput$Spec$Mode;

    invoke-virtual {v0, p1, v1}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalIn(ILioio/lib/api/DigitalInput$Spec$Mode;)V

    .line 216
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    const/4 v1, 0x0

    aput-boolean v1, v0, p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 218
    :catch_1
    move-exception v0

    goto :goto_0

    .line 211
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized closePwm(I)V
    .locals 3
    .param p1, "pwmNum"    # I

    .prologue
    .line 224
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 225
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->pwmAllocator_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v0, p1}, Lioio/lib/impl/ModuleAllocator;->releaseModule(I)V

    .line 226
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    const/4 v1, 0x0

    sget-object v2, Lioio/lib/impl/IOIOProtocol$PwmScale;->SCALE_1X:Lioio/lib/impl/IOIOProtocol$PwmScale;

    invoke-virtual {v0, p1, v1, v2}, Lioio/lib/impl/IOIOProtocol;->setPwmPeriod(IILioio/lib/impl/IOIOProtocol$PwmScale;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 230
    :goto_0
    monitor-exit p0

    return-void

    .line 224
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 228
    :catch_0
    move-exception v0

    goto :goto_0

    .line 227
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method declared-synchronized closeSpi(I)V
    .locals 1
    .param p1, "spiNum"    # I

    .prologue
    .line 276
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 277
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->spiAllocator_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v0, p1}, Lioio/lib/impl/ModuleAllocator;->releaseModule(I)V

    .line 278
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v0, p1}, Lioio/lib/impl/IOIOProtocol;->spiClose(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    :goto_0
    monitor-exit p0

    return-void

    .line 276
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 280
    :catch_0
    move-exception v0

    goto :goto_0

    .line 279
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method declared-synchronized closeTwi(I)V
    .locals 4
    .param p1, "twiNum"    # I

    .prologue
    .line 244
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 245
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->openTwi_:[Z

    aget-boolean v1, v1, p1

    if-nez v1, :cond_0

    .line 246
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "TWI not open: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    :catch_0
    move-exception v1

    .line 256
    :goto_0
    monitor-exit p0

    return-void

    .line 248
    :cond_0
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->openTwi_:[Z

    const/4 v2, 0x0

    aput-boolean v2, v1, p1

    .line 249
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware;->twiPins()[[I

    move-result-object v0

    .line 250
    .local v0, "twiPins":[[I
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    aget-object v2, v0, p1

    const/4 v3, 0x0

    aget v2, v2, v3

    const/4 v3, 0x0

    aput-boolean v3, v1, v2

    .line 251
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    aget-object v2, v0, p1

    const/4 v3, 0x1

    aget v2, v2, v3

    const/4 v3, 0x0

    aput-boolean v3, v1, v2

    .line 252
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1, p1}, Lioio/lib/impl/IOIOProtocol;->i2cClose(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 254
    .end local v0    # "twiPins":[[I
    :catch_1
    move-exception v1

    goto :goto_0

    .line 244
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized closeUart(I)V
    .locals 1
    .param p1, "uartNum"    # I

    .prologue
    .line 234
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 235
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->uartAllocator_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v0, p1}, Lioio/lib/impl/ModuleAllocator;->releaseModule(I)V

    .line 236
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v0, p1}, Lioio/lib/impl/IOIOProtocol;->uartClose(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 240
    :goto_0
    monitor-exit p0

    return-void

    .line 234
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 238
    :catch_0
    move-exception v0

    goto :goto_0

    .line 237
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public declared-synchronized disconnect()V
    .locals 3

    .prologue
    .line 129
    monitor-enter p0

    :try_start_0
    const-string v1, "IOIOImpl"

    const-string v2, "Client requested disconnect."

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    iget-boolean v1, p0, Lioio/lib/impl/IOIOImpl;->disconnect_:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 142
    :goto_0
    monitor-exit p0

    return-void

    .line 133
    :cond_0
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lioio/lib/impl/IOIOImpl;->disconnect_:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    :try_start_2
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->connection_:Lioio/lib/api/IOIOConnection;

    invoke-interface {v1}, Lioio/lib/api/IOIOConnection;->canClose()Z

    move-result v1

    if-nez v1, :cond_1

    .line 136
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1}, Lioio/lib/impl/IOIOProtocol;->softClose()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 141
    :cond_1
    :goto_1
    :try_start_3
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->connection_:Lioio/lib/api/IOIOConnection;

    invoke-interface {v1}, Lioio/lib/api/IOIOConnection;->disconnect()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 129
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Ljava/io/IOException;
    :try_start_4
    const-string v1, "IOIOImpl"

    const-string v2, "Soft close failed"

    invoke-static {v1, v2, v0}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method public declared-synchronized disconnected()V
    .locals 2

    .prologue
    .line 146
    monitor-enter p0

    :try_start_0
    sget-object v0, Lioio/lib/api/IOIO$State;->DEAD:Lioio/lib/api/IOIO$State;

    iput-object v0, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    .line 147
    iget-boolean v0, p0, Lioio/lib/impl/IOIOImpl;->disconnect_:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 154
    :goto_0
    monitor-exit p0

    return-void

    .line 150
    :cond_0
    :try_start_1
    const-string v0, "IOIOImpl"

    const-string v1, "Physical disconnect."

    invoke-static {v0, v1}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    const/4 v0, 0x1

    iput-boolean v0, p0, Lioio/lib/impl/IOIOImpl;->disconnect_:Z

    .line 153
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->connection_:Lioio/lib/api/IOIOConnection;

    invoke-interface {v0}, Lioio/lib/api/IOIOConnection;->disconnect()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 146
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized endBatch()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 713
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 715
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 719
    monitor-exit p0

    return-void

    .line 716
    :catch_0
    move-exception v0

    .line 717
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 713
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getImplVersion(Lioio/lib/api/IOIO$VersionType;)Ljava/lang/String;
    .locals 2
    .param p1, "v"    # Lioio/lib/api/IOIO$VersionType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 320
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    sget-object v1, Lioio/lib/api/IOIO$State;->INIT:Lioio/lib/api/IOIO$State;

    if-ne v0, v1, :cond_0

    .line 321
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 322
    const-string v1, "Connection has not yet been established"

    .line 321
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 324
    :cond_0
    invoke-static {}, Lioio/lib/impl/IOIOImpl;->$SWITCH_TABLE$ioio$lib$api$IOIO$VersionType()[I

    move-result-object v0

    invoke-virtual {p1}, Lioio/lib/api/IOIO$VersionType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 334
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 326
    :pswitch_0
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    iget-object v0, v0, Lioio/lib/impl/IncomingState;->hardwareId_:Ljava/lang/String;

    goto :goto_0

    .line 328
    :pswitch_1
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    iget-object v0, v0, Lioio/lib/impl/IncomingState;->bootloaderId_:Ljava/lang/String;

    goto :goto_0

    .line 330
    :pswitch_2
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    iget-object v0, v0, Lioio/lib/impl/IncomingState;->firmwareId_:Ljava/lang/String;

    goto :goto_0

    .line 332
    :pswitch_3
    const-string v0, "IOIO0326"

    goto :goto_0

    .line 324
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public getState()Lioio/lib/api/IOIO$State;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    return-object v0
.end method

.method public declared-synchronized hardReset()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 310
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 312
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1}, Lioio/lib/impl/IOIOProtocol;->hardReset()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 316
    monitor-exit p0

    return-void

    .line 313
    :catch_0
    move-exception v0

    .line 314
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 310
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized openAnalogInput(I)Lioio/lib/api/AnalogInput;
    .locals 4
    .param p1, "pin"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 410
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 411
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v2, p1}, Lioio/lib/impl/Board$Hardware;->checkSupportsAnalogInput(I)V

    .line 412
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 413
    new-instance v1, Lioio/lib/impl/AnalogInputImpl;

    invoke-direct {v1, p0, p1}, Lioio/lib/impl/AnalogInputImpl;-><init>(Lioio/lib/impl/IOIOImpl;I)V

    .line 414
    .local v1, "result":Lioio/lib/impl/AnalogInputImpl;
    invoke-virtual {p0, v1}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 415
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    const/4 v3, 0x1

    aput-boolean v3, v2, p1

    .line 416
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v2, p1, v1}, Lioio/lib/impl/IncomingState;->addInputPinListener(ILioio/lib/impl/IncomingState$InputPinListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 418
    :try_start_1
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v2, p1}, Lioio/lib/impl/IOIOProtocol;->setPinAnalogIn(I)V

    .line 419
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    const/4 v3, 0x1

    invoke-virtual {v2, p1, v3}, Lioio/lib/impl/IOIOProtocol;->setAnalogInSampling(IZ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 424
    monitor-exit p0

    return-object v1

    .line 420
    :catch_0
    move-exception v0

    .line 421
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v1}, Lioio/lib/impl/AnalogInputImpl;->close()V

    .line 422
    new-instance v2, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v2, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 410
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "result":Lioio/lib/impl/AnalogInputImpl;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public openDigitalInput(I)Lioio/lib/api/DigitalInput;
    .locals 1
    .param p1, "pin"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 340
    new-instance v0, Lioio/lib/api/DigitalInput$Spec;

    invoke-direct {v0, p1}, Lioio/lib/api/DigitalInput$Spec;-><init>(I)V

    invoke-virtual {p0, v0}, Lioio/lib/impl/IOIOImpl;->openDigitalInput(Lioio/lib/api/DigitalInput$Spec;)Lioio/lib/api/DigitalInput;

    move-result-object v0

    return-object v0
.end method

.method public openDigitalInput(ILioio/lib/api/DigitalInput$Spec$Mode;)Lioio/lib/api/DigitalInput;
    .locals 1
    .param p1, "pin"    # I
    .param p2, "mode"    # Lioio/lib/api/DigitalInput$Spec$Mode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 346
    new-instance v0, Lioio/lib/api/DigitalInput$Spec;

    invoke-direct {v0, p1, p2}, Lioio/lib/api/DigitalInput$Spec;-><init>(ILioio/lib/api/DigitalInput$Spec$Mode;)V

    invoke-virtual {p0, v0}, Lioio/lib/impl/IOIOImpl;->openDigitalInput(Lioio/lib/api/DigitalInput$Spec;)Lioio/lib/api/DigitalInput;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized openDigitalInput(Lioio/lib/api/DigitalInput$Spec;)Lioio/lib/api/DigitalInput;
    .locals 5
    .param p1, "spec"    # Lioio/lib/api/DigitalInput$Spec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 352
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 353
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    iget v3, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-virtual {v2, v3}, Lioio/lib/impl/Board$Hardware;->checkValidPin(I)V

    .line 354
    iget v2, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-direct {p0, v2}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 355
    new-instance v1, Lioio/lib/impl/DigitalInputImpl;

    iget v2, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-direct {v1, p0, v2}, Lioio/lib/impl/DigitalInputImpl;-><init>(Lioio/lib/impl/IOIOImpl;I)V

    .line 356
    .local v1, "result":Lioio/lib/impl/DigitalInputImpl;
    invoke-virtual {p0, v1}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 357
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    iget v3, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    const/4 v4, 0x1

    aput-boolean v4, v2, v3

    .line 358
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    iget v3, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-virtual {v2, v3, v1}, Lioio/lib/impl/IncomingState;->addInputPinListener(ILioio/lib/impl/IncomingState$InputPinListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    :try_start_1
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v3, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    iget-object v4, p1, Lioio/lib/api/DigitalInput$Spec;->mode:Lioio/lib/api/DigitalInput$Spec$Mode;

    invoke-virtual {v2, v3, v4}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalIn(ILioio/lib/api/DigitalInput$Spec$Mode;)V

    .line 361
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v3, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lioio/lib/impl/IOIOProtocol;->setChangeNotify(IZ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 366
    monitor-exit p0

    return-object v1

    .line 362
    :catch_0
    move-exception v0

    .line 363
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v1}, Lioio/lib/impl/DigitalInputImpl;->close()V

    .line 364
    new-instance v2, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v2, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 352
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "result":Lioio/lib/impl/DigitalInputImpl;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public openDigitalOutput(I)Lioio/lib/api/DigitalOutput;
    .locals 2
    .param p1, "pin"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 404
    new-instance v0, Lioio/lib/api/DigitalOutput$Spec;

    invoke-direct {v0, p1}, Lioio/lib/api/DigitalOutput$Spec;-><init>(I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lioio/lib/impl/IOIOImpl;->openDigitalOutput(Lioio/lib/api/DigitalOutput$Spec;Z)Lioio/lib/api/DigitalOutput;

    move-result-object v0

    return-object v0
.end method

.method public openDigitalOutput(ILioio/lib/api/DigitalOutput$Spec$Mode;Z)Lioio/lib/api/DigitalOutput;
    .locals 1
    .param p1, "pin"    # I
    .param p2, "mode"    # Lioio/lib/api/DigitalOutput$Spec$Mode;
    .param p3, "startValue"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 373
    new-instance v0, Lioio/lib/api/DigitalOutput$Spec;

    invoke-direct {v0, p1, p2}, Lioio/lib/api/DigitalOutput$Spec;-><init>(ILioio/lib/api/DigitalOutput$Spec$Mode;)V

    invoke-virtual {p0, v0, p3}, Lioio/lib/impl/IOIOImpl;->openDigitalOutput(Lioio/lib/api/DigitalOutput$Spec;Z)Lioio/lib/api/DigitalOutput;

    move-result-object v0

    return-object v0
.end method

.method public openDigitalOutput(IZ)Lioio/lib/api/DigitalOutput;
    .locals 1
    .param p1, "pin"    # I
    .param p2, "startValue"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 398
    new-instance v0, Lioio/lib/api/DigitalOutput$Spec;

    invoke-direct {v0, p1}, Lioio/lib/api/DigitalOutput$Spec;-><init>(I)V

    invoke-virtual {p0, v0, p2}, Lioio/lib/impl/IOIOImpl;->openDigitalOutput(Lioio/lib/api/DigitalOutput$Spec;Z)Lioio/lib/api/DigitalOutput;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized openDigitalOutput(Lioio/lib/api/DigitalOutput$Spec;Z)Lioio/lib/api/DigitalOutput;
    .locals 5
    .param p1, "spec"    # Lioio/lib/api/DigitalOutput$Spec;
    .param p2, "startValue"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 380
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 381
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    iget v3, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-virtual {v2, v3}, Lioio/lib/impl/Board$Hardware;->checkValidPin(I)V

    .line 382
    iget v2, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-direct {p0, v2}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 383
    new-instance v1, Lioio/lib/impl/DigitalOutputImpl;

    iget v2, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-direct {v1, p0, v2, p2}, Lioio/lib/impl/DigitalOutputImpl;-><init>(Lioio/lib/impl/IOIOImpl;IZ)V

    .line 384
    .local v1, "result":Lioio/lib/impl/DigitalOutputImpl;
    invoke-virtual {p0, v1}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 385
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    iget v3, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v4, 0x1

    aput-boolean v4, v2, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 387
    :try_start_1
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v3, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    iget-object v4, p1, Lioio/lib/api/DigitalOutput$Spec;->mode:Lioio/lib/api/DigitalOutput$Spec$Mode;

    invoke-virtual {v2, v3, p2, v4}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalOut(IZLioio/lib/api/DigitalOutput$Spec$Mode;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 392
    monitor-exit p0

    return-object v1

    .line 388
    :catch_0
    move-exception v0

    .line 389
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v1}, Lioio/lib/impl/DigitalOutputImpl;->close()V

    .line 390
    new-instance v2, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v2, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 380
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "result":Lioio/lib/impl/DigitalOutputImpl;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized openIcspMaster()Lioio/lib/api/IcspMaster;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 550
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 551
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkIcspFree()V

    .line 552
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v3}, Lioio/lib/impl/Board$Hardware;->icspPins()[I

    move-result-object v2

    .line 553
    .local v2, "icspPins":[I
    const/4 v3, 0x0

    aget v3, v2, v3

    invoke-direct {p0, v3}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 554
    const/4 v3, 0x1

    aget v3, v2, v3

    invoke-direct {p0, v3}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 555
    const/4 v3, 0x2

    aget v3, v2, v3

    invoke-direct {p0, v3}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 556
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    const/4 v4, 0x0

    aget v4, v2, v4

    const/4 v5, 0x1

    aput-boolean v5, v3, v4

    .line 557
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    const/4 v4, 0x1

    aget v4, v2, v4

    const/4 v5, 0x1

    aput-boolean v5, v3, v4

    .line 558
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    const/4 v4, 0x2

    aget v4, v2, v4

    const/4 v5, 0x1

    aput-boolean v5, v3, v4

    .line 559
    const/4 v3, 0x1

    iput-boolean v3, p0, Lioio/lib/impl/IOIOImpl;->openIcsp_:Z

    .line 560
    new-instance v1, Lioio/lib/impl/IcspMasterImpl;

    invoke-direct {v1, p0}, Lioio/lib/impl/IcspMasterImpl;-><init>(Lioio/lib/impl/IOIOImpl;)V

    .line 561
    .local v1, "icsp":Lioio/lib/impl/IcspMasterImpl;
    invoke-virtual {p0, v1}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 562
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v3, v1}, Lioio/lib/impl/IncomingState;->addIcspListener(Lioio/lib/impl/IncomingState$DataModuleListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 564
    :try_start_1
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v3}, Lioio/lib/impl/IOIOProtocol;->icspOpen()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 569
    monitor-exit p0

    return-object v1

    .line 565
    :catch_0
    move-exception v0

    .line 566
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v1}, Lioio/lib/impl/IcspMasterImpl;->close()V

    .line 567
    new-instance v3, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v3, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 550
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "icsp":Lioio/lib/impl/IcspMasterImpl;
    .end local v2    # "icspPins":[I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public openPulseInput(ILioio/lib/api/PulseInput$PulseMode;)Lioio/lib/api/PulseInput;
    .locals 3
    .param p1, "pin"    # I
    .param p2, "mode"    # Lioio/lib/api/PulseInput$PulseMode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 669
    new-instance v0, Lioio/lib/api/DigitalInput$Spec;

    invoke-direct {v0, p1}, Lioio/lib/api/DigitalInput$Spec;-><init>(I)V

    sget-object v1, Lioio/lib/api/PulseInput$ClockRate;->RATE_16MHz:Lioio/lib/api/PulseInput$ClockRate;

    .line 670
    const/4 v2, 0x1

    .line 669
    invoke-virtual {p0, v0, v1, p2, v2}, Lioio/lib/impl/IOIOImpl;->openPulseInput(Lioio/lib/api/DigitalInput$Spec;Lioio/lib/api/PulseInput$ClockRate;Lioio/lib/api/PulseInput$PulseMode;Z)Lioio/lib/api/PulseInput;

    move-result-object v0

    return-object v0
.end method

.method public openPulseInput(Lioio/lib/api/DigitalInput$Spec;Lioio/lib/api/PulseInput$ClockRate;Lioio/lib/api/PulseInput$PulseMode;Z)Lioio/lib/api/PulseInput;
    .locals 10
    .param p1, "spec"    # Lioio/lib/api/DigitalInput$Spec;
    .param p2, "rate"    # Lioio/lib/api/PulseInput$ClockRate;
    .param p3, "mode"    # Lioio/lib/api/PulseInput$PulseMode;
    .param p4, "doublePrecision"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 644
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 645
    iget v1, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 646
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    iget v2, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-virtual {v1, v2}, Lioio/lib/impl/Board$Hardware;->checkSupportsPeripheralInput(I)V

    .line 647
    if-eqz p4, :cond_0

    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->incapAllocatorDouble_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v1}, Lioio/lib/impl/ModuleAllocator;->allocateModule()Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 649
    .local v3, "incapNum":I
    new-instance v0, Lioio/lib/impl/IncapImpl;

    iget v4, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    .line 650
    iget v5, p2, Lioio/lib/api/PulseInput$ClockRate;->hertz:I

    iget v6, p3, Lioio/lib/api/PulseInput$PulseMode;->scaling:I

    move-object v1, p0

    move-object v2, p3

    move v7, p4

    .line 649
    invoke-direct/range {v0 .. v7}, Lioio/lib/impl/IncapImpl;-><init>(Lioio/lib/impl/IOIOImpl;Lioio/lib/api/PulseInput$PulseMode;IIIIZ)V

    .line 651
    .local v0, "incap":Lioio/lib/impl/IncapImpl;
    invoke-virtual {p0, v0}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 652
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v1, v3, v0}, Lioio/lib/impl/IncomingState;->addIncapListener(ILioio/lib/impl/IncomingState$DataModuleListener;)V

    .line 653
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    iget v2, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    aput-boolean v9, v1, v2

    .line 655
    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v2, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    iget-object v4, p1, Lioio/lib/api/DigitalInput$Spec;->mode:Lioio/lib/api/DigitalInput$Spec$Mode;

    invoke-virtual {v1, v2, v4}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalIn(ILioio/lib/api/DigitalInput$Spec$Mode;)V

    .line 656
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v2, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lioio/lib/impl/IOIOProtocol;->setPinIncap(IIZ)V

    .line 657
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    .line 658
    invoke-virtual {p3}, Lioio/lib/api/PulseInput$PulseMode;->ordinal()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p2}, Lioio/lib/api/PulseInput$ClockRate;->ordinal()I

    move-result v4

    .line 657
    invoke-virtual {v1, v3, p4, v2, v4}, Lioio/lib/impl/IOIOProtocol;->incapConfigure(IZII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 663
    return-object v0

    .line 648
    .end local v0    # "incap":Lioio/lib/impl/IncapImpl;
    .end local v3    # "incapNum":I
    :cond_0
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->incapAllocatorSingle_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v1}, Lioio/lib/impl/ModuleAllocator;->allocateModule()Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    .line 659
    .restart local v0    # "incap":Lioio/lib/impl/IncapImpl;
    .restart local v3    # "incapNum":I
    :catch_0
    move-exception v8

    .line 660
    .local v8, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Lioio/lib/impl/IncapImpl;->close()V

    .line 661
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v8}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public openPwmOutput(II)Lioio/lib/api/PwmOutput;
    .locals 1
    .param p1, "pin"    # I
    .param p2, "freqHz"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 430
    new-instance v0, Lioio/lib/api/DigitalOutput$Spec;

    invoke-direct {v0, p1}, Lioio/lib/api/DigitalOutput$Spec;-><init>(I)V

    invoke-virtual {p0, v0, p2}, Lioio/lib/impl/IOIOImpl;->openPwmOutput(Lioio/lib/api/DigitalOutput$Spec;I)Lioio/lib/api/PwmOutput;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized openPwmOutput(Lioio/lib/api/DigitalOutput$Spec;I)Lioio/lib/api/PwmOutput;
    .locals 11
    .param p1, "spec"    # Lioio/lib/api/DigitalOutput$Spec;
    .param p2, "freqHz"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 436
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 437
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    iget v2, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-virtual {v1, v2}, Lioio/lib/impl/Board$Hardware;->checkSupportsPeripheralOutput(I)V

    .line 438
    iget v1, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 439
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->pwmAllocator_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v1}, Lioio/lib/impl/ModuleAllocator;->allocateModule()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 441
    .local v3, "pwmNum":I
    const/4 v8, 0x0

    .line 445
    .local v8, "scale":I
    :cond_0
    const v1, 0xf42400

    invoke-static {}, Lioio/lib/impl/IOIOProtocol$PwmScale;->values()[Lioio/lib/impl/IOIOProtocol$PwmScale;

    move-result-object v2

    aget-object v2, v2, v8

    iget v2, v2, Lioio/lib/impl/IOIOProtocol$PwmScale;->scale:I

    div-int v6, v1, v2

    .line 446
    .local v6, "clk":I
    div-int v4, v6, p2

    .line 447
    .local v4, "period":I
    const/high16 v1, 0x10000

    if-gt v4, v1, :cond_1

    .line 448
    const v1, 0x49742400

    int-to-float v2, v6

    div-float v5, v1, v2

    .line 457
    .local v5, "baseUs":F
    new-instance v0, Lioio/lib/impl/PwmImpl;

    iget v2, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lioio/lib/impl/PwmImpl;-><init>(Lioio/lib/impl/IOIOImpl;IIIF)V

    .line 458
    .local v0, "pwm":Lioio/lib/impl/PwmImpl;
    invoke-virtual {p0, v0}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 459
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    iget v2, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v9, 0x1

    aput-boolean v9, v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 461
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v2, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v9, 0x0

    iget-object v10, p1, Lioio/lib/api/DigitalOutput$Spec;->mode:Lioio/lib/api/DigitalOutput$Spec$Mode;

    invoke-virtual {v1, v2, v9, v10}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalOut(IZLioio/lib/api/DigitalOutput$Spec$Mode;)V

    .line 462
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v2, p1, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v9, 0x1

    invoke-virtual {v1, v2, v3, v9}, Lioio/lib/impl/IOIOProtocol;->setPinPwm(IIZ)V

    .line 463
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    add-int/lit8 v2, v4, -0x1

    .line 464
    invoke-static {}, Lioio/lib/impl/IOIOProtocol$PwmScale;->values()[Lioio/lib/impl/IOIOProtocol$PwmScale;

    move-result-object v9

    aget-object v9, v9, v8

    .line 463
    invoke-virtual {v1, v3, v2, v9}, Lioio/lib/impl/IOIOProtocol;->setPwmPeriod(IILioio/lib/impl/IOIOProtocol$PwmScale;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 469
    monitor-exit p0

    return-object v0

    .line 451
    .end local v0    # "pwm":Lioio/lib/impl/PwmImpl;
    .end local v5    # "baseUs":F
    :cond_1
    add-int/lit8 v8, v8, 0x1

    :try_start_2
    invoke-static {}, Lioio/lib/impl/IOIOProtocol$PwmScale;->values()[Lioio/lib/impl/IOIOProtocol$PwmScale;

    move-result-object v1

    array-length v1, v1

    if-lt v8, v1, :cond_0

    .line 452
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v9, "Frequency too low: "

    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 453
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 452
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 436
    .end local v3    # "pwmNum":I
    .end local v4    # "period":I
    .end local v6    # "clk":I
    .end local v8    # "scale":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 465
    .restart local v0    # "pwm":Lioio/lib/impl/PwmImpl;
    .restart local v3    # "pwmNum":I
    .restart local v4    # "period":I
    .restart local v5    # "baseUs":F
    .restart local v6    # "clk":I
    .restart local v8    # "scale":I
    :catch_0
    move-exception v7

    .line 466
    .local v7, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v0}, Lioio/lib/impl/PwmImpl;->close()V

    .line 467
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v7}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method public openSpiMaster(IIIILioio/lib/api/SpiMaster$Rate;)Lioio/lib/api/SpiMaster;
    .locals 6
    .param p1, "miso"    # I
    .param p2, "mosi"    # I
    .param p3, "clk"    # I
    .param p4, "slaveSelect"    # I
    .param p5, "rate"    # Lioio/lib/api/SpiMaster$Rate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 576
    const/4 v0, 0x1

    new-array v4, v0, [I

    const/4 v0, 0x0

    aput p4, v4, v0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lioio/lib/impl/IOIOImpl;->openSpiMaster(III[ILioio/lib/api/SpiMaster$Rate;)Lioio/lib/api/SpiMaster;

    move-result-object v0

    return-object v0
.end method

.method public openSpiMaster(III[ILioio/lib/api/SpiMaster$Rate;)Lioio/lib/api/SpiMaster;
    .locals 7
    .param p1, "miso"    # I
    .param p2, "mosi"    # I
    .param p3, "clk"    # I
    .param p4, "slaveSelect"    # [I
    .param p5, "rate"    # Lioio/lib/api/SpiMaster$Rate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 583
    array-length v0, p4

    new-array v4, v0, [Lioio/lib/api/DigitalOutput$Spec;

    .line 584
    .local v4, "slaveSpecs":[Lioio/lib/api/DigitalOutput$Spec;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    array-length v0, p4

    if-lt v6, v0, :cond_0

    .line 587
    new-instance v1, Lioio/lib/api/DigitalInput$Spec;

    sget-object v0, Lioio/lib/api/DigitalInput$Spec$Mode;->PULL_UP:Lioio/lib/api/DigitalInput$Spec$Mode;

    invoke-direct {v1, p1, v0}, Lioio/lib/api/DigitalInput$Spec;-><init>(ILioio/lib/api/DigitalInput$Spec$Mode;)V

    .line 588
    new-instance v2, Lioio/lib/api/DigitalOutput$Spec;

    invoke-direct {v2, p2}, Lioio/lib/api/DigitalOutput$Spec;-><init>(I)V

    new-instance v3, Lioio/lib/api/DigitalOutput$Spec;

    invoke-direct {v3, p3}, Lioio/lib/api/DigitalOutput$Spec;-><init>(I)V

    .line 589
    new-instance v5, Lioio/lib/api/SpiMaster$Config;

    invoke-direct {v5, p5}, Lioio/lib/api/SpiMaster$Config;-><init>(Lioio/lib/api/SpiMaster$Rate;)V

    move-object v0, p0

    .line 587
    invoke-virtual/range {v0 .. v5}, Lioio/lib/impl/IOIOImpl;->openSpiMaster(Lioio/lib/api/DigitalInput$Spec;Lioio/lib/api/DigitalOutput$Spec;Lioio/lib/api/DigitalOutput$Spec;[Lioio/lib/api/DigitalOutput$Spec;Lioio/lib/api/SpiMaster$Config;)Lioio/lib/api/SpiMaster;

    move-result-object v0

    return-object v0

    .line 585
    :cond_0
    new-instance v0, Lioio/lib/api/DigitalOutput$Spec;

    aget v1, p4, v6

    invoke-direct {v0, v1}, Lioio/lib/api/DigitalOutput$Spec;-><init>(I)V

    aput-object v0, v4, v6

    .line 584
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method

.method public declared-synchronized openSpiMaster(Lioio/lib/api/DigitalInput$Spec;Lioio/lib/api/DigitalOutput$Spec;Lioio/lib/api/DigitalOutput$Spec;[Lioio/lib/api/DigitalOutput$Spec;Lioio/lib/api/SpiMaster$Config;)Lioio/lib/api/SpiMaster;
    .locals 13
    .param p1, "miso"    # Lioio/lib/api/DigitalInput$Spec;
    .param p2, "mosi"    # Lioio/lib/api/DigitalOutput$Spec;
    .param p3, "clk"    # Lioio/lib/api/DigitalOutput$Spec;
    .param p4, "slaveSelect"    # [Lioio/lib/api/DigitalOutput$Spec;
    .param p5, "config"    # Lioio/lib/api/SpiMaster$Config;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 597
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 598
    move-object/from16 v0, p4

    array-length v2, v0

    new-array v7, v2, [I

    .line 599
    .local v7, "ssPins":[I
    iget v2, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-direct {p0, v2}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 600
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    iget v4, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-virtual {v2, v4}, Lioio/lib/impl/Board$Hardware;->checkSupportsPeripheralInput(I)V

    .line 601
    iget v2, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-direct {p0, v2}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 602
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    iget v4, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-virtual {v2, v4}, Lioio/lib/impl/Board$Hardware;->checkSupportsPeripheralOutput(I)V

    .line 603
    move-object/from16 v0, p3

    iget v2, v0, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-direct {p0, v2}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 604
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    move-object/from16 v0, p3

    iget v4, v0, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-virtual {v2, v4}, Lioio/lib/impl/Board$Hardware;->checkSupportsPeripheralOutput(I)V

    .line 605
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    move-object/from16 v0, p4

    array-length v2, v0

    if-lt v9, v2, :cond_0

    .line 610
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->spiAllocator_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v2}, Lioio/lib/impl/ModuleAllocator;->allocateModule()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 611
    .local v3, "spiNum":I
    new-instance v1, Lioio/lib/impl/SpiMasterImpl;

    iget v4, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    iget v5, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    .line 612
    move-object/from16 v0, p3

    iget v6, v0, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    move-object v2, p0

    .line 611
    invoke-direct/range {v1 .. v7}, Lioio/lib/impl/SpiMasterImpl;-><init>(Lioio/lib/impl/IOIOImpl;IIII[I)V

    .line 613
    .local v1, "spi":Lioio/lib/impl/SpiMasterImpl;
    invoke-virtual {p0, v1}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 615
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    iget v4, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    const/4 v5, 0x1

    aput-boolean v5, v2, v4

    .line 616
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    iget v4, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v5, 0x1

    aput-boolean v5, v2, v4

    .line 617
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    move-object/from16 v0, p3

    iget v4, v0, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v5, 0x1

    aput-boolean v5, v2, v4

    .line 618
    const/4 v9, 0x0

    :goto_1
    move-object/from16 v0, p4

    array-length v2, v0

    if-lt v9, v2, :cond_1

    .line 622
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v2, v3, v1}, Lioio/lib/impl/IncomingState;->addSpiListener(ILioio/lib/impl/IncomingState$DataModuleListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 624
    :try_start_1
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v4, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    iget-object v5, p1, Lioio/lib/api/DigitalInput$Spec;->mode:Lioio/lib/api/DigitalInput$Spec$Mode;

    invoke-virtual {v2, v4, v5}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalIn(ILioio/lib/api/DigitalInput$Spec$Mode;)V

    .line 625
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v4, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-virtual {v2, v4, v5, v6, v3}, Lioio/lib/impl/IOIOProtocol;->setPinSpi(IIZI)V

    .line 626
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v4, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v5, 0x1

    iget-object v6, p2, Lioio/lib/api/DigitalOutput$Spec;->mode:Lioio/lib/api/DigitalOutput$Spec$Mode;

    invoke-virtual {v2, v4, v5, v6}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalOut(IZLioio/lib/api/DigitalOutput$Spec$Mode;)V

    .line 627
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v4, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v2, v4, v5, v6, v3}, Lioio/lib/impl/IOIOProtocol;->setPinSpi(IIZI)V

    .line 628
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    move-object/from16 v0, p3

    iget v4, v0, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    move-object/from16 v0, p5

    iget-boolean v5, v0, Lioio/lib/api/SpiMaster$Config;->invertClk:Z

    move-object/from16 v0, p3

    iget-object v6, v0, Lioio/lib/api/DigitalOutput$Spec;->mode:Lioio/lib/api/DigitalOutput$Spec$Mode;

    invoke-virtual {v2, v4, v5, v6}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalOut(IZLioio/lib/api/DigitalOutput$Spec$Mode;)V

    .line 629
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    move-object/from16 v0, p3

    iget v4, v0, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v5, 0x2

    const/4 v6, 0x1

    invoke-virtual {v2, v4, v5, v6, v3}, Lioio/lib/impl/IOIOProtocol;->setPinSpi(IIZI)V

    .line 630
    move-object/from16 v0, p4

    array-length v4, v0

    const/4 v2, 0x0

    :goto_2
    if-lt v2, v4, :cond_2

    .line 633
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    move-object/from16 v0, p5

    invoke-virtual {v2, v3, v0}, Lioio/lib/impl/IOIOProtocol;->spiConfigureMaster(ILioio/lib/api/SpiMaster$Config;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 638
    monitor-exit p0

    return-object v1

    .line 606
    .end local v1    # "spi":Lioio/lib/impl/SpiMasterImpl;
    .end local v3    # "spiNum":I
    :cond_0
    :try_start_2
    aget-object v2, p4, v9

    iget v2, v2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-direct {p0, v2}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 607
    aget-object v2, p4, v9

    iget v2, v2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    aput v2, v7, v9

    .line 605
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_0

    .line 619
    .restart local v1    # "spi":Lioio/lib/impl/SpiMasterImpl;
    .restart local v3    # "spiNum":I
    :cond_1
    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    aget-object v4, p4, v9

    iget v4, v4, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v5, 0x1

    aput-boolean v5, v2, v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 618
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 630
    :cond_2
    :try_start_3
    aget-object v10, p4, v2

    .line 631
    .local v10, "spec":Lioio/lib/api/DigitalOutput$Spec;
    iget-object v5, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v6, v10, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v11, 0x1

    iget-object v12, v10, Lioio/lib/api/DigitalOutput$Spec;->mode:Lioio/lib/api/DigitalOutput$Spec$Mode;

    invoke-virtual {v5, v6, v11, v12}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalOut(IZLioio/lib/api/DigitalOutput$Spec$Mode;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 630
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 634
    .end local v10    # "spec":Lioio/lib/api/DigitalOutput$Spec;
    :catch_0
    move-exception v8

    .line 635
    .local v8, "e":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {v1}, Lioio/lib/impl/SpiMasterImpl;->close()V

    .line 636
    new-instance v2, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v2, v8}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 597
    .end local v1    # "spi":Lioio/lib/impl/SpiMasterImpl;
    .end local v3    # "spiNum":I
    .end local v7    # "ssPins":[I
    .end local v8    # "e":Ljava/io/IOException;
    .end local v9    # "i":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized openTwiMaster(ILioio/lib/api/TwiMaster$Rate;Z)Lioio/lib/api/TwiMaster;
    .locals 6
    .param p1, "twiNum"    # I
    .param p2, "rate"    # Lioio/lib/api/TwiMaster$Rate;
    .param p3, "smbus"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 527
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 528
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOImpl;->checkTwiFree(I)V

    .line 529
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    invoke-virtual {v3}, Lioio/lib/impl/Board$Hardware;->twiPins()[[I

    move-result-object v2

    .line 530
    .local v2, "twiPins":[[I
    aget-object v3, v2, p1

    const/4 v4, 0x0

    aget v3, v3, v4

    invoke-direct {p0, v3}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 531
    aget-object v3, v2, p1

    const/4 v4, 0x1

    aget v3, v3, v4

    invoke-direct {p0, v3}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 532
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    aget-object v4, v2, p1

    const/4 v5, 0x0

    aget v4, v4, v5

    const/4 v5, 0x1

    aput-boolean v5, v3, v4

    .line 533
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    aget-object v4, v2, p1

    const/4 v5, 0x1

    aget v4, v4, v5

    const/4 v5, 0x1

    aput-boolean v5, v3, v4

    .line 534
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->openTwi_:[Z

    const/4 v4, 0x1

    aput-boolean v4, v3, p1

    .line 535
    new-instance v1, Lioio/lib/impl/TwiMasterImpl;

    invoke-direct {v1, p0, p1}, Lioio/lib/impl/TwiMasterImpl;-><init>(Lioio/lib/impl/IOIOImpl;I)V

    .line 536
    .local v1, "twi":Lioio/lib/impl/TwiMasterImpl;
    invoke-virtual {p0, v1}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 537
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v3, p1, v1}, Lioio/lib/impl/IncomingState;->addTwiListener(ILioio/lib/impl/IncomingState$DataModuleListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 539
    :try_start_1
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v3, p1, p2, p3}, Lioio/lib/impl/IOIOProtocol;->i2cConfigureMaster(ILioio/lib/api/TwiMaster$Rate;Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 544
    monitor-exit p0

    return-object v1

    .line 540
    :catch_0
    move-exception v0

    .line 541
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v1}, Lioio/lib/impl/TwiMasterImpl;->close()V

    .line 542
    new-instance v3, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v3, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 527
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "twi":Lioio/lib/impl/TwiMasterImpl;
    .end local v2    # "twiPins":[[I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public openUart(IIILioio/lib/api/Uart$Parity;Lioio/lib/api/Uart$StopBits;)Lioio/lib/api/Uart;
    .locals 6
    .param p1, "rx"    # I
    .param p2, "tx"    # I
    .param p3, "baud"    # I
    .param p4, "parity"    # Lioio/lib/api/Uart$Parity;
    .param p5, "stopbits"    # Lioio/lib/api/Uart$StopBits;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v0, -0x1

    .line 475
    if-ne p1, v0, :cond_0

    move-object v1, v2

    .line 476
    :goto_0
    if-ne p2, v0, :cond_1

    :goto_1
    move-object v0, p0

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 475
    invoke-virtual/range {v0 .. v5}, Lioio/lib/impl/IOIOImpl;->openUart(Lioio/lib/api/DigitalInput$Spec;Lioio/lib/api/DigitalOutput$Spec;ILioio/lib/api/Uart$Parity;Lioio/lib/api/Uart$StopBits;)Lioio/lib/api/Uart;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v1, Lioio/lib/api/DigitalInput$Spec;

    invoke-direct {v1, p1}, Lioio/lib/api/DigitalInput$Spec;-><init>(I)V

    goto :goto_0

    .line 476
    :cond_1
    new-instance v2, Lioio/lib/api/DigitalOutput$Spec;

    invoke-direct {v2, p2}, Lioio/lib/api/DigitalOutput$Spec;-><init>(I)V

    goto :goto_1
.end method

.method public declared-synchronized openUart(Lioio/lib/api/DigitalInput$Spec;Lioio/lib/api/DigitalOutput$Spec;ILioio/lib/api/Uart$Parity;Lioio/lib/api/Uart$StopBits;)Lioio/lib/api/Uart;
    .locals 11
    .param p1, "rx"    # Lioio/lib/api/DigitalInput$Spec;
    .param p2, "tx"    # Lioio/lib/api/DigitalOutput$Spec;
    .param p3, "baud"    # I
    .param p4, "parity"    # Lioio/lib/api/Uart$Parity;
    .param p5, "stopbits"    # Lioio/lib/api/Uart$StopBits;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 484
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V

    .line 485
    if-eqz p1, :cond_0

    .line 486
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    iget v4, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-virtual {v0, v4}, Lioio/lib/impl/Board$Hardware;->checkSupportsPeripheralInput(I)V

    .line 487
    iget v0, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 489
    :cond_0
    if-eqz p2, :cond_1

    .line 490
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->hardware_:Lioio/lib/impl/Board$Hardware;

    iget v4, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-virtual {v0, v4}, Lioio/lib/impl/Board$Hardware;->checkSupportsPeripheralOutput(I)V

    .line 491
    iget v0, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOImpl;->checkPinFree(I)V

    .line 493
    :cond_1
    if-eqz p1, :cond_5

    iget v7, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    .line 494
    .local v7, "rxPin":I
    :goto_0
    if-eqz p2, :cond_6

    iget v8, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    .line 495
    .local v8, "txPin":I
    :goto_1
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->uartAllocator_:Lioio/lib/impl/ModuleAllocator;

    invoke-virtual {v0}, Lioio/lib/impl/ModuleAllocator;->allocateModule()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 496
    .local v1, "uartNum":I
    new-instance v9, Lioio/lib/impl/UartImpl;

    invoke-direct {v9, p0, v8, v7, v1}, Lioio/lib/impl/UartImpl;-><init>(Lioio/lib/impl/IOIOImpl;III)V

    .line 497
    .local v9, "uart":Lioio/lib/impl/UartImpl;
    invoke-virtual {p0, v9}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 498
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v0, v1, v9}, Lioio/lib/impl/IncomingState;->addUartListener(ILioio/lib/impl/IncomingState$DataModuleListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 500
    if-eqz p1, :cond_2

    .line 501
    :try_start_1
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    iget v4, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    const/4 v5, 0x1

    aput-boolean v5, v0, v4

    .line 502
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v4, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    iget-object v5, p1, Lioio/lib/api/DigitalInput$Spec;->mode:Lioio/lib/api/DigitalInput$Spec$Mode;

    invoke-virtual {v0, v4, v5}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalIn(ILioio/lib/api/DigitalInput$Spec$Mode;)V

    .line 503
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v4, p1, Lioio/lib/api/DigitalInput$Spec;->pin:I

    const/4 v5, 0x0

    const/4 v10, 0x1

    invoke-virtual {v0, v4, v1, v5, v10}, Lioio/lib/impl/IOIOProtocol;->setPinUart(IIZZ)V

    .line 505
    :cond_2
    if-eqz p2, :cond_3

    .line 506
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->openPins_:[Z

    iget v4, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v5, 0x1

    aput-boolean v5, v0, v4

    .line 507
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v4, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v5, 0x1

    iget-object v10, p2, Lioio/lib/api/DigitalOutput$Spec;->mode:Lioio/lib/api/DigitalOutput$Spec$Mode;

    invoke-virtual {v0, v4, v5, v10}, Lioio/lib/impl/IOIOProtocol;->setPinDigitalOut(IZLioio/lib/api/DigitalOutput$Spec$Mode;)V

    .line 508
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v4, p2, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    const/4 v5, 0x1

    const/4 v10, 0x1

    invoke-virtual {v0, v4, v1, v5, v10}, Lioio/lib/impl/IOIOProtocol;->setPinUart(IIZZ)V

    .line 510
    :cond_3
    const/4 v3, 0x1

    .line 511
    .local v3, "speed4x":Z
    const v0, 0x4a742400

    int-to-float v4, p3

    div-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/lit8 v2, v0, -0x1

    .line 512
    .local v2, "rate":I
    const v0, 0xffff

    if-le v2, v0, :cond_4

    .line 513
    const/4 v3, 0x0

    .line 514
    const v0, 0x49742400

    int-to-float v4, p3

    div-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/lit8 v2, v0, -0x1

    .line 516
    :cond_4
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    move-object/from16 v4, p5

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lioio/lib/impl/IOIOProtocol;->uartConfigure(IIZLioio/lib/api/Uart$StopBits;Lioio/lib/api/Uart$Parity;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 521
    monitor-exit p0

    return-object v9

    .line 493
    .end local v1    # "uartNum":I
    .end local v2    # "rate":I
    .end local v3    # "speed4x":Z
    .end local v7    # "rxPin":I
    .end local v8    # "txPin":I
    .end local v9    # "uart":Lioio/lib/impl/UartImpl;
    :cond_5
    const/4 v7, -0x1

    goto :goto_0

    .line 494
    .restart local v7    # "rxPin":I
    :cond_6
    const/4 v8, -0x1

    goto :goto_1

    .line 517
    .restart local v1    # "uartNum":I
    .restart local v8    # "txPin":I
    .restart local v9    # "uart":Lioio/lib/impl/UartImpl;
    :catch_0
    move-exception v6

    .line 518
    .local v6, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v9}, Lioio/lib/impl/UartImpl;->close()V

    .line 519
    new-instance v0, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v0, v6}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 484
    .end local v1    # "uartNum":I
    .end local v6    # "e":Ljava/io/IOException;
    .end local v7    # "rxPin":I
    .end local v8    # "txPin":I
    .end local v9    # "uart":Lioio/lib/impl/UartImpl;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized removeDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V
    .locals 1
    .param p1, "listener"    # Lioio/lib/impl/IncomingState$DisconnectListener;

    .prologue
    .line 201
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v0, p1}, Lioio/lib/impl/IncomingState;->removeDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    monitor-exit p0

    return-void

    .line 201
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized softReset()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 300
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 302
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v1}, Lioio/lib/impl/IOIOProtocol;->softReset()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 306
    monitor-exit p0

    return-void

    .line 303
    :catch_0
    move-exception v0

    .line 304
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 300
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public waitForConnect()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Lioio/lib/api/exception/IncompatibilityException;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    sget-object v2, Lioio/lib/api/IOIO$State;->CONNECTED:Lioio/lib/api/IOIO$State;

    if-ne v1, v2, :cond_0

    .line 125
    :goto_0
    return-void

    .line 86
    :cond_0
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    sget-object v2, Lioio/lib/api/IOIO$State;->DEAD:Lioio/lib/api/IOIO$State;

    if-ne v1, v2, :cond_1

    .line 87
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v1

    .line 89
    :cond_1
    invoke-virtual {p0, p0}, Lioio/lib/impl/IOIOImpl;->addDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V

    .line 90
    const-string v1, "IOIOImpl"

    const-string v2, "Waiting for IOIO connection"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    :try_start_0
    const-string v1, "IOIOImpl"

    const-string v2, "Waiting for underlying connection"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->connection_:Lioio/lib/api/IOIOConnection;

    invoke-interface {v1}, Lioio/lib/api/IOIOConnection;->waitForConnect()V

    .line 95
    monitor-enter p0
    :try_end_0
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lioio/lib/api/exception/IncompatibilityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_3

    .line 96
    :try_start_1
    iget-boolean v1, p0, Lioio/lib/impl/IOIOImpl;->disconnect_:Z

    if-eqz v1, :cond_2

    .line 97
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v1

    .line 95
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lioio/lib/api/exception/IncompatibilityException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_3

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Lioio/lib/api/exception/ConnectionLostException;
    :try_start_3
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v1}, Lioio/lib/impl/IncomingState;->handleConnectionLost()V

    .line 106
    throw v0
    :try_end_3
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lioio/lib/api/exception/IncompatibilityException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_3

    .line 116
    .end local v0    # "e":Lioio/lib/api/exception/ConnectionLostException;
    :catch_1
    move-exception v0

    .line 117
    .restart local v0    # "e":Lioio/lib/api/exception/ConnectionLostException;
    const-string v1, "IOIOImpl"

    const-string v2, "Connection lost / aborted"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    sget-object v1, Lioio/lib/api/IOIO$State;->DEAD:Lioio/lib/api/IOIO$State;

    iput-object v1, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    .line 119
    throw v0

    .line 99
    .end local v0    # "e":Lioio/lib/api/exception/ConnectionLostException;
    :cond_2
    :try_start_4
    new-instance v1, Lioio/lib/impl/IOIOProtocol;

    iget-object v2, p0, Lioio/lib/impl/IOIOImpl;->connection_:Lioio/lib/api/IOIOConnection;

    invoke-interface {v2}, Lioio/lib/api/IOIOConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 100
    iget-object v3, p0, Lioio/lib/impl/IOIOImpl;->connection_:Lioio/lib/api/IOIOConnection;

    invoke-interface {v3}, Lioio/lib/api/IOIOConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    iget-object v4, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-direct {v1, v2, v3, v4}, Lioio/lib/impl/IOIOProtocol;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Lioio/lib/impl/IOIOProtocol$IncomingHandler;)V

    .line 99
    iput-object v1, p0, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    .line 95
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 108
    :try_start_5
    const-string v1, "IOIOImpl"

    const-string v2, "Waiting for handshake"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    iget-object v1, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v1}, Lioio/lib/impl/IncomingState;->waitConnectionEstablished()V

    .line 110
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->initBoard()V

    .line 111
    const-string v1, "IOIOImpl"

    const-string v2, "Querying for required interface ID"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    invoke-direct {p0}, Lioio/lib/impl/IOIOImpl;->checkInterfaceVersion()V

    .line 113
    const-string v1, "IOIOImpl"

    const-string v2, "Required interface ID is supported"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    sget-object v1, Lioio/lib/api/IOIO$State;->CONNECTED:Lioio/lib/api/IOIO$State;

    iput-object v1, p0, Lioio/lib/impl/IOIOImpl;->state_:Lioio/lib/api/IOIO$State;

    .line 115
    const-string v1, "IOIOImpl"

    const-string v2, "IOIO connection established"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lioio/lib/api/exception/IncompatibilityException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_3

    goto/16 :goto_0

    .line 120
    :catch_2
    move-exception v0

    .line 121
    .local v0, "e":Lioio/lib/api/exception/IncompatibilityException;
    throw v0

    .line 122
    .end local v0    # "e":Lioio/lib/api/exception/IncompatibilityException;
    :catch_3
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v1, "IOIOImpl"

    const-string v2, "Unexpected exception"

    invoke-static {v1, v2, v0}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0
.end method

.method public waitForDisconnect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 158
    iget-object v0, p0, Lioio/lib/impl/IOIOImpl;->incomingState_:Lioio/lib/impl/IncomingState;

    invoke-virtual {v0}, Lioio/lib/impl/IncomingState;->waitDisconnect()V

    .line 159
    return-void
.end method
