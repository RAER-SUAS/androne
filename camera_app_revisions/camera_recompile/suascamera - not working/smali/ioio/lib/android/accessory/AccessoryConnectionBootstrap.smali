.class public Lioio/lib/android/accessory/AccessoryConnectionBootstrap;
.super Landroid/content/BroadcastReceiver;
.source "AccessoryConnectionBootstrap.java"

# interfaces
.implements Lioio/lib/spi/IOIOConnectionBootstrap;
.implements Lioio/lib/spi/IOIOConnectionFactory;
.implements Lioio/lib/util/android/ContextWrapperDependent;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;,
        Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;,
        Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;
    }
.end annotation


# static fields
.field private static final ACTION_USB_PERMISSION:Ljava/lang/String; = "ioio.lib.accessory.action.USB_PERMISSION"

.field private static final TAG:Ljava/lang/String; = "AccessoryIOIOConnection"


# instance fields
.field private accessory_:Lcom/android/future/usb/UsbAccessory;

.field private activity_:Landroid/content/ContextWrapper;

.field private fileDescriptor_:Landroid/os/ParcelFileDescriptor;

.field private inputStream_:Ljava/io/FileInputStream;

.field private outputStream_:Ljava/io/FileOutputStream;

.field private pendingIntent_:Landroid/app/PendingIntent;

.field private state_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

.field private usbManager_:Lcom/android/future/usb/UsbManager;


# direct methods
.method public constructor <init>()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/spi/NoRuntimeSupportException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 75
    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->CLOSED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    iput-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->state_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    .line 83
    :try_start_0
    const-string v1, "com.android.future.usb.UsbManager"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    return-void

    .line 84
    :catch_0
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Lioio/lib/spi/NoRuntimeSupportException;

    .line 86
    const-string v2, "Accessory is not supported on this device."

    .line 85
    invoke-direct {v1, v2}, Lioio/lib/spi/NoRuntimeSupportException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic access$0(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;)Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->state_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    return-object v0
.end method

.method static synthetic access$1(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;)Ljava/io/FileInputStream;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->inputStream_:Ljava/io/FileInputStream;

    return-object v0
.end method

.method static synthetic access$2(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;)Ljava/io/FileOutputStream;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->outputStream_:Ljava/io/FileOutputStream;

    return-object v0
.end method

.method private closeStreams()V
    .locals 3

    .prologue
    .line 173
    :try_start_0
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->fileDescriptor_:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    :goto_0
    return-void

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "AccessoryIOIOConnection"

    const-string v2, "Failed to proprly close accessory"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private openStreams()V
    .locals 4

    .prologue
    .line 156
    :try_start_0
    iget-object v2, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->usbManager_:Lcom/android/future/usb/UsbManager;

    iget-object v3, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->accessory_:Lcom/android/future/usb/UsbAccessory;

    invoke-virtual {v2, v3}, Lcom/android/future/usb/UsbManager;->openAccessory(Lcom/android/future/usb/UsbAccessory;)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    iput-object v2, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->fileDescriptor_:Landroid/os/ParcelFileDescriptor;

    .line 157
    iget-object v2, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->fileDescriptor_:Landroid/os/ParcelFileDescriptor;

    if-eqz v2, :cond_0

    .line 158
    iget-object v2, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->fileDescriptor_:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    .line 159
    .local v1, "fd":Ljava/io/FileDescriptor;
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    iput-object v2, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->inputStream_:Ljava/io/FileInputStream;

    .line 160
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    iput-object v2, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->outputStream_:Ljava/io/FileOutputStream;

    .line 161
    sget-object v2, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->OPEN:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    invoke-direct {p0, v2}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->setState(Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;)V

    .line 169
    .end local v1    # "fd":Ljava/io/FileDescriptor;
    :goto_0
    return-void

    .line 163
    :cond_0
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Failed to open file descriptor"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    :catch_0
    move-exception v0

    .line 166
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "AccessoryIOIOConnection"

    const-string v3, "Failed to open streams"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 167
    sget-object v2, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->CLOSED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    invoke-direct {p0, v2}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->setState(Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;)V

    goto :goto_0
.end method

.method private registerReceiver()V
    .locals 2

    .prologue
    .line 144
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "ioio.lib.accessory.action.USB_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 145
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.hardware.usb.action.USB_ACCESSORY_DETACHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 147
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->activity_:Landroid/content/ContextWrapper;

    invoke-virtual {v1, p0, v0}, Landroid/content/ContextWrapper;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 148
    return-void
.end method

.method private setState(Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;)V
    .locals 0
    .param p1, "state"    # Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    .prologue
    .line 199
    iput-object p1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->state_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    .line 200
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 201
    return-void
.end method

