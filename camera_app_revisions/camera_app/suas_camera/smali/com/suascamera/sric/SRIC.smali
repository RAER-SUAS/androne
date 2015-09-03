.class public Lcom/suascamera/sric/SRIC;
.super Ljava/lang/Thread;
.source "SRIC.java"


# instance fields
.field key:Ljava/lang/String;

.field message:Ljava/lang/String;

.field out:Ljava/io/ByteArrayOutputStream;

.field reconnectNetwork:Ljava/lang/String;

.field remoteDirectory:Ljava/lang/String;

.field remoteFilename:Ljava/lang/String;

.field remoteIP:Ljava/lang/String;

.field sricFile:Ljava/io/File;

.field ssid:Ljava/lang/String;

.field timeoutTime:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 21
    sget-object v0, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "sric_ssid"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/suascamera/sric/SRIC;->ssid:Ljava/lang/String;

    .line 22
    sget-object v0, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "sric_key"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/suascamera/sric/SRIC;->key:Ljava/lang/String;

    .line 24
    sget-object v0, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "sric_remoteip"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/suascamera/sric/SRIC;->remoteIP:Ljava/lang/String;

    .line 26
    sget-object v0, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "sric_remotedir"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/suascamera/sric/SRIC;->remoteDirectory:Ljava/lang/String;

    .line 27
    sget-object v0, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "sric_remotefile"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/suascamera/sric/SRIC;->remoteFilename:Ljava/lang/String;

    .line 29
    sget-object v0, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "sric_reconnectnet"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/suascamera/sric/SRIC;->reconnectNetwork:Ljava/lang/String;

    .line 35
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Lcom/suascamera/app/Backend;->currentDirectory:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "sric.txt"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/suascamera/sric/SRIC;->sricFile:Ljava/io/File;

    .line 38
    const-wide/32 v0, 0xea60

    iput-wide v0, p0, Lcom/suascamera/sric/SRIC;->timeoutTime:J

    .line 42
    return-void
.end method


