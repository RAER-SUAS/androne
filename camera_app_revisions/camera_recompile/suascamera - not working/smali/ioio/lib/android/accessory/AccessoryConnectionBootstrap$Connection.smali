.class Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;
.super Ljava/lang/Object;
.source "AccessoryConnectionBootstrap.java"

# interfaces
.implements Lioio/lib/api/IOIOConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/android/accessory/AccessoryConnectionBootstrap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Connection"
.end annotation


# instance fields
.field private instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

.field private localInputStream_:Ljava/io/InputStream;

.field private localOutputStream_:Ljava/io/OutputStream;

.field final synthetic this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;


# direct methods
.method private constructor <init>(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;)V
    .locals 1

    .prologue
    .line 203
    iput-object p1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 204
    sget-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->INIT:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    iput-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    return-void
.end method

.method synthetic constructor <init>(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;)V
    .locals 0

    .prologue
    .line 203
    invoke-direct {p0, p1}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;-><init>(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;)V

    return-void
.end method

.method private trySleep(J)V
    .locals 2
    .param p1, "time"    # J

    .prologue
    .line 282
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    monitor-enter v1

    .line 284
    :try_start_0
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    invoke-virtual {v0, p1, p2}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    :goto_0
    :try_start_1
    monitor-exit v1

    .line 288
    return-void

    .line 282
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 285
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public canClose()Z
    .locals 1

    .prologue
    .line 220
    const/4 v0, 0x0

    return v0
.end method

.method public disconnect()V
    .locals 2

    .prologue
    .line 275
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    monitor-enter v1

    .line 276
    :try_start_0
    sget-object v0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->DEAD:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    iput-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    .line 277
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 275
    monitor-exit v1

    .line 279
    return-void

    .line 275
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 210
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->localInputStream_:Ljava/io/InputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 215
    iget-object v0, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->localOutputStream_:Ljava/io/OutputStream;

    return-object v0
.end method

.method public waitForConnect()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x3e8

    .line 225
    iget-object v2, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    monitor-enter v2

    .line 226
    :try_start_0
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    sget-object v3, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->INIT:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    if-eq v1, v3, :cond_1

    .line 227
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 228
    const-string v3, "waitForConnect() may only be called once"

    .line 227
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 225
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 233
    :cond_0
    :try_start_1
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 230
    :cond_1
    :goto_0
    :try_start_2
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    sget-object v3, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->DEAD:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    if-eq v1, v3, :cond_2

    .line 231
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    # getter for: Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->state_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;
    invoke-static {v1}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->access$0(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;)Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    move-result-object v1

    sget-object v3, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->OPEN:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    if-ne v1, v3, :cond_0

    .line 237
    :cond_2
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    sget-object v3, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->DEAD:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    if-ne v1, v3, :cond_3

    .line 238
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v1

    .line 240
    :cond_3
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    # getter for: Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->inputStream_:Ljava/io/FileInputStream;
    invoke-static {v1}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->access$1(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;)Ljava/io/FileInputStream;

    move-result-object v1

    iput-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->localInputStream_:Ljava/io/InputStream;

    .line 241
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    # getter for: Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->outputStream_:Ljava/io/FileOutputStream;
    invoke-static {v1}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->access$2(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;)Ljava/io/FileOutputStream;

    move-result-object v1

    iput-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->localOutputStream_:Ljava/io/OutputStream;

    .line 225
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 244
    :goto_1
    :try_start_3
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    sget-object v2, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->CONNECTED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    if-ne v1, v2, :cond_4

    .line 271
    return-void

    .line 245
    :cond_4
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    sget-object v2, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->DEAD:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    if-eq v1, v2, :cond_5

    .line 246
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->this$0:Lioio/lib/android/accessory/AccessoryConnectionBootstrap;

    # getter for: Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->state_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;
    invoke-static {v1}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap;->access$0(Lioio/lib/android/accessory/AccessoryConnectionBootstrap;)Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    move-result-object v1

    sget-object v2, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;->OPEN:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$State;

    if-eq v1, v2, :cond_6

    .line 247
    :cond_5
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v1
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 262
    :catch_0
    move-exception v0

    .line 263
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->DEAD:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    iput-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    .line 268
    invoke-direct {p0, v4, v5}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->trySleep(J)V

    .line 269
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v1

    .line 250
    .end local v0    # "e":Ljava/io/IOException;
    :cond_6
    :try_start_4
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->localOutputStream_:Ljava/io/OutputStream;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write(I)V

    .line 256
    iget-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->localInputStream_:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_7

    .line 257
    sget-object v1, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;->CONNECTED:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    iput-object v1, p0, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->instanceState_:Lioio/lib/android/accessory/AccessoryConnectionBootstrap$InstanceState;

    goto :goto_1

    .line 259
    :cond_7
    const-wide/16 v1, 0x3e8

    invoke-direct {p0, v1, v2}, Lioio/lib/android/accessory/AccessoryConnectionBootstrap$Connection;->trySleep(J)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 234
    :catch_1
    move-exception v1

    goto :goto_0
.end method
