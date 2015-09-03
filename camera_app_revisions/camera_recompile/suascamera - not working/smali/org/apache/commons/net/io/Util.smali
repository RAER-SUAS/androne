.class public final Lorg/apache/commons/net/io/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field public static final DEFAULT_COPY_BUFFER_SIZE:I = 0x400


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .locals 1
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 352
    if-eqz p0, :cond_0

    .line 354
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 358
    :cond_0
    :goto_0
    return-void

    .line 355
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static closeQuietly(Ljava/net/Socket;)V
    .locals 1
    .param p0, "socket"    # Ljava/net/Socket;

    .prologue
    .line 368
    if-eqz p0, :cond_0

    .line 370
    :try_start_0
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 374
    :cond_0
    :goto_0
    return-void

    .line 371
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static final copyReader(Ljava/io/Reader;Ljava/io/Writer;)J
    .locals 2
    .param p0, "source"    # Ljava/io/Reader;
    .param p1, "dest"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 341
    const/16 v0, 0x400

    invoke-static {p0, p1, v0}, Lorg/apache/commons/net/io/Util;->copyReader(Ljava/io/Reader;Ljava/io/Writer;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyReader(Ljava/io/Reader;Ljava/io/Writer;I)J
    .locals 6
    .param p0, "source"    # Ljava/io/Reader;
    .param p1, "dest"    # Ljava/io/Writer;
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 330
    const-wide/16 v3, -0x1

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/net/io/Util;->copyReader(Ljava/io/Reader;Ljava/io/Writer;IJLorg/apache/commons/net/io/CopyStreamListener;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyReader(Ljava/io/Reader;Ljava/io/Writer;IJLorg/apache/commons/net/io/CopyStreamListener;)J
    .locals 8
    .param p0, "source"    # Ljava/io/Reader;
    .param p1, "dest"    # Ljava/io/Writer;
    .param p2, "bufferSize"    # I
    .param p3, "streamSize"    # J
    .param p5, "listener"    # Lorg/apache/commons/net/io/CopyStreamListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 263
    const-wide/16 v1, 0x0

    .line 264
    .local v1, "total":J
    if-ltz p2, :cond_2

    .end local p2    # "bufferSize":I
    :goto_0
    new-array v6, p2, [C

    .line 268
    .local v6, "buffer":[C
    :cond_0
    :goto_1
    :try_start_0
    invoke-virtual {p0, v6}, Ljava/io/Reader;->read([C)I

    move-result v3

    .local v3, "chars":I
    const/4 v0, -0x1

    if-eq v3, v0, :cond_1

    .line 272
    if-nez v3, :cond_4

    .line 274
    invoke-virtual {p0}, Ljava/io/Reader;->read()I

    move-result v3

    .line 275
    if-gez v3, :cond_3

    .line 301
    :cond_1
    return-wide v1

    .line 264
    .end local v3    # "chars":I
    .end local v6    # "buffer":[C
    .restart local p2    # "bufferSize":I
    :cond_2
    const/16 p2, 0x400

    goto :goto_0

    .line 278
    .end local p2    # "bufferSize":I
    .restart local v3    # "chars":I
    .restart local v6    # "buffer":[C
    :cond_3
    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 279
    invoke-virtual {p1}, Ljava/io/Writer;->flush()V

    .line 280
    const-wide/16 v4, 0x1

    add-long/2addr v1, v4

    .line 281
    if-eqz p5, :cond_0

    move-object v0, p5

    move-wide v4, p3

    .line 282
    invoke-interface/range {v0 .. v5}, Lorg/apache/commons/net/io/CopyStreamListener;->bytesTransferred(JIJ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 295
    .end local v3    # "chars":I
    :catch_0
    move-exception v7

    .line 297
    .local v7, "e":Ljava/io/IOException;
    new-instance v0, Lorg/apache/commons/net/io/CopyStreamException;

    const-string v4, "IOException caught while copying."

    invoke-direct {v0, v4, v1, v2, v7}, Lorg/apache/commons/net/io/CopyStreamException;-><init>(Ljava/lang/String;JLjava/io/IOException;)V

    throw v0

    .line 287
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v3    # "chars":I
    :cond_4
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p1, v6, v0, v3}, Ljava/io/Writer;->write([CII)V

    .line 288
    invoke-virtual {p1}, Ljava/io/Writer;->flush()V

    .line 289
    int-to-long v4, v3

    add-long/2addr v1, v4

    .line 290
    if-eqz p5, :cond_0

    move-object v0, p5

    move-wide v4, p3

    .line 291
    invoke-interface/range {v0 .. v5}, Lorg/apache/commons/net/io/CopyStreamListener;->bytesTransferred(JIJ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public static final copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .locals 2
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "dest"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 221
    const/16 v0, 0x400

    invoke-static {p0, p1, v0}, Lorg/apache/commons/net/io/Util;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;I)J
    .locals 6
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "dest"    # Ljava/io/OutputStream;
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 210
    const-wide/16 v3, -0x1

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/net/io/Util;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;IJLorg/apache/commons/net/io/CopyStreamListener;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;IJLorg/apache/commons/net/io/CopyStreamListener;)J
    .locals 7
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "dest"    # Ljava/io/OutputStream;
    .param p2, "bufferSize"    # I
    .param p3, "streamSize"    # J
    .param p5, "listener"    # Lorg/apache/commons/net/io/CopyStreamListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 179
    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/net/io/Util;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;IJLorg/apache/commons/net/io/CopyStreamListener;Z)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;IJLorg/apache/commons/net/io/CopyStreamListener;Z)J
    .locals 8
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "dest"    # Ljava/io/OutputStream;
    .param p2, "bufferSize"    # I
    .param p3, "streamSize"    # J
    .param p5, "listener"    # Lorg/apache/commons/net/io/CopyStreamListener;
    .param p6, "flush"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 95
    const-wide/16 v1, 0x0

    .line 96
    .local v1, "total":J
    if-ltz p2, :cond_2

    .end local p2    # "bufferSize":I
    :goto_0
    new-array v6, p2, [B

    .line 100
    .local v6, "buffer":[B
    :cond_0
    :goto_1
    :try_start_0
    invoke-virtual {p0, v6}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "bytes":I
    const/4 v0, -0x1

    if-eq v3, v0, :cond_1

    .line 105
    if-nez v3, :cond_5

    .line 107
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 108
    if-gez v3, :cond_3

    .line 138
    :cond_1
    return-wide v1

    .line 96
    .end local v3    # "bytes":I
    .end local v6    # "buffer":[B
    .restart local p2    # "bufferSize":I
    :cond_2
    const/16 p2, 0x400

    goto :goto_0

    .line 111
    .end local p2    # "bufferSize":I
    .restart local v3    # "bytes":I
    .restart local v6    # "buffer":[B
    :cond_3
    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write(I)V

    .line 112
    if-eqz p6, :cond_4

    .line 113
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 115
    :cond_4
    const-wide/16 v4, 0x1

    add-long/2addr v1, v4

    .line 116
    if-eqz p5, :cond_0

    .line 117
    const/4 v3, 0x1

    move-object v0, p5

    move-wide v4, p3

    invoke-interface/range {v0 .. v5}, Lorg/apache/commons/net/io/CopyStreamListener;->bytesTransferred(JIJ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 132
    .end local v3    # "bytes":I
    :catch_0
    move-exception v7

    .line 134
    .local v7, "e":Ljava/io/IOException;
    new-instance v0, Lorg/apache/commons/net/io/CopyStreamException;

    const-string v4, "IOException caught while copying."

    invoke-direct {v0, v4, v1, v2, v7}, Lorg/apache/commons/net/io/CopyStreamException;-><init>(Ljava/lang/String;JLjava/io/IOException;)V

    throw v0

    .line 122
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v3    # "bytes":I
    :cond_5
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p1, v6, v0, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 123
    if-eqz p6, :cond_6

    .line 124
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 126
    :cond_6
    int-to-long v4, v3

    add-long/2addr v1, v4

    .line 127
    if-eqz p5, :cond_0

    move-object v0, p5

    move-wide v4, p3

    .line 128
    invoke-interface/range {v0 .. v5}, Lorg/apache/commons/net/io/CopyStreamListener;->bytesTransferred(JIJ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
