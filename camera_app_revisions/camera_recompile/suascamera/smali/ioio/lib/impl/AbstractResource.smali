.class Lioio/lib/impl/AbstractResource;
.super Ljava/lang/Object;
.source "AbstractResource.java"

# interfaces
.implements Lioio/lib/api/Closeable;
.implements Lioio/lib/impl/IncomingState$DisconnectListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/AbstractResource$State;
    }
.end annotation


# instance fields
.field protected final ioio_:Lioio/lib/impl/IOIOImpl;

.field protected state_:Lioio/lib/impl/AbstractResource$State;


# direct methods
.method public constructor <init>(Lioio/lib/impl/IOIOImpl;)V
    .locals 1
    .param p1, "ioio"    # Lioio/lib/impl/IOIOImpl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    sget-object v0, Lioio/lib/impl/AbstractResource$State;->OPEN:Lioio/lib/impl/AbstractResource$State;

    iput-object v0, p0, Lioio/lib/impl/AbstractResource;->state_:Lioio/lib/impl/AbstractResource$State;

    .line 46
    iput-object p1, p0, Lioio/lib/impl/AbstractResource;->ioio_:Lioio/lib/impl/IOIOImpl;

    .line 47
    return-void
.end method


# virtual methods
.method protected declared-synchronized checkState()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 69
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/AbstractResource;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->CLOSED:Lioio/lib/impl/AbstractResource$State;

    if-ne v0, v1, :cond_0

    .line 70
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Trying to use a closed resouce"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 71
    :cond_0
    :try_start_1
    iget-object v0, p0, Lioio/lib/impl/AbstractResource;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

    if-ne v0, v1, :cond_1

    .line 72
    new-instance v0, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 58
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/AbstractResource;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->CLOSED:Lioio/lib/impl/AbstractResource$State;

    if-ne v0, v1, :cond_0

    .line 59
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Trying to use a closed resouce"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 60
    :cond_0
    :try_start_1
    iget-object v0, p0, Lioio/lib/impl/AbstractResource;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

    if-ne v0, v1, :cond_1

    .line 61
    sget-object v0, Lioio/lib/impl/AbstractResource$State;->CLOSED:Lioio/lib/impl/AbstractResource$State;

    iput-object v0, p0, Lioio/lib/impl/AbstractResource;->state_:Lioio/lib/impl/AbstractResource$State;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    :goto_0
    monitor-exit p0

    return-void

    .line 64
    :cond_1
    :try_start_2
    sget-object v0, Lioio/lib/impl/AbstractResource$State;->CLOSED:Lioio/lib/impl/AbstractResource$State;

    iput-object v0, p0, Lioio/lib/impl/AbstractResource;->state_:Lioio/lib/impl/AbstractResource$State;

    .line 65
    iget-object v0, p0, Lioio/lib/impl/AbstractResource;->ioio_:Lioio/lib/impl/IOIOImpl;

    invoke-virtual {v0, p0}, Lioio/lib/impl/IOIOImpl;->removeDisconnectListener(Lioio/lib/impl/IncomingState$DisconnectListener;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized disconnected()V
    .locals 2

    .prologue
    .line 51
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/AbstractResource;->state_:Lioio/lib/impl/AbstractResource$State;

    sget-object v1, Lioio/lib/impl/AbstractResource$State;->CLOSED:Lioio/lib/impl/AbstractResource$State;

    if-eq v0, v1, :cond_0

    .line 52
    sget-object v0, Lioio/lib/impl/AbstractResource$State;->DISCONNECTED:Lioio/lib/impl/AbstractResource$State;

    iput-object v0, p0, Lioio/lib/impl/AbstractResource;->state_:Lioio/lib/impl/AbstractResource$State;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    :cond_0
    monitor-exit p0

    return-void

    .line 51
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
