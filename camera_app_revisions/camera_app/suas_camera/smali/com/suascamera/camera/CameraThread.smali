.class public Lcom/suascamera/camera/CameraThread;
.super Ljava/lang/Thread;
.source "CameraThread.java"


# instance fields
.field oldTime:J

.field private p:Lcom/suascamera/camera/Preview;

.field public running:Z

.field public takePictures:Z


# direct methods
.method public constructor <init>(Lcom/suascamera/camera/Preview;)V
    .locals 2
    .param p1, "p"    # Lcom/suascamera/camera/Preview;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 9
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/suascamera/camera/CameraThread;->running:Z

    .line 10
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/suascamera/camera/CameraThread;->takePictures:Z

    .line 12
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/suascamera/camera/CameraThread;->oldTime:J

    .line 16
    iput-object p1, p0, Lcom/suascamera/camera/CameraThread;->p:Lcom/suascamera/camera/Preview;

    .line 17
    return-void
.end method


# virtual methods
.method public end()V
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/suascamera/camera/CameraThread;->running:Z

    .line 40
    return-void
.end method

.method public run()V
    .locals 4

    .prologue
    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/suascamera/camera/CameraThread;->oldTime:J

    .line 22
    :goto_0
    iget-boolean v0, p0, Lcom/suascamera/camera/CameraThread;->running:Z

    if-nez v0, :cond_0

    .line 36
    return-void

    .line 23
    :cond_0
    sget-boolean v0, Lcom/suascamera/app/Backend;->continuous:Z

    if-eqz v0, :cond_1

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/suascamera/camera/CameraThread;->oldTime:J

    sub-long/2addr v0, v2

    sget v2, Lcom/suascamera/app/Backend;->picDelay:I

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 26
    :try_start_0
    iget-object v0, p0, Lcom/suascamera/camera/CameraThread;->p:Lcom/suascamera/camera/Preview;

    invoke-virtual {v0}, Lcom/suascamera/camera/Preview;->takePicture()V

    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/suascamera/camera/CameraThread;->oldTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :cond_1
    :goto_1
    const-wide/16 v0, 0x64

    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    .line 34
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0

    .line 28
    :catch_0
    move-exception v0

    goto :goto_1
.end method
