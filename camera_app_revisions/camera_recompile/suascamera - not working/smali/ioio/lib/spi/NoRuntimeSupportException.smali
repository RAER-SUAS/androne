.class public Lioio/lib/spi/NoRuntimeSupportException;
.super Ljava/lang/RuntimeException;
.source "NoRuntimeSupportException.java"


# static fields
.field private static final serialVersionUID:J = -0x5b06fd870778188aL


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 8
    return-void
.end method
