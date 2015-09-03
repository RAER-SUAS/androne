.class public final enum Lioio/lib/api/DigitalInput$Spec$Mode;
.super Ljava/lang/Enum;
.source "DigitalInput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/DigitalInput$Spec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Mode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/api/DigitalInput$Spec$Mode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lioio/lib/api/DigitalInput$Spec$Mode;

.field public static final enum FLOATING:Lioio/lib/api/DigitalInput$Spec$Mode;

.field public static final enum PULL_DOWN:Lioio/lib/api/DigitalInput$Spec$Mode;

.field public static final enum PULL_UP:Lioio/lib/api/DigitalInput$Spec$Mode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 67
    new-instance v0, Lioio/lib/api/DigitalInput$Spec$Mode;

    const-string v1, "FLOATING"

    invoke-direct {v0, v1, v2}, Lioio/lib/api/DigitalInput$Spec$Mode;-><init>(Ljava/lang/String;I)V

    .line 73
    sput-object v0, Lioio/lib/api/DigitalInput$Spec$Mode;->FLOATING:Lioio/lib/api/DigitalInput$Spec$Mode;

    .line 74
    new-instance v0, Lioio/lib/api/DigitalInput$Spec$Mode;

    const-string v1, "PULL_UP"

    invoke-direct {v0, v1, v3}, Lioio/lib/api/DigitalInput$Spec$Mode;-><init>(Ljava/lang/String;I)V

    .line 80
    sput-object v0, Lioio/lib/api/DigitalInput$Spec$Mode;->PULL_UP:Lioio/lib/api/DigitalInput$Spec$Mode;

    .line 81
    new-instance v0, Lioio/lib/api/DigitalInput$Spec$Mode;

    const-string v1, "PULL_DOWN"

    invoke-direct {v0, v1, v4}, Lioio/lib/api/DigitalInput$Spec$Mode;-><init>(Ljava/lang/String;I)V

    .line 87
    sput-object v0, Lioio/lib/api/DigitalInput$Spec$Mode;->PULL_DOWN:Lioio/lib/api/DigitalInput$Spec$Mode;

    .line 66
    const/4 v0, 0x3

    new-array v0, v0, [Lioio/lib/api/DigitalInput$Spec$Mode;

    sget-object v1, Lioio/lib/api/DigitalInput$Spec$Mode;->FLOATING:Lioio/lib/api/DigitalInput$Spec$Mode;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/api/DigitalInput$Spec$Mode;->PULL_UP:Lioio/lib/api/DigitalInput$Spec$Mode;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/api/DigitalInput$Spec$Mode;->PULL_DOWN:Lioio/lib/api/DigitalInput$Spec$Mode;

    aput-object v1, v0, v4

    sput-object v0, Lioio/lib/api/DigitalInput$Spec$Mode;->ENUM$VALUES:[Lioio/lib/api/DigitalInput$Spec$Mode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/api/DigitalInput$Spec$Mode;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/api/DigitalInput$Spec$Mode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/api/DigitalInput$Spec$Mode;

    return-object v0
.end method

.method public static values()[Lioio/lib/api/DigitalInput$Spec$Mode;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/api/DigitalInput$Spec$Mode;->ENUM$VALUES:[Lioio/lib/api/DigitalInput$Spec$Mode;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/api/DigitalInput$Spec$Mode;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
