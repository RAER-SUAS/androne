.class final enum Lioio/lib/impl/IncomingState$ConnectionState;
.super Ljava/lang/Enum;
.source "IncomingState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/IncomingState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ConnectionState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/impl/IncomingState$ConnectionState;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

.field public static final enum DISCONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

.field private static final synthetic ENUM$VALUES:[Lioio/lib/impl/IncomingState$ConnectionState;

.field public static final enum ESTABLISHED:Lioio/lib/impl/IncomingState$ConnectionState;

.field public static final enum INIT:Lioio/lib/impl/IncomingState$ConnectionState;

.field public static final enum UNSUPPORTED_IID:Lioio/lib/impl/IncomingState$ConnectionState;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 46
    new-instance v0, Lioio/lib/impl/IncomingState$ConnectionState;

    const-string v1, "INIT"

    invoke-direct {v0, v1, v2}, Lioio/lib/impl/IncomingState$ConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->INIT:Lioio/lib/impl/IncomingState$ConnectionState;

    new-instance v0, Lioio/lib/impl/IncomingState$ConnectionState;

    const-string v1, "ESTABLISHED"

    invoke-direct {v0, v1, v3}, Lioio/lib/impl/IncomingState$ConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->ESTABLISHED:Lioio/lib/impl/IncomingState$ConnectionState;

    new-instance v0, Lioio/lib/impl/IncomingState$ConnectionState;

    const-string v1, "CONNECTED"

    invoke-direct {v0, v1, v4}, Lioio/lib/impl/IncomingState$ConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->CONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    new-instance v0, Lioio/lib/impl/IncomingState$ConnectionState;

    const-string v1, "DISCONNECTED"

    invoke-direct {v0, v1, v5}, Lioio/lib/impl/IncomingState$ConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->DISCONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    new-instance v0, Lioio/lib/impl/IncomingState$ConnectionState;

    const-string v1, "UNSUPPORTED_IID"

    invoke-direct {v0, v1, v6}, Lioio/lib/impl/IncomingState$ConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->UNSUPPORTED_IID:Lioio/lib/impl/IncomingState$ConnectionState;

    .line 45
    const/4 v0, 0x5

    new-array v0, v0, [Lioio/lib/impl/IncomingState$ConnectionState;

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->INIT:Lioio/lib/impl/IncomingState$ConnectionState;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->ESTABLISHED:Lioio/lib/impl/IncomingState$ConnectionState;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->CONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    aput-object v1, v0, v4

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->DISCONNECTED:Lioio/lib/impl/IncomingState$ConnectionState;

    aput-object v1, v0, v5

    sget-object v1, Lioio/lib/impl/IncomingState$ConnectionState;->UNSUPPORTED_IID:Lioio/lib/impl/IncomingState$ConnectionState;

    aput-object v1, v0, v6

    sput-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->ENUM$VALUES:[Lioio/lib/impl/IncomingState$ConnectionState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/impl/IncomingState$ConnectionState;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/impl/IncomingState$ConnectionState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/IncomingState$ConnectionState;

    return-object v0
.end method

.method public static values()[Lioio/lib/impl/IncomingState$ConnectionState;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/impl/IncomingState$ConnectionState;->ENUM$VALUES:[Lioio/lib/impl/IncomingState$ConnectionState;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/impl/IncomingState$ConnectionState;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
