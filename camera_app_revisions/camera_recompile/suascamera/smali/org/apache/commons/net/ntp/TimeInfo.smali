.class public Lorg/apache/commons/net/ntp/TimeInfo;
.super Ljava/lang/Object;
.source "TimeInfo.java"


# instance fields
.field private _comments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _delay:Ljava/lang/Long;

.field private _detailsComputed:Z

.field private final _message:Lorg/apache/commons/net/ntp/NtpV3Packet;

.field private _offset:Ljava/lang/Long;

.field private final _returnTime:J


# direct methods
.method public constructor <init>(Lorg/apache/commons/net/ntp/NtpV3Packet;J)V
    .locals 6
    .param p1, "message"    # Lorg/apache/commons/net/ntp/NtpV3Packet;
    .param p2, "returnTime"    # J

    .prologue
    .line 56
    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/ntp/TimeInfo;-><init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;Z)V

    .line 57
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;)V
    .locals 6
    .param p1, "message"    # Lorg/apache/commons/net/ntp/NtpV3Packet;
    .param p2, "returnTime"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/net/ntp/NtpV3Packet;",
            "J",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p4, "comments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/ntp/TimeInfo;-><init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;Z)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;Z)V
    .locals 2
    .param p1, "message"    # Lorg/apache/commons/net/ntp/NtpV3Packet;
    .param p2, "returnTime"    # J
    .param p5, "doComputeDetails"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/net/ntp/NtpV3Packet;",
            "J",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p4, "comments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    if-nez p1, :cond_0

    .line 104
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "message cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_0
    iput-wide p2, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_returnTime:J

    .line 107
    iput-object p1, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    .line 108
    iput-object p4, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    .line 109
    if-eqz p5, :cond_1

    .line 110
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/TimeInfo;->computeDetails()V

    .line 112
    :cond_1
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JZ)V
    .locals 6
    .param p1, "msgPacket"    # Lorg/apache/commons/net/ntp/NtpV3Packet;
    .param p2, "returnTime"    # J
    .param p4, "doComputeDetails"    # Z

    .prologue
    .line 85
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/ntp/TimeInfo;-><init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;Z)V

    .line 86
    return-void
.end method


# virtual methods
.method public addComment(Ljava/lang/String;)V
    .locals 1
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    if-nez v0, :cond_0

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    .line 126
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    return-void
.end method

