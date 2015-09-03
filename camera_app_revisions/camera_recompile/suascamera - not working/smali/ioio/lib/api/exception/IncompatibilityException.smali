.class public Lioio/lib/api/exception/IncompatibilityException;
.super Ljava/lang/Exception;
.source "IncompatibilityException.java"


# static fields
.field private static final serialVersionUID:J = -0x8852703012b2cd3L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 40
    return-void
.end method
