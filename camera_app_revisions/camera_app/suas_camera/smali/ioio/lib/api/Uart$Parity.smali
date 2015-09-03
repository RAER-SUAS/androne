.class public final enum Lioio/lib/api/Uart$Parity;
.super Ljava/lang/Enum;
.source "Uart.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/Uart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Parity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/api/Uart$Parity;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lioio/lib/api/Uart$Parity;

.field public static final enum EVEN:Lioio/lib/api/Uart$Parity;

.field public static final enum NONE:Lioio/lib/api/Uart$Parity;

.field public static final enum ODD:Lioio/lib/api/Uart$Parity;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 78
    new-instance v0, Lioio/lib/api/Uart$Parity;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lioio/lib/api/Uart$Parity;-><init>(Ljava/lang/String;I)V

    .line 79
    sput-object v0, Lioio/lib/api/Uart$Parity;->NONE:Lioio/lib/api/Uart$Parity;

    .line 80
    new-instance v0, Lioio/lib/api/Uart$Parity;

    const-string v1, "EVEN"

    invoke-direct {v0, v1, v3}, Lioio/lib/api/Uart$Parity;-><init>(Ljava/lang/String;I)V

    .line 81
    sput-object v0, Lioio/lib/api/Uart$Parity;->EVEN:Lioio/lib/api/Uart$Parity;

    .line 82
    new-instance v0, Lioio/lib/api/Uart$Parity;

    const-string v1, "ODD"

    invoke-direct {v0, v1, v4}, Lioio/lib/api/Uart$Parity;-><init>(Ljava/lang/String;I)V

    .line 83
    sput-object v0, Lioio/lib/api/Uart$Parity;->ODD:Lioio/lib/api/Uart$Parity;

    .line 77
    const/4 v0, 0x3

    new-array v0, v0, [Lioio/lib/api/Uart$Parity;

    sget-object v1, Lioio/lib/api/Uart$Parity;->NONE:Lioio/lib/api/Uart$Parity;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/api/Uart$Parity;->EVEN:Lioio/lib/api/Uart$Parity;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/api/Uart$Parity;->ODD:Lioio/lib/api/Uart$Parity;

    aput-object v1, v0, v4

    sput-object v0, Lioio/lib/api/Uart$Parity;->ENUM$VALUES:[Lioio/lib/api/Uart$Parity;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/api/Uart$Parity;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/api/Uart$Parity;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/api/Uart$Parity;

    return-object v0
.end method

.method public static values()[Lioio/lib/api/Uart$Parity;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/api/Uart$Parity;->ENUM$VALUES:[Lioio/lib/api/Uart$Parity;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/api/Uart$Parity;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
