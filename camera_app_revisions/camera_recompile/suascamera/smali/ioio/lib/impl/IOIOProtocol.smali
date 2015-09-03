.class Lioio/lib/impl/IOIOProtocol;
.super Ljava/lang/Object;
.source "IOIOProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/IOIOProtocol$IncomingHandler;,
        Lioio/lib/impl/IOIOProtocol$IncomingThread;,
        Lioio/lib/impl/IOIOProtocol$PwmScale;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final CHECK_INTERFACE:I = 0x2

.field static final CHECK_INTERFACE_RESPONSE:I = 0x2

.field static final ESTABLISH_CONNECTION:I = 0x0

.field static final HARD_RESET:I = 0x0

.field static final I2C_CONFIGURE_MASTER:I = 0x13

.field static final I2C_REPORT_TX_STATUS:I = 0x15

.field static final I2C_RESULT:I = 0x14

.field static final I2C_STATUS:I = 0x13

.field static final I2C_WRITE_READ:I = 0x14

.field static final ICSP_CONFIG:I = 0x1a

.field static final ICSP_PROG_ENTER:I = 0x18

.field static final ICSP_PROG_EXIT:I = 0x19

.field static final ICSP_REGOUT:I = 0x17

.field static final ICSP_REPORT_RX_STATUS:I = 0x16

.field static final ICSP_RESULT:I = 0x17

.field static final ICSP_SIX:I = 0x16

.field static final INCAP_CONFIGURE:I = 0x1b

.field static final INCAP_REPORT:I = 0x1c

.field static final INCAP_STATUS:I = 0x1b

.field static final REGISTER_PERIODIC_DIGITAL_SAMPLING:I = 0x7

.field static final REPORT_ANALOG_IN_FORMAT:I = 0xc

.field static final REPORT_ANALOG_IN_STATUS:I = 0xb

.field static final REPORT_DIGITAL_IN_STATUS:I = 0x4

.field static final REPORT_PERIODIC_DIGITAL_IN_STATUS:I = 0x5

