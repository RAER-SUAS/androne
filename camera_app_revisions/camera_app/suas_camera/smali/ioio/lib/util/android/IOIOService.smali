.class public abstract Lioio/lib/util/android/IOIOService;
.super Landroid/app/Service;
.source "IOIOService.java"

# interfaces
.implements Lioio/lib/util/IOIOLooperProvider;


# instance fields
.field private final helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

.field private started_:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 73
    new-instance v0, Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    .line 74
    invoke-direct {v0, p0, p0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;-><init>(Landroid/content/ContextWrapper;Lioio/lib/util/IOIOLooperProvider;)V

    iput-object v0, p0, Lioio/lib/util/android/IOIOService;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/util/android/IOIOService;->started_:Z

    .line 71
    return-void
.end method


# virtual methods
.method protected createIOIOLooper()Lioio/lib/util/IOIOLooper;
    .locals 2

    .prologue
    .line 140
    new-instance v0, Ljava/lang/RuntimeException;

    .line 141
    const-string v1, "Client must override one of the createIOIOLooper overloads!"

    .line 140
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createIOIOLooper(Ljava/lang/String;Ljava/lang/Object;)Lioio/lib/util/IOIOLooper;
    .locals 1
    .param p1, "connectionType"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;

    .prologue
    .line 146
    invoke-virtual {p0}, Lioio/lib/util/android/IOIOService;->createIOIOLooper()Lioio/lib/util/IOIOLooper;

    move-result-object v0

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 83
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 84
    iget-object v0, p0, Lioio/lib/util/android/IOIOService;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->create()V

    .line 85
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 93
    invoke-virtual {p0}, Lioio/lib/util/android/IOIOService;->stop()V

    .line 94
    iget-object v0, p0, Lioio/lib/util/android/IOIOService;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->destroy()V

    .line 95
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 96
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I

    .prologue
    .line 104
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 105
    iget-boolean v0, p0, Lioio/lib/util/android/IOIOService;->started_:Z

    if-nez v0, :cond_1

    .line 106
    iget-object v0, p0, Lioio/lib/util/android/IOIOService;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->start()V

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lioio/lib/util/android/IOIOService;->started_:Z

    .line 113
    :cond_0
    :goto_0
    return-void

    .line 109
    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v0

    const/high16 v1, 0x10000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lioio/lib/util/android/IOIOService;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->restart()V

    goto :goto_0
.end method

.method protected stop()V
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lioio/lib/util/android/IOIOService;->started_:Z

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lioio/lib/util/android/IOIOService;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->stop()V

    .line 122
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/util/android/IOIOService;->started_:Z

    .line 124
    :cond_0
    return-void
.end method
