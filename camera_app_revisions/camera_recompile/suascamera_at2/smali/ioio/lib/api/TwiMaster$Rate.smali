.class public final enum Lioio/lib/api/TwiMaster$Rate;
.super Ljava/lang/Enum;
.source "TwiMaster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/TwiMaster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Rate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/api/TwiMaster$Rate;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lioio/lib/api/TwiMaster$Rate;

.field public static final enum RATE_100KHz:Lioio/lib/api/TwiMaster$Rate;

.field public static final enum RATE_1MHz:Lioio/lib/api/TwiMaster$Rate;

.field public static final enum RATE_400KHz:Lioio/lib/api/TwiMaster$Rate;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 86
    new-instance v0, Lioio/lib/api/TwiMaster$Rate;

    const-string v1, "RATE_100KHz"

    invoke-direct {v0, v1, v2}, Lioio/lib/api/TwiMaster$Rate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/api/TwiMaster$Rate;->RATE_100KHz:Lioio/lib/api/TwiMaster$Rate;

    new-instance v0, Lioio/lib/api/TwiMaster$Rate;

    const-string v1, "RATE_400KHz"

    invoke-direct {v0, v1, v3}, Lioio/lib/api/TwiMaster$Rate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/api/TwiMaster$Rate;->RATE_400KHz:Lioio/lib/api/TwiMaster$Rate;

    new-instance v0, Lioio/lib/api/TwiMaster$Rate;

    const-string v1, "RATE_1MHz"

    invoke-direct {v0, v1, v4}, Lioio/lib/api/TwiMaster$Rate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/api/TwiMaster$Rate;->RATE_1MHz:Lioio/lib/api/TwiMaster$Rate;

    .line 85
    const/4 v0, 0x3

    new-array v0, v0, [Lioio/lib/api/TwiMaster$Rate;

    sget-object v1, Lioio/lib/api/TwiMaster$Rate;->RATE_100KHz:Lioio/lib/api/TwiMaster$Rate;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/api/TwiMaster$Rate;->RATE_400KHz:Lioio/lib/api/TwiMaster$Rate;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/api/TwiMaster$Rate;->RATE_1MHz:Lioio/lib/api/TwiMaster$Rate;

    aput-object v1, v0, v4

    sput-object v0, Lioio/lib/api/TwiMaster$Rate;->ENUM$VALUES:[Lioio/lib/api/TwiMaster$Rate;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/api/TwiMaster$Rate;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/api/TwiMaster$Rate;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/api/TwiMaster$Rate;

    return-object v0
.end method

.method public static values()[Lioio/lib/api/TwiMaster$Rate;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/api/TwiMaster$Rate;->ENUM$VALUES:[Lioio/lib/api/TwiMaster$Rate;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/api/TwiMaster$Rate;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
