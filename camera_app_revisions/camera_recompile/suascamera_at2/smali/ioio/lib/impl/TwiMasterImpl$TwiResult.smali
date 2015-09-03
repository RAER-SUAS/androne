.class Lioio/lib/impl/TwiMasterImpl$TwiResult;
.super Ljava/lang/Object;
.source "TwiMasterImpl.java"

# interfaces
.implements Lioio/lib/api/TwiMaster$Result;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/TwiMasterImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TwiResult"
.end annotation


# instance fields
.field final data_:[B

.field ready_:Z

.field success_:Z

.field final synthetic this$0:Lioio/lib/impl/TwiMasterImpl;


# direct methods
.method public constructor <init>(Lioio/lib/impl/TwiMasterImpl;[B)V
    .locals 1
    .param p2, "data"    # [B

    .prologue
    .line 49
    iput-object p1, p0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->this$0:Lioio/lib/impl/TwiMasterImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->ready_:Z

    .line 50
    iput-object p2, p0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->data_:[B

    .line 51
    return-void
.end method


# virtual methods
.method public declared-synchronized waitReady()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 56
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->ready_:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->this$0:Lioio/lib/impl/TwiMasterImpl;

    iget-object v0, v0, Lioio/lib/impl/TwiMasterImpl;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

    if-ne v0, v1, :cond_1

    .line 59
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->this$0:Lioio/lib/impl/TwiMasterImpl;

    invoke-virtual {v0}, Lioio/lib/impl/TwiMasterImpl;->checkState()V

    .line 60
    iget-boolean v0, p0, Lioio/lib/impl/TwiMasterImpl$TwiResult;->success_:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 57
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 56
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
