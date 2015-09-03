.class public Lioio/lib/impl/SocketIOIOConnectionBootstrap;
.super Ljava/lang/Object;
.source "SocketIOIOConnectionBootstrap.java"

# interfaces
.implements Lioio/lib/spi/IOIOConnectionBootstrap;


# static fields
.field public static final IOIO_PORT:I = 0x11c1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFactories(Ljava/util/Collection;)V
    .locals 1
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
    .line 44
    .local p1, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lioio/lib/spi/IOIOConnectionFactory;>;"
    new-instance v0, Lioio/lib/impl/SocketIOIOConnectionBootstrap$1;

    invoke-direct {v0, p0}, Lioio/lib/impl/SocketIOIOConnectionBootstrap$1;-><init>(Lioio/lib/impl/SocketIOIOConnectionBootstrap;)V

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 62
    return-void
.end method
