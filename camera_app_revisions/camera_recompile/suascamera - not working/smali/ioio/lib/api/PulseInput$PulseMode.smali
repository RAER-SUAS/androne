.class public final enum Lioio/lib/api/PulseInput$PulseMode;
.super Ljava/lang/Enum;
.source "PulseInput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/PulseInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PulseMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/api/PulseInput$PulseMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lioio/lib/api/PulseInput$PulseMode;

.field public static final enum FREQ:Lioio/lib/api/PulseInput$PulseMode;

.field public static final enum FREQ_SCALE_16:Lioio/lib/api/PulseInput$PulseMode;

.field public static final enum FREQ_SCALE_4:Lioio/lib/api/PulseInput$PulseMode;

.field public static final enum NEGATIVE:Lioio/lib/api/PulseInput$PulseMode;

.field public static final enum POSITIVE:Lioio/lib/api/PulseInput$PulseMode;


# instance fields
.field public final scaling:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x4

    const/4 v3, 0x1

    .line 233
    new-instance v0, Lioio/lib/api/PulseInput$PulseMode;

    const-string v1, "POSITIVE"

    .line 234
    invoke-direct {v0, v1, v5, v3}, Lioio/lib/api/PulseInput$PulseMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lioio/lib/api/PulseInput$PulseMode;->POSITIVE:Lioio/lib/api/PulseInput$PulseMode;

    .line 235
    new-instance v0, Lioio/lib/api/PulseInput$PulseMode;

    const-string v1, "NEGATIVE"

    .line 236
    invoke-direct {v0, v1, v3, v3}, Lioio/lib/api/PulseInput$PulseMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lioio/lib/api/PulseInput$PulseMode;->NEGATIVE:Lioio/lib/api/PulseInput$PulseMode;

    .line 237
    new-instance v0, Lioio/lib/api/PulseInput$PulseMode;

    const-string v1, "FREQ"

    .line 238
    invoke-direct {v0, v1, v6, v3}, Lioio/lib/api/PulseInput$PulseMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lioio/lib/api/PulseInput$PulseMode;->FREQ:Lioio/lib/api/PulseInput$PulseMode;

    .line 239
    new-instance v0, Lioio/lib/api/PulseInput$PulseMode;

    const-string v1, "FREQ_SCALE_4"

    .line 240
    invoke-direct {v0, v1, v7, v4}, Lioio/lib/api/PulseInput$PulseMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lioio/lib/api/PulseInput$PulseMode;->FREQ_SCALE_4:Lioio/lib/api/PulseInput$PulseMode;

    .line 241
    new-instance v0, Lioio/lib/api/PulseInput$PulseMode;

    const-string v1, "FREQ_SCALE_16"

    .line 242
    const/16 v2, 0x10

    invoke-direct {v0, v1, v4, v2}, Lioio/lib/api/PulseInput$PulseMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lioio/lib/api/PulseInput$PulseMode;->FREQ_SCALE_16:Lioio/lib/api/PulseInput$PulseMode;

    .line 232
    const/4 v0, 0x5

    new-array v0, v0, [Lioio/lib/api/PulseInput$PulseMode;

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->POSITIVE:Lioio/lib/api/PulseInput$PulseMode;

    aput-object v1, v0, v5

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->NEGATIVE:Lioio/lib/api/PulseInput$PulseMode;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->FREQ:Lioio/lib/api/PulseInput$PulseMode;

    aput-object v1, v0, v6

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->FREQ_SCALE_4:Lioio/lib/api/PulseInput$PulseMode;

    aput-object v1, v0, v7

    sget-object v1, Lioio/lib/api/PulseInput$PulseMode;->FREQ_SCALE_16:Lioio/lib/api/PulseInput$PulseMode;

    aput-object v1, v0, v4

    sput-object v0, Lioio/lib/api/PulseInput$PulseMode;->ENUM$VALUES:[Lioio/lib/api/PulseInput$PulseMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "s"    # I

    .prologue
    .line 247
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 248
    iput p3, p0, Lioio/lib/api/PulseInput$PulseMode;->scaling:I

    .line 249
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/api/PulseInput$PulseMode;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/api/PulseInput$PulseMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/api/PulseInput$PulseMode;

    return-object v0
.end method

.method public static values()[Lioio/lib/api/PulseInput$PulseMode;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/api/PulseInput$PulseMode;->ENUM$VALUES:[Lioio/lib/api/PulseInput$PulseMode;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/api/PulseInput$PulseMode;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
