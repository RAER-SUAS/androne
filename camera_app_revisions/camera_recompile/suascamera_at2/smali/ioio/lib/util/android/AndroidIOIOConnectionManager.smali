.class public Lioio/lib/util/android/AndroidIOIOConnectionManager;
.super Lioio/lib/util/IOIOConnectionManager;
.source "AndroidIOIOConnectionManager.java"


# instance fields
.field private bootstraps_:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lioio/lib/spi/IOIOConnectionBootstrap;",
            ">;"
        }
    .end annotation
.end field

.field private final contextWrapper_:Landroid/content/ContextWrapper;


# direct methods
.method public constructor <init>(Landroid/content/ContextWrapper;Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;)V
    .locals 1
    .param p1, "wrapper"    # Landroid/content/ContextWrapper;
    .param p2, "provider"    # Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;

    .prologue
    .line 34
    invoke-direct {p0, p2}, Lioio/lib/util/IOIOConnectionManager;-><init>(Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;)V

    .line 30
    invoke-static {}, Lioio/lib/util/IOIOConnectionRegistry;->getBootstraps()Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lioio/lib/util/android/AndroidIOIOConnectionManager;->bootstraps_:Ljava/util/Collection;

    .line 35
    iput-object p1, p0, Lioio/lib/util/android/AndroidIOIOConnectionManager;->contextWrapper_:Landroid/content/ContextWrapper;

    .line 36
    return-void
.end method


# virtual methods
.method public create()V
    .locals 3

    .prologue
    .line 39
    iget-object v1, p0, Lioio/lib/util/android/AndroidIOIOConnectionManager;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 44
    return-void

    .line 39
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 40
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 41
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    iget-object v2, p0, Lioio/lib/util/android/AndroidIOIOConnectionManager;->contextWrapper_:Landroid/content/ContextWrapper;

    invoke-interface {v0, v2}, Lioio/lib/util/android/ContextWrapperDependent;->onCreate(Landroid/content/ContextWrapper;)V

    goto :goto_0
.end method

.method public destroy()V
    .locals 3

    .prologue
    .line 47
    iget-object v1, p0, Lioio/lib/util/android/AndroidIOIOConnectionManager;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 52
    return-void

    .line 47
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 48
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 49
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0}, Lioio/lib/util/android/ContextWrapperDependent;->onDestroy()V

    goto :goto_0
.end method

.method public restart()V
    .locals 3

    .prologue
    .line 75
    iget-object v1, p0, Lioio/lib/util/android/AndroidIOIOConnectionManager;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 80
    return-void

    .line 75
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 76
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 77
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0}, Lioio/lib/util/android/ContextWrapperDependent;->reopen()V

    goto :goto_0
.end method

.method public start()V
    .locals 3

    .prologue
    .line 56
    iget-object v1, p0, Lioio/lib/util/android/AndroidIOIOConnectionManager;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 61
    invoke-super {p0}, Lioio/lib/util/IOIOConnectionManager;->start()V

    .line 62
    return-void

    .line 56
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 57
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 58
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0}, Lioio/lib/util/android/ContextWrapperDependent;->open()V

    goto :goto_0
.end method

.method public stop()V
    .locals 3

    .prologue
    .line 66
    invoke-super {p0}, Lioio/lib/util/IOIOConnectionManager;->stop()V

    .line 67
    iget-object v1, p0, Lioio/lib/util/android/AndroidIOIOConnectionManager;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 72
    return-void

    .line 67
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 68
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 69
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0}, Lioio/lib/util/android/ContextWrapperDependent;->close()V

    goto :goto_0
.end method
