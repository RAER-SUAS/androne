.class public Lcom/suascamera/camera/JpegCallback;
.super Ljava/lang/Object;
.source "JpegCallback.java"

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# instance fields
.field lm:Landroid/location/LocationManager;

.field ot:Lcom/suascamera/data/Orientation;

.field pic:Lcom/suascamera/data/Picture;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 7
    .param p1, "data"    # [B
    .param p2, "cam"    # Landroid/hardware/Camera;

    .prologue
    .line 23
    iget-object v4, p0, Lcom/suascamera/camera/JpegCallback;->ot:Lcom/suascamera/data/Orientation;

    invoke-virtual {v4}, Lcom/suascamera/data/Orientation;->getAngles()[F

    move-result-object v1

    .line 24
    .local v1, "orientation":[F
    iget-object v4, p0, Lcom/suascamera/camera/JpegCallback;->ot:Lcom/suascamera/data/Orientation;

    invoke-virtual {v4}, Lcom/suascamera/data/Orientation;->getAltitude()F

    move-result v2

    .line 26
    .local v2, "alt":F
    sget-object v4, Lcom/suascamera/app/Backend;->lt:Lcom/suascamera/data/LocationThread;

    iget-object v3, v4, Lcom/suascamera/data/LocationThread;->currentLocation:Landroid/location/Location;

    .line 28
    .local v3, "loc":Landroid/location/Location;
    new-instance v0, Lcom/suascamera/data/Picture;

    .line 29
    sget v5, Lcom/suascamera/app/Backend;->imageCount:I

    move-object v4, p1

    .line 28
    invoke-direct/range {v0 .. v5}, Lcom/suascamera/data/Picture;-><init>([FFLandroid/location/Location;[BI)V

    .line 30
    .local v0, "pic":Lcom/suascamera/data/Picture;
    invoke-virtual {v0}, Lcom/suascamera/data/Picture;->save()V

    .line 31
    sget-boolean v4, Lcom/suascamera/app/Backend;->whichQueue:Z

    if-eqz v4, :cond_0

    .line 32
    sget-object v4, Lcom/suascamera/app/Backend;->qOne:Ljava/util/concurrent/ConcurrentLinkedQueue;

    iget v5, v0, Lcom/suascamera/data/Picture;->imageNumber:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 38
    :cond_0
    sget-object v4, Lcom/suascamera/app/Backend;->text:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/suascamera/app/Backend;->imageCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    sget v4, Lcom/suascamera/app/Backend;->imageCount:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Lcom/suascamera/app/Backend;->imageCount:I

    .line 41
    invoke-virtual {p2}, Landroid/hardware/Camera;->startPreview()V

    .line 42
    return-void
.end method

.method public setLocation(Landroid/location/LocationManager;)V
    .locals 0
    .param p1, "lm"    # Landroid/location/LocationManager;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/suascamera/camera/JpegCallback;->lm:Landroid/location/LocationManager;

    .line 50
    return-void
.end method

.method public setOrientation(Lcom/suascamera/data/Orientation;)V
    .locals 0
    .param p1, "ot"    # Lcom/suascamera/data/Orientation;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/suascamera/camera/JpegCallback;->ot:Lcom/suascamera/data/Orientation;

    .line 46
    return-void
.end method
