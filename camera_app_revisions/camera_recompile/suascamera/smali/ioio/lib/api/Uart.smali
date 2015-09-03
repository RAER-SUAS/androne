.class public interface abstract Lioio/lib/api/Uart;
.super Ljava/lang/Object;
.source "Uart.java"

# interfaces
.implements Lioio/lib/api/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/api/Uart$Parity;,
        Lioio/lib/api/Uart$StopBits;
    }
.end annotation


# virtual methods
.method public abstract getInputStream()Ljava/io/InputStream;
.end method

.method public abstract getOutputStream()Ljava/io/OutputStream;
.end method
