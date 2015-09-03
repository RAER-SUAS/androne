.class public abstract Lioio/lib/util/android/IOIOActivity;
.super Landroid/app/Activity;
.source "IOIOActivity.java"

# interfaces
.implements Lioio/lib/util/IOIOLooperProvider;


# instance fields
.field private final helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 72
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 74
    new-instance v0, Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    .line 75
    invoke-direct {v0, p0, p0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;-><init>(Landroid/content/ContextWrapper;Lioio/lib/util/IOIOLooperProvider;)V

    iput-object v0, p0, Lioio/lib/util/android/IOIOActivity;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    .line 72
    return-void
.end method


# virtual methods
.method protected createIOIOLooper()Lioio/lib/util/IOIOLooper;
    .locals 2

    .prologue
    .line 139
    new-instance v0, Ljava/lang/RuntimeException;

    .line 140
    const-string v1, "Client must override one of the createIOIOLooper overloads!"

    .line 139
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createIOIOLooper(Ljava/lang/String;Ljava/lang/Object;)Lioio/lib/util/IOIOLooper;
    .locals 1
    .param p1, "connectionType"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;

    .prologue
    .line 145
    invoke-virtual {p0}, Lioio/lib/util/android/IOIOActivity;->createIOIOLooper()Lioio/lib/util/IOIOLooper;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 83
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 84
    iget-object v0, p0, Lioio/lib/util/android/IOIOActivity;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->create()V

    .line 85
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lioio/lib/util/android/IOIOActivity;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->destroy()V

    .line 94
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 95
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 119
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 120
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v0

    const/high16 v1, 0x10000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lioio/lib/util/android/IOIOActivity;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->restart()V

    .line 123
    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 103
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 104
    iget-object v0, p0, Lioio/lib/util/android/IOIOActivity;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->start()V

    .line 105
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lioio/lib/util/android/IOIOActivity;->helper_:Lioio/lib/util/android/IOIOAndroidApplicationHelper;

    invoke-virtual {v0}, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->stop()V

    .line 114
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 115
    return-void
.end method