.field static final SCALE_DIV:[I

.field static final SET_ANALOG_IN_SAMPLING:I = 0xc

.field static final SET_CHANGE_NOTIFY:I = 0x6

.field static final SET_DIGITAL_OUT_LEVEL:I = 0x4

.field static final SET_PIN_ANALOG_IN:I = 0xb

.field static final SET_PIN_DIGITAL_IN:I = 0x5

.field static final SET_PIN_DIGITAL_OUT:I = 0x3

.field static final SET_PIN_INCAP:I = 0x1c

.field static final SET_PIN_PWM:I = 0x8

.field static final SET_PIN_SPI:I = 0x12

.field static final SET_PIN_UART:I = 0xf

.field static final SET_PWM_DUTY_CYCLE:I = 0x9

.field static final SET_PWM_PERIOD:I = 0xa

.field static final SOFT_CLOSE:I = 0x1d

.field static final SOFT_RESET:I = 0x1

.field static final SPI_CONFIGURE_MASTER:I = 0x10

.field static final SPI_DATA:I = 0x11

.field static final SPI_MASTER_REQUEST:I = 0x11

.field static final SPI_REPORT_TX_STATUS:I = 0x12

.field static final SPI_STATUS:I = 0x10

.field private static final TAG:Ljava/lang/String; = "IOIOProtocol"

.field static final UART_CONFIG:I = 0xd

.field static final UART_DATA:I = 0xe

.field static final UART_REPORT_TX_STATUS:I = 0xf

.field static final UART_STATUS:I = 0xd


# instance fields
.field private batchCounter_:I

.field private final handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;

.field private final in_:Ljava/io/InputStream;

.field private final out_:Ljava/io/OutputStream;

.field private outbuf_:[B

.field private pos_:I

.field private final thread_:Lioio/lib/impl/IOIOProtocol$IncomingThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const-class v0, Lioio/lib/impl/IOIOProtocol;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lioio/lib/impl/IOIOProtocol;->$assertionsDisabled:Z

    .line 96
    const/16 v0, 0x19

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lioio/lib/impl/IOIOProtocol;->SCALE_DIV:[I

    .line 124
    return-void

    .line 47
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 96
    nop

    :array_0
    .array-data 4
        0x1f
        0x1e
        0x1d
        0x1c
        0x1b
        0x1a
        0x17
        0x16
        0x15
        0x14
        0x13
        0x12
        0xf
        0xe
        0xd
        0xc
        0xb
        0xa
        0x7
        0x6
        0x5
        0x4
        0x3
        0x2
        0x1
    .end array-data
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;Lioio/lib/impl/IOIOProtocol$IncomingHandler;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "handler"    # Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    .prologue
    const/4 v1, 0x0

    .line 854
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lioio/lib/impl/IOIOProtocol;->outbuf_:[B

    .line 139
    iput v1, p0, Lioio/lib/impl/IOIOProtocol;->pos_:I

    .line 140
    iput v1, p0, Lioio/lib/impl/IOIOProtocol;->batchCounter_:I

    .line 852
    new-instance v0, Lioio/lib/impl/IOIOProtocol$IncomingThread;

    invoke-direct {v0, p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;-><init>(Lioio/lib/impl/IOIOProtocol;)V

    iput-object v0, p0, Lioio/lib/impl/IOIOProtocol;->thread_:Lioio/lib/impl/IOIOProtocol$IncomingThread;

    .line 856
    iput-object p1, p0, Lioio/lib/impl/IOIOProtocol;->in_:Ljava/io/InputStream;

    .line 857
    iput-object p2, p0, Lioio/lib/impl/IOIOProtocol;->out_:Ljava/io/OutputStream;

    .line 858
    iput-object p3, p0, Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    .line 859
    iget-object v0, p0, Lioio/lib/impl/IOIOProtocol;->thread_:Lioio/lib/impl/IOIOProtocol$IncomingThread;

    invoke-virtual {v0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->start()V

    .line 860
    return-void
.end method

.method static synthetic access$0(Lioio/lib/impl/IOIOProtocol;)Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 849
    iget-object v0, p0, Lioio/lib/impl/IOIOProtocol;->in_:Ljava/io/InputStream;

    return-object v0
.end method

.method static synthetic access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    .locals 1

    .prologue
    .line 851
    iget-object v0, p0, Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    return-object v0
.end method

.method private flush()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 164
    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/IOIOProtocol;->out_:Ljava/io/OutputStream;

    iget-object v1, p0, Lioio/lib/impl/IOIOProtocol;->outbuf_:[B

    const/4 v2, 0x0

    iget v3, p0, Lioio/lib/impl/IOIOProtocol;->pos_:I

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    iput v4, p0, Lioio/lib/impl/IOIOProtocol;->pos_:I

    .line 168
    return-void

    .line 165
    :catchall_0
    move-exception v0

    .line 166
    iput v4, p0, Lioio/lib/impl/IOIOProtocol;->pos_:I

    .line 167
    throw v0
.end method

.method private writeByte(I)V
    .locals 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    sget-boolean v0, Lioio/lib/impl/IOIOProtocol;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-ltz p1, :cond_0

    const/16 v0, 0x100

    if-lt p1, v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 144
    :cond_1
    iget v0, p0, Lioio/lib/impl/IOIOProtocol;->pos_:I

    iget-object v1, p0, Lioio/lib/impl/IOIOProtocol;->outbuf_:[B

    array-length v1, v1

    if-ne v0, v1, :cond_2

    .line 146
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol;->flush()V

    .line 149
    :cond_2
    iget-object v0, p0, Lioio/lib/impl/IOIOProtocol;->outbuf_:[B

    iget v1, p0, Lioio/lib/impl/IOIOProtocol;->pos_:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lioio/lib/impl/IOIOProtocol;->pos_:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 150
    return-void
.end method

.method private writeThreeBytes(I)V
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 176
    and-int/lit16 v0, p1, 0xff

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 177
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 178
    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 179
    return-void
.end method

.method private writeTwoBytes(I)V
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    and-int/lit16 v0, p1, 0xff

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 172
    shr-int/lit8 v0, p1, 0x8

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 173
    return-void
.end method


# virtual methods
.method public declared-synchronized beginBatch()V
    .locals 1

    .prologue
    .line 153
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lioio/lib/impl/IOIOProtocol;->batchCounter_:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lioio/lib/impl/IOIOProtocol;->batchCounter_:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    monitor-exit p0

    return-void

    .line 153
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized checkInterface([B)V
    .locals 3
    .param p1, "interfaceId"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x8

    .line 205
    monitor-enter p0

    :try_start_0
    array-length v1, p1

    if-eq v1, v2, :cond_0

    .line 206
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 207
    const-string v2, "interface ID must be exactly 8 bytes long"

    .line 206
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 205
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 209
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 210
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 211
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v2, :cond_1

    .line 214
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 215
    monitor-exit p0

    return-void

    .line 212
    :cond_1
    :try_start_2
    aget-byte v1, p1, v0

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 211
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public declared-synchronized endBatch()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lioio/lib/impl/IOIOProtocol;->batchCounter_:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lioio/lib/impl/IOIOProtocol;->batchCounter_:I

    if-nez v0, :cond_0

    .line 158
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    :cond_0
    monitor-exit p0

    return-void

    .line 157
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized hardReset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 183
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 184
    const/16 v0, 0x49

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 185
    const/16 v0, 0x4f

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 186
    const/16 v0, 0x49

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 187
    const/16 v0, 0x4f

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 188
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    monitor-exit p0

    return-void

    .line 182
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized i2cClose(I)V
    .locals 1
    .param p1, "i2cNum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 453
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 454
    const/16 v0, 0x13

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 455
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 456
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 457
    monitor-exit p0

    return-void

    .line 453
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized i2cConfigureMaster(ILioio/lib/api/TwiMaster$Rate;Z)V
    .locals 3
    .param p1, "i2cNum"    # I
    .param p2, "rate"    # Lioio/lib/api/TwiMaster$Rate;
    .param p3, "smbusLevels"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 444
    monitor-enter p0

    :try_start_0
    sget-object v1, Lioio/lib/api/TwiMaster$Rate;->RATE_1MHz:Lioio/lib/api/TwiMaster$Rate;

    if-ne p2, v1, :cond_0

    const/4 v0, 0x3

    .line 446
    .local v0, "rateBits":I
    :goto_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 447
    const/16 v1, 0x13

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 448
    if-eqz p3, :cond_2

    const/16 v1, 0x80

    :goto_1
    shl-int/lit8 v2, v0, 0x5

    or-int/2addr v1, v2

    or-int/2addr v1, p1

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 449
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 450
    monitor-exit p0

    return-void

    .line 445
    .end local v0    # "rateBits":I
    :cond_0
    :try_start_1
    sget-object v1, Lioio/lib/api/TwiMaster$Rate;->RATE_400KHz:Lioio/lib/api/TwiMaster$Rate;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne p2, v1, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .line 448
    .restart local v0    # "rateBits":I
    :cond_2
    const/4 v1, 0x0

    goto :goto_1

    .line 444
    .end local v0    # "rateBits":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized i2cWriteRead(IZIII[B)V
    .locals 3
    .param p1, "i2cNum"    # I
    .param p2, "tenBitAddr"    # Z
    .param p3, "address"    # I
    .param p4, "writeSize"    # I
    .param p5, "readSize"    # I
    .param p6, "writeData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 283
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 284
    const/16 v1, 0x14

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 285
    shr-int/lit8 v1, p3, 0x8

    shl-int/lit8 v2, v1, 0x6

    if-eqz p2, :cond_0

    const/16 v1, 0x20

    :goto_0
    or-int/2addr v1, v2

    or-int/2addr v1, p1

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 286
    and-int/lit16 v1, p3, 0xff

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 287
    invoke-direct {p0, p4}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 288
    invoke-direct {p0, p5}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 289
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-lt v0, p4, :cond_1

    .line 292
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 293
    monitor-exit p0

    return-void

    .line 285
    .end local v0    # "i":I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 290
    .restart local v0    # "i":I
    :cond_1
    :try_start_1
    aget-byte v1, p6, v0

    and-int/lit16 v1, v1, 0xff

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 289
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 283
    .end local v0    # "i":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized icspClose()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 467
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 468
    const/16 v0, 0x1a

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 469
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 470
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 471
    monitor-exit p0

    return-void

    .line 467
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized icspEnter()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 474
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 475
    const/16 v0, 0x18

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 476
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 477
    monitor-exit p0

    return-void

    .line 474
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized icspExit()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 480
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 481
    const/16 v0, 0x19

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 482
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 483
    monitor-exit p0

    return-void

    .line 480
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized icspOpen()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 460
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 461
    const/16 v0, 0x1a

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 462
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 463
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 464
    monitor-exit p0

    return-void

    .line 460
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized icspRegout()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 493
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 494
    const/16 v0, 0x17

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 495
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 496
    monitor-exit p0

    return-void

    .line 493
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized icspSix(I)V
    .locals 1
    .param p1, "instruction"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 486
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 487
    const/16 v0, 0x16

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 488
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOProtocol;->writeThreeBytes(I)V

    .line 489
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 490
    monitor-exit p0

    return-void

    .line 486
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized incapClose(IZ)V
    .locals 1
    .param p1, "incapNum"    # I
    .param p2, "double_prec"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 265
    const/16 v0, 0x1b

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 266
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 267
    if-eqz p2, :cond_0

    const/16 v0, 0x80

    :goto_0
    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 268
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    monitor-exit p0

    return-void

    .line 267
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 264
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized incapConfigure(IZII)V
    .locals 2
    .param p1, "incapNum"    # I
    .param p2, "double_prec"    # Z
    .param p3, "mode"    # I
    .param p4, "clock"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 274
    const/16 v0, 0x1b

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 275
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 276
    if-eqz p2, :cond_0

    const/16 v0, 0x80

    :goto_0
    shl-int/lit8 v1, p3, 0x3

    or-int/2addr v0, v1

    or-int/2addr v0, p4

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 277
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 278
    monitor-exit p0

    return-void

    .line 276
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 273
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized registerPeriodicDigitalSampling(II)V
    .locals 0
    .param p1, "pin"    # I
    .param p2, "freqScale"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 330
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setAnalogInSampling(IZ)V
    .locals 2
    .param p1, "pin"    # I
    .param p2, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 341
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 342
    const/16 v0, 0xc

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 343
    if-eqz p2, :cond_0

    const/16 v0, 0x80

    :goto_0
    and-int/lit8 v1, p1, 0x3f

    or-int/2addr v0, v1

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 344
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 345
    monitor-exit p0

    return-void

    .line 343
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 341
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setChangeNotify(IZ)V
    .locals 2
    .param p1, "pin"    # I
    .param p2, "changeNotify"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 321
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 322
    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 323
    shl-int/lit8 v1, p1, 0x2

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    or-int/2addr v0, v1

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 324
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 325
    monitor-exit p0

    return-void

    .line 323
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 321
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setDigitalOutLevel(IZ)V
    .locals 2
    .param p1, "pin"    # I
    .param p2, "level"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 220
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 221
    shl-int/lit8 v1, p1, 0x2

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    or-int/2addr v0, v1

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 222
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    monitor-exit p0

    return-void

    .line 221
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 219
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPinAnalogIn(I)V
    .locals 1
    .param p1, "pin"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 333
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 334
    const/16 v0, 0xb

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 335
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 336
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 337
    monitor-exit p0

    return-void

    .line 333
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPinDigitalIn(ILioio/lib/api/DigitalInput$Spec$Mode;)V
    .locals 2
    .param p1, "pin"    # I
    .param p2, "mode"    # Lioio/lib/api/DigitalInput$Spec$Mode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 307
    monitor-enter p0

    const/4 v0, 0x0

    .line 308
    .local v0, "pull":I
    :try_start_0
    sget-object v1, Lioio/lib/api/DigitalInput$Spec$Mode;->PULL_UP:Lioio/lib/api/DigitalInput$Spec$Mode;

    if-ne p2, v1, :cond_1

    .line 309
    const/4 v0, 0x1

    .line 313
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 314
    const/4 v1, 0x5

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 315
    shl-int/lit8 v1, p1, 0x2

    or-int/2addr v1, v0

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 316
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 317
    monitor-exit p0

    return-void

    .line 310
    :cond_1
    :try_start_1
    sget-object v1, Lioio/lib/api/DigitalInput$Spec$Mode;->PULL_DOWN:Lioio/lib/api/DigitalInput$Spec$Mode;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne p2, v1, :cond_0

    .line 311
    const/4 v0, 0x2

    goto :goto_0

    .line 307
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setPinDigitalOut(IZLioio/lib/api/DigitalOutput$Spec$Mode;)V
    .locals 3
    .param p1, "pin"    # I
    .param p2, "value"    # Z
    .param p3, "mode"    # Lioio/lib/api/DigitalOutput$Spec$Mode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 297
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 298
    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 299
    shl-int/lit8 v2, p1, 0x2

    .line 300
    sget-object v1, Lioio/lib/api/DigitalOutput$Spec$Mode;->OPEN_DRAIN:Lioio/lib/api/DigitalOutput$Spec$Mode;

    if-ne p3, v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    or-int/2addr v1, v2

    .line 301
    if-eqz p2, :cond_0

    const/4 v0, 0x2

    :cond_0
    or-int/2addr v0, v1

    .line 299
    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 302
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 303
    monitor-exit p0

    return-void

    :cond_1
    move v1, v0

    .line 300
    goto :goto_0

    .line 297
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPinIncap(IIZ)V
    .locals 1
    .param p1, "pin"    # I
    .param p2, "incapNum"    # I
    .param p3, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 256
    const/16 v0, 0x1c

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 257
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 258
    if-eqz p3, :cond_0

    const/16 v0, 0x80

    :goto_0
    or-int/2addr v0, p2

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 259
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 260
    monitor-exit p0

    return-void

    .line 258
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 255
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPinPwm(IIZ)V
    .locals 2
    .param p1, "pin"    # I
    .param p2, "pwmNum"    # I
    .param p3, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 228
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 229
    and-int/lit8 v0, p1, 0x3f

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 230
    if-eqz p3, :cond_0

    const/16 v0, 0x80

    :goto_0
    and-int/lit8 v1, p2, 0xf

    or-int/2addr v0, v1

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 231
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 232
    monitor-exit p0

    return-void

    .line 230
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 227
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPinSpi(IIZI)V
    .locals 1
    .param p1, "pin"    # I
    .param p2, "mode"    # I
    .param p3, "enable"    # Z
    .param p4, "spiNum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 413
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 414
    const/16 v0, 0x12

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 415
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 416
    shl-int/lit8 v0, p2, 0x2

    or-int/lit8 v0, v0, 0x10

    or-int/2addr v0, p4

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 417
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 418
    monitor-exit p0

    return-void

    .line 413
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPinUart(IIZZ)V
    .locals 2
    .param p1, "pin"    # I
    .param p2, "uartNum"    # I
    .param p3, "tx"    # Z
    .param p4, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 386
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 387
    const/16 v1, 0xf

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 388
    invoke-direct {p0, p1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 389
    if-eqz p4, :cond_1

    const/16 v1, 0x80

    :goto_0
    if-eqz p3, :cond_0

    const/16 v0, 0x40

    :cond_0
    or-int/2addr v0, v1

    or-int/2addr v0, p2

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 390
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 391
    monitor-exit p0

    return-void

    :cond_1
    move v1, v0

    .line 389
    goto :goto_0

    .line 386
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPwmDutyCycle(III)V
    .locals 1
    .param p1, "pwmNum"    # I
    .param p2, "dutyCycle"    # I
    .param p3, "fraction"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 237
    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 238
    shl-int/lit8 v0, p1, 0x2

    or-int/2addr v0, p3

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 239
    invoke-direct {p0, p2}, Lioio/lib/impl/IOIOProtocol;->writeTwoBytes(I)V

    .line 240
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 241
    monitor-exit p0

    return-void

    .line 236
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPwmPeriod(IILioio/lib/impl/IOIOProtocol$PwmScale;)V
    .locals 2
    .param p1, "pwmNum"    # I
    .param p2, "period"    # I
    .param p3, "scale"    # Lioio/lib/impl/IOIOProtocol$PwmScale;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 246
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 247
    # getter for: Lioio/lib/impl/IOIOProtocol$PwmScale;->encoding:I
    invoke-static {p3}, Lioio/lib/impl/IOIOProtocol$PwmScale;->access$2(Lioio/lib/impl/IOIOProtocol$PwmScale;)I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    shl-int/lit8 v0, v0, 0x6

    shl-int/lit8 v1, p1, 0x1

    or-int/2addr v0, v1

    .line 248
    # getter for: Lioio/lib/impl/IOIOProtocol$PwmScale;->encoding:I
    invoke-static {p3}, Lioio/lib/impl/IOIOProtocol$PwmScale;->access$2(Lioio/lib/impl/IOIOProtocol$PwmScale;)I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    or-int/2addr v0, v1

    .line 247
    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 249
    invoke-direct {p0, p2}, Lioio/lib/impl/IOIOProtocol;->writeTwoBytes(I)V

    .line 250
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 251
    monitor-exit p0

    return-void

    .line 245
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized softClose()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 199
    const/16 v0, 0x1d

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 200
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    monitor-exit p0

    return-void

    .line 198
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized softReset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 193
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 194
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    monitor-exit p0

    return-void

    .line 192
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized spiClose(I)V
    .locals 1
    .param p1, "spiNum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 404
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 405
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 406
    shl-int/lit8 v0, p1, 0x5

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 407
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 408
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 409
    monitor-exit p0

    return-void

    .line 404
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized spiConfigureMaster(ILioio/lib/api/SpiMaster$Config;)V
    .locals 4
    .param p1, "spiNum"    # I
    .param p2, "config"    # Lioio/lib/api/SpiMaster$Config;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 395
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 396
    const/16 v1, 0x10

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 397
    shl-int/lit8 v1, p1, 0x5

    sget-object v2, Lioio/lib/impl/IOIOProtocol;->SCALE_DIV:[I

    iget-object v3, p2, Lioio/lib/api/SpiMaster$Config;->rate:Lioio/lib/api/SpiMaster$Rate;

    invoke-virtual {v3}, Lioio/lib/api/SpiMaster$Rate;->ordinal()I

    move-result v3

    aget v2, v2, v3

    or-int/2addr v1, v2

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 398
    iget-boolean v1, p2, Lioio/lib/api/SpiMaster$Config;->sampleOnTrailing:Z

    if-eqz v1, :cond_1

    move v1, v0

    .line 399
    :goto_0
    iget-boolean v2, p2, Lioio/lib/api/SpiMaster$Config;->invertClk:Z

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    or-int/2addr v0, v1

    .line 398
    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 400
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 401
    monitor-exit p0

    return-void

    .line 398
    :cond_1
    const/4 v1, 0x2

    goto :goto_0

    .line 395
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized spiMasterRequest(II[BIII)V
    .locals 5
    .param p1, "spiNum"    # I
    .param p2, "ssPin"    # I
    .param p3, "data"    # [B
    .param p4, "dataBytes"    # I
    .param p5, "totalBytes"    # I
    .param p6, "responseBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 423
    monitor-enter p0

    if-eq p4, p5, :cond_3

    move v0, v2

    .line 424
    .local v0, "dataNeqTotal":Z
    :goto_0
    if-eq p6, p5, :cond_4

    .line 425
    .local v2, "resNeqTotal":Z
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 426
    const/16 v4, 0x11

    invoke-direct {p0, v4}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 427
    shl-int/lit8 v4, p1, 0x6

    or-int/2addr v4, p2

    invoke-direct {p0, v4}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 428
    if-eqz v0, :cond_5

    const/16 v4, 0x80

    :goto_2
    if-eqz v2, :cond_0

    const/16 v3, 0x40

    :cond_0
    or-int/2addr v3, v4

    .line 429
    add-int/lit8 v4, p5, -0x1

    or-int/2addr v3, v4

    .line 428
    invoke-direct {p0, v3}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 430
    if-eqz v0, :cond_1

    .line 431
    invoke-direct {p0, p4}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 433
    :cond_1
    if-eqz v2, :cond_2

    .line 434
    invoke-direct {p0, p6}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 436
    :cond_2
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    if-lt v1, p4, :cond_6

    .line 439
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 440
    monitor-exit p0

    return-void

    .end local v0    # "dataNeqTotal":Z
    .end local v1    # "i":I
    .end local v2    # "resNeqTotal":Z
    :cond_3
    move v0, v3

    .line 423
    goto :goto_0

    .restart local v0    # "dataNeqTotal":Z
    :cond_4
    move v2, v3

    .line 424
    goto :goto_1

    .restart local v2    # "resNeqTotal":Z
    :cond_5
    move v4, v3

    .line 428
    goto :goto_2

    .line 437
    .restart local v1    # "i":I
    :cond_6
    :try_start_1
    aget-byte v3, p3, v1

    and-int/lit16 v3, v3, 0xff

    invoke-direct {p0, v3}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 436
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 423
    .end local v1    # "i":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized uartClose(I)V
    .locals 1
    .param p1, "uartNum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 378
    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 379
    shl-int/lit8 v0, p1, 0x6

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 380
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lioio/lib/impl/IOIOProtocol;->writeTwoBytes(I)V

    .line 381
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 382
    monitor-exit p0

    return-void

    .line 377
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized uartConfigure(IIZLioio/lib/api/Uart$StopBits;Lioio/lib/api/Uart$Parity;)V
    .locals 4
    .param p1, "uartNum"    # I
    .param p2, "rate"    # I
    .param p3, "speed4x"    # Z
    .param p4, "stopbits"    # Lioio/lib/api/Uart$StopBits;
    .param p5, "parity"    # Lioio/lib/api/Uart$Parity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 366
    monitor-enter p0

    :try_start_0
    sget-object v2, Lioio/lib/api/Uart$Parity;->EVEN:Lioio/lib/api/Uart$Parity;

    if-ne p5, v2, :cond_1

    const/4 v0, 0x1

    .line 368
    .local v0, "parbits":I
    :goto_0
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 369
    const/16 v2, 0xd

    invoke-direct {p0, v2}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 370
    shl-int/lit8 v3, p1, 0x6

    if-eqz p3, :cond_3

    const/16 v2, 0x8

    :goto_1
    or-int/2addr v2, v3

    .line 371
    sget-object v3, Lioio/lib/api/Uart$StopBits;->TWO:Lioio/lib/api/Uart$StopBits;

    if-ne p4, v3, :cond_0

    const/4 v1, 0x4

    :cond_0
    or-int/2addr v1, v2

    or-int/2addr v1, v0

    .line 370
    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 372
    invoke-direct {p0, p2}, Lioio/lib/impl/IOIOProtocol;->writeTwoBytes(I)V

    .line 373
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 374
    monitor-exit p0

    return-void

    .line 367
    .end local v0    # "parbits":I
    :cond_1
    :try_start_1
    sget-object v2, Lioio/lib/api/Uart$Parity;->ODD:Lioio/lib/api/Uart$Parity;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne p5, v2, :cond_2

    const/4 v0, 0x2

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_0

    .restart local v0    # "parbits":I
    :cond_3
    move v2, v1

    .line 370
    goto :goto_1

    .line 366
    .end local v0    # "parbits":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized uartData(II[B)V
    .locals 4
    .param p1, "uartNum"    # I
    .param p2, "numBytes"    # I
    .param p3, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 349
    monitor-enter p0

    const/16 v1, 0x40

    if-le p2, v1, :cond_0

    .line 350
    :try_start_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 351
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "A maximum of 64 bytes can be sent in one uartData message. Got: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 352
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 351
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 350
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 349
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 354
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->beginBatch()V

    .line 355
    const/16 v1, 0xe

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 356
    add-int/lit8 v1, p2, -0x1

    shl-int/lit8 v2, p1, 0x6

    or-int/2addr v1, v2

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V

    .line 357
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p2, :cond_1

    .line 360
    invoke-virtual {p0}, Lioio/lib/impl/IOIOProtocol;->endBatch()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 361
    monitor-exit p0

    return-void

    .line 358
    :cond_1
    :try_start_2
    aget-byte v1, p3, v0

    and-int/lit16 v1, v1, 0xff

    invoke-direct {p0, v1}, Lioio/lib/impl/IOIOProtocol;->writeByte(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 357
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
