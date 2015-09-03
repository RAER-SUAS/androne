.class public Lioio/lib/util/IOIOConnectionManager;
.super Ljava/lang/Object;
.source "IOIOConnectionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;,
        Lioio/lib/util/IOIOConnectionManager$Thread;
    }
.end annotation


# instance fields
.field private final provider_:Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;

.field private threads_:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lioio/lib/util/IOIOConnectionManager$Thread;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;)V
    .locals 1
    .param p1, "provider"    # Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lioio/lib/util/IOIOConnectionManager;->threads_:Ljava/util/Collection;

    .line 56
    iput-object p1, p0, Lioio/lib/util/IOIOConnectionManager;->provider_:Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;

    .line 57
    return-void
.end method

.method private abortAllThreads()V
    .locals 3

    .prologue
    .line 83
    iget-object v1, p0, Lioio/lib/util/IOIOConnectionManager;->threads_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 86
    return-void

    .line 83
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/util/IOIOConnectionManager$Thread;

    .line 84
    .local v0, "thread":Lioio/lib/util/IOIOConnectionManager$Thread;
    invoke-virtual {v0}, Lioio/lib/util/IOIOConnectionManager$Thread;->abort()V

    goto :goto_0
.end method

.method private createAllThreads()V
    .locals 5

    .prologue
    .line 95
    iget-object v3, p0, Lioio/lib/util/IOIOConnectionManager;->threads_:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->clear()V

    .line 97
    invoke-static {}, Lioio/lib/util/IOIOConnectionRegistry;->getConnectionFactories()Ljava/util/Collection;

    move-result-object v0

    .line 98
    .local v0, "factories":Ljava/util/Collection;, "Ljava/util/Collection<Lioio/lib/spi/IOIOConnectionFactory;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 104
    return-void

    .line 98
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lioio/lib/spi/IOIOConnectionFactory;

    .line 99
    .local v1, "factory":Lioio/lib/spi/IOIOConnectionFactory;
    iget-object v4, p0, Lioio/lib/util/IOIOConnectionManager;->provider_:Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;

    invoke-interface {v4, v1}, Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;->createThreadFromFactory(Lioio/lib/spi/IOIOConnectionFactory;)Lioio/lib/util/IOIOConnectionManager$Thread;

    move-result-object v2

    .line 100
    .local v2, "thread":Lioio/lib/util/IOIOConnectionManager$Thread;
    if-eqz v2, :cond_0

    .line 101
    iget-object v4, p0, Lioio/lib/util/IOIOConnectionManager;->threads_:Ljava/util/Collection;

    invoke-interface {v4, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private joinAllThreads()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v1, p0, Lioio/lib/util/IOIOConnectionManager;->threads_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 92
    return-void

    .line 89
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/util/IOIOConnectionManager$Thread;

    .line 90
    .local v0, "thread":Lioio/lib/util/IOIOConnectionManager$Thread;
    invoke-virtual {v0}, Lioio/lib/util/IOIOConnectionManager$Thread;->join()V

    goto :goto_0
.end method

.method private startAllThreads()V
    .locals 3

    .prologue
    .line 107
    iget-object v1, p0, Lioio/lib/util/IOIOConnectionManager;->threads_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 110
    return-void

    .line 107
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/util/IOIOConnectionManager$Thread;

    .line 108
    .local v0, "thread":Lioio/lib/util/IOIOConnectionManager$Thread;
    invoke-virtual {v0}, Lioio/lib/util/IOIOConnectionManager$Thread;->start()V

    goto :goto_0
.end method


# virtual methods
.method public start()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Lioio/lib/util/IOIOConnectionManager;->createAllThreads()V

    .line 65
    invoke-direct {p0}, Lioio/lib/util/IOIOConnectionManager;->startAllThreads()V

    .line 66
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 69
    invoke-direct {p0}, Lioio/lib/util/IOIOConnectionManager;->abortAllThreads()V

    .line 71
    :try_start_0
    invoke-direct {p0}, Lioio/lib/util/IOIOConnectionManager;->joinAllThreads()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :goto_0
    return-void

    .line 72
    :catch_0
    move-exception v0

    goto :goto_0
.end method
