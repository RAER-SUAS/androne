.class public final enum Lioio/lib/api/IOIO$VersionType;
.super Ljava/lang/Enum;
.source "IOIO.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/api/IOIO;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VersionType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/api/IOIO$VersionType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum APP_FIRMWARE_VER:Lioio/lib/api/IOIO$VersionType;

.field public static final enum BOOTLOADER_VER:Lioio/lib/api/IOIO$VersionType;

.field private static final synthetic ENUM$VALUES:[Lioio/lib/api/IOIO$VersionType;

.field public static final enum HARDWARE_VER:Lioio/lib/api/IOIO$VersionType;

.field public static final enum IOIOLIB_VER:Lioio/lib/api/IOIO$VersionType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 102
    new-instance v0, Lioio/lib/api/IOIO$VersionType;

    const-string v1, "HARDWARE_VER"

    invoke-direct {v0, v1, v2}, Lioio/lib/api/IOIO$VersionType;-><init>(Ljava/lang/String;I)V

    .line 103
    sput-object v0, Lioio/lib/api/IOIO$VersionType;->HARDWARE_VER:Lioio/lib/api/IOIO$VersionType;

    .line 104
    new-instance v0, Lioio/lib/api/IOIO$VersionType;

    const-string v1, "BOOTLOADER_VER"

    invoke-direct {v0, v1, v3}, Lioio/lib/api/IOIO$VersionType;-><init>(Ljava/lang/String;I)V

    .line 105
    sput-object v0, Lioio/lib/api/IOIO$VersionType;->BOOTLOADER_VER:Lioio/lib/api/IOIO$VersionType;

    .line 106
    new-instance v0, Lioio/lib/api/IOIO$VersionType;

    const-string v1, "APP_FIRMWARE_VER"

    invoke-direct {v0, v1, v4}, Lioio/lib/api/IOIO$VersionType;-><init>(Ljava/lang/String;I)V

    .line 107
    sput-object v0, Lioio/lib/api/IOIO$VersionType;->APP_FIRMWARE_VER:Lioio/lib/api/IOIO$VersionType;

    .line 108
    new-instance v0, Lioio/lib/api/IOIO$VersionType;

    const-string v1, "IOIOLIB_VER"

    invoke-direct {v0, v1, v5}, Lioio/lib/api/IOIO$VersionType;-><init>(Ljava/lang/String;I)V

    .line 109
    sput-object v0, Lioio/lib/api/IOIO$VersionType;->IOIOLIB_VER:Lioio/lib/api/IOIO$VersionType;

    .line 101
    const/4 v0, 0x4

    new-array v0, v0, [Lioio/lib/api/IOIO$VersionType;

    sget-object v1, Lioio/lib/api/IOIO$VersionType;->HARDWARE_VER:Lioio/lib/api/IOIO$VersionType;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/api/IOIO$VersionType;->BOOTLOADER_VER:Lioio/lib/api/IOIO$VersionType;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/api/IOIO$VersionType;->APP_FIRMWARE_VER:Lioio/lib/api/IOIO$VersionType;

    aput-object v1, v0, v4

    sget-object v1, Lioio/lib/api/IOIO$VersionType;->IOIOLIB_VER:Lioio/lib/api/IOIO$VersionType;

    aput-object v1, v0, v5

    sput-object v0, Lioio/lib/api/IOIO$VersionType;->ENUM$VALUES:[Lioio/lib/api/IOIO$VersionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 101
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/api/IOIO$VersionType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/api/IOIO$VersionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/api/IOIO$VersionType;

    return-object v0
.end method

.method public static values()[Lioio/lib/api/IOIO$VersionType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/api/IOIO$VersionType;->ENUM$VALUES:[Lioio/lib/api/IOIO$VersionType;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/api/IOIO$VersionType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
