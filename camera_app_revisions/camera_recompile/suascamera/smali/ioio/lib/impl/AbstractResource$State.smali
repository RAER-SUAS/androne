.class final enum Lioio/lib/impl/AbstractResource$State;
.super Ljava/lang/Enum;
.source "AbstractResource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/AbstractResource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/impl/AbstractResource$State;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CLOSED:Lioio/lib/impl/AbstractResource$State;

.field public static final enum DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

.field private static final synthetic ENUM$VALUES:[Lioio/lib/impl/AbstractResource$State;

.field public static final enum OPEN:Lioio/lib/impl/AbstractResource$State;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 37
    new-instance v0, Lioio/lib/impl/AbstractResource$State;

    const-string v1, "OPEN"

    invoke-direct {v0, v1, v2}, Lioio/lib/impl/AbstractResource$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/AbstractResource$State;->OPEN:Lioio/lib/impl/AbstractResource$State;

    .line 38
    new-instance v0, Lioio/lib/impl/AbstractResource$State;

    const-string v1, "CLOSED"

    invoke-direct {v0, v1, v3}, Lioio/lib/impl/AbstractResource$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/AbstractResource$State;->CLOSED:Lioio/lib/impl/AbstractResource$State;

    .line 39
    new-instance v0, Lioio/lib/impl/AbstractResource$State;

    const-string v1, "DISCONNECTED"

    invoke-direct {v0, v1, v4}, Lioio/lib/impl/AbstractResource$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/AbstractResource$State;->DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

    .line 36
    const/4 v0, 0x3

    new-array v0, v0, [Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->OPEN:Lioio/lib/impl/AbstractResource$State;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->CLOSED:Lioio/lib/impl/AbstractResource$State;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

    aput-object v1, v0, v4

    sput-object v0, Lioio/lib/impl/AbstractResource$State;->ENUM$VALUES:[Lioio/lib/impl/AbstractResource$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/impl/AbstractResource$State;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/impl/AbstractResource$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/AbstractResource$State;

    return-object v0
.end method

.method public static values()[Lioio/lib/impl/AbstractResource$State;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/impl/AbstractResource$State;->ENUM$VALUES:[Lioio/lib/impl/AbstractResource$State;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/impl/AbstractResource$State;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
