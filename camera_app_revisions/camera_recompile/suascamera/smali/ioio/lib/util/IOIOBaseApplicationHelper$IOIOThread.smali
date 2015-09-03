.class public Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;
.super Lioio/lib/util/IOIOConnectionManager$Thread;
.source "IOIOBaseApplicationHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/util/IOIOBaseApplicationHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "IOIOThread"
.end annotation


# instance fields
.field private abort_:Z

.field private connected_:Z

.field private final connectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;

.field protected ioio_:Lioio/lib/api/IOIO;

.field private final looper_:Lioio/lib/util/IOIOLooper;


# direct methods
.method constructor <init>(Lioio/lib/util/IOIOLooper;Lioio/lib/spi/IOIOConnectionFactory;)V
    .locals 1
    .param p1, "looper"    # Lioio/lib/util/IOIOLooper;
    .param p2, "factory"    # Lioio/lib/spi/IOIOConnectionFactory;

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0}, Lioio/lib/util/IOIOConnectionManager$Thread;-><init>()V

    .line 25
    iput-boolean v0, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->abort_:Z

    .line 26
    iput-boolean v0, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    .line 31
    iput-object p1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    .line 32
    iput-object p2, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;

    .line 33
    return-void
.end method


# virtual methods
.method public final declared-synchronized abort()V
    .locals 1

    .prologue
    .line 100
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->abort_:Z

    .line 101
    iget-object v0, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v0}, Lioio/lib/api/IOIO;->disconnect()V

    .line 104
    :cond_0
    iget-boolean v0, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    if-eqz v0, :cond_1

    .line 105
    invoke-virtual {p0}, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->interrupt()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    :cond_1
    monitor-exit p0

    return-void

    .line 100
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 42
    invoke-super {p0}, Lioio/lib/util/IOIOConnectionManager$Thread;->run()V

    .line 43
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->abort_:Z

    if-eqz v1, :cond_2

    .line 90
    :cond_1
    :goto_1
    const-string v1, "IOIOBaseApplicationHelper"

    const-string v2, "IOIOThread is exiting"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    :goto_2
    return-void

    .line 45
    :cond_2
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :try_start_1
    iget-boolean v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->abort_:Z

    if-eqz v1, :cond_3

    .line 47
    monitor-exit p0

    goto :goto_1

    .line 45
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 52
    :catch_0
    move-exception v0

    .line 53
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "IOIOBaseApplicationHelper"

    const-string v2, "Failed to create IOIO, aborting IOIOThread!"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 49
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    :try_start_3
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;

    .line 50
    invoke-interface {v1}, Lioio/lib/spi/IOIOConnectionFactory;->createConnection()Lioio/lib/api/IOIOConnection;

    move-result-object v1

    .line 49
    invoke-static {v1}, Lioio/lib/api/IOIOFactory;->create(Lioio/lib/api/IOIOConnection;)Lioio/lib/api/IOIO;

    move-result-object v1

    iput-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 45
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 58
    :try_start_4
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForConnect()V

    .line 59
    const/4 v1, 0x1

    iput-boolean v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    .line 60
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    iget-object v2, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1, v2}, Lioio/lib/util/IOIOLooper;->setup(Lioio/lib/api/IOIO;)V

    .line 61
    :goto_3
    iget-boolean v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->abort_:Z

    if-nez v1, :cond_4

    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->getState()Lioio/lib/api/IOIO$State;

    move-result-object v1

    sget-object v2, Lioio/lib/api/IOIO$State;->CONNECTED:Lioio/lib/api/IOIO$State;
    :try_end_4
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Lioio/lib/api/exception/IncompatibilityException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    if-eq v1, v2, :cond_5

    .line 78
    :cond_4
    :try_start_5
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_5

    .line 81
    :goto_4
    monitor-enter p0

    .line 82
    const/4 v1, 0x0

    :try_start_6
    iput-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 81
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_7

    .line 84
    iget-boolean v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    if-eqz v1, :cond_0

    .line 85
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    invoke-interface {v1}, Lioio/lib/util/IOIOLooper;->disconnected()V

    .line 86
    iput-boolean v3, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    goto :goto_0

    .line 62
    :cond_5
    :try_start_7
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    invoke-interface {v1}, Lioio/lib/util/IOIOLooper;->loop()V
    :try_end_7
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Lioio/lib/api/exception/IncompatibilityException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    goto :goto_3

    .line 64
    :catch_1
    move-exception v1

    .line 78
    :try_start_8
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_a

    .line 81
    :goto_5
    monitor-enter p0

    .line 82
    const/4 v1, 0x0

    :try_start_9
    iput-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 81
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 84
    iget-boolean v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    if-eqz v1, :cond_0

    .line 85
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    invoke-interface {v1}, Lioio/lib/util/IOIOLooper;->disconnected()V

    .line 86
    iput-boolean v3, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    goto :goto_0

    .line 81
    :catchall_1
    move-exception v1

    :try_start_a
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    throw v1

    .line 65
    :catch_2
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_b
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->disconnect()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 78
    :try_start_c
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_9

    .line 81
    :goto_6
    monitor-enter p0

    .line 82
    const/4 v1, 0x0

    :try_start_d
    iput-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 81
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 84
    iget-boolean v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    if-eqz v1, :cond_0

    .line 85
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    invoke-interface {v1}, Lioio/lib/util/IOIOLooper;->disconnected()V

    .line 86
    iput-boolean v3, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    goto/16 :goto_0

    .line 81
    :catchall_2
    move-exception v1

    :try_start_e
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    throw v1

    .line 67
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_3
    move-exception v0

    .line 68
    .local v0, "e":Lioio/lib/api/exception/IncompatibilityException;
    :try_start_f
    const-string v1, "IOIOBaseApplicationHelper"

    const-string v2, "Incompatible IOIO firmware"

    invoke-static {v1, v2, v0}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 69
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    invoke-interface {v1}, Lioio/lib/util/IOIOLooper;->incompatible()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 78
    :try_start_10
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_10 .. :try_end_10} :catch_8

    .line 81
    :goto_7
    monitor-enter p0

    .line 82
    const/4 v1, 0x0

    :try_start_11
    iput-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 81
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    .line 84
    iget-boolean v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    if-eqz v1, :cond_0

    .line 85
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    invoke-interface {v1}, Lioio/lib/util/IOIOLooper;->disconnected()V

    .line 86
    iput-boolean v3, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    goto/16 :goto_0

    .line 81
    :catchall_3
    move-exception v1

    :try_start_12
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    throw v1

    .line 72
    .end local v0    # "e":Lioio/lib/api/exception/IncompatibilityException;
    :catch_4
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/Exception;
    :try_start_13
    const-string v1, "IOIOBaseApplicationHelper"

    const-string v2, "Unexpected exception caught"

    invoke-static {v1, v2, v0}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->disconnect()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    .line 78
    :try_start_14
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_14
    .catch Ljava/lang/InterruptedException; {:try_start_14 .. :try_end_14} :catch_7

    .line 81
    :goto_8
    monitor-enter p0

    .line 82
    const/4 v1, 0x0

    :try_start_15
    iput-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 81
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_4

    .line 84
    iget-boolean v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    if-eqz v1, :cond_1

    .line 85
    iget-object v1, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    invoke-interface {v1}, Lioio/lib/util/IOIOLooper;->disconnected()V

    .line 86
    iput-boolean v3, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    goto/16 :goto_1

    .line 81
    :catchall_4
    move-exception v1

    :try_start_16
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_4

    throw v1

    .line 76
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_5
    move-exception v1

    .line 78
    :try_start_17
    iget-object v2, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v2}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_17
    .catch Ljava/lang/InterruptedException; {:try_start_17 .. :try_end_17} :catch_6

    .line 81
    :goto_9
    monitor-enter p0

    .line 82
    const/4 v2, 0x0

    :try_start_18
    iput-object v2, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 81
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_6

    .line 84
    iget-boolean v2, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    if-eqz v2, :cond_6

    .line 85
    iget-object v2, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->looper_:Lioio/lib/util/IOIOLooper;

    invoke-interface {v2}, Lioio/lib/util/IOIOLooper;->disconnected()V

    .line 86
    iput-boolean v3, p0, Lioio/lib/util/IOIOBaseApplicationHelper$IOIOThread;->connected_:Z

    .line 88
    :cond_6
    throw v1

    .line 81
    :catchall_6
    move-exception v1

    :try_start_19
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_6

    throw v1

    :catchall_7
    move-exception v1

    :try_start_1a
    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_7

    throw v1

    .line 79
    :catch_5
    move-exception v1

    goto/16 :goto_4

    :catch_6
    move-exception v2

    goto :goto_9

    .restart local v0    # "e":Ljava/lang/Exception;
    :catch_7
    move-exception v1

    goto :goto_8

    .local v0, "e":Lioio/lib/api/exception/IncompatibilityException;
    :catch_8
    move-exception v1

    goto :goto_7

    .local v0, "e":Ljava/lang/InterruptedException;
    :catch_9
    move-exception v1

    goto/16 :goto_6

    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_a
    move-exception v1

    goto/16 :goto_5
.end method
