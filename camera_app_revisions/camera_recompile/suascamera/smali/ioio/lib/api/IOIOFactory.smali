.class public Lioio/lib/api/IOIOFactory;
.super Ljava/lang/Object;
.source "IOIOFactory.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "IOIOFactory"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lioio/lib/api/IOIO;
    .locals 4

    .prologue
    .line 70
    invoke-static {}, Lioio/lib/util/IOIOConnectionRegistry;->getConnectionFactories()Ljava/util/Collection;

    move-result-object v1

    .line 72
    .local v1, "factories":Ljava/util/Collection;, "Ljava/util/Collection<Lioio/lib/spi/IOIOConnectionFactory;>;"
    :try_start_0
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lioio/lib/spi/IOIOConnectionFactory;

    invoke-interface {v2}, Lioio/lib/spi/IOIOConnectionFactory;->createConnection()Lioio/lib/api/IOIOConnection;

    move-result-object v2

    invoke-static {v2}, Lioio/lib/api/IOIOFactory;->create(Lioio/lib/api/IOIOConnection;)Lioio/lib/api/IOIO;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 73
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Ljava/util/NoSuchElementException;
    const-string v2, "IOIOFactory"

    const-string v3, "No connection is available. This shouldn\'t happen."

    invoke-static {v2, v3}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    throw v0
.end method

.method public static create(Lioio/lib/api/IOIOConnection;)Lioio/lib/api/IOIO;
    .locals 1
    .param p0, "connection"    # Lioio/lib/api/IOIOConnection;

    .prologue
    .line 90
    new-instance v0, Lioio/lib/impl/IOIOImpl;

    invoke-direct {v0, p0}, Lioio/lib/impl/IOIOImpl;-><init>(Lioio/lib/api/IOIOConnection;)V

    return-object v0
.end method
