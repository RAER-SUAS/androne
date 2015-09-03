.class public abstract Lioio/lib/util/IOIOBaseApplicationHelper;
.super Ljava/lang/Object;
.source "IOIOBaseApplicationHelper.java"

# interfaces
.implements Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "IOIOBaseApplicationHelper"


# instance fields
.field protected final looperProvider_:Lioio/lib/util/IOIOLooperProvider;


# direct methods
.method public constructor <init>(Lioio/lib/util/IOIOLooperProvider;)V
    .locals 0
    .param p1, "provider"    # Lioio/lib/util/IOIOLooperProvider;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lioio/lib/util/IOIOBaseApplicationHelper;->looperProvider_:Lioio/lib/util/IOIOLooperProvider;

    .line 18
    return-void
.end method


# virtual methods
.method public createThreadFromFactory(Lioio/lib/spi/IOIOConnectionFactory;)Lioio/lib/util/IOIOConnectionManager$Thread;
    .locals 4
    .param p1, "factory"    # Lioio/lib/spi/IOIOConnectionFactory;

    .prologue
    .line 112
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper;->looperProvider_:Lioio/lib/util/IOIOLooperProvider;

    invoke-interface {p1}, Lioio/lib/spi/IOIOConnectionFactory;->getType()Ljava/lang/String;

    move-result-object v2

    .line 113
    invoke-interface {p1}, Lioio/lib/spi/IOIOConnectionFactory;->getExtra()Ljava/lang/Object;

    move-result-object v3

    .line 112
    invoke-interface {v1, v2, v3}, Lioio/lib/util/IOIOLooperProvider;->createIOIOLooper(Ljava/lang/String;Ljava/lang/Object;)Lioio/lib/util/IOIOLooper;

    move-result-object v0

    .line 114
    .local v0, "looper":Lioio/lib/util/IOIOLooper;
    if-nez v0, :cond_0

    .line 115
    const/4 v1, 0x0

    .line 117
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;

    invoke-direct {v1, v0, p1}, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;-><init>(Lioio/lib/util/IOIOLooper;Lioio/lib/spi/IOIOConnectionFactory;)V

    goto :goto_0
.end method