.method private unregisterReceiver()V
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->activity_:Landroid/content/ContextWrapper;

    invoke-virtual {v0, p0}, Landroid/content/ContextWrapper;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 152
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 130
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->state_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->OPEN:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    if-ne v0, v1, :cond_1

    .line 131
    invoke-direct {p0}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->closeStreams()V

    .line 135
    :cond_0
    :goto_0
    sget-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->CLOSED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    invoke-direct {p0, v0}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->setState(Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    monitor-exit p0

    return-void

    .line 132
    :cond_1
    :try_start_1
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->state_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->WAIT_PERMISSION:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    if-ne v0, v1, :cond_0

    .line 133
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->pendingIntent_:Landroid/app/PendingIntent;

    invoke-virtual {v0}, Landroid/app/PendingIntent;->cancel()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 130
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public createConnection()Lioio/lib/api/IOIOConnection;
    .locals 2

    .prologue
    .line 140
    new-instance v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;-><init>(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;)V

    return-object v0
.end method

.method public getExtra()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 303
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFactories(Ljava/util/Collection;)V
    .locals 0
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
    .line 293
    .local p1, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lioio/lib/spi/IOIOConnectionFactory;>;"
    invoke-interface {p1, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 294
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 298
    const-class v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onCreate(Landroid/content/ContextWrapper;)V
    .locals 1
    .param p1, "wrapper"    # Landroid/content/ContextWrapper;

    .prologue
    .line 92
    iput-object p1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->activity_:Landroid/content/ContextWrapper;

    .line 93
    invoke-static {p1}, Lcom/android/future/usb/UsbManager;->getInstance(Landroid/content/Context;)Lcom/android/future/usb/UsbManager;

    move-result-object v0

    iput-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->usbManager_:Lcom/android/future/usb/UsbManager;

    .line 94
    invoke-direct {p0}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->registerReceiver()V

    .line 95
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 99
    invoke-direct {p0}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->unregisterReceiver()V

    .line 100
    return-void
.end method

.method public declared-synchronized onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 181
    monitor-enter p0

    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 182
    .local v0, "action":Ljava/lang/String;
    const-string v1, "android.hardware.usb.action.USB_ACCESSORY_DETACHED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 183
    invoke-virtual {p0}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 187
    :cond_1
    :try_start_1
    const-string v1, "ioio.lib.accessory.action.USB_PERMISSION"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 188
    const-string v1, "permission"

    .line 189
    const/4 v2, 0x0

    .line 188
    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 189
    if-eqz v1, :cond_2

    .line 190
    invoke-direct {p0}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->openStreams()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 181
    .end local v0    # "action":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 192
    .restart local v0    # "action":Ljava/lang/String;
    :cond_2
    :try_start_2
    const-string v1, "AccessoryIOIOConnection"

    const-string v2, "Permission denied"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->CLOSED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    invoke-direct {p0, v1}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->setState(Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized open()V
    .locals 5

    .prologue
    .line 104
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->state_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    sget-object v2, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->CLOSED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq v1, v2, :cond_0

    .line 121
    :goto_0
    monitor-exit p0

    return-void

    .line 107
    :cond_0
    :try_start_1
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->usbManager_:Lcom/android/future/usb/UsbManager;

    invoke-virtual {v1}, Lcom/android/future/usb/UsbManager;->getAccessoryList()[Lcom/android/future/usb/UsbAccessory;

    move-result-object v0

    .line 108
    .local v0, "accessories":[Lcom/android/future/usb/UsbAccessory;
    if-nez v0, :cond_1

    const/4 v1, 0x0

    :goto_1
    iput-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->accessory_:Lcom/android/future/usb/UsbAccessory;

    .line 109
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->accessory_:Lcom/android/future/usb/UsbAccessory;

    if-eqz v1, :cond_3

    .line 110
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->usbManager_:Lcom/android/future/usb/UsbManager;

    iget-object v2, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->accessory_:Lcom/android/future/usb/UsbAccessory;

    invoke-virtual {v1, v2}, Lcom/android/future/usb/UsbManager;->hasPermission(Lcom/android/future/usb/UsbAccessory;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 111
    invoke-direct {p0}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->openStreams()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 104
    .end local v0    # "accessories":[Lcom/android/future/usb/UsbAccessory;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 108
    .restart local v0    # "accessories":[Lcom/android/future/usb/UsbAccessory;
    :cond_1
    const/4 v1, 0x0

    :try_start_2
    aget-object v1, v0, v1

    goto :goto_1

    .line 113
    :cond_2
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->activity_:Landroid/content/ContextWrapper;

    const/4 v2, 0x0

    .line 114
    new-instance v3, Landroid/content/Intent;

    const-string v4, "ioio.lib.accessory.action.USB_PERMISSION"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    .line 113
    invoke-static {v1, v2, v3, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    iput-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->pendingIntent_:Landroid/app/PendingIntent;

    .line 115
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->usbManager_:Lcom/android/future/usb/UsbManager;

    iget-object v2, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->accessory_:Lcom/android/future/usb/UsbAccessory;

    iget-object v3, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->pendingIntent_:Landroid/app/PendingIntent;

    invoke-virtual {v1, v2, v3}, Lcom/android/future/usb/UsbManager;->requestPermission(Lcom/android/future/usb/UsbAccessory;Landroid/app/PendingIntent;)V

    .line 116
    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->WAIT_PERMISSION:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    invoke-direct {p0, v1}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->setState(Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;)V

    goto :goto_0

    .line 119
    :cond_3
    const-string v1, "AccessoryIOIOConnection"

    const-string v2, "No accessory found."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public reopen()V
    .locals 0

    .prologue
    .line 125
    invoke-virtual {p0}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->open()V

    .line 126
    return-void
.end method
