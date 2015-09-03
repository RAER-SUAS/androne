.class public Lcom/suascamera/data/Picture;
.super Ljava/lang/Object;
.source "Picture.java"


# static fields
.field static windowSize:I


# instance fields
.field public image:[B

.field public imageNumber:I

.field public location:Landroid/location/Location;

.field public pressureAlt:F

.field public rpy:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const/16 v0, 0x2710

    sput v0, Lcom/suascamera/data/Picture;->windowSize:I

    return-void
.end method

.method public constructor <init>([FFLandroid/location/Location;[BI)V
    .locals 0
    .param p1, "rpy"    # [F
    .param p2, "pressureAlt"    # F
    .param p3, "location"    # Landroid/location/Location;
    .param p4, "image"    # [B
    .param p5, "imageNumber"    # I

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/suascamera/data/Picture;->rpy:[F

    .line 33
    iput-object p3, p0, Lcom/suascamera/data/Picture;->location:Landroid/location/Location;

    .line 34
    iput-object p4, p0, Lcom/suascamera/data/Picture;->image:[B

    .line 35
    iput p5, p0, Lcom/suascamera/data/Picture;->imageNumber:I

    .line 36
    iput p2, p0, Lcom/suascamera/data/Picture;->pressureAlt:F

    .line 37
    return-void
.end method

.method private static messageHelper([BI)Ljava/util/ArrayList;
    .locals 13
    .param p0, "byteData"    # [B
    .param p1, "imageNumber"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI)",
            "Ljava/util/ArrayList",
            "<[B>;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 122
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .local v5, "messages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    array-length v8, p0

    int-to-double v8, v8

    sget v10, Lcom/suascamera/data/Picture;->windowSize:I

    int-to-double v10, v10

    div-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v6, v8

    .line 127
    .local v6, "numMessages":I
    const/16 v8, 0xa

    new-array v0, v8, [B

    const/16 v8, -0x10

    aput-byte v8, v0, v12

    const/4 v8, 0x1

    const/16 v9, 0xd

    aput-byte v9, v0, v8

    .line 132
    .local v0, "a":[B
    const/4 v7, 0x0

    .line 133
    .local v7, "offset":I
    sget v4, Lcom/suascamera/data/Picture;->windowSize:I

    .line 135
    .local v4, "lengthJawn":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v6, :cond_0

    .line 162
    return-object v5

    .line 136
    :cond_0
    add-int/lit8 v8, v6, -0x1

    if-ne v3, v8, :cond_1

    .line 137
    array-length v8, p0

    sget v9, Lcom/suascamera/data/Picture;->windowSize:I

    mul-int/2addr v9, v3

    sub-int/2addr v8, v9

    sget v9, Lcom/suascamera/data/Picture;->windowSize:I

    sub-int v7, v8, v9

    .line 138
    array-length v8, p0

    sget v9, Lcom/suascamera/data/Picture;->windowSize:I

    mul-int/2addr v9, v3

    sub-int v4, v8, v9

    .line 141
    :cond_1
    sget v8, Lcom/suascamera/data/Picture;->windowSize:I

    mul-int/2addr v8, v3

    sget v9, Lcom/suascamera/data/Picture;->windowSize:I

    mul-int/2addr v9, v3

    .line 142
    sget v10, Lcom/suascamera/data/Picture;->windowSize:I

    add-int/2addr v9, v10

    add-int/2addr v9, v7

    .line 141
    invoke-static {p0, v8, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    .line 144
    .local v1, "b":[B
    const/4 v8, 0x2

    shr-int/lit8 v9, p1, 0x8

    and-int/lit16 v9, v9, 0xff

    int-to-byte v9, v9

    aput-byte v9, v0, v8

    .line 145
    const/4 v8, 0x3

    and-int/lit16 v9, p1, 0xff

    int-to-byte v9, v9

    aput-byte v9, v0, v8

    .line 146
    const/4 v8, 0x4

    shr-int/lit8 v9, v3, 0x8

    and-int/lit16 v9, v9, 0xff

    int-to-byte v9, v9

    aput-byte v9, v0, v8

    .line 147
    const/4 v8, 0x5

    and-int/lit16 v9, v3, 0xff

    int-to-byte v9, v9

    aput-byte v9, v0, v8

    .line 148
    const/4 v8, 0x6

    shr-int/lit8 v9, v6, 0x8

    and-int/lit16 v9, v9, 0xff

    int-to-byte v9, v9

    aput-byte v9, v0, v8

    .line 149
    const/4 v8, 0x7

    and-int/lit16 v9, v6, 0xff

    int-to-byte v9, v9

    aput-byte v9, v0, v8

    .line 150
    const/16 v8, 0x8

    shr-int/lit8 v9, v4, 0x8

    int-to-byte v9, v9

    aput-byte v9, v0, v8

    .line 151
    const/16 v8, 0x9

    and-int/lit16 v9, v4, 0xff

    int-to-byte v9, v9

    aput-byte v9, v0, v8

    .line 153
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    array-length v10, v0

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 155
    array-length v8, v0

    array-length v9, v1

    add-int/2addr v8, v9

    new-array v2, v8, [B

    .line 156
    .local v2, "c":[B
    array-length v8, v0

    invoke-static {v0, v12, v2, v12, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 157
    array-length v8, v0

    array-length v9, v1

    invoke-static {v1, v12, v2, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 159
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0
.end method

.method public static messageMaker(I)Ljava/util/ArrayList;
    .locals 10
    .param p0, "imageNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 87
    new-instance v1, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    sget-object v8, Lcom/suascamera/app/Backend;->currentDirectory:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 88
    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".jpg"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 87
    invoke-direct {v1, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 89
    .local v1, "pf":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v7

    long-to-int v7, v7

    new-array v2, v7, [B

    .line 91
    .local v2, "picBuffer":[B
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 92
    .local v3, "pis":Ljava/io/FileInputStream;
    invoke-virtual {v3, v2}, Ljava/io/FileInputStream;->read([B)I

    .line 94
    new-instance v5, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    sget-object v8, Lcom/suascamera/app/Backend;->currentDirectory:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 95
    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".txt"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 94
    invoke-direct {v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 96
    .local v5, "tf":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v7

    long-to-int v7, v7

    new-array v4, v7, [B

    .line 97
    .local v4, "textBuffer":[B
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 98
    .local v6, "tis":Ljava/io/FileInputStream;
    invoke-virtual {v6, v4}, Ljava/io/FileInputStream;->read([B)I

    .line 101
    array-length v7, v4

    array-length v8, v2

    add-int/2addr v7, v8

    new-array v0, v7, [B

    .line 102
    .local v0, "c":[B
    array-length v7, v4

    invoke-static {v4, v9, v0, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 103
    array-length v7, v4

    array-length v8, v2

    invoke-static {v2, v9, v0, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    invoke-static {v0, p0}, Lcom/suascamera/data/Picture;->messageHelper([BI)Ljava/util/ArrayList;

    move-result-object v7

    return-object v7
.end method


# virtual methods
.method public getDataString()Ljava/lang/String;
    .locals 10

    .prologue
    .line 68
    iget-object v7, p0, Lcom/suascamera/data/Picture;->location:Landroid/location/Location;

    if-nez v7, :cond_0

    .line 69
    const-wide/16 v3, 0x0

    .line 70
    .local v3, "lat":D
    const-wide/16 v5, 0x0

    .line 71
    .local v5, "lon":D
    const-wide/16 v0, 0x0

    .line 78
    .local v0, "alt":D
    :goto_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget v8, p0, Lcom/suascamera/data/Picture;->imageNumber:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\t"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 79
    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/suascamera/data/Picture;->rpy:[F

    const/4 v9, 0x0

    aget v8, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/suascamera/data/Picture;->rpy:[F

    const/4 v9, 0x1

    aget v8, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/suascamera/data/Picture;->rpy:[F

    const/4 v9, 0x2

    aget v8, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 78
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 81
    .local v2, "data":Ljava/lang/String;
    return-object v2

    .line 73
    .end local v0    # "alt":D
    .end local v2    # "data":Ljava/lang/String;
    .end local v3    # "lat":D
    .end local v5    # "lon":D
    :cond_0
    iget-object v7, p0, Lcom/suascamera/data/Picture;->location:Landroid/location/Location;

    invoke-virtual {v7}, Landroid/location/Location;->getLatitude()D

    move-result-wide v3

    .line 74
    .restart local v3    # "lat":D
    iget-object v7, p0, Lcom/suascamera/data/Picture;->location:Landroid/location/Location;

    invoke-virtual {v7}, Landroid/location/Location;->getLongitude()D

    move-result-wide v5

    .line 75
    .restart local v5    # "lon":D
    iget-object v7, p0, Lcom/suascamera/data/Picture;->location:Landroid/location/Location;

    invoke-virtual {v7}, Landroid/location/Location;->getAltitude()D

    move-result-wide v0

    .restart local v0    # "alt":D
    goto :goto_0
.end method

.method public messageMaker()Ljava/util/ArrayList;
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<[B>;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 110
    invoke-virtual {p0}, Lcom/suascamera/data/Picture;->getDataString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 112
    .local v1, "data":[B
    array-length v2, v1

    iget-object v3, p0, Lcom/suascamera/data/Picture;->image:[B

    array-length v3, v3

    add-int/2addr v2, v3

    new-array v0, v2, [B

    .line 113
    .local v0, "byteData":[B
    array-length v2, v1

    invoke-static {v1, v5, v0, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    iget-object v2, p0, Lcom/suascamera/data/Picture;->image:[B

    array-length v3, v1

    iget-object v4, p0, Lcom/suascamera/data/Picture;->image:[B

    array-length v4, v4

    invoke-static {v2, v5, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 116
    iget v2, p0, Lcom/suascamera/data/Picture;->imageNumber:I

    invoke-static {v0, v2}, Lcom/suascamera/data/Picture;->messageHelper([BI)Ljava/util/ArrayList;

    move-result-object v2

    return-object v2
.end method

.method public save()V
    .locals 9

    .prologue
    .line 40
    new-instance v5, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    sget-object v8, Lcom/suascamera/app/Backend;->currentDirectory:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/suascamera/data/Picture;->imageNumber:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".jpg"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 40
    invoke-direct {v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 42
    .local v5, "pictureFile":Ljava/io/File;
    new-instance v4, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    sget-object v8, Lcom/suascamera/app/Backend;->currentDirectory:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/suascamera/data/Picture;->imageNumber:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".txt"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 42
    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 46
    .local v4, "logFile":Ljava/io/File;
    :try_start_0
    invoke-virtual {p0}, Lcom/suascamera/data/Picture;->getDataString()Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "data":Ljava/lang/String;
    new-instance v3, Ljava/io/ByteArrayInputStream;

    iget-object v7, p0, Lcom/suascamera/data/Picture;->image:[B

    invoke-direct {v3, v7}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 50
    .local v3, "is":Ljava/io/InputStream;
    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 52
    .local v0, "bm2":Landroid/graphics/Bitmap;
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 53
    .local v6, "pos":Ljava/io/FileOutputStream;
    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v8, 0x50

    invoke-virtual {v0, v7, v8, v6}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 54
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 56
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 57
    .local v2, "dos":Ljava/io/FileOutputStream;
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/io/FileOutputStream;->write([B)V

    .line 58
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .end local v0    # "bm2":Landroid/graphics/Bitmap;
    .end local v1    # "data":Ljava/lang/String;
    .end local v2    # "dos":Ljava/io/FileOutputStream;
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v6    # "pos":Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 61
    :catch_0
    move-exception v7

    goto :goto_0

    .line 59
    :catch_1
    move-exception v7

    goto :goto_0
.end method
