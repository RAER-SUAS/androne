.class public Lioio/lib/api/SpiMaster$Config;
.super Ljava/lang/Object;
.source "SpiMaster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/SpiMaster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Config"
.end annotation


# instance fields
.field public invertClk:Z

.field public rate:Lioio/lib/api/SpiMaster$Rate;

.field public sampleOnTrailing:Z


# direct methods
.method public constructor <init>(Lioio/lib/api/SpiMaster$Rate;)V
    .locals 1
    .param p1, "rate"    # Lioio/lib/api/SpiMaster$Rate;

    .prologue
    const/4 v0, 0x0

    .line 155
    invoke-direct {p0, p1, v0, v0}, Lioio/lib/api/SpiMaster$Config;-><init>(Lioio/lib/api/SpiMaster$Rate;ZZ)V

    .line 156
    return-void
.end method

.method public constructor <init>(Lioio/lib/api/SpiMaster$Rate;ZZ)V
    .locals 0
    .param p1, "rate"    # Lioio/lib/api/SpiMaster$Rate;
    .param p2, "invertClk"    # Z
    .param p3, "sampleOnTrailing"    # Z

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    iput-object p1, p0, Lioio/lib/api/SpiMaster$Config;->rate:Lioio/lib/api/SpiMaster$Rate;

    .line 144
    iput-boolean p2, p0, Lioio/lib/api/SpiMaster$Config;->invertClk:Z

    .line 145
    iput-boolean p3, p0, Lioio/lib/api/SpiMaster$Config;->sampleOnTrailing:Z

    .line 146
    return-void
.end method
