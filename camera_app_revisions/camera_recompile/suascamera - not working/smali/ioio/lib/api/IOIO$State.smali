.class public final enum Lioio/lib/api/IOIO$State;
.super Ljava/lang/Enum;
.source "IOIO.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/IOIO;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/api/IOIO$State;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CONNECTED:Lioio/lib/api/IOIO$State;

.field public static final enum DEAD:Lioio/lib/api/IOIO$State;

.field private static final synthetic ENUM$VALUES:[Lioio/lib/api/IOIO$State;

.field public static final enum INCOMPATIBLE:Lioio/lib/api/IOIO$State;

.field public static final enum INIT:Lioio/lib/api/IOIO$State;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 116
    new-instance v0, Lioio/lib/api/IOIO$State;

    const-string v1, "INIT"

    invoke-direct {v0, v1, v2}, Lioio/lib/api/IOIO$State;-><init>(Ljava/lang/String;I)V

    .line 117
    sput-object v0, Lioio/lib/api/IOIO$State;->INIT:Lioio/lib/api/IOIO$State;

    .line 118
    new-instance v0, Lioio/lib/api/IOIO$State;

    const-string v1, "CONNECTED"

    invoke-direct {v0, v1, v3}, Lioio/lib/api/IOIO$State;-><init>(Ljava/lang/String;I)V

    .line 119
    sput-object v0, Lioio/lib/api/IOIO$State;->CONNECTED:Lioio/lib/api/IOIO$State;

    .line 120
    new-instance v0, Lioio/lib/api/IOIO$State;

    const-string v1, "INCOMPATIBLE"

    invoke-direct {v0, v1, v4}, Lioio/lib/api/IOIO$State;-><init>(Ljava/lang/String;I)V

    .line 121
    sput-object v0, Lioio/lib/api/IOIO$State;->INCOMPATIBLE:Lioio/lib/api/IOIO$State;

    .line 122
    new-instance v0, Lioio/lib/api/IOIO$State;

    const-string v1, "DEAD"

    invoke-direct {v0, v1, v5}, Lioio/lib/api/IOIO$State;-><init>(Ljava/lang/String;I)V

    .line 123
    sput-object v0, Lioio/lib/api/IOIO$State;->DEAD:Lioio/lib/api/IOIO$State;

    .line 115
    const/4 v0, 0x4

    new-array v0, v0, [Lioio/lib/api/IOIO$State;

    sget-object v1, Lioio/lib/api/IOIO$State;->INIT:Lioio/lib/api/IOIO$State;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/api/IOIO$State;->CONNECTED:Lioio/lib/api/IOIO$State;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/api/IOIO$State;->INCOMPATIBLE:Lioio/lib/api/IOIO$State;

    aput-object v1, v0, v4

    sget-object v1, Lioio/lib/api/IOIO$State;->DEAD:Lioio/lib/api/IOIO$State;

    aput-object v1, v0, v5

    sput-object v0, Lioio/lib/api/IOIO$State;->ENUM$VALUES:[Lioio/lib/api/IOIO$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 115
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/api/IOIO$State;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/api/IOIO$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/api/IOIO$State;

    return-object v0
.end method

.method public static values()[Lioio/lib/api/IOIO$State;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/api/IOIO$State;->ENUM$VALUES:[Lioio/lib/api/IOIO$State;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/api/IOIO$State;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
