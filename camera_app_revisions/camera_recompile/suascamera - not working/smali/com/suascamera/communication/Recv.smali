.class public Lcom/suascamera/communication/Recv;
.super Ljava/lang/Thread;
.source "Recv.java"


# instance fields
.field imageData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[B>;"
        }
    .end annotation
.end field

.field public oot:Z

.field parent:Lcom/suascamera/communication/Comm;

.field pictureNumber:I

.field public running:Z

.field startTime:J


# direct methods
.method public constructor <init>(Lcom/suascamera/communication/Comm;)V
    .locals 2
    .param p1, "c"    # Lcom/suascamera/communication/Comm;

    .prologue
    const/4 v0, 0x1

    .line 25
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 13
    iput-boolean v0, p0, Lcom/suascamera/communication/Recv;->running:Z

    .line 15
    iput-boolean v0, p0, Lcom/suascamera/communication/Recv;->oot:Z

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/suascamera/communication/Recv;->pictureNumber:I

    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/suascamera/communication/Recv;->imageData:Ljava/util/ArrayList;

    .line 27
    iput-object p1, p0, Lcom/suascamera/communication/Recv;->parent:Lcom/suascamera/communication/Comm;

    .line 29
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/suascamera/communication/Recv;->startTime:J

    .line 30
    return-void
.end method


# virtual methods
.method public end()V
    .locals 1

    .prologue
    .line 83
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/suascamera/communication/Recv;->running:Z

    .line 84
    return-void
.end method

.method public run()V
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 34
    :cond_0
    :goto_0
    iget-boolean v2, p0, Lcom/suascamera/communication/Recv;->running:Z

    if-nez v2, :cond_1

    .line 80
    return-void

    .line 36
    :cond_1
    :try_start_0
    sget-object v2, Lcom/suascamera/app/Backend;->tcpIn:Ljava/io/BufferedInputStream;

    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->available()I

    move-result v2

    if-lez v2, :cond_2

    .line 37
    sget-object v2, Lcom/suascamera/app/Backend;->tcpIn:Ljava/io/BufferedInputStream;

    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->read()I

    move-result v0

    .line 38
    .local v0, "data":I
    const/16 v2, 0x7f

    if-ne v0, v2, :cond_3

    .line 39
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/suascamera/communication/Recv;->startTime:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 73
    .end local v0    # "data":I
    :cond_2
    :goto_1
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/suascamera/communication/Recv;->startTime:J

    sub-long/2addr v5, v7

    const-wide/16 v7, 0xbb8

    cmp-long v2, v5, v7

    if-lez v2, :cond_0

    .line 74
    iget-object v2, p0, Lcom/suascamera/communication/Recv;->parent:Lcom/suascamera/communication/Comm;

    iget-boolean v2, v2, Lcom/suascamera/communication/Comm;->firstConnect:Z

    if-nez v2, :cond_0

    .line 75
    const-string v2, "Comm"

    const-string v5, "Link dead"

    invoke-static {v2, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    iget-object v2, p0, Lcom/suascamera/communication/Recv;->parent:Lcom/suascamera/communication/Comm;

    iput-boolean v3, v2, Lcom/suascamera/communication/Comm;->connected:Z

    .line 77
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/suascamera/communication/Recv;->startTime:J

    goto :goto_0

    .line 40
    .restart local v0    # "data":I
    :cond_3
    const/16 v2, 0xf9

    if-ne v0, v2, :cond_4

    .line 41
    :try_start_1
    new-instance v1, Lcom/suascamera/sric/SRIC;

    invoke-direct {v1}, Lcom/suascamera/sric/SRIC;-><init>()V

    .line 42
    .local v1, "sric":Lcom/suascamera/sric/SRIC;
    invoke-virtual {v1}, Lcom/suascamera/sric/SRIC;->start()V

    goto :goto_1

    .line 68
    .end local v0    # "data":I
    .end local v1    # "sric":Lcom/suascamera/sric/SRIC;
    :catch_0
    move-exception v2

    goto :goto_1

    .line 43
    .restart local v0    # "data":I
    :cond_4
    const/16 v2, 0xfa

    if-ne v0, v2, :cond_5

    .line 45
    sget-object v2, Lcom/suascamera/app/Backend;->tcpIn:Ljava/io/BufferedInputStream;

    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->read()I

    move-result v2

    sput v2, Lcom/suascamera/app/Backend;->picDelay:I

    goto :goto_1

    .line 70
    .end local v0    # "data":I
    :catch_1
    move-exception v2

    goto :goto_1

    .line 46
    .restart local v0    # "data":I
    :cond_5
    const/16 v2, 0xfb

    if-ne v0, v2, :cond_7

    .line 48
    sget-boolean v2, Lcom/suascamera/app/Backend;->continuous:Z

    if-eqz v2, :cond_6

    move v2, v3

    :goto_2
    sput-boolean v2, Lcom/suascamera/app/Backend;->continuous:Z

    goto :goto_1

    :cond_6
    move v2, v4

    goto :goto_2

    .line 49
    :cond_7
    const/16 v2, 0xfc

    if-ne v0, v2, :cond_8

    .line 51
    sget-object v2, Lcom/suascamera/app/Backend;->preview:Lcom/suascamera/camera/Preview;

    invoke-virtual {v2}, Lcom/suascamera/camera/Preview;->rebalance()V

    goto :goto_1

    .line 52
    :cond_8
    const/16 v2, 0xfd

    if-ne v0, v2, :cond_b

    .line 53
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Wake Lock"

    invoke-virtual {v2, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
    iget-boolean v2, p0, Lcom/suascamera/communication/Recv;->oot:Z

    if-eqz v2, :cond_9

    .line 55
    sget-object v2, Lcom/suascamera/app/Backend;->screenHandler:Lcom/suascamera/app/MainActivity$ScreenHandler;

    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Lcom/suascamera/app/MainActivity$ScreenHandler;->sendEmptyMessage(I)Z

    .line 59
    :goto_3
    iget-boolean v2, p0, Lcom/suascamera/communication/Recv;->oot:Z

    if-eqz v2, :cond_a

    move v2, v3

    :goto_4
    iput-boolean v2, p0, Lcom/suascamera/communication/Recv;->oot:Z

    goto/16 :goto_1

    .line 57
    :cond_9
    sget-object v2, Lcom/suascamera/app/Backend;->screenHandler:Lcom/suascamera/app/MainActivity$ScreenHandler;

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Lcom/suascamera/app/MainActivity$ScreenHandler;->sendEmptyMessage(I)Z

    goto :goto_3

    :cond_a
    move v2, v4

    .line 59
    goto :goto_4

    .line 60
    :cond_b
    const/16 v2, 0xfe

    if-ne v0, v2, :cond_c

    .line 62
    sget-object v2, Lcom/suascamera/app/Backend;->preview:Lcom/suascamera/camera/Preview;

    invoke-virtual {v2}, Lcom/suascamera/camera/Preview;->increaseExposureCompensation()V

    goto/16 :goto_1

    .line 63
    :cond_c
    const/16 v2, 0xff

    if-ne v0, v2, :cond_2

    .line 65
    sget-object v2, Lcom/suascamera/app/Backend;->preview:Lcom/suascamera/camera/Preview;

    invoke-virtual {v2}, Lcom/suascamera/camera/Preview;->decreaseExposureCompensation()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1
.end method
