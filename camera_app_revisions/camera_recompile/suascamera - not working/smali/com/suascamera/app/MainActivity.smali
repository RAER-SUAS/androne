.class public Lcom/suascamera/app/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/suascamera/app/MainActivity$ScreenHandler;
    }
.end annotation


# static fields
.field static timeStamp:Ljava/lang/String;


# instance fields
.field comm:Lcom/suascamera/communication/Comm;

.field ct:Lcom/suascamera/camera/CameraThread;

.field ot:Lcom/suascamera/data/Orientation;

.field state:I

.field wl:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 44
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd_HHmmss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 45
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 44
    sput-object v0, Lcom/suascamera/app/MainActivity;->timeStamp:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private getPicutreDirectory()Ljava/io/File;
    .locals 3

    .prologue
    .line 180
    new-instance v0, Ljava/io/File;

    .line 182
    sget-object v1, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 183
    sget-object v2, Lcom/suascamera/app/MainActivity;->timeStamp:Ljava/lang/String;

    .line 180
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 185
    .local v0, "mediaStorageDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 186
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_0

    .line 187
    const-string v1, "SUASCameraApp"

    const-string v2, "failed to create directory"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    const/4 v0, 0x0

    .line 191
    .end local v0    # "mediaStorageDir":Ljava/io/File;
    :cond_0
    return-object v0
.end method


