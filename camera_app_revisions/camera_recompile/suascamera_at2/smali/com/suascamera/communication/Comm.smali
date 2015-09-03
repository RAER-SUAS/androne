.class public Lcom/suascamera/communication/Comm;
.super Ljava/lang/Thread;
.source "Comm.java"


# instance fields
.field connected:Z

.field firstConnect:Z

.field receiveData:[B

.field recv:Lcom/suascamera/communication/Recv;

.field public running:Z

.field sendData:[B

.field startTime:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/16 v2, 0x3e80

    const/4 v1, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/suascamera/communication/Comm;->running:Z

    .line 22
    new-array v0, v2, [B

    iput-object v0, p0, Lcom/suascamera/communication/Comm;->receiveData:[B

    .line 23
    new-array v0, v2, [B

    iput-object v0, p0, Lcom/suascamera/communication/Comm;->sendData:[B

    .line 27
    iput-boolean v1, p0, Lcom/suascamera/communication/Comm;->connected:Z

    .line 29
    iput-boolean v1, p0, Lcom/suascamera/communication/Comm;->firstConnect:Z

    .line 36
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    sput-object v0, Lcom/suascamera/app/Backend;->qOne:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 38
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    sput-object v0, Lcom/suascamera/app/Backend;->altQ:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 40
    new-instance v0, Lcom/suascamera/communication/Recv;

    invoke-direct {v0, p0}, Lcom/suascamera/communication/Recv;-><init>(Lcom/suascamera/communication/Comm;)V

    iput-object v0, p0, Lcom/suascamera/communication/Comm;->recv:Lcom/suascamera/communication/Recv;

    .line 41
    iget-object v0, p0, Lcom/suascamera/communication/Comm;->recv:Lcom/suascamera/communication/Recv;

    invoke-virtual {v0}, Lcom/suascamera/communication/Recv;->start()V

    .line 43
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/suascamera/communication/Comm;->startTime:J

    .line 44
    return-void
.end method


# virtual methods
.method public connect()Z
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 53
    :try_start_0
    const-string v2, "com.suascamera.com"

    const-string v3, "connecting"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    new-instance v2, Ljava/net/Socket;

    const-string v3, "192.168.1.90"

    const/16 v4, 0x2710

    invoke-direct {v2, v3, v4}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/suascamera/app/Backend;->sock:Ljava/net/Socket;

    .line 55
    new-instance v2, Ljava/io/BufferedOutputStream;

    .line 56
    sget-object v3, Lcom/suascamera/app/Backend;->sock:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 55
    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    sput-object v2, Lcom/suascamera/app/Backend;->tcpOut:Ljava/io/BufferedOutputStream;

    .line 57
    sget-object v2, Lcom/suascamera/app/Backend;->sock:Ljava/net/Socket;

    const v3, 0x4c4b40

    invoke-virtual {v2, v3}, Ljava/net/Socket;->setSendBufferSize(I)V

    .line 58
    new-instance v2, Ljava/io/BufferedInputStream;

    .line 59
    sget-object v3, Lcom/suascamera/app/Backend;->sock:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 58
    invoke-direct {v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    sput-object v2, Lcom/suascamera/app/Backend;->tcpIn:Ljava/io/BufferedInputStream;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 60
    const/4 v1, 0x1

    .line 64
    :goto_0
    return v1

    .line 61
    :catch_0
    move-exception v0

    .line 62
    .local v0, "e":Ljava/net/UnknownHostException;
    goto :goto_0

    .line 63
    .end local v0    # "e":Ljava/net/UnknownHostException;
    :catch_1
    move-exception v0

    .line 64
    .local v0, "e":Ljava/io/IOException;
    goto :goto_0
.end method

.method public end()V
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/suascamera/communication/Comm;->running:Z

    .line 48
    iget-object v0, p0, Lcom/suascamera/communication/Comm;->recv:Lcom/suascamera/communication/Recv;

    invoke-virtual {v0}, Lcom/suascamera/communication/Recv;->end()V

    .line 49
    return-void
.end method

.method public run()V
    .locals 16

    .prologue
    const/4 v11, 0x1

    const-wide/16 v14, 0x2

    const/4 v13, 0x0

    .line 70
    const/4 v4, 0x0

    .line 71
    .local v4, "failedMessage":[B
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/suascamera/communication/Comm;->connected:Z

    if-eqz v9, :cond_0

    .line 75
    const-string v9, "Comm"

    const-string v10, "Connected"

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/suascamera/communication/Comm;->firstConnect:Z

    .line 78
    const/4 v7, -0x1

    .line 80
    .local v7, "picNumber":I
    const/4 v1, 0x1

    .line 81
    .local v1, "continuousStatus":B
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/suascamera/communication/Comm;->running:Z

    if-nez v9, :cond_1

    .line 163
    return-void

    .line 72
    .end local v1    # "continuousStatus":B
    .end local v7    # "picNumber":I
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/suascamera/communication/Comm;->connect()Z

    move-result v9

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/suascamera/communication/Comm;->connected:Z

    goto :goto_0

    .line 85
    .restart local v1    # "continuousStatus":B
    .restart local v7    # "picNumber":I
    :cond_1
    :try_start_0
    sget-object v9, Lcom/suascamera/app/Backend;->qOne:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/suascamera/communication/Comm;->connected:Z

    if-eqz v9, :cond_2

    .line 86
    sget-object v9, Lcom/suascamera/app/Backend;->qOne:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 87
    invoke-static {v7}, Lcom/suascamera/data/Picture;->messageMaker(I)Ljava/util/ArrayList;

    move-result-object v2

    .line 88
    .local v2, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    if-lt v5, v9, :cond_5

    .line 102
    .end local v2    # "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    .end local v5    # "i":I
    :cond_2
    :goto_3
    :try_start_1
    new-instance v9, Ljava/util/Date;

    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    move-object/from16 v0, p0

    iget-wide v11, v0, Lcom/suascamera/communication/Comm;->startTime:J

    sub-long/2addr v9, v11

    const-wide/16 v11, 0x3e8

    cmp-long v9, v9, v11

    if-lez v9, :cond_3

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/suascamera/communication/Comm;->connected:Z

    if-eqz v9, :cond_3

    .line 103
    const/4 v9, 0x4

    new-array v8, v9, [B

    const/4 v9, 0x0

    const/16 v10, -0x57

    aput-byte v10, v8, v9

    const/4 v9, 0x3

    aput-byte v1, v8, v9

    .line 104
    .local v8, "status":[B
    const/4 v9, 0x1

    sget v10, Lcom/suascamera/app/Backend;->imageCount:I

    add-int/lit8 v10, v10, -0x1

    shr-int/lit8 v10, v10, 0x8

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    .line 105
    const/4 v9, 0x2

    sget v10, Lcom/suascamera/app/Backend;->imageCount:I

    add-int/lit8 v10, v10, -0x1

    and-int/lit16 v10, v10, 0xff

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    .line 106
    sget-boolean v9, Lcom/suascamera/app/Backend;->continuous:Z

    if-eqz v9, :cond_6

    .line 107
    const/16 v1, 0xf

    .line 111
    :goto_4
    const/4 v9, 0x3

    aput-byte v1, v8, v9

    .line 113
    sget-object v9, Lcom/suascamera/app/Backend;->tcpOut:Ljava/io/BufferedOutputStream;

    invoke-virtual {v9, v8}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 114
    sget-object v9, Lcom/suascamera/app/Backend;->tcpOut:Ljava/io/BufferedOutputStream;

    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->flush()V

    .line 115
    new-instance v9, Ljava/util/Date;

    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    move-object/from16 v0, p0

    iput-wide v9, v0, Lcom/suascamera/communication/Comm;->startTime:J
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 124
    .end local v8    # "status":[B
    :cond_3
    :goto_5
    const/4 v6, 0x0

    .line 126
    .local v6, "message":[B
    :try_start_2
    sget-object v9, Lcom/suascamera/app/Backend;->altQ:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_4

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/suascamera/communication/Comm;->connected:Z

    if-eqz v9, :cond_4

    .line 127
    sget-object v9, Lcom/suascamera/app/Backend;->altQ:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v9

    move-object v0, v9

    check-cast v0, [B

    move-object v6, v0

    .line 128
    const-string v9, "SRIC Message"

    new-instance v10, Ljava/lang/String;

    invoke-direct {v10, v6}, Ljava/lang/String;-><init>([B)V

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    sget-object v9, Lcom/suascamera/app/Backend;->tcpOut:Ljava/io/BufferedOutputStream;

    invoke-virtual {v9, v6}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 130
    sget-object v9, Lcom/suascamera/app/Backend;->tcpOut:Ljava/io/BufferedOutputStream;

    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->flush()V

    .line 131
    const-wide/16 v9, 0x2

    invoke-static {v9, v10}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 141
    :cond_4
    :goto_6
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/suascamera/communication/Comm;->connected:Z

    if-eqz v9, :cond_7

    .line 161
    invoke-static {v14, v15}, Landroid/os/SystemClock;->sleep(J)V

    goto/16 :goto_1

    .line 89
    .end local v6    # "message":[B
    .restart local v2    # "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    .restart local v5    # "i":I
    :cond_5
    :try_start_3
    sget-object v10, Lcom/suascamera/app/Backend;->tcpOut:Ljava/io/BufferedOutputStream;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    invoke-virtual {v10, v9}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 90
    sget-object v9, Lcom/suascamera/app/Backend;->tcpOut:Ljava/io/BufferedOutputStream;

    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->flush()V

    .line 91
    const-wide/16 v9, 0x2

    invoke-static {v9, v10}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 88
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_2

    .line 94
    .end local v2    # "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    .end local v5    # "i":I
    :catch_0
    move-exception v3

    .line 95
    .local v3, "e":Ljava/io/IOException;
    const-string v9, "Comm"

    const-string v10, "Socket Broken"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/suascamera/communication/Comm;->connected:Z

    goto/16 :goto_3

    .line 109
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v8    # "status":[B
    :cond_6
    const/4 v1, 0x1

    goto :goto_4

    .line 117
    .end local v8    # "status":[B
    :catch_1
    move-exception v3

    .line 118
    .restart local v3    # "e":Ljava/io/IOException;
    const-string v9, "Comm"

    const-string v10, "Socket Broken"

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/suascamera/communication/Comm;->connected:Z

    goto :goto_5

    .line 133
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v6    # "message":[B
    :catch_2
    move-exception v3

    .line 134
    .restart local v3    # "e":Ljava/io/IOException;
    const-string v9, "Comm"

    const-string v10, "Socket Broken"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/suascamera/communication/Comm;->connected:Z

    .line 136
    move-object v4, v6

    .line 141
    goto :goto_6

    .line 143
    .end local v3    # "e":Ljava/io/IOException;
    :cond_7
    :try_start_4
    sget-object v9, Lcom/suascamera/app/Backend;->sock:Ljava/net/Socket;

    invoke-virtual {v9}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 147
    :goto_7
    invoke-virtual/range {p0 .. p0}, Lcom/suascamera/communication/Comm;->connect()Z

    move-result v9

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/suascamera/communication/Comm;->connected:Z

    .line 148
    const-wide/16 v9, 0x1f4

    invoke-static {v9, v10}, Landroid/os/SystemClock;->sleep(J)V

    .line 149
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/suascamera/communication/Comm;->connected:Z

    if-eqz v9, :cond_4

    if-eqz v4, :cond_4

    .line 151
    :try_start_5
    sget-object v9, Lcom/suascamera/app/Backend;->tcpOut:Ljava/io/BufferedOutputStream;

    invoke-virtual {v9, v4}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 152
    sget-object v9, Lcom/suascamera/app/Backend;->tcpOut:Ljava/io/BufferedOutputStream;

    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 156
    :goto_8
    const/4 v4, 0x0

    goto :goto_6

    .line 153
    :catch_3
    move-exception v9

    goto :goto_8

    .line 144
    :catch_4
    move-exception v9

    goto :goto_7
.end method
