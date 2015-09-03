.class public Lioio/lib/api/DigitalOutput$Spec;
.super Ljava/lang/Object;
.source "DigitalOutput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/DigitalOutput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Spec"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/api/DigitalOutput$Spec$Mode;
    }
.end annotation


# instance fields
.field public mode:Lioio/lib/api/DigitalOutput$Spec$Mode;

.field public pin:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "pin"    # I

    .prologue
    .line 107
    sget-object v0, Lioio/lib/api/DigitalOutput$Spec$Mode;->NORMAL:Lioio/lib/api/DigitalOutput$Spec$Mode;

    invoke-direct {p0, p1, v0}, Lioio/lib/api/DigitalOutput$Spec;-><init>(ILioio/lib/api/DigitalOutput$Spec$Mode;)V

    .line 108
    return-void
.end method

.method public constructor <init>(ILioio/lib/api/DigitalOutput$Spec$Mode;)V
    .locals 0
    .param p1, "pin"    # I
    .param p2, "mode"    # Lioio/lib/api/DigitalOutput$Spec$Mode;

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput p1, p0, Lioio/lib/api/DigitalOutput$Spec;->pin:I

    .line 98
    iput-object p2, p0, Lioio/lib/api/DigitalOutput$Spec;->mode:Lioio/lib/api/DigitalOutput$Spec$Mode;

    .line 99
    return-void
.end method