# virtual methods
.method public continuous(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 176
    sget-boolean v0, Lcom/suascamera/app/Backend;->continuous:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/suascamera/app/Backend;->continuous:Z

    .line 177
    return-void

    .line 176
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public exposureDown(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 171
    const/high16 v0, 0x7f080000

    invoke-virtual {p0, v0}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/suascamera/camera/Preview;

    .line 172
    invoke-virtual {v0}, Lcom/suascamera/camera/Preview;->decreaseExposureCompensation()V

    .line 173
    return-void
.end method

.method public exposureUp(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 166
    const/high16 v0, 0x7f080000

    invoke-virtual {p0, v0}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/suascamera/camera/Preview;

    .line 167
    invoke-virtual {v0}, Lcom/suascamera/camera/Preview;->increaseExposureCompensation()V

    .line 168
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 140
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 148
    :goto_0
    return-void

    .line 142
    :pswitch_0
    invoke-virtual {p0}, Lcom/suascamera/app/MainActivity;->screenOff()V

    goto :goto_0

    .line 145
    :pswitch_1
    invoke-virtual {p0}, Lcom/suascamera/app/MainActivity;->screenOn()V

    goto :goto_0

    .line 140
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 205
    iget v0, p0, Lcom/suascamera/app/MainActivity;->state:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 206
    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/suascamera/app/MainActivity;->setContentView(I)V

    .line 207
    const/4 v0, 0x0

    iput v0, p0, Lcom/suascamera/app/MainActivity;->state:I

    .line 211
    :goto_0
    return-void

    .line 209
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x0

    const/high16 v8, 0x7f080000

    const/4 v7, 0x3

    .line 49
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    const/high16 v1, 0x7f030000

    invoke-virtual {p0, v1}, Lcom/suascamera/app/MainActivity;->setContentView(I)V

    .line 51
    iput v9, p0, Lcom/suascamera/app/MainActivity;->state:I

    .line 53
    invoke-direct {p0}, Lcom/suascamera/app/MainActivity;->getPicutreDirectory()Ljava/io/File;

    move-result-object v1

    sput-object v1, Lcom/suascamera/app/Backend;->currentDirectory:Ljava/io/File;

    .line 56
    new-instance v2, Lcom/suascamera/camera/CameraThread;

    invoke-virtual {p0, v8}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/suascamera/camera/Preview;

    invoke-direct {v2, v1}, Lcom/suascamera/camera/CameraThread;-><init>(Lcom/suascamera/camera/Preview;)V

    iput-object v2, p0, Lcom/suascamera/app/MainActivity;->ct:Lcom/suascamera/camera/CameraThread;

    .line 57
    iget-object v1, p0, Lcom/suascamera/app/MainActivity;->ct:Lcom/suascamera/camera/CameraThread;

    invoke-virtual {v1}, Lcom/suascamera/camera/CameraThread;->start()V

    .line 58
    iget-object v1, p0, Lcom/suascamera/app/MainActivity;->ct:Lcom/suascamera/camera/CameraThread;

    sput-object v1, Lcom/suascamera/app/Backend;->ct:Lcom/suascamera/camera/CameraThread;

    .line 61
    new-instance v1, Lcom/suascamera/communication/Comm;

    invoke-direct {v1}, Lcom/suascamera/communication/Comm;-><init>()V

    iput-object v1, p0, Lcom/suascamera/app/MainActivity;->comm:Lcom/suascamera/communication/Comm;

    .line 62
    iget-object v1, p0, Lcom/suascamera/app/MainActivity;->comm:Lcom/suascamera/communication/Comm;

    invoke-virtual {v1}, Lcom/suascamera/communication/Comm;->start()V

    .line 64
    new-instance v1, Lcom/suascamera/data/Orientation;

    invoke-direct {v1}, Lcom/suascamera/data/Orientation;-><init>()V

    iput-object v1, p0, Lcom/suascamera/app/MainActivity;->ot:Lcom/suascamera/data/Orientation;

    .line 68
    const-string v1, "sensor"

    invoke-virtual {p0, v1}, Lcom/suascamera/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/hardware/SensorManager;

    .line 69
    .local v6, "sensMgr":Landroid/hardware/SensorManager;
    iget-object v1, p0, Lcom/suascamera/app/MainActivity;->ot:Lcom/suascamera/data/Orientation;

    .line 70
    const/4 v2, 0x1

    invoke-virtual {v6, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v2

    .line 69
    invoke-virtual {v6, v1, v2, v7}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 72
    iget-object v1, p0, Lcom/suascamera/app/MainActivity;->ot:Lcom/suascamera/data/Orientation;

    .line 73
    const/4 v2, 0x2

    invoke-virtual {v6, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v2

    .line 72
    invoke-virtual {v6, v1, v2, v7}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 75
    iget-object v1, p0, Lcom/suascamera/app/MainActivity;->ot:Lcom/suascamera/data/Orientation;

    .line 76
    const/4 v2, 0x6

    invoke-virtual {v6, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v2

    .line 75
    invoke-virtual {v6, v1, v2, v7}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 80
    new-instance v1, Lcom/suascamera/data/LocationThread;

    invoke-direct {v1}, Lcom/suascamera/data/LocationThread;-><init>()V

    sput-object v1, Lcom/suascamera/app/Backend;->lt:Lcom/suascamera/data/LocationThread;

    .line 82
    const-string v1, "location"

    invoke-virtual {p0, v1}, Lcom/suascamera/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 81
    check-cast v0, Landroid/location/LocationManager;

    .line 83
    .local v0, "locationManager":Landroid/location/LocationManager;
    const-string v1, "gps"

    const-wide/16 v2, 0x0

    .line 84
    const/4 v4, 0x0

    sget-object v5, Lcom/suascamera/app/Backend;->lt:Lcom/suascamera/data/LocationThread;

    .line 83
    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 88
    invoke-virtual {p0, v8}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/suascamera/camera/Preview;

    iget-object v2, v1, Lcom/suascamera/camera/Preview;->jCallback:Lcom/suascamera/camera/JpegCallback;

    .line 89
    const-string v1, "location"

    invoke-virtual {p0, v1}, Lcom/suascamera/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    invoke-virtual {v2, v1}, Lcom/suascamera/camera/JpegCallback;->setLocation(Landroid/location/LocationManager;)V

    .line 90
    invoke-virtual {p0, v8}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/suascamera/camera/Preview;

    iget-object v1, v1, Lcom/suascamera/camera/Preview;->jCallback:Lcom/suascamera/camera/JpegCallback;

    iget-object v2, p0, Lcom/suascamera/app/MainActivity;->ot:Lcom/suascamera/data/Orientation;

    invoke-virtual {v1, v2}, Lcom/suascamera/camera/JpegCallback;->setOrientation(Lcom/suascamera/data/Orientation;)V

    .line 93
    invoke-virtual {p0, v8}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/suascamera/camera/Preview;

    sput-object v1, Lcom/suascamera/app/Backend;->preview:Lcom/suascamera/camera/Preview;

    .line 94
    const v1, 0x7f080005

    invoke-virtual {p0, v1}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sput-object v1, Lcom/suascamera/app/Backend;->text:Landroid/widget/TextView;

    .line 98
    new-instance v1, Lcom/suascamera/app/MainActivity$ScreenHandler;

    invoke-direct {v1, p0, p0}, Lcom/suascamera/app/MainActivity$ScreenHandler;-><init>(Lcom/suascamera/app/MainActivity;Lcom/suascamera/app/MainActivity;)V

    sput-object v1, Lcom/suascamera/app/Backend;->screenHandler:Lcom/suascamera/app/MainActivity$ScreenHandler;

    .line 101
    const-string v1, "wifi"

    invoke-virtual {p0, v1}, Lcom/suascamera/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    sput-object v1, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    .line 102
    sget-object v1, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    .line 103
    const-string v2, "What Goes here?"

    .line 102
    invoke-virtual {v1, v7, v2}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    .line 104
    sget-object v1, Lcom/suascamera/app/Backend;->wifi:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->startScan()Z

    .line 106
    invoke-virtual {p0, v9}, Lcom/suascamera/app/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    sput-object v1, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    .line 107
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 198
    invoke-virtual {p0}, Lcom/suascamera/app/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 199
    .local v0, "inflater":Landroid/view/MenuInflater;
    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 200
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    return v1
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 111
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Ending App"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 112
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 113
    const-string v1, "sensor"

    invoke-virtual {p0, v1}, Lcom/suascamera/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 114
    .local v0, "sensMgr":Landroid/hardware/SensorManager;
    iget-object v1, p0, Lcom/suascamera/app/MainActivity;->ot:Lcom/suascamera/data/Orientation;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 115
    iget-object v1, p0, Lcom/suascamera/app/MainActivity;->ct:Lcom/suascamera/camera/CameraThread;

    invoke-virtual {v1}, Lcom/suascamera/camera/CameraThread;->end()V

    .line 116
    iget-object v1, p0, Lcom/suascamera/app/MainActivity;->comm:Lcom/suascamera/communication/Comm;

    invoke-virtual {v1}, Lcom/suascamera/communication/Comm;->end()V

    .line 117
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 10
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v6, 0x1

    .line 216
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 257
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v6

    :cond_0
    :goto_0
    return v6

    .line 220
    :pswitch_0
    iget v7, p0, Lcom/suascamera/app/MainActivity;->state:I

    if-nez v7, :cond_1

    .line 221
    const v7, 0x7f030001

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->setContentView(I)V

    .line 222
    iput v6, p0, Lcom/suascamera/app/MainActivity;->state:I

    .line 224
    const v7, 0x7f080006

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 225
    .local v0, "editText1":Landroid/widget/EditText;
    sget-object v7, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v8, "sric_ssid"

    const-string v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 226
    sget-object v8, Landroid/widget/TextView$BufferType;->EDITABLE:Landroid/widget/TextView$BufferType;

    .line 225
    invoke-virtual {v0, v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 228
    const v7, 0x7f080007

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 229
    .local v1, "editText2":Landroid/widget/EditText;
    sget-object v7, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v8, "sric_key"

    const-string v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 230
    sget-object v8, Landroid/widget/TextView$BufferType;->EDITABLE:Landroid/widget/TextView$BufferType;

    .line 229
    invoke-virtual {v1, v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 232
    const v7, 0x7f080008

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 233
    .local v2, "editText3":Landroid/widget/EditText;
    sget-object v7, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v8, "sric_remoteip"

    const-string v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 234
    sget-object v8, Landroid/widget/TextView$BufferType;->EDITABLE:Landroid/widget/TextView$BufferType;

    .line 233
    invoke-virtual {v2, v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 236
    const v7, 0x7f080009

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 238
    .local v3, "editText4":Landroid/widget/EditText;
    sget-object v7, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v8, "sric_remotedir"

    const-string v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 239
    sget-object v8, Landroid/widget/TextView$BufferType;->EDITABLE:Landroid/widget/TextView$BufferType;

    .line 237
    invoke-virtual {v3, v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 241
    const v7, 0x7f08000a

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 243
    .local v4, "editText5":Landroid/widget/EditText;
    sget-object v7, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v8, "sric_remotefile"

    const-string v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 244
    sget-object v8, Landroid/widget/TextView$BufferType;->EDITABLE:Landroid/widget/TextView$BufferType;

    .line 242
    invoke-virtual {v4, v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 246
    const v7, 0x7f08000b

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 248
    .local v5, "editText6":Landroid/widget/EditText;
    sget-object v7, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    const-string v8, "sric_reconnectnet"

    const-string v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 249
    sget-object v8, Landroid/widget/TextView$BufferType;->EDITABLE:Landroid/widget/TextView$BufferType;

    .line 247
    invoke-virtual {v5, v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    goto/16 :goto_0

    .line 250
    .end local v0    # "editText1":Landroid/widget/EditText;
    .end local v1    # "editText2":Landroid/widget/EditText;
    .end local v2    # "editText3":Landroid/widget/EditText;
    .end local v3    # "editText4":Landroid/widget/EditText;
    .end local v4    # "editText5":Landroid/widget/EditText;
    .end local v5    # "editText6":Landroid/widget/EditText;
    :cond_1
    iget v7, p0, Lcom/suascamera/app/MainActivity;->state:I

    if-ne v7, v6, :cond_0

    .line 251
    const/high16 v7, 0x7f030000

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->setContentView(I)V

    .line 252
    const/4 v7, 0x0

    iput v7, p0, Lcom/suascamera/app/MainActivity;->state:I

    goto/16 :goto_0

    .line 216
    nop

    :pswitch_data_0
    .packed-switch 0x7f08000c
        :pswitch_0
    .end packed-switch
.end method

.method public rebalance(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 162
    const/high16 v0, 0x7f080000

    invoke-virtual {p0, v0}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/suascamera/camera/Preview;

    invoke-virtual {v0}, Lcom/suascamera/camera/Preview;->rebalance()V

    .line 163
    return-void
.end method

.method public saveSRICOptions(Landroid/view/View;)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 262
    sget-object v7, Lcom/suascamera/app/Backend;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    .line 264
    .local v6, "editor":Landroid/content/SharedPreferences$Editor;
    const v7, 0x7f080006

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 265
    .local v0, "editText1":Landroid/widget/EditText;
    const-string v7, "sric_ssid"

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 267
    const v7, 0x7f080007

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 268
    .local v1, "editText2":Landroid/widget/EditText;
    const-string v7, "sric_key"

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 270
    const v7, 0x7f080008

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 271
    .local v2, "editText3":Landroid/widget/EditText;
    const-string v7, "sric_remoteip"

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 273
    const v7, 0x7f080009

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 274
    .local v3, "editText4":Landroid/widget/EditText;
    const-string v7, "sric_remotedir"

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 276
    const v7, 0x7f08000a

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 277
    .local v4, "editText5":Landroid/widget/EditText;
    const-string v7, "sric_remotefile"

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 279
    const v7, 0x7f08000b

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 280
    .local v5, "editText6":Landroid/widget/EditText;
    const-string v7, "sric_reconnectnet"

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 282
    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 284
    const/high16 v7, 0x7f030000

    invoke-virtual {p0, v7}, Lcom/suascamera/app/MainActivity;->setContentView(I)V

    .line 285
    return-void
.end method

.method public screenOff()V
    .locals 2

    .prologue
    .line 133
    invoke-virtual {p0}, Lcom/suascamera/app/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 134
    .local v0, "params":Landroid/view/WindowManager$LayoutParams;
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit16 v1, v1, 0x80

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 135
    const/4 v1, 0x0

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 136
    invoke-virtual {p0}, Lcom/suascamera/app/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 137
    return-void
.end method

.method public screenOn()V
    .locals 2

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/suascamera/app/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 152
    .local v0, "params":Landroid/view/WindowManager$LayoutParams;
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit16 v1, v1, 0x80

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 153
    const/high16 v1, 0x3f800000

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 154
    invoke-virtual {p0}, Lcom/suascamera/app/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 155
    return-void
.end method

.method public takePicture(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 158
    const/high16 v0, 0x7f080000

    invoke-virtual {p0, v0}, Lcom/suascamera/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/suascamera/camera/Preview;

    invoke-virtual {v0}, Lcom/suascamera/camera/Preview;->takePicture()V

    .line 159
    return-void
.end method
