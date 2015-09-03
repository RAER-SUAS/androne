.class final enum Lioio/lib/impl/Board;
.super Ljava/lang/Enum;
.source "Board.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/Board$Hardware;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/impl/Board;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lioio/lib/impl/Board;

.field public static final enum MINT0010:Lioio/lib/impl/Board;

.field public static final enum SPRK0015:Lioio/lib/impl/Board;

.field public static final enum SPRK0016:Lioio/lib/impl/Board;

.field public static final enum SPRK0020:Lioio/lib/impl/Board;


# instance fields
.field public final hardware:Lioio/lib/impl/Board$Hardware;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 32
    new-instance v0, Lioio/lib/impl/Board;

    const-string v1, "SPRK0015"

    sget-object v2, Lioio/lib/impl/Board$Hardware;->IOIO0002:Lioio/lib/impl/Board$Hardware;

    invoke-direct {v0, v1, v3, v2}, Lioio/lib/impl/Board;-><init>(Ljava/lang/String;ILioio/lib/impl/Board$Hardware;)V

    sput-object v0, Lioio/lib/impl/Board;->SPRK0015:Lioio/lib/impl/Board;

    .line 33
    new-instance v0, Lioio/lib/impl/Board;

    const-string v1, "SPRK0016"

    sget-object v2, Lioio/lib/impl/Board$Hardware;->IOIO0003:Lioio/lib/impl/Board$Hardware;

    invoke-direct {v0, v1, v4, v2}, Lioio/lib/impl/Board;-><init>(Ljava/lang/String;ILioio/lib/impl/Board$Hardware;)V

    sput-object v0, Lioio/lib/impl/Board;->SPRK0016:Lioio/lib/impl/Board;

    .line 34
    new-instance v0, Lioio/lib/impl/Board;

    const-string v1, "MINT0010"

    sget-object v2, Lioio/lib/impl/Board$Hardware;->IOIO0003:Lioio/lib/impl/Board$Hardware;

    invoke-direct {v0, v1, v5, v2}, Lioio/lib/impl/Board;-><init>(Ljava/lang/String;ILioio/lib/impl/Board$Hardware;)V

    sput-object v0, Lioio/lib/impl/Board;->MINT0010:Lioio/lib/impl/Board;

    .line 35
    new-instance v0, Lioio/lib/impl/Board;

    const-string v1, "SPRK0020"

    sget-object v2, Lioio/lib/impl/Board$Hardware;->IOIO0004:Lioio/lib/impl/Board$Hardware;

    invoke-direct {v0, v1, v6, v2}, Lioio/lib/impl/Board;-><init>(Ljava/lang/String;ILioio/lib/impl/Board$Hardware;)V

    sput-object v0, Lioio/lib/impl/Board;->SPRK0020:Lioio/lib/impl/Board;

    .line 31
    const/4 v0, 0x4

    new-array v0, v0, [Lioio/lib/impl/Board;

    sget-object v1, Lioio/lib/impl/Board;->SPRK0015:Lioio/lib/impl/Board;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/impl/Board;->SPRK0016:Lioio/lib/impl/Board;

    aput-object v1, v0, v4

    sget-object v1, Lioio/lib/impl/Board;->MINT0010:Lioio/lib/impl/Board;

    aput-object v1, v0, v5

    sget-object v1, Lioio/lib/impl/Board;->SPRK0020:Lioio/lib/impl/Board;

    aput-object v1, v0, v6

    sput-object v0, Lioio/lib/impl/Board;->ENUM$VALUES:[Lioio/lib/impl/Board;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILioio/lib/impl/Board$Hardware;)V
    .locals 0
    .param p3, "hw"    # Lioio/lib/impl/Board$Hardware;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 40
    iput-object p3, p0, Lioio/lib/impl/Board;->hardware:Lioio/lib/impl/Board$Hardware;

    .line 41
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/impl/Board;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/impl/Board;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/Board;

    return-object v0
.end method

.method public static values()[Lioio/lib/impl/Board;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/impl/Board;->ENUM$VALUES:[Lioio/lib/impl/Board;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/impl/Board;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
