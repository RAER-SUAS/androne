.class public Lioio/lib/api/exception/OutOfResourceException;
.super Ljava/lang/RuntimeException;
.source "OutOfResourceException.java"


# static fields
.field private static final serialVersionUID:J = -0x3e3569b797addb2bL


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 13
    return-void
.end method
