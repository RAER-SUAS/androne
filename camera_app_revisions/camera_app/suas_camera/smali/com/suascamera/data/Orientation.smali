.class public Lcom/suascamera/data/Orientation;
.super Ljava/lang/Object;
.source "Orientation.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# instance fields
.field final R:[F

.field final accel:[F

.field accelave:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field altitude:F

.field fieldave:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field firstPressure:Z

.field final magnet:[F

.field final orientation:[F

.field pZero:F

.field public running:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x3

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    .line 14
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/suascamera/data/Orientation;->accel:[F

    .line 15
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/suascamera/data/Orientation;->orientation:[F

    .line 16
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/suascamera/data/Orientation;->R:[F

    .line 18
    iput-boolean v3, p0, Lcom/suascamera/data/Orientation;->firstPressure:Z

    .line 19
    iput v2, p0, Lcom/suascamera/data/Orientation;->pZero:F

    .line 20
    iput v2, p0, Lcom/suascamera/data/Orientation;->altitude:F

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    .line 27
    iput-boolean v3, p0, Lcom/suascamera/data/Orientation;->running:Z

    .line 31
    return-void
.end method


# virtual methods
.method public getAltitude()F
    .locals 1

    .prologue
    .line 41
    iget v0, p0, Lcom/suascamera/data/Orientation;->altitude:F

    return v0
.end method

.method public getAngles()[F
    .locals 4

    .prologue
    .line 34
    iget-object v0, p0, Lcom/suascamera/data/Orientation;->R:[F

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accel:[F

    iget-object v3, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    invoke-static {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->getRotationMatrix([F[F[F[F)Z

    .line 35
    iget-object v0, p0, Lcom/suascamera/data/Orientation;->R:[F

    iget-object v1, p0, Lcom/suascamera/data/Orientation;->orientation:[F

    invoke-static {v0, v1}, Landroid/hardware/SensorManager;->getOrientation([F[F)[F

    .line 37
    iget-object v0, p0, Lcom/suascamera/data/Orientation;->orientation:[F

    return-object v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 47
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 8
    .param p1, "s"    # Landroid/hardware/SensorEvent;

    .prologue
    const/16 v4, 0xa

    const/4 v3, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 51
    iget-object v2, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getType()I

    move-result v2

    if-ne v2, v6, :cond_3

    .line 56
    new-array v1, v3, [Ljava/lang/Float;

    .line 57
    .local v1, "tfa":[Ljava/lang/Float;
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v5

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v5

    .line 58
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v6

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v6

    .line 59
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v7

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v7

    .line 60
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, v4, :cond_0

    .line 62
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 63
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_2

    .line 68
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accel:[F

    iget-object v3, p0, Lcom/suascamera/data/Orientation;->accel:[F

    aget v3, v3, v5

    iget-object v4, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    aput v3, v2, v5

    .line 69
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accel:[F

    iget-object v3, p0, Lcom/suascamera/data/Orientation;->accel:[F

    aget v3, v3, v6

    iget-object v4, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    aput v3, v2, v6

    .line 70
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accel:[F

    iget-object v3, p0, Lcom/suascamera/data/Orientation;->accel:[F

    aget v3, v3, v7

    iget-object v4, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    aput v3, v2, v7

    .line 103
    .end local v0    # "i":I
    .end local v1    # "tfa":[Ljava/lang/Float;
    :cond_1
    :goto_1
    return-void

    .line 64
    .restart local v0    # "i":I
    .restart local v1    # "tfa":[Ljava/lang/Float;
    :cond_2
    iget-object v3, p0, Lcom/suascamera/data/Orientation;->accel:[F

    aget v4, v3, v5

    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Float;

    aget-object v2, v2, v5

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v2, v4

    aput v2, v3, v5

    .line 65
    iget-object v3, p0, Lcom/suascamera/data/Orientation;->accel:[F

    aget v4, v3, v6

    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Float;

    aget-object v2, v2, v6

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v2, v4

    aput v2, v3, v6

    .line 66
    iget-object v3, p0, Lcom/suascamera/data/Orientation;->accel:[F

    aget v4, v3, v7

    iget-object v2, p0, Lcom/suascamera/data/Orientation;->accelave:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Float;

    aget-object v2, v2, v7

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v2, v4

    aput v2, v3, v7

    .line 63
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 71
    .end local v0    # "i":I
    .end local v1    # "tfa":[Ljava/lang/Float;
    :cond_3
    iget-object v2, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getType()I

    move-result v2

    if-ne v2, v7, :cond_6

    .line 80
    new-array v1, v3, [Ljava/lang/Float;

    .line 81
    .restart local v1    # "tfa":[Ljava/lang/Float;
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v5

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v5

    .line 82
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v6

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v6

    .line 83
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v7

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v7

    .line 84
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, v4, :cond_4

    .line 86
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 87
    :cond_4
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_5

    .line 92
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    iget-object v3, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    aget v3, v3, v5

    iget-object v4, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    aput v3, v2, v5

    .line 93
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    iget-object v3, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    aget v3, v3, v6

    iget-object v4, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    aput v3, v2, v6

    .line 94
    iget-object v2, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    iget-object v3, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    aget v3, v3, v7

    iget-object v4, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    aput v3, v2, v7

    goto/16 :goto_1

    .line 88
    :cond_5
    iget-object v3, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    aget v4, v3, v5

    iget-object v2, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Float;

    aget-object v2, v2, v5

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v2, v4

    aput v2, v3, v5

    .line 89
    iget-object v3, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    aget v4, v3, v6

    iget-object v2, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Float;

    aget-object v2, v2, v6

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v2, v4

    aput v2, v3, v6

    .line 90
    iget-object v3, p0, Lcom/suascamera/data/Orientation;->magnet:[F

    aget v4, v3, v7

    iget-object v2, p0, Lcom/suascamera/data/Orientation;->fieldave:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Float;

    aget-object v2, v2, v7

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v2, v4

    aput v2, v3, v7

    .line 87
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 95
    .end local v0    # "i":I
    .end local v1    # "tfa":[Ljava/lang/Float;
    :cond_6
    iget-object v2, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getType()I

    move-result v2

    const/4 v3, 0x6

    if-ne v2, v3, :cond_1

    .line 96
    iget-boolean v2, p0, Lcom/suascamera/data/Orientation;->firstPressure:Z

    if-eqz v2, :cond_7

    .line 97
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v5

    iput v2, p0, Lcom/suascamera/data/Orientation;->pZero:F

    .line 98
    iput-boolean v5, p0, Lcom/suascamera/data/Orientation;->firstPressure:Z

    .line 100
    :cond_7
    iget v2, p0, Lcom/suascamera/data/Orientation;->pZero:F

    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v3, v5

    invoke-static {v2, v3}, Landroid/hardware/SensorManager;->getAltitude(FF)F

    move-result v2

    iput v2, p0, Lcom/suascamera/data/Orientation;->altitude:F

    goto/16 :goto_1
.end method
