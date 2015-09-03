.class public interface abstract Lioio/lib/api/DigitalOutput;
.super Ljava/lang/Object;
.source "DigitalOutput.java"

# interfaces
.implements Lioio/lib/api/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/api/DigitalOutput$Spec;
    }
.end annotation


# virtual methods
.method public abstract write(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation
.end method
