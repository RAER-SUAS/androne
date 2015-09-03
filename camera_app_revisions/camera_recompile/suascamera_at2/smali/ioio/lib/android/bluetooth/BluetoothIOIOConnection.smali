.class public Lioio/lib/android/bluetooth/BluetoothIOIOConnection;
.super Ljava/lang/Object;
.source "BluetoothIOIOConnection.java"

# interfaces
.implements Lioio/lib/api/IOIOConnection;


# static fields
.field private static final TAG:Ljava/lang/String; = "BluetoothIOIOConnection"


# instance fields
.field private final address_:Ljava/lang/String;

.field private final device_:Landroid/bluetooth/BluetoothDevice;

.field private disconnect_:Z

.field private final name_:Ljava/lang/String;

.field private socket_:Landroid/bluetooth/BluetoothSocket;


# direct methods
.method public constructor <init>(Landroid/bluetooth/BluetoothDevice;)V
    .locals 1
    .param p1, "device"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->socket_:Landroid/bluetooth/BluetoothSocket;

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->disconnect_:Z

    .line 54
    iput-object p1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->device_:Landroid/bluetooth/BluetoothDevice;

    .line 55
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->name_:Ljava/lang/String;

    .line 56
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->address_:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public static createSocket(Landroid/bluetooth/BluetoothDevice;)Landroid/bluetooth/BluetoothSocket;
    .locals 2
    .param p0, "device"    # Landroid/bluetooth/BluetoothDevice;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-lt v0, v1, :cond_0

    .line 98
    const-string v0, "00001101-0000-1000-8000-00805F9B34FB"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    .line 97
    invoke-virtual {p0, v0}, Landroid/bluetooth/BluetoothDevice;->createInsecureRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    .line 100
    :goto_0
    return-object v0

    .line 101
    :cond_0
    const-string v0, "00001101-0000-1000-8000-00805F9B34FB"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    .line 100
    invoke-virtual {p0, v0}, Landroid/bluetooth/BluetoothDevice;->createRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public canClose()Z
    .locals 1

    .prologue
    .line 140
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized disconnect()V
    .locals 2

    .prologue
    .line 107
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->disconnect_:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    .line 118
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 110
    :cond_1
    :try_start_1
    const-string v0, "BluetoothIOIOConnection"

    const-string v1, "Client initiated disconnect"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const/4 v0, 0x1

    iput-boolean v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->disconnect_:Z

    .line 112
    iget-object v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->socket_:Landroid/bluetooth/BluetoothSocket;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_0

    .line 114
    :try_start_2
    iget-object v0, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->socket_:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 115
    :catch_0
    move-exception v0

    goto :goto_0

    .line 107
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 123
    :try_start_0
    iget-object v1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->socket_:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 132
    :try_start_0
    iget-object v1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->socket_:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public waitForConnect()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 61
    monitor-enter p0

    .line 62
    :try_start_0
    iget-boolean v1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->disconnect_:Z

    if-eqz v1, :cond_0

    .line 63
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v1

    .line 61
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 66
    :cond_0
    :try_start_1
    iget-object v1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->device_:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v1}, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->createSocket(Landroid/bluetooth/BluetoothDevice;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v1

    iput-object v1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->socket_:Landroid/bluetooth/BluetoothSocket;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    :goto_0
    :try_start_3
    const-string v1, "BluetoothIOIOConnection"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Attempting to connect to Bluetooth device: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->name_:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    iget-object v1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->socket_:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->connect()V

    .line 76
    const-string v1, "BluetoothIOIOConnection"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Established connection to device "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->name_:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 77
    const-string v3, " address: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->address_:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 76
    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 89
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/io/IOException;
    :try_start_4
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 79
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    iget-boolean v1, p0, Lioio/lib/android/bluetooth/BluetoothIOIOConnection;->disconnect_:Z

    if-eqz v1, :cond_1

    .line 81
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1

    .line 84
    :cond_1
    const-wide/16 v1, 0x3e8

    :try_start_5
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_0

    .line 85
    :catch_2
    move-exception v1

    goto :goto_0
.end method
