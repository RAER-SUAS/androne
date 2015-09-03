.class public Lioio/lib/util/android/IOIOAndroidApplicationHelper;
.super Lioio/lib/util/IOIOBaseApplicationHelper;
.source "IOIOAndroidApplicationHelper.java"


# instance fields
.field private final manager_:Lioio/lib/util/android/AndroidIOIOConnectionManager;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 72
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 73
    const-string v2, "ioio.lib.impl.SocketIOIOConnectionBootstrap"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 74
    const-string v2, "ioio.lib.android.accessory.AccessoryConnectionBootstrap"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 75
    const-string v2, "ioio.lib.android.bluetooth.BluetoothIOIOConnectionBootstrap"

    aput-object v2, v0, v1

    .line 72
    invoke-static {v0}, Lioio/lib/util/IOIOConnectionRegistry;->addBootstraps([Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Landroid/content/ContextWrapper;Lioio/lib/util/IOIOLooperProvider;)V
    .locals 1
    .param p1, "wrapper"    # Landroid/content/ContextWrapper;
    .param p2, "provider"    # Lioio/lib/util/IOIOLooperProvider;

    .prologue
    .line 66
    invoke-direct {p0, p2}, Lioio/lib/util/IOIOBaseApplicationHelper;-><init>(Lioio/lib/util/IOIOLooperProvider;)V

    .line 67
    new-instance v0, Lioio/lib/util/android/AndroidIOIOConnectionManager;

    invoke-direct {v0, p1, p0}, Lioio/lib/util/android/AndroidIOIOConnectionManager;-><init>(Landroid/content/ContextWrapper;Lioio/lib/util/IOIOConnectionManager$IOIOConnectionThreadProvider;)V

    iput-object v0, p0, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->manager_:Lioio/lib/util/android/AndroidIOIOConnectionManager;

    .line 68
    return-void
.end method


# virtual methods
.method public create()V
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->manager_:Lioio/lib/util/android/AndroidIOIOConnectionManager;

    invoke-virtual {v0}, Lioio/lib/util/android/AndroidIOIOConnectionManager;->create()V

    .line 80
    return-void
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->manager_:Lioio/lib/util/android/AndroidIOIOConnectionManager;

    invoke-virtual {v0}, Lioio/lib/util/android/AndroidIOIOConnectionManager;->destroy()V

    .line 84
    return-void
.end method

.method public restart()V
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->manager_:Lioio/lib/util/android/AndroidIOIOConnectionManager;

    invoke-virtual {v0}, Lioio/lib/util/android/AndroidIOIOConnectionManager;->restart()V

    .line 96
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->manager_:Lioio/lib/util/android/AndroidIOIOConnectionManager;

    invoke-virtual {v0}, Lioio/lib/util/android/AndroidIOIOConnectionManager;->start()V

    .line 88
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lioio/lib/util/android/IOIOAndroidApplicationHelper;->manager_:Lioio/lib/util/android/AndroidIOIOConnectionManager;

    invoke-virtual {v0}, Lioio/lib/util/android/AndroidIOIOConnectionManager;->stop()V

    .line 92
    return-void
.end method
