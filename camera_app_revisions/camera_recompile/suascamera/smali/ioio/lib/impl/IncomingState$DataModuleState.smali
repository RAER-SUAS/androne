.class Lioio/lib/impl/IncomingState$DataModuleState;
.super Ljava/lang/Object;
.source "IncomingState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/IncomingState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DataModuleState"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private currentOpen_:Z

.field private listeners_:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lioio/lib/impl/IncomingState$DataModuleListener;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lioio/lib/impl/IncomingState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 91
    const-class v0, Lioio/lib/impl/IncomingState;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lioio/lib/impl/IncomingState$DataModuleState;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lioio/lib/impl/IncomingState;)V
    .locals 1

    .prologue
    .line 91
    iput-object p1, p0, Lioio/lib/impl/IncomingState$DataModuleState;->this$0:Lioio/lib/impl/IncomingState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->listeners_:Ljava/util/Queue;

    .line 93
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->currentOpen_:Z

    return-void
.end method


# virtual methods
.method closeCurrentListener()V
    .locals 1

    .prologue
    .line 100
    iget-boolean v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->currentOpen_:Z

    if-eqz v0, :cond_0

    .line 101
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->currentOpen_:Z

    .line 102
    iget-object v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->listeners_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 104
    :cond_0
    return-void
.end method

.method dataReceived([BI)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    .line 114
    sget-boolean v0, Lioio/lib/impl/IncomingState$DataModuleState;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->currentOpen_:Z

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 115
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->listeners_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/IncomingState$DataModuleListener;

    invoke-interface {v0, p1, p2}, Lioio/lib/impl/IncomingState$DataModuleListener;->dataReceived([BI)V

    .line 116
    return-void
.end method

.method openNextListener()V
    .locals 1

    .prologue
    .line 107
    sget-boolean v0, Lioio/lib/impl/IncomingState$DataModuleState;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->listeners_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 108
    :cond_0
    iget-boolean v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->currentOpen_:Z

    if-nez v0, :cond_1

    .line 109
    const/4 v0, 0x1

    iput-boolean v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->currentOpen_:Z

    .line 111
    :cond_1
    return-void
.end method

.method pushListener(Lioio/lib/impl/IncomingState$DataModuleListener;)V
    .locals 1
    .param p1, "listener"    # Lioio/lib/impl/IncomingState$DataModuleListener;

    .prologue
    .line 96
    iget-object v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->listeners_:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 97
    return-void
.end method

.method public reportAdditionalBuffer(I)V
    .locals 1
    .param p1, "bytesRemaining"    # I

    .prologue
    .line 119
    sget-boolean v0, Lioio/lib/impl/IncomingState$DataModuleState;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->currentOpen_:Z

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 120
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/IncomingState$DataModuleState;->listeners_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/IncomingState$DataModuleListener;

    invoke-interface {v0, p1}, Lioio/lib/impl/IncomingState$DataModuleListener;->reportAdditionalBuffer(I)V

    .line 121
    return-void
.end method
