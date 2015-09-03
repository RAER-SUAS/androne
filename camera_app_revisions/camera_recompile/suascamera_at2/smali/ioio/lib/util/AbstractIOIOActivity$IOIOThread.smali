.class public abstract Lioio/lib/util/AbstractIOIOActivity$IOIOThread;
.super Ljava/lang/Thread;
.source "AbstractIOIOActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/util/AbstractIOIOActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "IOIOThread"
.end annotation


# instance fields
.field private abort_:Z

.field private connected_:Z

.field private final connectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;

.field protected ioio_:Lioio/lib/api/IOIO;

.field final synthetic this$0:Lioio/lib/util/AbstractIOIOActivity;


# direct methods
.method protected constructor <init>(Lioio/lib/util/AbstractIOIOActivity;)V
    .locals 1

    .prologue
    .line 223
    iput-object p1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->this$0:Lioio/lib/util/AbstractIOIOActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 226
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->abort_:Z

    .line 227
    const/4 v0, 0x1

    iput-boolean v0, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    .line 228
    # getter for: Lioio/lib/util/AbstractIOIOActivity;->currentConnectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;
    invoke-static {p1}, Lioio/lib/util/AbstractIOIOActivity;->access$0(Lioio/lib/util/AbstractIOIOActivity;)Lioio/lib/spi/IOIOConnectionFactory;

    move-result-object v0

    iput-object v0, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;

    return-void
.end method


# virtual methods
.method public final declared-synchronized abort()V
    .locals 1

    .prologue
    .line 327
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->abort_:Z

    .line 328
    iget-object v0, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v0}, Lioio/lib/api/IOIO;->disconnect()V

    .line 331
    :cond_0
    iget-boolean v0, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    if-eqz v0, :cond_1

    .line 332
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->interrupt()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 334
    :cond_1
    monitor-exit p0

    return-void

    .line 327
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected disconnected()V
    .locals 0

    .prologue
    .line 260
    return-void
.end method

.method protected incompatible()V
    .locals 0

    .prologue
    .line 270
    return-void
.end method

.method protected loop()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 248
    const-wide/32 v0, 0x186a0

    invoke-static {v0, v1}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->sleep(J)V

    .line 249
    return-void
.end method

