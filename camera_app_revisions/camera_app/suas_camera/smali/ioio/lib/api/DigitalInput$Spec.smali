.class public Lioio/lib/api/DigitalInput$Spec;
.super Ljava/lang/Object;
.source "DigitalInput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/DigitalInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Spec"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/api/DigitalInput$Spec$Mode;
    }
.end annotation


# instance fields
.field public mode:Lioio/lib/api/DigitalInput$Spec$Mode;

.field public pin:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "pin"    # I

    .prologue
    .line 110
    sget-object v0, Lioio/lib/api/DigitalInput$Spec$Mode;->FLOATING:Lioio/lib/api/DigitalInput$Spec$Mode;

    invoke-direct {p0, p1, v0}, Lioio/lib/api/DigitalInput$Spec;-><init>(ILioio/lib/api/DigitalInput$Spec$Mode;)V

    .line 111
    return-void
.end method

.method public constructor <init>(ILioio/lib/api/DigitalInput$Spec$Mode;)V
    .locals 0
    .param p1, "pin"    # I
    .param p2, "mode"    # Lioio/lib/api/DigitalInput$Spec$Mode;

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput p1, p0, Lioio/lib/api/DigitalInput$Spec;->pin:I

    .line 105
    iput-object p2, p0, Lioio/lib/api/DigitalInput$Spec;->mode:Lioio/lib/api/DigitalInput$Spec$Mode;

    .line 106
    return-void
.end method
