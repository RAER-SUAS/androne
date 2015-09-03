.class public Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap;
.super Ljava/lang/Object;
.source "BluetoothIOIOConnectionBootstrap.java"

# interfaces
.implements Lioio/lib/spi/IOIOConnectionBootstrap;


# static fields
.field private static final TAG:Ljava/lang/String; = "BluetoothIOIOConnectionDiscovery"


# instance fields
.field private final adapter_:Landroid/bluetooth/BluetoothAdapter;


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/spi/NoRuntimeSupportException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    :try_start_0
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap;->adapter_:Landroid/bluetooth/BluetoothAdapter;

    .line 53
    iget-object v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap;->adapter_:Landroid/bluetooth/BluetoothAdapter;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    .line 54
    return-void

    .line 56
    :catch_0
    move-exception v0

    .line 58
    :cond_0
    new-instance v0, Lioio/lib/spi/NoRuntimeSupportException;

    .line 59
    const-string v1, "Bluetooth is not supported on this device."

    .line 58
    invoke-direct {v0, v1}, Lioio/lib/spi/NoRuntimeSupportException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getFactories(Ljava/util/Collection;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lioio/lib/spi/IOIOConnectionFactory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p1, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lioio/lib/spi/IOIOConnectionFactory;>;"
    :try_start_0
    iget-object v3, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap;->adapter_:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v0

    .line 66
    .local v0, "bondedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 95
    .end local v0    # "bondedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    :goto_1
    return-void

    .line 66
    .restart local v0    # "bondedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 67
    .local v1, "device":Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "IOIO"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 68
    new-instance v4, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap$1;

    invoke-direct {v4, p0, v1}, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap$1;-><init>(Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap;Landroid/bluetooth/BluetoothDevice;)V

    invoke-interface {p1, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 88
    .end local v0    # "bondedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    .end local v1    # "device":Landroid/bluetooth/BluetoothDevice;
    :catch_0
    move-exception v2

    .line 89
    .local v2, "e":Ljava/lang/SecurityException;
    const-string v3, "BluetoothIOIOConnectionDiscovery"

    .line 90
    const-string v4, "Did you forget to declare uses-permission of android.permission.BLUETOOTH?"

    .line 89
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    throw v2

    .line 92
    .end local v2    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v2

    .line 93
    .local v2, "e":Ljava/lang/NoClassDefFoundError;
    const-string v3, "BluetoothIOIOConnectionDiscovery"

    const-string v4, "Bluetooth is not supported on this device."

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method