.method public final run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 275
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 276
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->abort_:Z

    if-eqz v1, :cond_2

    .line 322
    :cond_1
    :goto_1
    const-string v1, "AbstractIOIOActivity"

    const-string v2, "IOIOThread is exiting"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    :goto_2
    return-void

    .line 278
    :cond_2
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    :try_start_1
    iget-boolean v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->abort_:Z

    if-eqz v1, :cond_3

    .line 280
    monitor-exit p0

    goto :goto_1

    .line 278
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 285
    :catch_0
    move-exception v0

    .line 286
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AbstractIOIOActivity"

    const-string v2, "Failed to create IOIO, aborting IOIOThread!"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 282
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    :try_start_3
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connectionFactory_:Lioio/lib/spi/IOIOConnectionFactory;

    .line 283
    invoke-interface {v1}, Lioio/lib/spi/IOIOConnectionFactory;->createConnection()Lioio/lib/api/IOIOConnection;

    move-result-object v1

    .line 282
    invoke-static {v1}, Lioio/lib/api/IOIOFactory;->create(Lioio/lib/api/IOIOConnection;)Lioio/lib/api/IOIO;

    move-result-object v1

    iput-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 278
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 291
    :try_start_4
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForConnect()V

    .line 292
    const/4 v1, 0x1

    iput-boolean v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    .line 293
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->setup()V

    .line 294
    :goto_3
    iget-boolean v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->abort_:Z
    :try_end_4
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Lioio/lib/api/exception/IncompatibilityException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    if-eqz v1, :cond_4

    .line 310
    :try_start_5
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_5

    .line 313
    :goto_4
    monitor-enter p0

    .line 314
    const/4 v1, 0x0

    :try_start_6
    iput-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 313
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_7

    .line 316
    iget-boolean v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    if-eqz v1, :cond_0

    .line 317
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->disconnected()V

    .line 318
    iput-boolean v3, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    goto :goto_0

    .line 295
    :cond_4
    :try_start_7
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->loop()V
    :try_end_7
    .catch Lioio/lib/api/exception/ConnectionLostException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Lioio/lib/api/exception/IncompatibilityException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    goto :goto_3

    .line 297
    :catch_1
    move-exception v1

    .line 310
    :try_start_8
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_a

    .line 313
    :goto_5
    monitor-enter p0

    .line 314
    const/4 v1, 0x0

    :try_start_9
    iput-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 313
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 316
    iget-boolean v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    if-eqz v1, :cond_0

    .line 317
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->disconnected()V

    .line 318
    iput-boolean v3, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    goto :goto_0

    .line 313
    :catchall_1
    move-exception v1

    :try_start_a
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    throw v1

    .line 298
    :catch_2
    move-exception v0

    .line 299
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_b
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->disconnect()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 310
    :try_start_c
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_9

    .line 313
    :goto_6
    monitor-enter p0

    .line 314
    const/4 v1, 0x0

    :try_start_d
    iput-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 313
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 316
    iget-boolean v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    if-eqz v1, :cond_0

    .line 317
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->disconnected()V

    .line 318
    iput-boolean v3, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    goto/16 :goto_0

    .line 313
    :catchall_2
    move-exception v1

    :try_start_e
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    throw v1

    .line 300
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_3
    move-exception v0

    .line 301
    .local v0, "e":Lioio/lib/api/exception/IncompatibilityException;
    :try_start_f
    const-string v1, "AbstractIOIOActivity"

    const-string v2, "Incompatible IOIO firmware"

    invoke-static {v1, v2, v0}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 302
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->incompatible()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 310
    :try_start_10
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_10 .. :try_end_10} :catch_8

    .line 313
    :goto_7
    monitor-enter p0

    .line 314
    const/4 v1, 0x0

    :try_start_11
    iput-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 313
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    .line 316
    iget-boolean v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    if-eqz v1, :cond_0

    .line 317
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->disconnected()V

    .line 318
    iput-boolean v3, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    goto/16 :goto_0

    .line 313
    :catchall_3
    move-exception v1

    :try_start_12
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    throw v1

    .line 304
    .end local v0    # "e":Lioio/lib/api/exception/IncompatibilityException;
    :catch_4
    move-exception v0

    .line 305
    .local v0, "e":Ljava/lang/Exception;
    :try_start_13
    const-string v1, "AbstractIOIOActivity"

    const-string v2, "Unexpected exception caught"

    invoke-static {v1, v2, v0}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 306
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->disconnect()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    .line 310
    :try_start_14
    iget-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v1}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_14
    .catch Ljava/lang/InterruptedException; {:try_start_14 .. :try_end_14} :catch_7

    .line 313
    :goto_8
    monitor-enter p0

    .line 314
    const/4 v1, 0x0

    :try_start_15
    iput-object v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 313
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_4

    .line 316
    iget-boolean v1, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    if-eqz v1, :cond_1

    .line 317
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->disconnected()V

    .line 318
    iput-boolean v3, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    goto/16 :goto_1

    .line 313
    :catchall_4
    move-exception v1

    :try_start_16
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_4

    throw v1

    .line 308
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_5
    move-exception v1

    .line 310
    :try_start_17
    iget-object v2, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    invoke-interface {v2}, Lioio/lib/api/IOIO;->waitForDisconnect()V
    :try_end_17
    .catch Ljava/lang/InterruptedException; {:try_start_17 .. :try_end_17} :catch_6

    .line 313
    :goto_9
    monitor-enter p0

    .line 314
    const/4 v2, 0x0

    :try_start_18
    iput-object v2, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->ioio_:Lioio/lib/api/IOIO;

    .line 313
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_6

    .line 316
    iget-boolean v2, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    if-eqz v2, :cond_5

    .line 317
    invoke-virtual {p0}, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->disconnected()V

    .line 318
    iput-boolean v3, p0, Lioio/lib/util/AbstractIOIOActivity$IOIOThread;->connected_:Z

    .line 320
    :cond_5
    throw v1

    .line 313
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

    .line 311
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

    goto :goto_6

    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_a
    move-exception v1

    goto/16 :goto_5
.end method

.method protected setup()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 238
    return-void
.end method
