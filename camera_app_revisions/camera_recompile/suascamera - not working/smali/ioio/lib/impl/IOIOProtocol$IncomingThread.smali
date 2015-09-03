.class Lioio/lib/impl/IOIOProtocol$IncomingThread;
.super Ljava/lang/Thread;
.source "IOIOProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/IOIOProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IncomingThread"
.end annotation


# instance fields
.field private addedPins_:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private analogFramePins_:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private analogPinValues_:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private inbuf_:[B

.field private newFramePins_:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private readOffset_:I

.field private removedPins_:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lioio/lib/impl/IOIOProtocol;

.field private validBytes_:I


# direct methods
.method constructor <init>(Lioio/lib/impl/IOIOProtocol;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 562
    iput-object p1, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 563
    iput v0, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readOffset_:I

    .line 564
    iput v0, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->validBytes_:I

    .line 565
    const/16 v0, 0x40

    new-array v0, v0, [B

    iput-object v0, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->inbuf_:[B

    .line 567
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogPinValues_:Ljava/util/List;

    .line 568
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogFramePins_:Ljava/util/List;

    .line 569
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->newFramePins_:Ljava/util/List;

    .line 570
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->removedPins_:Ljava/util/Set;

    .line 571
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->addedPins_:Ljava/util/Set;

    return-void
.end method

.method private calculateAnalogFrameDelta()V
    .locals 5

    .prologue
    .line 574
    iget-object v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->removedPins_:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->clear()V

    .line 575
    iget-object v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->removedPins_:Ljava/util/Set;

    iget-object v4, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogFramePins_:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 576
    iget-object v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->addedPins_:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->clear()V

    .line 577
    iget-object v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->addedPins_:Ljava/util/Set;

    iget-object v4, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->newFramePins_:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 579
    iget-object v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->removedPins_:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 587
    iget-object v2, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogFramePins_:Ljava/util/List;

    .line 588
    .local v2, "temp":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->newFramePins_:Ljava/util/List;

    iput-object v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogFramePins_:Ljava/util/List;

    .line 589
    iput-object v2, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->newFramePins_:Ljava/util/List;

    .line 590
    return-void

    .line 580
    .end local v2    # "temp":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 581
    .local v0, "current":Ljava/lang/Integer;
    iget-object v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->addedPins_:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 582
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 583
    iget-object v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->addedPins_:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private fillBuf()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 594
    :try_start_0
    iget-object v1, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->in_:Ljava/io/InputStream;
    invoke-static {v1}, Lioio/lib/impl/IOIOProtocol;->access$0(Lioio/lib/impl/IOIOProtocol;)Ljava/io/InputStream;

    move-result-object v1

    iget-object v2, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->inbuf_:[B

    const/4 v3, 0x0

    iget-object v4, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->inbuf_:[B

    array-length v4, v4

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    iput v1, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->validBytes_:I

    .line 595
    iget v1, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->validBytes_:I

    if-gtz v1, :cond_0

    .line 596
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Unexpected stream closure"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 600
    :catch_0
    move-exception v0

    .line 601
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "IOIOProtocol"

    const-string v2, "IOIO disconnected"

    invoke-static {v1, v2}, Lioio/lib/spi/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 602
    throw v0

    .line 599
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    const/4 v1, 0x0

    :try_start_1
    iput v1, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readOffset_:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 604
    return-void
.end method

.method private readByte()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 607
    iget v1, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readOffset_:I

    iget v2, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->validBytes_:I

    if-ne v1, v2, :cond_0

    .line 608
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->fillBuf()V

    .line 610
    :cond_0
    iget-object v1, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->inbuf_:[B

    iget v2, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readOffset_:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readOffset_:I

    aget-byte v0, v1, v2

    .line 611
    .local v0, "b":I
    and-int/lit16 v0, v0, 0xff

    .line 613
    return v0
.end method

.method private readBytes(I[B)V
    .locals 2
    .param p1, "size"    # I
    .param p2, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 617
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p1, :cond_0

    .line 620
    return-void

    .line 618
    :cond_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 617
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 624
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 625
    const/16 v11, 0xa

    invoke-virtual {p0, v11}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->setPriority(I)V

    .line 630
    const/16 v11, 0x100

    new-array v3, v11, [B

    .line 633
    .local v3, "data":[B
    :cond_0
    :goto_0
    :pswitch_0
    :try_start_0
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .local v0, "arg1":I
    packed-switch v0, :pswitch_data_0

    .line 835
    :pswitch_1
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->in_:Ljava/io/InputStream;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$0(Lioio/lib/impl/IOIOProtocol;)Ljava/io/InputStream;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    .line 836
    new-instance v4, Ljava/io/IOException;

    .line 837
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Received unexpected command: 0x"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 838
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 837
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 836
    invoke-direct {v4, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 839
    .local v4, "e":Ljava/io/IOException;
    const-string v11, "IOIOProtocol"

    const-string v12, "Protocol error"

    invoke-static {v11, v12, v4}, Lioio/lib/spi/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 840
    throw v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 843
    .end local v0    # "arg1":I
    .end local v4    # "e":Ljava/io/IOException;
    :catch_0
    move-exception v4

    .line 844
    .restart local v4    # "e":Ljava/io/IOException;
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    invoke-interface {v11}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleConnectionLost()V

    .line 846
    return-void

    .line 635
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v0    # "arg1":I
    :pswitch_2
    :try_start_1
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v11

    const/16 v12, 0x49

    if-ne v11, v12, :cond_1

    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v11

    const/16 v12, 0x4f

    if-ne v11, v12, :cond_1

    .line 636
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v11

    const/16 v12, 0x49

    if-ne v11, v12, :cond_1

    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v11

    const/16 v12, 0x4f

    if-eq v11, v12, :cond_2

    .line 637
    :cond_1
    new-instance v11, Ljava/io/IOException;

    .line 638
    const-string v12, "Bad establish connection magic"

    .line 637
    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 640
    :cond_2
    const/16 v11, 0x8

    new-array v6, v11, [B

    .line 641
    .local v6, "hardwareId":[B
    const/16 v11, 0x8

    new-array v2, v11, [B

    .line 642
    .local v2, "bootloaderId":[B
    const/16 v11, 0x8

    new-array v5, v11, [B

    .line 643
    .local v5, "firmwareId":[B
    const/16 v11, 0x8

    invoke-direct {p0, v11, v6}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readBytes(I[B)V

    .line 644
    const/16 v11, 0x8

    invoke-direct {p0, v11, v2}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readBytes(I[B)V

    .line 645
    const/16 v11, 0x8

    invoke-direct {p0, v11, v5}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readBytes(I[B)V

    .line 647
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    invoke-interface {v11, v6, v2, v5}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleEstablishConnection([B[B[B)V

    goto/16 :goto_0

    .line 652
    .end local v2    # "bootloaderId":[B
    .end local v5    # "firmwareId":[B
    .end local v6    # "hardwareId":[B
    :pswitch_3
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogFramePins_:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->clear()V

    .line 653
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    invoke-interface {v11}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleSoftReset()V

    goto/16 :goto_0

    .line 657
    :pswitch_4
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 658
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v12

    shr-int/lit8 v13, v0, 0x2

    .line 659
    and-int/lit8 v11, v0, 0x1

    const/4 v14, 0x1

    if-ne v11, v14, :cond_3

    const/4 v11, 0x1

    .line 658
    :goto_1
    invoke-interface {v12, v13, v11}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleReportDigitalInStatus(IZ)V

    goto/16 :goto_0

    .line 659
    :cond_3
    const/4 v11, 0x0

    goto :goto_1

    .line 663
    :pswitch_5
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 664
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v12

    shr-int/lit8 v13, v0, 0x2

    .line 665
    and-int/lit8 v11, v0, 0x1

    const/4 v14, 0x1

    if-ne v11, v14, :cond_4

    const/4 v11, 0x1

    .line 664
    :goto_2
    invoke-interface {v12, v13, v11}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleSetChangeNotify(IZ)V

    goto/16 :goto_0

    .line 665
    :cond_4
    const/4 v11, 0x0

    goto :goto_2

    .line 677
    :pswitch_6
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v9

    .line 678
    .local v9, "numPins":I
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->newFramePins_:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->clear()V

    .line 679
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_3
    if-lt v8, v9, :cond_5

    .line 682
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->calculateAnalogFrameDelta()V

    .line 683
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->removedPins_:Ljava/util/Set;

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .end local v8    # "i":I
    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_6

    .line 686
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->addedPins_:Ljava/util/Set;

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_5
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_0

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    .line 687
    .local v8, "i":Ljava/lang/Integer;
    iget-object v12, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v12}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v12

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const/4 v14, 0x1

    invoke-interface {v12, v13, v14}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleAnalogPinStatus(IZ)V

    goto :goto_5

    .line 680
    .local v8, "i":I
    :cond_5
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->newFramePins_:Ljava/util/List;

    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 679
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 683
    .end local v8    # "i":I
    :cond_6
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    .line 684
    .local v8, "i":Ljava/lang/Integer;
    iget-object v12, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v12}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v12

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const/4 v14, 0x0

    invoke-interface {v12, v13, v14}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleAnalogPinStatus(IZ)V

    goto :goto_4

    .line 692
    .end local v8    # "i":Ljava/lang/Integer;
    .end local v9    # "numPins":I
    :pswitch_7
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogFramePins_:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v9

    .line 693
    .restart local v9    # "numPins":I
    const/4 v7, 0x0

    .line 694
    .local v7, "header":I
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogPinValues_:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->clear()V

    .line 695
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_6
    if-lt v8, v9, :cond_7

    .line 702
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    iget-object v12, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogFramePins_:Ljava/util/List;

    .line 703
    iget-object v13, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogPinValues_:Ljava/util/List;

    .line 702
    invoke-interface {v11, v12, v13}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleReportAnalogInStatus(Ljava/util/List;Ljava/util/List;)V

    goto/16 :goto_0

    .line 696
    :cond_7
    rem-int/lit8 v11, v8, 0x4

    if-nez v11, :cond_8

    .line 697
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v7

    .line 699
    :cond_8
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->analogPinValues_:Ljava/util/List;

    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v12

    shl-int/lit8 v12, v12, 0x2

    and-int/lit8 v13, v7, 0x3

    or-int/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 700
    shr-int/lit8 v7, v7, 0x2

    .line 695
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 707
    .end local v7    # "header":I
    .end local v8    # "i":I
    .end local v9    # "numPins":I
    :pswitch_8
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 708
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v1

    .line 709
    .local v1, "arg2":I
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    .line 710
    shr-int/lit8 v13, v0, 0x2

    shl-int/lit8 v14, v1, 0x6

    or-int/2addr v13, v14

    .line 709
    invoke-interface {v11, v12, v13}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleUartReportTxStatus(II)V

    goto/16 :goto_0

    .line 714
    .end local v1    # "arg2":I
    :pswitch_9
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 715
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_7
    and-int/lit8 v11, v0, 0x3f

    add-int/lit8 v11, v11, 0x1

    if-lt v8, v11, :cond_9

    .line 718
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    shr-int/lit8 v12, v0, 0x6

    and-int/lit8 v13, v0, 0x3f

    add-int/lit8 v13, v13, 0x1

    invoke-interface {v11, v12, v13, v3}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleUartData(II[B)V

    goto/16 :goto_0

    .line 716
    :cond_9
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v3, v8

    .line 715
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 723
    .end local v8    # "i":I
    :pswitch_a
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 724
    and-int/lit16 v11, v0, 0x80

    if-eqz v11, :cond_a

    .line 725
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    invoke-interface {v11, v12}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleUartOpen(I)V

    goto/16 :goto_0

    .line 727
    :cond_a
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    invoke-interface {v11, v12}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleUartClose(I)V

    goto/16 :goto_0

    .line 732
    :pswitch_b
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 733
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v1

    .line 734
    .restart local v1    # "arg2":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_8
    and-int/lit8 v11, v0, 0x3f

    add-int/lit8 v11, v11, 0x1

    if-lt v8, v11, :cond_b

    .line 737
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    shr-int/lit8 v12, v0, 0x6

    and-int/lit8 v13, v1, 0x3f

    .line 738
    and-int/lit8 v14, v0, 0x3f

    add-int/lit8 v14, v14, 0x1

    .line 737
    invoke-interface {v11, v12, v13, v3, v14}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleSpiData(II[BI)V

    goto/16 :goto_0

    .line 735
    :cond_b
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v3, v8

    .line 734
    add-int/lit8 v8, v8, 0x1

    goto :goto_8

    .line 742
    .end local v1    # "arg2":I
    .end local v8    # "i":I
    :pswitch_c
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 743
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v1

    .line 744
    .restart local v1    # "arg2":I
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    .line 745
    shr-int/lit8 v13, v0, 0x2

    shl-int/lit8 v14, v1, 0x6

    or-int/2addr v13, v14

    .line 744
    invoke-interface {v11, v12, v13}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleSpiReportTxStatus(II)V

    goto/16 :goto_0

    .line 749
    .end local v1    # "arg2":I
    :pswitch_d
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 750
    and-int/lit16 v11, v0, 0x80

    if-eqz v11, :cond_c

    .line 751
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    invoke-interface {v11, v12}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleSpiOpen(I)V

    goto/16 :goto_0

    .line 753
    :cond_c
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    invoke-interface {v11, v12}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleSpiClose(I)V

    goto/16 :goto_0

    .line 758
    :pswitch_e
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 759
    and-int/lit16 v11, v0, 0x80

    if-eqz v11, :cond_d

    .line 760
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    invoke-interface {v11, v12}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleI2cOpen(I)V

    goto/16 :goto_0

    .line 762
    :cond_d
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    invoke-interface {v11, v12}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleI2cClose(I)V

    goto/16 :goto_0

    .line 767
    :pswitch_f
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 768
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v1

    .line 769
    .restart local v1    # "arg2":I
    const/16 v11, 0xff

    if-eq v1, v11, :cond_e

    .line 770
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_9
    if-lt v8, v1, :cond_f

    .line 774
    .end local v8    # "i":I
    :cond_e
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    invoke-interface {v11, v12, v1, v3}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleI2cResult(II[B)V

    goto/16 :goto_0

    .line 771
    .restart local v8    # "i":I
    :cond_f
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v3, v8

    .line 770
    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    .line 778
    .end local v1    # "arg2":I
    .end local v8    # "i":I
    :pswitch_10
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 779
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v1

    .line 780
    .restart local v1    # "arg2":I
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0x3

    .line 781
    shr-int/lit8 v13, v0, 0x2

    shl-int/lit8 v14, v1, 0x6

    or-int/2addr v13, v14

    .line 780
    invoke-interface {v11, v12, v13}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleI2cReportTxStatus(II)V

    goto/16 :goto_0

    .line 785
    .end local v1    # "arg2":I
    :pswitch_11
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 786
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v12

    and-int/lit8 v11, v0, 0x1

    const/4 v13, 0x1

    if-ne v11, v13, :cond_10

    const/4 v11, 0x1

    :goto_a
    invoke-interface {v12, v11}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleCheckInterfaceResponse(Z)V

    goto/16 :goto_0

    :cond_10
    const/4 v11, 0x0

    goto :goto_a

    .line 790
    :pswitch_12
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 791
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v1

    .line 792
    .restart local v1    # "arg2":I
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    shl-int/lit8 v12, v1, 0x8

    or-int/2addr v12, v0

    invoke-interface {v11, v12}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleIcspReportRxStatus(I)V

    goto/16 :goto_0

    .line 796
    .end local v1    # "arg2":I
    :pswitch_13
    const/4 v11, 0x0

    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v12

    int-to-byte v12, v12

    aput-byte v12, v3, v11

    .line 797
    const/4 v11, 0x1

    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v12

    int-to-byte v12, v12

    aput-byte v12, v3, v11

    .line 798
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    const/4 v12, 0x2

    invoke-interface {v11, v12, v3}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleIcspResult(I[B)V

    goto/16 :goto_0

    .line 802
    :pswitch_14
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 803
    and-int/lit8 v11, v0, 0x1

    const/4 v12, 0x1

    if-ne v11, v12, :cond_11

    .line 804
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    invoke-interface {v11}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleIcspOpen()V

    goto/16 :goto_0

    .line 806
    :cond_11
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    invoke-interface {v11}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleIcspClose()V

    goto/16 :goto_0

    .line 811
    :pswitch_15
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 812
    and-int/lit16 v11, v0, 0x80

    if-eqz v11, :cond_12

    .line 813
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0xf

    invoke-interface {v11, v12}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleIncapOpen(I)V

    goto/16 :goto_0

    .line 815
    :cond_12
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0xf

    invoke-interface {v11, v12}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleIncapClose(I)V

    goto/16 :goto_0

    .line 820
    :pswitch_16
    invoke-direct {p0}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readByte()I

    move-result v0

    .line 821
    shr-int/lit8 v10, v0, 0x6

    .line 822
    .local v10, "size":I
    if-nez v10, :cond_13

    .line 823
    const/4 v10, 0x4

    .line 825
    :cond_13
    invoke-direct {p0, v10, v3}, Lioio/lib/impl/IOIOProtocol$IncomingThread;->readBytes(I[B)V

    .line 826
    iget-object v11, p0, Lioio/lib/impl/IOIOProtocol$IncomingThread;->this$0:Lioio/lib/impl/IOIOProtocol;

    # getter for: Lioio/lib/impl/IOIOProtocol;->handler_:Lioio/lib/impl/IOIOProtocol$IncomingHandler;
    invoke-static {v11}, Lioio/lib/impl/IOIOProtocol;->access$1(Lioio/lib/impl/IOIOProtocol;)Lioio/lib/impl/IOIOProtocol$IncomingHandler;

    move-result-object v11

    and-int/lit8 v12, v0, 0xf

    invoke-interface {v11, v12, v10, v3}, Lioio/lib/impl/IOIOProtocol$IncomingHandler;->handleIncapReport(II[B)V

    goto/16 :goto_0

    .line 830
    .end local v10    # "size":I
    :pswitch_17
    const-string v11, "IOIOProtocol"

    const-string v12, "Received soft close."

    invoke-static {v11, v12}, Lioio/lib/spi/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 831
    new-instance v11, Ljava/io/IOException;

    const-string v12, "Soft close"

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 633
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_11
        :pswitch_1
        :pswitch_4
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_7
        :pswitch_6
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_d
        :pswitch_b
        :pswitch_c
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_12
        :pswitch_13
        :pswitch_1
        :pswitch_1
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
    .end packed-switch
.end method
