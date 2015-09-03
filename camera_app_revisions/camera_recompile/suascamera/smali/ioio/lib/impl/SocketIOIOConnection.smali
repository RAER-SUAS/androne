.class public Lioio/lib/impl/SocketIOIOConnection;
.super Ljava/lang/Object;
.source "SocketIOIOConnection.java"

# interfaces
.implements Lioio/lib/api/IOIOConnection;


# static fields
.field private static final TAG:Ljava/lang/String; = "SocketIOIOConnection"


# instance fields
.field private disconnect_:Z

.field private final port_:I

.field private server_:Ljava/net/ServerSocket;

.field private server_owned_by_connect_:Z

.field private socket_:Ljava/net/Socket;

.field private socket_owned_by_connect_:Z


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "port"    # I

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object v0, p0, Lioio/lib/impl/SocketIOIOConnection;->server_:Ljava/net/ServerSocket;

    .line 46
    iput-object v0, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_:Ljava/net/Socket;

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lioio/lib/impl/SocketIOIOConnection;->disconnect_:Z

    .line 48
    iput-boolean v1, p0, Lioio/lib/impl/SocketIOIOConnection;->server_owned_by_connect_:Z

    .line 49
    iput-boolean v1, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_owned_by_connect_:Z

    .line 52
    iput p1, p0, Lioio/lib/impl/SocketIOIOConnection;->port_:I

    .line 53
    return-void
.end method


# virtual methods
.method public canClose()Z
    .locals 1

    .prologue
    .line 143
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized disconnect()V
    .locals 3

    .prologue
    .line 103
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lioio/lib/impl/SocketIOIOConnection;->disconnect_:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 121
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 106
    :cond_1
    :try_start_1
    const-string v1, "SocketIOIOConnection"

    const-string v2, "Client initiated disconnect"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    const/4 v1, 0x1

    iput-boolean v1, p0, Lioio/lib/impl/SocketIOIOConnection;->disconnect_:Z

    .line 108
    iget-boolean v1, p0, Lioio/lib/impl/SocketIOIOConnection;->server_owned_by_connect_:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_2

    .line 110
    :try_start_2
    iget-object v1, p0, Lioio/lib/impl/SocketIOIOConnection;->server_:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 115
    :cond_2
    :goto_1
    :try_start_3
    iget-boolean v1, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_owned_by_connect_:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v1, :cond_0

    .line 117
    :try_start_4
    iget-object v1, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 118
    :catch_0
    move-exception v1

    goto :goto_0

    .line 111
    :catch_1
    move-exception v0

    .line 112
    .local v0, "e1":Ljava/io/IOException;
    :try_start_5
    const-string v1, "SocketIOIOConnection"

    const-string v2, "Unexpected exception"

    invoke-static {v1, v2, v0}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 103
    .end local v0    # "e1":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 126
    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 127
    :catch_0
    move-exception v0

    .line 128
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 135
    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v1, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public waitForConnect()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lioio/lib/api/exception/ConnectionLostException;
        }
    .end annotation

    .prologue
    .line 58
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :try_start_1
    iget-boolean v2, p0, Lioio/lib/impl/SocketIOIOConnection;->disconnect_:Z

    if-eqz v2, :cond_3

    .line 60
    new-instance v2, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v2}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v2

    .line 58
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Ljava/io/IOException;
    monitor-enter p0

    .line 78
    const/4 v2, 0x1

    :try_start_3
    iput-boolean v2, p0, Lioio/lib/impl/SocketIOIOConnection;->disconnect_:Z

    .line 79
    iget-boolean v2, p0, Lioio/lib/impl/SocketIOIOConnection;->server_owned_by_connect_:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lioio/lib/impl/SocketIOIOConnection;->server_:Ljava/net/ServerSocket;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v2, :cond_0

    .line 81
    :try_start_4
    iget-object v2, p0, Lioio/lib/impl/SocketIOIOConnection;->server_:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 86
    :cond_0
    :goto_0
    :try_start_5
    iget-boolean v2, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_owned_by_connect_:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_:Ljava/net/Socket;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v2, :cond_1

    .line 88
    :try_start_6
    iget-object v2, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 93
    :cond_1
    :goto_1
    :try_start_7
    instance-of v2, v0, Ljava/net/SocketException;

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Permission denied"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 94
    const-string v2, "SocketIOIOConnection"

    const-string v3, "Did you forget to declare uses-permission of android.permission.INTERNET?"

    invoke-static {v2, v3}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    :cond_2
    new-instance v2, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v2, v0}, Lioio/lib/api/exception/ConnectionLostException;-><init>(Ljava/lang/Exception;)V

    throw v2

    .line 77
    :catchall_1
    move-exception v2

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw v2

    .line 62
    .end local v0    # "e":Ljava/io/IOException;
    :cond_3
    :try_start_8
    const-string v2, "SocketIOIOConnection"

    const-string v3, "Creating server socket"

    invoke-static {v2, v3}, Lioio/lib/spi/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    new-instance v2, Ljava/net/ServerSocket;

    iget v3, p0, Lioio/lib/impl/SocketIOIOConnection;->port_:I

    invoke-direct {v2, v3}, Ljava/net/ServerSocket;-><init>(I)V

    iput-object v2, p0, Lioio/lib/impl/SocketIOIOConnection;->server_:Ljava/net/ServerSocket;

    .line 64
    const/4 v2, 0x0

    iput-boolean v2, p0, Lioio/lib/impl/SocketIOIOConnection;->server_owned_by_connect_:Z

    .line 58
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 66
    :try_start_9
    const-string v2, "SocketIOIOConnection"

    const-string v3, "Waiting for TCP connection"

    invoke-static {v2, v3}, Lioio/lib/spi/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    iget-object v2, p0, Lioio/lib/impl/SocketIOIOConnection;->server_:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v2

    iput-object v2, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_:Ljava/net/Socket;

    .line 68
    const-string v2, "SocketIOIOConnection"

    const-string v3, "TCP connected"

    invoke-static {v2, v3}, Lioio/lib/spi/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    monitor-enter p0
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0

    .line 70
    :try_start_a
    iget-boolean v2, p0, Lioio/lib/impl/SocketIOIOConnection;->disconnect_:Z

    if-eqz v2, :cond_4

    .line 71
    iget-object v2, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->close()V

    .line 72
    new-instance v2, Lioio/lib/api/exception/ConnectionLostException;

    invoke-direct {v2}, Lioio/lib/api/exception/ConnectionLostException;-><init>()V

    throw v2

    .line 69
    :catchall_2
    move-exception v2

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :try_start_b
    throw v2
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_0

    .line 74
    :cond_4
    const/4 v2, 0x0

    :try_start_c
    iput-boolean v2, p0, Lioio/lib/impl/SocketIOIOConnection;->socket_owned_by_connect_:Z

    .line 69
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 99
    return-void

    .line 82
    .restart local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 83
    .local v1, "e1":Ljava/io/IOException;
    :try_start_d
    const-string v2, "SocketIOIOConnection"

    const-string v3, "Unexpected exception"

    invoke-static {v2, v3, v1}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 89
    .end local v1    # "e1":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 90
    .restart local v1    # "e1":Ljava/io/IOException;
    const-string v2, "SocketIOIOConnection"

    const-string v3, "Unexpected exception"

    invoke-static {v2, v3, v1}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    goto :goto_1
.end method
