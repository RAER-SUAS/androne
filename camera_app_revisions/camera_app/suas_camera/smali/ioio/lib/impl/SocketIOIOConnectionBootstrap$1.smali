.class Lioio/lib/impl/SocketIOIOConnectionBootstrap$1;
.super Ljava/lang/Object;
.source "SocketIOIOConnectionBootstrap.java"

# interfaces
.implements Lioio/lib/spi/IOIOConnectionFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lioio/lib/impl/SocketIOIOConnectionBootstrap;->getFactories(Ljava/util/Collection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private port_:Ljava/lang/Integer;

.field final synthetic this$0:Lioio/lib/impl/SocketIOIOConnectionBootstrap;


# direct methods
.method constructor <init>(Lioio/lib/impl/SocketIOIOConnectionBootstrap;)V
    .locals 2

    .prologue
    .line 1
    iput-object p1, p0, Lioio/lib/impl/SocketIOIOConnectionBootstrap$1;->this$0:Lioio/lib/impl/SocketIOIOConnectionBootstrap;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/lang/Integer;

    const/16 v1, 0x11c1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lioio/lib/impl/SocketIOIOConnectionBootstrap$1;->port_:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public createConnection()Lioio/lib/api/IOIOConnection;
    .locals 2

    .prologue
    .line 59
    new-instance v0, Lioio/lib/impl/SocketIOIOConnection;

    const/16 v1, 0x11c1

    invoke-direct {v0, v1}, Lioio/lib/impl/SocketIOIOConnection;-><init>(I)V

    return-object v0
.end method

.method public getExtra()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lioio/lib/impl/SocketIOIOConnectionBootstrap$1;->port_:Ljava/lang/Integer;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    const-class v0, Lioio/lib/impl/SocketIOIOConnection;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
