.class Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap$1;
.super Ljava/lang/Object;
.source "BluetoothIOIOConnectionBootstrap.java"

# interfaces
.implements Lioio/lib/spi/IOIOConnectionFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap;->getFactories(Ljava/util/Collection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap;

.field private final synthetic val$device:Landroid/bluetooth/BluetoothDevice;


# direct methods
.method constructor <init>(Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap;Landroid/bluetooth/BluetoothDevice;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap$1;->this$0:Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap;

    iput-object p2, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap$1;->val$device:Landroid/bluetooth/BluetoothDevice;

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createConnection()Lioio/lib/api/IOIOConnection;
    .locals 2

    .prologue
    .line 83
    new-instance v0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;

    iget-object v1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap$1;->val$device:Landroid/bluetooth/BluetoothDevice;

    invoke-direct {v0, v1}, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;-><init>(Landroid/bluetooth/BluetoothDevice;)V

    return-object v0
.end method

.method public getExtra()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 77
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap$1;->val$device:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 78
    iget-object v2, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnectionBootstrap$1;->val$device:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 77
    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    const-class v0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;

    .line 72
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    .line 71
    return-object v0
.end method
