.class final enum Lioio/lib/impl/QueueInputStream$State;
.super Ljava/lang/Enum;
.source "QueueInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/QueueInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lioio/lib/impl/QueueInputStream$State;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CLOSED:Lioio/lib/impl/QueueInputStream$State;

.field private static final synthetic ENUM$VALUES:[Lioio/lib/impl/QueueInputStream$State;

.field public static final enum KILLED:Lioio/lib/impl/QueueInputStream$State;

.field public static final enum OPEN:Lioio/lib/impl/QueueInputStream$State;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 40
    new-instance v0, Lioio/lib/impl/QueueInputStream$State;

    const-string v1, "OPEN"

    invoke-direct {v0, v1, v2}, Lioio/lib/impl/QueueInputStream$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/QueueInputStream$State;->OPEN:Lioio/lib/impl/QueueInputStream$State;

    new-instance v0, Lioio/lib/impl/QueueInputStream$State;

    const-string v1, "CLOSED"

    invoke-direct {v0, v1, v3}, Lioio/lib/impl/QueueInputStream$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/QueueInputStream$State;->CLOSED:Lioio/lib/impl/QueueInputStream$State;

    new-instance v0, Lioio/lib/impl/QueueInputStream$State;

    const-string v1, "KILLED"

    invoke-direct {v0, v1, v4}, Lioio/lib/impl/QueueInputStream$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lioio/lib/impl/QueueInputStream$State;->KILLED:Lioio/lib/impl/QueueInputStream$State;

    .line 39
    const/4 v0, 0x3

    new-array v0, v0, [Lioio/lib/impl/QueueInputStream$State;

    sget-object v1, Lioio/lib/impl/QueueInputStream$State;->OPEN:Lioio/lib/impl/QueueInputStream$State;

    aput-object v1, v0, v2

    sget-object v1, Lioio/lib/impl/QueueInputStream$State;->CLOSED:Lioio/lib/impl/QueueInputStream$State;

    aput-object v1, v0, v3

    sget-object v1, Lioio/lib/impl/QueueInputStream$State;->KILLED:Lioio/lib/impl/QueueInputStream$State;

    aput-object v1, v0, v4

    sput-object v0, Lioio/lib/impl/QueueInputStream$State;->ENUM$VALUES:[Lioio/lib/impl/QueueInputStream$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lioio/lib/impl/QueueInputStream$State;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lioio/lib/impl/QueueInputStream$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/QueueInputStream$State;

    return-object v0
.end method

.method public static values()[Lioio/lib/impl/QueueInputStream$State;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lioio/lib/impl/QueueInputStream$State;->ENUM$VALUES:[Lioio/lib/impl/QueueInputStream$State;

    array-length v1, v0

    new-array v2, v1, [Lioio/lib/impl/QueueInputStream$State;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
