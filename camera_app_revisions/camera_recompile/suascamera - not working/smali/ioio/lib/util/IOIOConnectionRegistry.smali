.class public Lioio/lib/util/IOIOConnectionRegistry;
.super Ljava/lang/Object;
.source "IOIOConnectionRegistry.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "IOIOConnectionRegistry"

.field private static bootstraps_:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lioio/lib/spi/IOIOConnectionBootstrap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 106
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lioio/lib/util/IOIOConnectionRegistry;->bootstraps_:Ljava/util/Collection;

    .line 107
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addBootstrap(Ljava/lang/String;)V
    .locals 5
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    .line 112
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 113
    const-class v3, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 112
    invoke-virtual {v2, v3}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 114
    .local v0, "bootstrapClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lioio/lib/spi/IOIOConnectionBootstrap;>;"
    sget-object v3, Lioio/lib/util/IOIOConnectionRegistry;->bootstraps_:Ljava/util/Collection;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lioio/lib/spi/IOIOConnectionBootstrap;

    invoke-interface {v3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 115
    const-string v2, "IOIOConnectionRegistry"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Successfully added bootstrap class: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lioio/lib/spi/NoRuntimeSupportException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .line 126
    .end local v0    # "bootstrapClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lioio/lib/spi/IOIOConnectionBootstrap;>;"
    :goto_0
    return-void

    .line 116
    :catch_0
    move-exception v1

    .line 117
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    const-string v2, "IOIOConnectionRegistry"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Bootstrap class not found: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 118
    const-string v4, ". Not adding."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 117
    invoke-static {v2, v3}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 119
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v1

    .line 120
    .local v1, "e":Lioio/lib/spi/NoRuntimeSupportException;
    const-string v2, "IOIOConnectionRegistry"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "No runtime support for: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". Not adding."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 121
    .end local v1    # "e":Lioio/lib/spi/NoRuntimeSupportException;
    :catch_2
    move-exception v1

    .line 122
    .local v1, "e":Ljava/lang/Throwable;
    const-string v2, "IOIOConnectionRegistry"

    .line 123
    const-string v3, "Exception caught while attempting to initialize connection factory"

    .line 122
    invoke-static {v2, v3, v1}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static addBootstraps([Ljava/lang/String;)V
    .locals 3
    .param p0, "classNames"    # [Ljava/lang/String;

    .prologue
    .line 96
    array-length v2, p0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_0

    .line 99
    return-void

    .line 96
    :cond_0
    aget-object v0, p0, v1

    .line 97
    .local v0, "className":Ljava/lang/String;
    invoke-static {v0}, Lioio/lib/util/IOIOConnectionRegistry;->addBootstrap(Ljava/lang/String;)V

    .line 96
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static getBootstraps()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lioio/lib/spi/IOIOConnectionBootstrap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 88
    sget-object v0, Lioio/lib/util/IOIOConnectionRegistry;->bootstraps_:Ljava/util/Collection;

    return-object v0
.end method

.method public static getConnectionFactories()Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lioio/lib/spi/IOIOConnectionFactory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 75
    .local v1, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lioio/lib/spi/IOIOConnectionFactory;>;"
    sget-object v2, Lioio/lib/util/IOIOConnectionRegistry;->bootstraps_:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 78
    return-object v1

    .line 75
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lioio/lib/spi/IOIOConnectionBootstrap;

    .line 76
    .local v0, "bootstrap":Lioio/lib/spi/IOIOConnectionBootstrap;
    invoke-interface {v0, v1}, Lioio/lib/spi/IOIOConnectionBootstrap;->getFactories(Ljava/util/Collection;)V

    goto :goto_0
.end method
