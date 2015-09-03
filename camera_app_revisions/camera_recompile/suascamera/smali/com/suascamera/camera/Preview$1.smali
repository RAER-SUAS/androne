.class Lcom/suascamera/camera/Preview$1;
.super Ljava/lang/Object;
.source "Preview.java"

# interfaces
.implements Landroid/hardware/Camera$AutoFocusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/suascamera/camera/Preview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/suascamera/camera/Preview;


# direct methods
.method constructor <init>(Lcom/suascamera/camera/Preview;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/suascamera/camera/Preview$1;->this$0:Lcom/suascamera/camera/Preview;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAutoFocus(ZLandroid/hardware/Camera;)V
    .locals 1
    .param p1, "success"    # Z
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/suascamera/camera/Preview$1;->this$0:Lcom/suascamera/camera/Preview;

    iput-boolean p1, v0, Lcom/suascamera/camera/Preview;->focused:Z

    .line 32
    return-void
.end method
