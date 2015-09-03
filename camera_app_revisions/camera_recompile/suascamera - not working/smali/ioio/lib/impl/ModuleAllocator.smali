.class Lioio/lib/impl/ModuleAllocator;
.super Ljava/lang/Object;
.source "ModuleAllocator.java"


# instance fields
.field private final allocatedModuleIds_:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final availableModuleIds_:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final name_:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "maxModules"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p1}, Lioio/lib/impl/ModuleAllocator;->getList(I)Ljava/util/Collection;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lioio/lib/impl/ModuleAllocator;-><init>(Ljava/util/Collection;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;Ljava/lang/String;)V
    .locals 1
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "availableModuleIds":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0, p1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lioio/lib/impl/ModuleAllocator;->availableModuleIds_:Ljava/util/Set;

    .line 54
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/ModuleAllocator;->allocatedModuleIds_:Ljava/util/Set;

    .line 55
    iput-object p2, p0, Lioio/lib/impl/ModuleAllocator;->name_:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public constructor <init>([ILjava/lang/String;)V
    .locals 1
    .param p1, "availableModuleIds"    # [I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-static {p1}, Lioio/lib/impl/ModuleAllocator;->getList([I)Ljava/util/Collection;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lioio/lib/impl/ModuleAllocator;-><init>(Ljava/util/Collection;Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method private static getList(I)Ljava/util/Collection;
    .locals 3
    .param p0, "maxModules"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .local v0, "availableModuleIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, p0, :cond_0

    .line 71
    return-object v0

    .line 69
    :cond_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static getList([I)Ljava/util/Collection;
    .locals 5
    .param p0, "array"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p0

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 76
    .local v0, "availableModuleIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v3, :cond_0

    .line 79
    return-object v0

    .line 76
    :cond_0
    aget v1, p0, v2

    .line 77
    .local v1, "i":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized allocateModule()Ljava/lang/Integer;
    .locals 4

    .prologue
    .line 86
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/ModuleAllocator;->availableModuleIds_:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    new-instance v1, Lioio/lib/api/exception/OutOfResourceException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "No more resources of the requested type: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lioio/lib/impl/ModuleAllocator;->name_:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lioio/lib/api/exception/OutOfResourceException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 89
    :cond_0
    :try_start_1
    iget-object v1, p0, Lioio/lib/impl/ModuleAllocator;->availableModuleIds_:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 90
    .local v0, "moduleId":Ljava/lang/Integer;
    iget-object v1, p0, Lioio/lib/impl/ModuleAllocator;->availableModuleIds_:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 91
    iget-object v1, p0, Lioio/lib/impl/ModuleAllocator;->allocatedModuleIds_:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized releaseModule(I)V
    .locals 3
    .param p1, "moduleId"    # I

    .prologue
    .line 100
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lioio/lib/impl/ModuleAllocator;->allocatedModuleIds_:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "moduleId: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; not yet allocated"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 103
    :cond_0
    :try_start_1
    iget-object v0, p0, Lioio/lib/impl/ModuleAllocator;->availableModuleIds_:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 104
    iget-object v0, p0, Lioio/lib/impl/ModuleAllocator;->allocatedModuleIds_:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 105
    monitor-exit p0

    return-void
.end method
