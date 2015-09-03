.class public Lioio/lib/impl/SpiMasterImpl$SpiResult;
.super Ljava/lang/Object;
.source "SpiMasterImpl.java"

# interfaces
.implements Lioio/lib/api/SpiMaster$Result;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/SpiMasterImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SpiResult"
.end annotation


# instance fields
.field final data_:[B

.field ready_:Z

.field final synthetic this$0:Lioio/lib/impl/SpiMasterImpl;


# direct methods
.method constructor <init>(Lioio/lib/impl/SpiMasterImpl;[B)V
    .locals 0
    .param p2, "data"    # [B

    .prologue
    .line 50
    iput-object p1, p0, Lioio/lib/impl/SpiMasterImpl$SpiResult;->this$0:Lioio/lib/impl/SpiMasterImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p2, p0, Lioio/lib/impl/SpiMasterImpl$SpiResult;->data_:[B

    .line 52
    return-void
.end method


# virtual methods
.method public declared-synchronized waitReady()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 57
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lioio/lib/impl/SpiMasterImpl$SpiResult;->ready_:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lioio/lib/impl/SpiMasterImpl$SpiResult;->this$0:Lioio/lib/impl/SpiMasterImpl;

    iget-object v0, v0, Lioio/lib/impl/SpiMasterImpl;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

    if-ne v0, v1, :cond_1

    .line 60
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/SpiMasterImpl$SpiResult;->this$0:Lioio/lib/impl/SpiMasterImpl;

    invoke-virtual {v0}, Lioio/lib/impl/SpiMasterImpl;->checkState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    monitor-exit p0

    return-void

    .line 58
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 57
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
