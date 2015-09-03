.class public final enum Lioio/lib/api/PulseInput$ClockRate;
.super Ljava/lang/Enum;
.source "PulseInput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/PulseInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ClockRate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/api/PulseInput$ClockRate;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lioio/lib/api/PulseInput$ClockRate;

.field public static final enum RATE_16MHz:Lioio/lib/api/PulseInput$ClockRate;

.field public static final enum RATE_250KHz:Lioio/lib/api/PulseInput$ClockRate;

.field public static final enum RATE_2MHz:Lioio/lib/api/PulseInput$ClockRate;

.field public static final enum RATE_62KHz:Lioio/lib/api/PulseInput$ClockRate;


# instance fields
.field public final hertz:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 254
    new-instance v0, Lioio/lib/api/PulseInput$ClockRate;

    const-string v1, "RATE_16MHz"

    .line 255
    const v2, 0xf42400

    invoke-direct {v0, v1, v3, v2}, Lioio/lib/api/PulseInput$ClockRate;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lioio/lib/api/PulseInput$ClockRate;->RATE_16MHz:Lioio/lib/api/PulseInput$ClockRate;

    .line 256
    new-instance v0, Lioio/lib/api/PulseInput$ClockRate;

    const-string v1, "RATE_2MHz"

    .line 257
    const v2, 0x1e8480

    invoke-direct {v0, v1, v4, v2}, Lioio/lib/api/PulseInput$ClockRate;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lioio/lib/api/PulseInput$ClockRate;->RATE_2MHz:Lioio/lib/api/PulseInput$ClockRate;

    .line 258
    new-instance v0, Lioio/lib/api/PulseInput$ClockRate;

    const-string v1, "RATE_250KHz"

    .line 259
    const v2, 0x3d090

    invoke-direct {v0, v1, v5, v2}, Lioio/lib/api/PulseInput$ClockRate;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lioio/lib/api/PulseInput$ClockRate;->RATE_250KHz:Lioio/lib/api/PulseInput$ClockRate;

    .line 260
    new-instance v0, Lioio/lib/api/PulseInput$ClockRate;

    const-string v1, "RATE_62KHz"

    .line 261
    const v2, 0xf424

    invoke-direct {v0, v1, v6, v2}, Lioio/lib/api/PulseInput$ClockRate;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lioio/lib/api/PulseInput$ClockRate;->RATE_62KHz:Lioio/lib/api/PulseInput$ClockRate;

    .line 253
    const/4 v0, 0x4

    new-array v0, v0, [Lioio/lib/api/PulseInput$ClockRate;

    sget-object v1, Lioio/lib/api/PulseInput$ClockRate;->RATE_16MHz:Lioio/lib/api/PulseInput$ClockRate;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/api/PulseInput$ClockRate;->RATE_2MHz:Lioio/lib/api/PulseInput$ClockRate;

    aput-object v1, v0, v4

    sget-object v1, Lioio/lib/api/PulseInput$ClockRate;->RATE_250KHz:Lioio/lib/api/PulseInput$ClockRate;

    aput-object v1, v0, v5

    sget-object v1, Lioio/lib/api/PulseInput$ClockRate;->RATE_62KHz:Lioio/lib/api/PulseInput$ClockRate;

    aput-object v1, v0, v6

    sput-object v0, Lioio/lib/api/PulseInput$ClockRate;->ENUM$VALUES:[Lioio/lib/api/PulseInput$ClockRate;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "h"    # I

    .prologue
    .line 266
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 267
    iput p3, p0, Lioio/lib/api/PulseInput$ClockRate;->hertz:I

    .line 268
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/api/PulseInput$ClockRate;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/api/PulseInput$ClockRate;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/api/PulseInput$ClockRate;

    return-object v0
.end method

.method public static values()[Lioio/lib/api/PulseInput$ClockRate;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/api/PulseInput$ClockRate;->ENUM$VALUES:[Lioio/lib/api/PulseInput$ClockRate;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/api/PulseInput$ClockRate;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
