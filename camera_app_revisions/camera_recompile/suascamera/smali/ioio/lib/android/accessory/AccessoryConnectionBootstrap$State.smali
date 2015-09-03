.class final enum Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;
.super Ljava/lang/Enum;
.source "AccessoryConnectionBootstrap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/android/accessory/AccessoryConnectionBootstrap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CLOSED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

.field private static final synthetic ENUM$VALUES:[Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

.field public static final enum OPEN:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

.field public static final enum WAIT_PERMISSION:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 65
    new-instance v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    const-string v1, "CLOSED"

    invoke-direct {v0, v1, v2}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->CLOSED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    new-instance v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    const-string v1, "WAIT_PERMISSION"

    invoke-direct {v0, v1, v3}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->WAIT_PERMISSION:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    new-instance v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    const-string v1, "OPEN"

    invoke-direct {v0, v1, v4}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->OPEN:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    .line 64
    const/4 v0, 0x3

    new-array v0, v0, [Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->CLOSED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->WAIT_PERMISSION:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->OPEN:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    aput-object v1, v0, v4

    sput-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->ENUM$VALUES:[Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    return-object v0
.end method

.method public static values()[Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->ENUM$VALUES:[Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
