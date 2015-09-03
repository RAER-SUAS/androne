.class public Lcom/suascamera/app/MainActivity$ScreenHandler;
.super Landroid/os/Handler;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/suascamera/app/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ScreenHandler"
.end annotation


# instance fields
.field private parent:Lcom/suascamera/app/MainActivity;

.field final synthetic this$0:Lcom/suascamera/app/MainActivity;


# direct methods
.method public constructor <init>(Lcom/suascamera/app/MainActivity;Lcom/suascamera/app/MainActivity;)V
    .locals 0
    .param p2, "parent"    # Lcom/suascamera/app/MainActivity;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/suascamera/app/MainActivity$ScreenHandler;->this$0:Lcom/suascamera/app/MainActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 123
    iput-object p2, p0, Lcom/suascamera/app/MainActivity$ScreenHandler;->parent:Lcom/suascamera/app/MainActivity;

    .line 124
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 128
    iget-object v0, p0, Lcom/suascamera/app/MainActivity$ScreenHandler;->parent:Lcom/suascamera/app/MainActivity;

    invoke-virtual {v0, p1}, Lcom/suascamera/app/MainActivity;->handleMessage(Landroid/os/Message;)V

    .line 129
    return-void
.end method
