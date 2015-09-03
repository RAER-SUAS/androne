.class Lioio/lib/impl/PwmImpl;
.super Lioio/lib/impl/AbstractResource;
.source "PwmImpl.java"

# interfaces
.implements Lioio/lib/api/PwmOutput;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final baseUs_:F

.field private final period_:I

.field private final pinNum_:I

.field private final pwmNum_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lioio/lib/impl/PwmImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lioio/lib/impl/PwmImpl;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lioio/lib/impl/IOIOImpl;IIIF)V
    .locals 0
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .param p2, "pinNum"    # I
    .param p3, "pwmNum"    # I
    .param p4, "period"    # I
    .param p5, "baseUs"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lioio/lib/impl/AbstractResource;-><init>(Lioio/lib/impl/IOIOImpl;)V

    .line 45
    iput p3, p0, Lioio/lib/impl/PwmImpl;->pwmNum_:I

    .line 46
    iput p2, p0, Lioio/lib/impl/PwmImpl;->pinNum_:I

    .line 47
    iput p5, p0, Lioio/lib/impl/PwmImpl;->baseUs_:F

    .line 48
    iput p4, p0, Lioio/lib/impl/PwmImpl;->period_:I

    .line 49
    return-void
.end method

.method private declared-synchronized setPulseWidthInClocks(F)V
    .locals 5
    .param p1, "p"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    const/high16 v4, 0x3f800000

    .line 79
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lioio/lib/impl/PwmImpl;->checkState()V

    .line 80
    iget v3, p0, Lioio/lib/impl/PwmImpl;->period_:I

    int-to-float v3, v3

    cmpl-float v3, p1, v3

    if-lez v3, :cond_0

    .line 81
    iget v3, p0, Lioio/lib/impl/PwmImpl;->period_:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-float p1, v3

    .line 85
    :cond_0
    sub-float/2addr p1, v4

    .line 88
    cmpg-float v3, p1, v4

    if-gez v3, :cond_1

    .line 89
    const/4 v2, 0x0

    .line 90
    .local v2, "pw":I
    const/4 v1, 0x0

    .line 96
    .local v1, "fraction":I
    :goto_0
    :try_start_1
    iget-object v3, p0, Lioio/lib/impl/PwmImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget-object v3, v3, Lioio/lib/impl/IOIOImpl;->protocol_:Lioio/lib/impl/IOIOProtocol;

    iget v4, p0, Lioio/lib/impl/PwmImpl;->pwmNum_:I

    invoke-virtual {v3, v4, v2, v1}, Lioio/lib/impl/IOIOProtocol;->setPwmDutyCycle(III)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    monitor-exit p0

    return-void

    .line 92
    .end local v1    # "fraction":I
    .end local v2    # "pw":I
    :cond_1
    float-to-int v2, p1

    .line 93
    .restart local v2    # "pw":I
    float-to-int v3, p1

    mul-int/lit8 v3, v3, 0x4

    and-int/lit8 v1, v3, 0x3

    .restart local v1    # "fraction":I
    goto :goto_0

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v3, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v3, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "fraction":I
    .end local v2    # "pw":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 53
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lioio/lib/impl/AbstractResource;->close()V

    .line 54
    iget-object v0, p0, Lioio/lib/impl/PwmImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v1, p0, Lioio/lib/impl/PwmImpl;->pwmNum_:I

    invoke-virtual {v0, v1}, Lioio/lib/impl/IOIOImpl;->closePwm(I)V

    .line 55
    iget-object v0, p0, Lioio/lib/impl/PwmImpl;->ioio_:Lioio/lib/impl/IOIOImpl;

    iget v1, p0, Lioio/lib/impl/PwmImpl;->pinNum_:I

    invoke-virtual {v0, v1}, Lioio/lib/impl/IOIOImpl;->closePin(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    monitor-exit p0

    return-void

    .line 53
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setDutyCycle(F)V
    .locals 1
    .param p1, "dutyCycle"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 60
    sget-boolean v0, Lioio/lib/impl/PwmImpl;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    const/high16 v0, 0x3f800000

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-gez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 61
    :cond_1
    iget v0, p0, Lioio/lib/impl/PwmImpl;->period_:I

    int-to-float v0, v0

    mul-float/2addr v0, p1

    invoke-direct {p0, v0}, Lioio/lib/impl/PwmImpl;->setPulseWidthInClocks(F)V

    .line 62
    return-void
.end method

.method public setPulseWidth(F)V
    .locals 2
    .param p1, "pulseWidthUs"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 72
    sget-boolean v1, Lioio/lib/impl/PwmImpl;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    const/4 v1, 0x0

    cmpl-float v1, p1, v1

    if-gez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 73
    :cond_0
    iget v1, p0, Lioio/lib/impl/PwmImpl;->baseUs_:F

    div-float v0, p1, v1

    .line 74
    .local v0, "p":F
    invoke-direct {p0, v0}, Lioio/lib/impl/PwmImpl;->setPulseWidthInClocks(F)V

    .line 75
    return-void
.end method

.method public setPulseWidth(I)V
    .locals 1
    .param p1, "pulseWidthUs"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 66
    int-to-float v0, p1

    invoke-virtual {p0, v0}, Lioio/lib/impl/PwmImpl;->setPulseWidth(F)V

    .line 67
    return-void
.end method
