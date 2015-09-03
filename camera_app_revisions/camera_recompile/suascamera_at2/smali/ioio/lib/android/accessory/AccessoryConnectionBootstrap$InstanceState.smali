.class final enum Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;
.super Ljava/lang/Enum;
.source "AccessoryConnectionBootstrap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/android/accessory/AccessoryConnectionBootstrap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "InstanceState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CONNECTED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

.field public static final enum DEAD:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

.field private static final synthetic ENUM$VALUES:[Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

.field public static final enum INIT:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 69
    new-instance v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    const-string v1, "INIT"

    invoke-direct {v0, v1, v2}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->INIT:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    new-instance v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    const-string v1, "CONNECTED"

    invoke-direct {v0, v1, v3}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->CONNECTED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    new-instance v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    const-string v1, "DEAD"

    invoke-direct {v0, v1, v4}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->DEAD:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    .line 68
    const/4 v0, 0x3

    new-array v0, v0, [Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->INIT:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->CONNECTED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->DEAD:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    aput-object v1, v0, v4

    sput-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->ENUM$VALUES:[Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    return-object v0
.end method

.method public static values()[Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->ENUM$VALUES:[Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
