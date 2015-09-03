.class public Lcom/suascamera/app/Backend;
.super Ljava/lang/Object;
.source "Backend.java"


# static fields
.field public static altQ:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<[B>;"
        }
    .end annotation
.end field

.field public static cm:Landroid/net/ConnectivityManager;

.field public static continuous:Z

.field public static continuousButton:Landroid/widget/Button;

.field public static ct:Lcom/suascamera/camera/CameraThread;

.field public static currentDirectory:Ljava/io/File;

.field public static imageCount:I

.field public static lt:Lcom/suascamera/data/LocationThread;

.field public static main:Lcom/suascamera/app/MainActivity;

.field public static manager:Landroid/os/PowerManager;

.field public static nmea:Lcom/suascamera/data/NmeaLocation;

.field public static picDelay:I

.field public static prefs:Landroid/content/SharedPreferences;

.field public static preview:Lcom/suascamera/camera/Preview;

.field public static qOne:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static screenHandler:Lcom/suascamera/app/MainActivity$ScreenHandler;

.field public static sock:Ljava/net/Socket;

.field public static tcpIn:Ljava/io/BufferedInputStream;

.field public static tcpOut:Ljava/io/BufferedOutputStream;

.field public static text:Landroid/widget/TextView;

.field public static whichQueue:Z

.field public static wifi:Landroid/net/wifi/WifiManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput v0, Lcom/suascamera/app/Backend;->imageCount:I

    .line 34
    const/4 v0, 0x1

    sput-boolean v0, Lcom/suascamera/app/Backend;->whichQueue:Z

    .line 59
    const/4 v0, 0x3

    sput v0, Lcom/suascamera/app/Backend;->picDelay:I

    .line 61
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
