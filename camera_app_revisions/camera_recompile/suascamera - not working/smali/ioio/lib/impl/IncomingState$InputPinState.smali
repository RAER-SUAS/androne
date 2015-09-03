.class Lioio/lib/impl/IncomingState$InputPinState;
.super Ljava/lang/Object;
.source "IncomingState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/IncomingState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InputPinState"
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
            "Lioio/lib/impl/IncomingState$InputPinListener;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lioio/lib/impl/IncomingState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    const-class v0, Lioio/lib/impl/IncomingState;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lioio/lib/impl/IncomingState$InputPinState;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lioio/lib/impl/IncomingState;)V
    .locals 1

    .prologue
    .line 63
    iput-object p1, p0, Lioio/lib/impl/IncomingState$InputPinState;->this$0:Lioio/lib/impl/IncomingState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->listeners_:Ljava/util/Queue;

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->currentOpen_:Z

    return-void
.end method


# virtual methods
.method closeCurrentListener()V
    .locals 1

    .prologue
    .line 72
    iget-boolean v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->currentOpen_:Z

    if-eqz v0, :cond_0

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->currentOpen_:Z

    .line 74
    iget-object v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->listeners_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 76
    :cond_0
    return-void
.end method

.method openNextListener()V
    .locals 1

    .prologue
    .line 79
    sget-boolean v0, Lioio/lib/impl/IncomingState$InputPinState;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->listeners_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 80
    :cond_0
    iget-boolean v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->currentOpen_:Z

    if-nez v0, :cond_1

    .line 81
    const/4 v0, 0x1

    iput-boolean v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->currentOpen_:Z

    .line 83
    :cond_1
    return-void
.end method

.method pushListener(Lioio/lib/impl/IncomingState$InputPinListener;)V
    .locals 1
    .param p1, "listener"    # Lioio/lib/impl/IncomingState$InputPinListener;

    .prologue
    .line 68
    iget-object v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->listeners_:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 69
    return-void
.end method

.method setValue(I)V
    .locals 1
    .param p1, "v"    # I

    .prologue
    .line 86
    sget-boolean v0, Lioio/lib/impl/IncomingState$InputPinState;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->currentOpen_:Z

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 87
    :cond_0
    iget-object v0, p0, Lioio/lib/impl/IncomingState$InputPinState;->listeners_:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/impl/IncomingState$InputPinListener;

    invoke-interface {v0, p1}, Lioio/lib/impl/IncomingState$InputPinListener;->setValue(I)V

    .line 88
    return-void
.end method
