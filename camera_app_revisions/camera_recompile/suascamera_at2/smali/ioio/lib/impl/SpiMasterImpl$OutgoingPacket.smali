.class Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;
.super Ljava/lang/Object;
.source "SpiMasterImpl.java"

# interfaces
.implements Lioio/lib/impl/FlowControlledPacketSender$Packet;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/SpiMasterImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OutgoingPacket"
.end annotation


# instance fields
.field readSize_:I

.field ssPin_:I

.field final synthetic this$0:Lioio/lib/impl/SpiMasterImpl;

.field totalSize_:I

.field writeData_:[B

.field writeSize_:I


# direct methods
.method constructor <init>(Lioio/lib/impl/SpiMasterImpl;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->this$0:Lioio/lib/impl/SpiMasterImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getSize()I
    .locals 1

    .prologue
    .line 73
    iget v0, p0, Lioio/lib/impl/SpiMasterImpl$OutgoingPacket;->writeSize_:I

    add-int/lit8 v0, v0, 0x4

    return v0
.end method
