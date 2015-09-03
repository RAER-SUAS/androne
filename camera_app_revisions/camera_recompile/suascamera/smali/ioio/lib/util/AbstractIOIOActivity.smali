.class public abstract Lioio/lib/util/AbstractIOIOActivity;
.super Landroid/app/Activity;
.source "AbstractIOIOActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/util/AbstractIOIOActivity$IOIOThread;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AbstractIOIOActivity"


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

.field private currentConnectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;

.field private threads_:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lioio/lib/util/AbstractIOIOActivity$IOIOThread;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 90
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 91
    const-string v2, "ioio.lib.android.accessory.AccessoryConnectionBootstrap"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 92
    const-string v2, "ioio.lib.android.bluetooth.BluetoothIOIOConnectionBootstrap"

    aput-object v2, v0, v1

    .line 90
    invoke-static {v0}, Lioio/lib/util/IOIOConnectionRegistry;->addBootstraps([Ljava/lang/String;)V

    .line 93
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 85
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 95
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lioio/lib/util/AbstractIOIOActivity;->threads_:Ljava/util/Collection;

    .line 97
    invoke-static {}, Lioio/lib/util/IOIOConnectionRegistry;->getBootstraps()Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lioio/lib/util/AbstractIOIOActivity;->bootstraps_:Ljava/util/Collection;

    .line 85
    return-void
.end method

.method private abortAllThreads()V
    .locals 3

    .prologue
    .line 338
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity;->threads_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 341
    return-void

    .line 338
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;

    .line 339
    .local v0, "thread":Lioio/lib/util/AbstractIOIOActivity$IOIOThread;
    invoke-virtual {v0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->abort()V

    goto :goto_0
.end method

.method static synthetic access$0(Lioio/lib/util/AbstractIOIOActivity;)Lioio/lib/spi/IOIOConnectionFactory;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lioio/lib/util/AbstractIOIOActivity;->currentConnectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;

    return-object v0
.end method

.method private createAllThreads()V
    .locals 6

    .prologue
    .line 350
    iget-object v3, p0, Lioio/lib/util/AbstractIOIOActivity;->threads_:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->clear()V

    .line 352
    invoke-static {}, Lioio/lib/util/IOIOConnectionRegistry;->getConnectionFactories()Ljava/util/Collection;

    move-result-object v0

    .line 353
    .local v0, "factories":Ljava/util/Collection;, "Ljava/util/Collection<Lioio/lib/spi/IOIOConnectionFactory;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 361
    return-void

    .line 353
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lioio/lib/spi/IOIOConnectionFactory;

    .line 354
    .local v1, "factory":Lioio/lib/spi/IOIOConnectionFactory;
    iput-object v1, p0, Lioio/lib/util/AbstractIOIOActivity;->currentConnectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;

    .line 355
    invoke-interface {v1}, Lioio/lib/spi/IOIOConnectionFactory;->getType()Ljava/lang/String;

    move-result-object v4

    .line 356
    invoke-interface {v1}, Lioio/lib/spi/IOIOConnectionFactory;->getExtra()Ljava/lang/Object;

    move-result-object v5

    .line 355
    invoke-virtual {p0, v4, v5}, Lioio/lib/util/AbstractIOIOActivity;->createIOIOThread(Ljava/lang/String;Ljava/lang/Object;)Lioio/lib/util/AbstractIOIOActivity$IOIOThread;

    move-result-object v2

    .line 357
    .local v2, "thread":Lioio/lib/util/AbstractIOIOActivity$IOIOThread;
    if-eqz v2, :cond_0

    .line 358
    iget-object v4, p0, Lioio/lib/util/AbstractIOIOActivity;->threads_:Ljava/util/Collection;

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
    .line 344
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity;->threads_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 347
    return-void

    .line 344
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;

    .line 345
    .local v0, "thread":Lioio/lib/util/AbstractIOIOActivity$IOIOThread;
    invoke-virtual {v0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->join()V

    goto :goto_0
.end method

.method private startAllThreads()V
    .locals 3

    .prologue
    .line 364
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity;->threads_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 367
    return-void

    .line 364
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;

    .line 365
    .local v0, "thread":Lioio/lib/util/AbstractIOIOActivity$IOIOThread;
    invoke-virtual {v0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->start()V

    goto :goto_0
.end method


# virtual methods
.method protected createIOIOThread()Lioio/lib/util/AbstractIOIOActivity$IOIOThread;
    .locals 2

    .prologue
    .line 186
    new-instance v0, Ljava/lang/RuntimeException;

    .line 187
    const-string v1, "Client must override on of the createIOIOThread overloads!"

    .line 186
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected createIOIOThread(Ljava/lang/String;Ljava/lang/Object;)Lioio/lib/util/AbstractIOIOActivity$IOIOThread;
    .locals 1
    .param p1, "connectionType"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;

    .prologue
    .line 216
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity;->createIOIOThread()Lioio/lib/util/AbstractIOIOActivity$IOIOThread;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 106
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 107
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 112
    return-void

    .line 107
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 108
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 109
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0, p0}, Lioio/lib/util/android/ContextWrapperDependent;->onCreate(Landroid/content/ContextWrapper;)V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 120
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 125
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 126
    return-void

    .line 120
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 121
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 122
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0}, Lioio/lib/util/android/ContextWrapperDependent;->onDestroy()V

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 165
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 166
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v1

    const/high16 v2, 0x10000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_1

    .line 167
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 173
    :cond_1
    return-void

    .line 167
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 168
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 169
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0}, Lioio/lib/util/android/ContextWrapperDependent;->open()V

    goto :goto_0
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 134
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 135
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 140
    invoke-direct {p0}, Lioio/lib/util/AbstractIOIOActivity;->createAllThreads()V

    .line 141
    invoke-direct {p0}, Lioio/lib/util/AbstractIOIOActivity;->startAllThreads()V

    .line 142
    return-void

    .line 135
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 136
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 137
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0}, Lioio/lib/util/android/ContextWrapperDependent;->open()V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 3

    .prologue
    .line 150
    invoke-direct {p0}, Lioio/lib/util/AbstractIOIOActivity;->abortAllThreads()V

    .line 152
    :try_start_0
    invoke-direct {p0}, Lioio/lib/util/AbstractIOIOActivity;->joinAllThreads()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    :goto_0
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 160
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 161
    return-void

    .line 155
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 156
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    instance-of v2, v0, Lioio/lib/util/android/ContextWrapperDependent;

    if-eqz v2, :cond_0

    .line 157
    check-cast v0, Lioio/lib/util/android/ContextWrapperDependent;

    .end local v0    # "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0}, Lioio/lib/util/android/ContextWrapperDependent;->close()V

    goto :goto_1

    .line 153
    :catch_0
    move-exception v1

    goto :goto_0
.end method