# virtual methods
.method public run()V
    .locals 28

    .prologue
    .line 46
    sget-object v24, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v25, "Starting SRIC attempt"

    invoke-virtual/range {v24 .. v25}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    .line 49
    .local v22, "startTime":J
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    invoke-virtual/range {v24 .. v24}, Landroid/net/wifi/WifiManager;->disconnect()Z

    .line 50
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    invoke-virtual/range {v24 .. v24}, Landroid/net/wifi/WifiManager;->startScan()Z

    .line 52
    const-wide/16 v24, 0x1388

    :try_start_0
    invoke-static/range {v24 .. v25}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    :goto_0
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .local v19, "scan":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    invoke-virtual/range {v24 .. v24}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v19

    .line 60
    const/16 v21, -0x1

    .line 62
    .local v21, "sric_netID":I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v24

    move/from16 v0, v24

    if-lt v15, v0, :cond_2

    .line 79
    sget-object v24, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v25, "Connected to network"

    invoke-virtual/range {v24 .. v25}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 82
    const/4 v4, 0x1

    .line 83
    .local v4, "b":Z
    const/4 v6, 0x0

    .line 84
    .local v6, "breakCount":I
    :goto_2
    if-eqz v4, :cond_0

    const/16 v24, 0xa

    move/from16 v0, v24

    if-ge v6, v0, :cond_0

    .line 85
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    sub-long v24, v24, v22

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/suascamera/sric/SRIC;->timeoutTime:J

    move-wide/from16 v26, v0

    .line 84
    cmp-long v24, v24, v26

    if-ltz v24, :cond_4

    .line 113
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 114
    .local v11, "endTime":J
    sget-object v24, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v25, Ljava/lang/StringBuilder;

    const-string v26, "File retrieved and took "

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long v26, v11, v22

    invoke-virtual/range {v25 .. v27}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 115
    const-string v26, "ms to complete."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 114
    invoke-virtual/range {v24 .. v25}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 118
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    invoke-virtual/range {v24 .. v24}, Landroid/net/wifi/WifiManager;->disconnect()Z

    .line 119
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    const/16 v25, 0x3

    .line 120
    const-string v26, "WifiHighPerf"

    .line 119
    invoke-virtual/range {v24 .. v26}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    .line 121
    new-instance v19, Ljava/util/ArrayList;

    .end local v19    # "scan":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .restart local v19    # "scan":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    invoke-virtual/range {v24 .. v24}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v19

    .line 123
    const/4 v15, 0x0

    :goto_3
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v24

    move/from16 v0, v24

    if-lt v15, v0, :cond_5

    .line 134
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    move-object/from16 v0, v24

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager;->removeNetwork(I)Z

    .line 136
    sget-object v24, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v25, "Reconnected to Androne"

    invoke-virtual/range {v24 .. v25}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 137
    sget-object v24, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v25, Ljava/lang/StringBuilder;

    const-string v26, "out: "

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->out:Ljava/io/ByteArrayOutputStream;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->out:Ljava/io/ByteArrayOutputStream;

    move-object/from16 v24, v0

    if-eqz v24, :cond_7

    if-nez v4, :cond_7

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->out:Ljava/io/ByteArrayOutputStream;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/suascamera/sric/SRIC;->message:Ljava/lang/String;

    .line 144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->message:Ljava/lang/String;

    move-object/from16 v24, v0

    const-string v25, ""

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_1

    .line 145
    const-string v24, "No message retrieved!"

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/suascamera/sric/SRIC;->message:Ljava/lang/String;

    .line 161
    :cond_1
    :goto_4
    sget-object v24, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v25, Ljava/lang/StringBuilder;

    const-string v26, "Message: "

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->message:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 163
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->message:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->length()I

    move-result v17

    .line 164
    .local v17, "len":I
    const/16 v24, 0x3

    move/from16 v0, v24

    new-array v14, v0, [B

    const/16 v24, 0x0

    const/16 v25, -0x56

    aput-byte v25, v14, v24

    const/16 v24, 0x1

    shr-int/lit8 v25, v17, 0x8

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-byte v0, v0

    move/from16 v25, v0

    aput-byte v25, v14, v24

    const/16 v24, 0x2

    .line 165
    move/from16 v0, v17

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-byte v0, v0

    move/from16 v25, v0

    aput-byte v25, v14, v24

    .line 166
    .local v14, "header":[B
    array-length v0, v14

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->message:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->length()I

    move-result v25

    add-int v24, v24, v25

    move/from16 v0, v24

    new-array v7, v0, [B

    .line 167
    .local v7, "c":[B
    const/16 v24, 0x0

    const/16 v25, 0x0

    array-length v0, v14

    move/from16 v26, v0

    move/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-static {v14, v0, v7, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->message:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->getBytes()[B

    move-result-object v24

    const/16 v25, 0x0

    array-length v0, v14

    move/from16 v26, v0

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->message:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->length()I

    move-result v27

    .line 168
    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    invoke-static {v0, v1, v7, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 170
    sget-object v24, Lcom/suascamera/app/Backend;->altQ:Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 171
    return-void

    .line 53
    .end local v4    # "b":Z
    .end local v6    # "breakCount":I
    .end local v7    # "c":[B
    .end local v11    # "endTime":J
    .end local v14    # "header":[B
    .end local v15    # "i":I
    .end local v17    # "len":I
    .end local v19    # "scan":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    .end local v21    # "sric_netID":I
    :catch_0
    move-exception v10

    .line 54
    .local v10, "e2":Ljava/lang/InterruptedException;
    const-string v24, "SRIC"

    const-string v25, "Error on thread.sleep"

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 63
    .end local v10    # "e2":Ljava/lang/InterruptedException;
    .restart local v15    # "i":I
    .restart local v19    # "scan":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    .restart local v21    # "sric_netID":I
    :cond_2
    move-object/from16 v0, v19

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/net/wifi/ScanResult;

    .line 64
    .local v18, "s":Landroid/net/wifi/ScanResult;
    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->ssid:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_3

    .line 65
    new-instance v20, Landroid/net/wifi/WifiConfiguration;

    invoke-direct/range {v20 .. v20}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 66
    .local v20, "sric":Landroid/net/wifi/WifiConfiguration;
    new-instance v24, Ljava/lang/StringBuilder;

    const-string v25, "\""

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "\""

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    iput-object v0, v1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 67
    const/16 v24, 0x4

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    .line 68
    .local v16, "keys":[Ljava/lang/String;
    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->key:Ljava/lang/String;

    move-object/from16 v25, v0

    aput-object v25, v16, v24

    .line 69
    move-object/from16 v0, v16

    move-object/from16 v1, v20

    iput-object v0, v1, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    .line 70
    const/16 v24, 0x0

    move/from16 v0, v24

    move-object/from16 v1, v20

    iput v0, v1, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    .line 71
    const/16 v24, 0x2

    move/from16 v0, v24

    move-object/from16 v1, v20

    iput v0, v1, Landroid/net/wifi/WifiConfiguration;->status:I

    .line 72
    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Ljava/util/BitSet;->set(I)V

    .line 73
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v21

    .line 74
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    const/16 v25, 0x1

    move-object/from16 v0, v24

    move/from16 v1, v21

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 75
    const-string v24, "SRIC"

    const-string v25, "SRIC found"

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .end local v16    # "keys":[Ljava/lang/String;
    .end local v20    # "sric":Landroid/net/wifi/WifiConfiguration;
    :cond_3
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_1

    .line 87
    .end local v18    # "s":Landroid/net/wifi/ScanResult;
    .restart local v4    # "b":Z
    .restart local v6    # "breakCount":I
    :cond_4
    sget-object v24, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v25, "TRYING TO GRAB FILE"

    invoke-virtual/range {v24 .. v25}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 90
    :try_start_1
    new-instance v13, Lorg/apache/commons/net/ftp/FTPClient;

    invoke-direct {v13}, Lorg/apache/commons/net/ftp/FTPClient;-><init>()V

    .line 91
    .local v13, "ftp":Lorg/apache/commons/net/ftp/FTPClient;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->remoteIP:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Lorg/apache/commons/net/ftp/FTPClient;->connect(Ljava/net/InetAddress;)V

    .line 92
    const-string v24, "anonymous"

    const-string v25, ""

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v13, v0, v1}, Lorg/apache/commons/net/ftp/FTPClient;->login(Ljava/lang/String;Ljava/lang/String;)Z

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->remoteDirectory:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Lorg/apache/commons/net/ftp/FTPClient;->changeWorkingDirectory(Ljava/lang/String;)Z

    .line 94
    const/16 v24, 0x2

    move/from16 v0, v24

    invoke-virtual {v13, v0}, Lorg/apache/commons/net/ftp/FTPClient;->setFileType(I)Z

    .line 95
    new-instance v24, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v24 .. v24}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/suascamera/sric/SRIC;->out:Ljava/io/ByteArrayOutputStream;

    .line 96
    invoke-virtual {v13}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 97
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->remoteFilename:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->out:Ljava/io/ByteArrayOutputStream;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v13, v0, v1}, Lorg/apache/commons/net/ftp/FTPClient;->retrieveFile(Ljava/lang/String;Ljava/io/OutputStream;)Z

    .line 98
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->out:Ljava/io/ByteArrayOutputStream;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 99
    invoke-virtual {v13}, Lorg/apache/commons/net/ftp/FTPClient;->disconnect()V

    .line 100
    const/4 v4, 0x0

    .line 101
    const-string v24, "SRIC"

    invoke-virtual {v13}, Lorg/apache/commons/net/ftp/FTPClient;->getStatus()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 110
    .end local v13    # "ftp":Lorg/apache/commons/net/ftp/FTPClient;
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_2

    .line 102
    :catch_1
    move-exception v8

    .line 103
    .local v8, "e":Ljava/io/IOException;
    const-string v24, "SRIC"

    new-instance v25, Ljava/lang/StringBuilder;

    const-string v26, "Error: "

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    const-wide/16 v24, 0x3e8

    :try_start_2
    invoke-static/range {v24 .. v25}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_5

    .line 106
    :catch_2
    move-exception v9

    .line 107
    .local v9, "e1":Ljava/lang/InterruptedException;
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5

    .line 124
    .end local v8    # "e":Ljava/io/IOException;
    .end local v9    # "e1":Ljava/lang/InterruptedException;
    .restart local v11    # "endTime":J
    :cond_5
    move-object/from16 v0, v19

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/net/wifi/ScanResult;

    .line 125
    .restart local v18    # "s":Landroid/net/wifi/ScanResult;
    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/suascamera/sric/SRIC;->reconnectNetwork:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_6

    .line 126
    new-instance v5, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v5}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 127
    .local v5, "baseNetwork":Landroid/net/wifi/WifiConfiguration;
    new-instance v24, Ljava/lang/StringBuilder;

    const-string v25, "\""

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "\""

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    iput-object v0, v5, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 128
    const/16 v24, 0x2

    move/from16 v0, v24

    iput v0, v5, Landroid/net/wifi/WifiConfiguration;->status:I

    .line 129
    sget-object v24, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    .line 130
    sget-object v25, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v25

    const/16 v26, 0x1

    .line 129
    invoke-virtual/range {v24 .. v26}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 123
    .end local v5    # "baseNetwork":Landroid/net/wifi/WifiConfiguration;
    :cond_6
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_3

    .line 148
    .end local v18    # "s":Landroid/net/wifi/ScanResult;
    :cond_7
    const-string v24, "Could not connect to server =( "

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/suascamera/sric/SRIC;->message:Ljava/lang/String;

    goto/16 :goto_4
.end method
