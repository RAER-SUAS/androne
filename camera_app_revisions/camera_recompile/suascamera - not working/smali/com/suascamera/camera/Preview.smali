.class public Lcom/suascamera/camera/Preview;
.super Landroid/view/SurfaceView;
.source "Preview.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# instance fields
.field public exposureCompensation:I

.field public exposureMax:I

.field public exposureMin:I

.field private focusCallback:Landroid/hardware/Camera$AutoFocusCallback;

.field public focused:Z

.field public jCallback:Lcom/suascamera/camera/JpegCallback;

.field public mCamera:Landroid/hardware/Camera;

.field public mHolder:Landroid/view/SurfaceHolder;

.field public useFocus:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 21
    iput v0, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    .line 25
    iput-boolean v0, p0, Lcom/suascamera/camera/Preview;->useFocus:Z

    .line 26
    iput-boolean v0, p0, Lcom/suascamera/camera/Preview;->focused:Z

    .line 28
    new-instance v0, Lcom/suascamera/camera/Preview$1;

    invoke-direct {v0, p0}, Lcom/suascamera/camera/Preview$1;-><init>(Lcom/suascamera/camera/Preview;)V

    iput-object v0, p0, Lcom/suascamera/camera/Preview;->focusCallback:Landroid/hardware/Camera$AutoFocusCallback;

    .line 37
    invoke-virtual {p0}, Lcom/suascamera/camera/Preview;->create()V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    iput v0, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    .line 25
    iput-boolean v0, p0, Lcom/suascamera/camera/Preview;->useFocus:Z

    .line 26
    iput-boolean v0, p0, Lcom/suascamera/camera/Preview;->focused:Z

    .line 28
    new-instance v0, Lcom/suascamera/camera/Preview$1;

    invoke-direct {v0, p0}, Lcom/suascamera/camera/Preview$1;-><init>(Lcom/suascamera/camera/Preview;)V

    iput-object v0, p0, Lcom/suascamera/camera/Preview;->focusCallback:Landroid/hardware/Camera$AutoFocusCallback;

    .line 47
    invoke-virtual {p0}, Lcom/suascamera/camera/Preview;->create()V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    iput v0, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    .line 25
    iput-boolean v0, p0, Lcom/suascamera/camera/Preview;->useFocus:Z

    .line 26
    iput-boolean v0, p0, Lcom/suascamera/camera/Preview;->focused:Z

    .line 28
    new-instance v0, Lcom/suascamera/camera/Preview$1;

    invoke-direct {v0, p0}, Lcom/suascamera/camera/Preview$1;-><init>(Lcom/suascamera/camera/Preview;)V

    iput-object v0, p0, Lcom/suascamera/camera/Preview;->focusCallback:Landroid/hardware/Camera$AutoFocusCallback;

    .line 42
    invoke-virtual {p0}, Lcom/suascamera/camera/Preview;->create()V

    .line 43
    return-void
.end method


# virtual methods
.method public create()V
    .locals 2

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/suascamera/camera/Preview;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/suascamera/camera/Preview;->mHolder:Landroid/view/SurfaceHolder;

    .line 54
    iget-object v0, p0, Lcom/suascamera/camera/Preview;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 55
    iget-object v0, p0, Lcom/suascamera/camera/Preview;->mHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 57
    new-instance v0, Lcom/suascamera/camera/JpegCallback;

    invoke-direct {v0}, Lcom/suascamera/camera/JpegCallback;-><init>()V

    iput-object v0, p0, Lcom/suascamera/camera/Preview;->jCallback:Lcom/suascamera/camera/JpegCallback;

    .line 58
    return-void
.end method

.method public decreaseExposureCompensation()V
    .locals 2

    .prologue
    .line 127
    iget v0, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    add-int/lit8 v0, v0, -0x1

    iget v1, p0, Lcom/suascamera/camera/Preview;->exposureMin:I

    if-le v0, v1, :cond_0

    .line 128
    iget v0, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    .line 130
    :cond_0
    return-void
.end method

.method public focus()Z
    .locals 2

    .prologue
    .line 143
    iget-object v0, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/suascamera/camera/Preview;->focusCallback:Landroid/hardware/Camera$AutoFocusCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 144
    iget-boolean v0, p0, Lcom/suascamera/camera/Preview;->focused:Z

    return v0
.end method

.method public increaseExposureCompensation()V
    .locals 2

    .prologue
    .line 121
    iget v0, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/suascamera/camera/Preview;->exposureMax:I

    if-ge v0, v1, :cond_0

    .line 122
    iget v0, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    .line 124
    :cond_0
    return-void
.end method

.method public rebalance()V
    .locals 3

    .prologue
    .line 110
    iget-object v1, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 111
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setAutoExposureLock(Z)V

    .line 113
    iget-object v1, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 114
    const-wide/16 v1, 0x1f4

    invoke-static {v1, v2}, Landroid/os/SystemClock;->sleep(J)V

    .line 117
    iget-object v1, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 118
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 5
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .prologue
    .line 87
    iget-object v3, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 88
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v2

    .line 91
    .local v2, "previewSizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/Camera$Size;

    .line 93
    .local v1, "previewSize":Landroid/hardware/Camera$Size;
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxExposureCompensation()I

    move-result v3

    iput v3, p0, Lcom/suascamera/camera/Preview;->exposureMax:I

    .line 94
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMinExposureCompensation()I

    move-result v3

    iput v3, p0, Lcom/suascamera/camera/Preview;->exposureMin:I

    .line 96
    iget v3, p0, Lcom/suascamera/camera/Preview;->exposureCompensation:I

    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    .line 97
    const-string v3, "auto"

    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 98
    const-string v3, "auto"

    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setWhiteBalance(Ljava/lang/String;)V

    .line 99
    const-string v3, "off"

    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 100
    const-string v3, "landscape"

    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setSceneMode(Ljava/lang/String;)V

    .line 101
    iget v3, v1, Landroid/hardware/Camera$Size;->width:I

    iget v4, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v3, v4}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 105
    iget-object v3, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v3, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 106
    iget-object v3, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v3}, Landroid/hardware/Camera;->startPreview()V

    .line 107
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 64
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v1

    iput-object v1, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    .line 66
    :try_start_0
    iget-object v1, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    iget-object v1, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMaxExposureCompensation()I

    move-result v1

    iput v1, p0, Lcom/suascamera/camera/Preview;->exposureMax:I

    .line 71
    iget-object v1, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMinExposureCompensation()I

    move-result v1

    iput v1, p0, Lcom/suascamera/camera/Preview;->exposureMin:I

    .line 72
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    .line 81
    return-void
.end method

.method public takePicture()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 133
    iget-boolean v0, p0, Lcom/suascamera/camera/Preview;->useFocus:Z

    if-eqz v0, :cond_0

    .line 134
    invoke-virtual {p0}, Lcom/suascamera/camera/Preview;->focus()Z

    .line 137
    :cond_0
    iget-boolean v0, p0, Lcom/suascamera/camera/Preview;->focused:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/suascamera/camera/Preview;->useFocus:Z

    if-nez v0, :cond_2

    .line 138
    :cond_1
    iget-object v0, p0, Lcom/suascamera/camera/Preview;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/suascamera/camera/Preview;->jCallback:Lcom/suascamera/camera/JpegCallback;

    invoke-virtual {v0, v2, v2, v1}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    .line 140
    :cond_2
    return-void
.end method
