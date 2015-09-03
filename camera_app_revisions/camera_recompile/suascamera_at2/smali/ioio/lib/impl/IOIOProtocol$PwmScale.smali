.class final enum Lioio/lib/impl/IOIOProtocol$PwmScale;
.super Ljava/lang/Enum;
.source "IOIOProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/IOIOProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "PwmScale"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/impl/IOIOProtocol$PwmScale;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lioio/lib/impl/IOIOProtocol$PwmScale;

.field public static final enum SCALE_1X:Lioio/lib/impl/IOIOProtocol$PwmScale;

.field public static final enum SCALE_256X:Lioio/lib/impl/IOIOProtocol$PwmScale;

.field public static final enum SCALE_64X:Lioio/lib/impl/IOIOProtocol$PwmScale;

.field public static final enum SCALE_8X:Lioio/lib/impl/IOIOProtocol$PwmScale;


# instance fields
.field private final encoding:I

.field public final scale:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 127
    new-instance v0, Lioio/lib/impl/IOIOProtocol$PwmScale;

    const-string v1, "SCALE_1X"

    invoke-direct {v0, v1, v4, v3, v4}, Lioio/lib/impl/IOIOProtocol$PwmScale;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lioio/lib/impl/IOIOProtocol$PwmScale;->SCALE_1X:Lioio/lib/impl/IOIOProtocol$PwmScale;

    new-instance v0, Lioio/lib/impl/IOIOProtocol$PwmScale;

    const-string v1, "SCALE_8X"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v3, v2, v6}, Lioio/lib/impl/IOIOProtocol$PwmScale;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lioio/lib/impl/IOIOProtocol$PwmScale;->SCALE_8X:Lioio/lib/impl/IOIOProtocol$PwmScale;

    new-instance v0, Lioio/lib/impl/IOIOProtocol$PwmScale;

    const-string v1, "SCALE_64X"

    const/16 v2, 0x40

    invoke-direct {v0, v1, v5, v2, v5}, Lioio/lib/impl/IOIOProtocol$PwmScale;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lioio/lib/impl/IOIOProtocol$PwmScale;->SCALE_64X:Lioio/lib/impl/IOIOProtocol$PwmScale;

    new-instance v0, Lioio/lib/impl/IOIOProtocol$PwmScale;

    const-string v1, "SCALE_256X"

    const/16 v2, 0x100

    invoke-direct {v0, v1, v6, v2, v3}, Lioio/lib/impl/IOIOProtocol$PwmScale;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lioio/lib/impl/IOIOProtocol$PwmScale;->SCALE_256X:Lioio/lib/impl/IOIOProtocol$PwmScale;

    .line 126
    const/4 v0, 0x4

    new-array v0, v0, [Lioio/lib/impl/IOIOProtocol$PwmScale;

    sget-object v1, Lioio/lib/impl/IOIOProtocol$PwmScale;->SCALE_1X:Lioio/lib/impl/IOIOProtocol$PwmScale;

    aput-object v1, v0, v4

    sget-object v1, Lioio/lib/impl/IOIOProtocol$PwmScale;->SCALE_8X:Lioio/lib/impl/IOIOProtocol$PwmScale;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/impl/IOIOProtocol$PwmScale;->SCALE_64X:Lioio/lib/impl/IOIOProtocol$PwmScale;

    aput-object v1, v0, v5

    sget-object v1, Lioio/lib/impl/IOIOProtocol$PwmScale;->SCALE_256X:Lioio/lib/impl/IOIOProtocol$PwmScale;

    aput-object v1, v0, v6

    sput-object v0, Lioio/lib/impl/IOIOProtocol$PwmScale;->ENUM$VALUES:[Lioio/lib/impl/IOIOProtocol$PwmScale;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .param p3, "scale"    # I
    .param p4, "encoding"    # I

    .prologue
    .line 132
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 133
    iput p3, p0, Lioio/lib/impl/IOIOProtocol$PwmScale;->scale:I

    .line 134
    iput p4, p0, Lioio/lib/impl/IOIOProtocol$PwmScale;->encoding:I

    .line 135
    return-void
.end method

.method static synthetic access$2(Lioio/lib/impl/IOIOProtocol$PwmScale;)I
    .locals 1

    .prologue
    .line 130
    iget v0, p0, Lioio/lib/impl/IOIOProtocol$PwmScale;->encoding:I

    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/impl/IOIOProtocol$PwmScale;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/impl/IOIOProtocol$PwmScale;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/IOIOProtocol$PwmScale;

    return-object v0
.end method

.method public static values()[Lioio/lib/impl/IOIOProtocol$PwmScale;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/impl/IOIOProtocol$PwmScale;->ENUM$VALUES:[Lioio/lib/impl/IOIOProtocol$PwmScale;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/impl/IOIOProtocol$PwmScale;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
