.class public interface abstract Lioio/lib/api/DigitalInput;
.super Ljava/lang/Object;
.source "DigitalInput.java"

# interfaces
.implements Lioio/lib/api/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/api/DigitalInput$Spec;
    }
.end annotation


# virtual methods
.method public abstract read()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method

.method public abstract waitForValue(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method