.method public computeDetails()V
    .locals 19

    .prologue
    .line 135
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_detailsComputed:Z

    if-eqz v15, :cond_1

    .line 245
    :cond_0
    :goto_0
    return-void

    .line 138
    :cond_1
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_detailsComputed:Z

    .line 139
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    if-nez v15, :cond_2

    .line 140
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    .line 143
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    invoke-interface {v15}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getOriginateTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v6

    .line 144
    .local v6, "origNtpTime":Lorg/apache/commons/net/ntp/TimeStamp;
    invoke-virtual {v6}, Lorg/apache/commons/net/ntp/TimeStamp;->getTime()J

    move-result-wide v7

    .line 147
    .local v7, "origTime":J
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    invoke-interface {v15}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getReceiveTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v9

    .line 148
    .local v9, "rcvNtpTime":Lorg/apache/commons/net/ntp/TimeStamp;
    invoke-virtual {v9}, Lorg/apache/commons/net/ntp/TimeStamp;->getTime()J

    move-result-wide v10

    .line 151
    .local v10, "rcvTime":J
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    invoke-interface {v15}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getTransmitTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v12

    .line 152
    .local v12, "xmitNtpTime":Lorg/apache/commons/net/ntp/TimeStamp;
    invoke-virtual {v12}, Lorg/apache/commons/net/ntp/TimeStamp;->getTime()J

    move-result-wide v13

    .line 170
    .local v13, "xmitTime":J
    invoke-virtual {v6}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v15

    const-wide/16 v17, 0x0

    cmp-long v15, v15, v17

    if-nez v15, :cond_4

    .line 174
    invoke-virtual {v12}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v15

    const-wide/16 v17, 0x0

    cmp-long v15, v15, v17

    if-eqz v15, :cond_3

    .line 176
    move-object/from16 v0, p0

    iget-wide v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_returnTime:J

    sub-long v15, v13, v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_offset:Ljava/lang/Long;

    .line 177
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    const-string v16, "Error: zero orig time -- cannot compute delay"

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 179
    :cond_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    const-string v16, "Error: zero orig time -- cannot compute delay/offset"

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 181
    :cond_4
    invoke-virtual {v9}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v15

    const-wide/16 v17, 0x0

    cmp-long v15, v15, v17

    if-eqz v15, :cond_5

    invoke-virtual {v12}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v15

    const-wide/16 v17, 0x0

    cmp-long v15, v15, v17

    if-nez v15, :cond_8

    .line 182
    :cond_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    const-string v16, "Warning: zero rcvNtpTime or xmitNtpTime"

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    move-object/from16 v0, p0

    iget-wide v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_returnTime:J

    cmp-long v15, v7, v15

    if-lez v15, :cond_6

    .line 185
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    const-string v16, "Error: OrigTime > DestRcvTime"

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    :goto_1
    invoke-virtual {v9}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v15

    const-wide/16 v17, 0x0

    cmp-long v15, v15, v17

    if-eqz v15, :cond_7

    .line 198
    sub-long v15, v10, v7

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_offset:Ljava/lang/Long;

    goto/16 :goto_0

    .line 189
    :cond_6
    move-object/from16 v0, p0

    iget-wide v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_returnTime:J

    sub-long/2addr v15, v7

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_delay:Ljava/lang/Long;

    goto :goto_1

    .line 199
    :cond_7
    invoke-virtual {v12}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v15

    const-wide/16 v17, 0x0

    cmp-long v15, v15, v17

    if-eqz v15, :cond_0

    .line 202
    move-object/from16 v0, p0

    iget-wide v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_returnTime:J

    sub-long v15, v13, v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_offset:Ljava/lang/Long;

    goto/16 :goto_0

    .line 206
    :cond_8
    move-object/from16 v0, p0

    iget-wide v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_returnTime:J

    sub-long v2, v15, v7

    .line 208
    .local v2, "delayValue":J
    cmp-long v15, v13, v10

    if-gez v15, :cond_b

    .line 211
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    const-string v16, "Error: xmitTime < rcvTime"

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    :cond_9
    :goto_2
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_delay:Ljava/lang/Long;

    .line 239
    move-object/from16 v0, p0

    iget-wide v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_returnTime:J

    cmp-long v15, v7, v15

    if-lez v15, :cond_a

    .line 240
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    const-string v16, "Error: OrigTime > DestRcvTime"

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    :cond_a
    sub-long v15, v10, v7

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_returnTime:J

    move-wide/from16 v17, v0

    sub-long v17, v13, v17

    add-long v15, v15, v17

    const-wide/16 v17, 0x2

    div-long v15, v15, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_offset:Ljava/lang/Long;

    goto/16 :goto_0

    .line 215
    :cond_b
    sub-long v4, v13, v10

    .line 218
    .local v4, "delta":J
    cmp-long v15, v4, v2

    if-gtz v15, :cond_c

    .line 220
    sub-long/2addr v2, v4

    goto :goto_2

    .line 225
    :cond_c
    sub-long v15, v4, v2

    const-wide/16 v17, 0x1

    cmp-long v15, v15, v17

    if-nez v15, :cond_d

    .line 228
    const-wide/16 v15, 0x0

    cmp-long v15, v2, v15

    if-eqz v15, :cond_9

    .line 230
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    const-string v16, "Info: processing time > total network time by 1 ms -> assume zero delay"

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    const-wide/16 v2, 0x0

    goto :goto_2

    .line 234
    :cond_d
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    const-string v16, "Warning: processing time > total network time"

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public getComments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 254
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_comments:Ljava/util/List;

    return-object v0
.end method

.method public getDelay()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 264
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_delay:Ljava/lang/Long;

    return-object v0
.end method

.method public getMessage()Lorg/apache/commons/net/ntp/NtpV3Packet;
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    return-object v0
.end method

.method public getOffset()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_offset:Ljava/lang/Long;

    return-object v0
.end method

.method public getReturnTime()J
    .locals 2

    .prologue
    .line 295
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->_returnTime:J

    return-wide v0
.end method
