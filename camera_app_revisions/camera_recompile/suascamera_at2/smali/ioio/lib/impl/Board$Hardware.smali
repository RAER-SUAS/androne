.class Lioio/lib/impl/Board$Hardware;
.super Ljava/lang/Object;
.source "Board.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lioio/lib/impl/Board;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Hardware"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lioio/lib/impl/Board$Hardware$Function;
    }
.end annotation


# static fields
.field static final IOIO0002:Lioio/lib/impl/Board$Hardware;

.field static final IOIO0003:Lioio/lib/impl/Board$Hardware;

.field static final IOIO0004:Lioio/lib/impl/Board$Hardware;

.field private static final MAP_IOIO0002_IOIO0003:[[Z

.field private static final MAP_IOIO0004:[[Z


# instance fields
.field private final icspPins_:[I

.field private final incapDoubleModules_:[I

.field private final incapSingleModules_:[I

.field private final map_:[[Z

.field private final numPwmModules_:I

.field private final numSpiModules_:I

.field private final numUartModules_:I

.field private final twiPins_:[[I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .prologue
    const/4 v3, 0x4

    const/4 v11, 0x2

    const/4 v10, 0x0

    const/4 v4, 0x3

    const/4 v9, 0x1

    .line 44
    const/16 v0, 0x31

    new-array v0, v0, [[Z

    .line 46
    new-array v1, v4, [Z

    aput-boolean v9, v1, v10

    aput-boolean v9, v1, v9

    aput-object v1, v0, v10

    .line 47
    new-array v1, v4, [Z

    aput-object v1, v0, v9

    .line 48
    new-array v1, v4, [Z

    aput-object v1, v0, v11

    .line 49
    new-array v1, v4, [Z

    aput-boolean v9, v1, v10

    aput-boolean v9, v1, v9

    aput-object v1, v0, v4

    .line 50
    new-array v1, v4, [Z

    aput-boolean v9, v1, v10

    aput-boolean v9, v1, v9

    aput-object v1, v0, v3

    const/4 v1, 0x5

    .line 51
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 52
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 53
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 54
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 55
    new-array v2, v4, [Z

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 56
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 57
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 58
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 59
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 60
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 61
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 62
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 63
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 64
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 65
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 66
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 67
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 68
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x17

    .line 69
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 70
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 71
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    .line 72
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    .line 73
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    .line 74
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    .line 75
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    .line 76
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    .line 77
    new-array v2, v4, [Z

    fill-array-data v2, :array_0

    aput-object v2, v0, v1

    const/16 v1, 0x20

    .line 78
    new-array v2, v4, [Z

    fill-array-data v2, :array_1

    aput-object v2, v0, v1

    const/16 v1, 0x21

    .line 79
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x22

    .line 80
    new-array v2, v4, [Z

    fill-array-data v2, :array_2

    aput-object v2, v0, v1

    const/16 v1, 0x23

    .line 81
    new-array v2, v4, [Z

    fill-array-data v2, :array_3

    aput-object v2, v0, v1

    const/16 v1, 0x24

    .line 82
    new-array v2, v4, [Z

    fill-array-data v2, :array_4

    aput-object v2, v0, v1

    const/16 v1, 0x25

    .line 83
    new-array v2, v4, [Z

    fill-array-data v2, :array_5

    aput-object v2, v0, v1

    const/16 v1, 0x26

    .line 84
    new-array v2, v4, [Z

    fill-array-data v2, :array_6

    aput-object v2, v0, v1

    const/16 v1, 0x27

    .line 85
    new-array v2, v4, [Z

    fill-array-data v2, :array_7

    aput-object v2, v0, v1

    const/16 v1, 0x28

    .line 86
    new-array v2, v4, [Z

    fill-array-data v2, :array_8

    aput-object v2, v0, v1

    const/16 v1, 0x29

    .line 87
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    .line 88
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    .line 89
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    .line 90
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    .line 91
    new-array v2, v4, [Z

    fill-array-data v2, :array_9

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    .line 92
    new-array v2, v4, [Z

    fill-array-data v2, :array_a

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    .line 93
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x30

    .line 94
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    .line 44
    sput-object v0, Lioio/lib/impl/Board$Hardware;->MAP_IOIO0002_IOIO0003:[[Z

    .line 96
    const/16 v0, 0x2f

    new-array v0, v0, [[Z

    .line 98
    new-array v1, v4, [Z

    aput-object v1, v0, v10

    .line 99
    new-array v1, v4, [Z

    aput-boolean v9, v1, v10

    aput-boolean v9, v1, v9

    aput-object v1, v0, v9

    .line 100
    new-array v1, v4, [Z

    aput-boolean v9, v1, v10

    aput-boolean v9, v1, v9

    aput-object v1, v0, v11

    .line 101
    new-array v1, v4, [Z

    aput-boolean v9, v1, v10

    aput-boolean v9, v1, v9

    aput-object v1, v0, v4

    .line 102
    new-array v1, v4, [Z

    aput-boolean v9, v1, v10

    aput-boolean v9, v1, v9

    aput-object v1, v0, v3

    const/4 v1, 0x5

    .line 103
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 104
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 105
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 106
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 107
    new-array v2, v4, [Z

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 108
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 109
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 110
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 111
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 112
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 113
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 114
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 115
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 116
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 117
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 118
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 119
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 120
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x17

    .line 121
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 122
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 123
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    .line 124
    new-array v2, v4, [Z

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    .line 125
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    .line 126
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    .line 127
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    .line 128
    new-array v2, v4, [Z

    aput-boolean v9, v2, v10

    aput-boolean v9, v2, v9

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    .line 129
    new-array v2, v4, [Z

    fill-array-data v2, :array_b

    aput-object v2, v0, v1

    const/16 v1, 0x20

    .line 130
    new-array v2, v4, [Z

    fill-array-data v2, :array_c

    aput-object v2, v0, v1

    const/16 v1, 0x21

    .line 131
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x22

    .line 132
    new-array v2, v4, [Z

    fill-array-data v2, :array_d

    aput-object v2, v0, v1

    const/16 v1, 0x23

    .line 133
    new-array v2, v4, [Z

    fill-array-data v2, :array_e

    aput-object v2, v0, v1

    const/16 v1, 0x24

    .line 134
    new-array v2, v4, [Z

    fill-array-data v2, :array_f

    aput-object v2, v0, v1

    const/16 v1, 0x25

    .line 135
    new-array v2, v4, [Z

    fill-array-data v2, :array_10

    aput-object v2, v0, v1

    const/16 v1, 0x26

    .line 136
    new-array v2, v4, [Z

    fill-array-data v2, :array_11

    aput-object v2, v0, v1

    const/16 v1, 0x27

    .line 137
    new-array v2, v4, [Z

    fill-array-data v2, :array_12

    aput-object v2, v0, v1

    const/16 v1, 0x28

    .line 138
    new-array v2, v4, [Z

    fill-array-data v2, :array_13

    aput-object v2, v0, v1

    const/16 v1, 0x29

    .line 139
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    .line 140
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    .line 141
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    .line 142
    new-array v2, v4, [Z

    aput-boolean v9, v2, v11

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    .line 143
    new-array v2, v4, [Z

    fill-array-data v2, :array_14

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    .line 144
    new-array v2, v4, [Z

    fill-array-data v2, :array_15

    aput-object v2, v0, v1

    .line 96
    sput-object v0, Lioio/lib/impl/Board$Hardware;->MAP_IOIO0004:[[Z

    .line 146
    new-instance v0, Lioio/lib/impl/Board$Hardware;

    sget-object v1, Lioio/lib/impl/Board$Hardware;->MAP_IOIO0002_IOIO0003:[[Z

    .line 147
    const/16 v2, 0x9

    new-array v5, v4, [I

    aput v11, v5, v9

    aput v3, v5, v11

    new-array v6, v4, [I

    fill-array-data v6, :array_16

    .line 148
    new-array v7, v4, [[I

    new-array v8, v11, [I

    fill-array-data v8, :array_17

    aput-object v8, v7, v10

    new-array v8, v11, [I

    fill-array-data v8, :array_18

    aput-object v8, v7, v9

    new-array v8, v11, [I

    fill-array-data v8, :array_19

    aput-object v8, v7, v11

    .line 149
    new-array v8, v4, [I

    fill-array-data v8, :array_1a

    .line 146
    invoke-direct/range {v0 .. v8}, Lioio/lib/impl/Board$Hardware;-><init>([[ZIII[I[I[[I[I)V

    sput-object v0, Lioio/lib/impl/Board$Hardware;->IOIO0002:Lioio/lib/impl/Board$Hardware;

    .line 150
    sget-object v0, Lioio/lib/impl/Board$Hardware;->IOIO0002:Lioio/lib/impl/Board$Hardware;

    sput-object v0, Lioio/lib/impl/Board$Hardware;->IOIO0003:Lioio/lib/impl/Board$Hardware;

    .line 151
    new-instance v0, Lioio/lib/impl/Board$Hardware;

    sget-object v1, Lioio/lib/impl/Board$Hardware;->MAP_IOIO0004:[[Z

    .line 152
    const/16 v2, 0x9

    new-array v5, v4, [I

    aput v11, v5, v9

    aput v3, v5, v11

    new-array v6, v4, [I

    fill-array-data v6, :array_1b

    .line 153
    new-array v7, v4, [[I

    new-array v8, v11, [I

    fill-array-data v8, :array_1c

    aput-object v8, v7, v10

    new-array v8, v11, [I

    fill-array-data v8, :array_1d

    aput-object v8, v7, v9

    new-array v8, v11, [I

    fill-array-data v8, :array_1e

    aput-object v8, v7, v11

    .line 154
    new-array v8, v4, [I

    fill-array-data v8, :array_1f

    .line 151
    invoke-direct/range {v0 .. v8}, Lioio/lib/impl/Board$Hardware;-><init>([[ZIII[I[I[[I[I)V

    sput-object v0, Lioio/lib/impl/Board$Hardware;->IOIO0004:Lioio/lib/impl/Board$Hardware;

    .line 154
    return-void

    .line 77
    :array_0
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 78
    :array_1
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 80
    :array_2
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 81
    :array_3
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 82
    :array_4
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 83
    :array_5
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 84
    :array_6
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 85
    :array_7
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 86
    :array_8
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 91
    :array_9
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 92
    :array_a
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 129
    :array_b
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 130
    :array_c
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 132
    :array_d
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 133
    :array_e
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 134
    :array_f
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 135
    :array_10
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 136
    :array_11
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 137
    :array_12
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 138
    :array_13
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 143
    :array_14
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 144
    :array_15
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 147
    :array_16
    .array-data 4
        0x6
        0x7
        0x8
    .end array-data

    .line 148
    :array_17
    .array-data 4
        0x4
        0x5
    .end array-data

    :array_18
    .array-data 4
        0x2f
        0x30
    .end array-data

    :array_19
    .array-data 4
        0x1a
        0x19
    .end array-data

    .line 149
    :array_1a
    .array-data 4
        0x24
        0x25
        0x26
    .end array-data

    .line 152
    :array_1b
    .array-data 4
        0x6
        0x7
        0x8
    .end array-data

    .line 153
    :array_1c
    .array-data 4
        0x4
        0x5
    .end array-data

    :array_1d
    .array-data 4
        0x1
        0x2
    .end array-data

    :array_1e
    .array-data 4
        0x1a
        0x19
    .end array-data

    .line 154
    :array_1f
    .array-data 4
        0x24
        0x25
        0x26
    .end array-data
.end method

.method private constructor <init>([[ZIII[I[I[[I[I)V
    .locals 2
    .param p1, "map"    # [[Z
    .param p2, "numPwmModules"    # I
    .param p3, "numUartModules"    # I
    .param p4, "numSpiModules"    # I
    .param p5, "incapDoubleModules"    # [I
    .param p6, "incapSingleModules"    # [I
    .param p7, "twiPins"    # [[I
    .param p8, "icspPins"    # [I

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    if-nez p1, :cond_0

    .line 176
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "WTF"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :cond_0
    iput-object p1, p0, Lioio/lib/impl/Board$Hardware;->map_:[[Z

    .line 178
    iput p2, p0, Lioio/lib/impl/Board$Hardware;->numPwmModules_:I

    .line 179
    iput p3, p0, Lioio/lib/impl/Board$Hardware;->numUartModules_:I

    .line 180
    iput p4, p0, Lioio/lib/impl/Board$Hardware;->numSpiModules_:I

    .line 181
    iput-object p6, p0, Lioio/lib/impl/Board$Hardware;->incapSingleModules_:[I

    .line 182
    iput-object p5, p0, Lioio/lib/impl/Board$Hardware;->incapDoubleModules_:[I

    .line 183
    iput-object p7, p0, Lioio/lib/impl/Board$Hardware;->twiPins_:[[I

    .line 184
    iput-object p8, p0, Lioio/lib/impl/Board$Hardware;->icspPins_:[I

    .line 185
    return-void
.end method


# virtual methods
.method checkSupportsAnalogInput(I)V
    .locals 3
    .param p1, "pin"    # I

    .prologue
    .line 234
    invoke-virtual {p0, p1}, Lioio/lib/impl/Board$Hardware;->checkValidPin(I)V

    .line 235
    iget-object v0, p0, Lioio/lib/impl/Board$Hardware;->map_:[[Z

    aget-object v0, v0, p1

    sget-object v1, Lioio/lib/impl/Board$Hardware$Function;->ANALOG_IN:Lioio/lib/impl/Board$Hardware$Function;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware$Function;->ordinal()I

    move-result v1

    aget-boolean v0, v0, v1

    if-nez v0, :cond_0

    .line 236
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Pin "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 237
    const-string v2, " does not support analog input"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 236
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 239
    :cond_0
    return-void
.end method

.method checkSupportsPeripheralInput(I)V
    .locals 3
    .param p1, "pin"    # I

    .prologue
    .line 242
    invoke-virtual {p0, p1}, Lioio/lib/impl/Board$Hardware;->checkValidPin(I)V

    .line 243
    iget-object v0, p0, Lioio/lib/impl/Board$Hardware;->map_:[[Z

    aget-object v0, v0, p1

    sget-object v1, Lioio/lib/impl/Board$Hardware$Function;->PERIPHERAL_IN:Lioio/lib/impl/Board$Hardware$Function;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware$Function;->ordinal()I

    move-result v1

    aget-boolean v0, v0, v1

    if-nez v0, :cond_0

    .line 244
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Pin "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 245
    const-string v2, " does not support peripheral input"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 244
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 247
    :cond_0
    return-void
.end method

.method checkSupportsPeripheralOutput(I)V
    .locals 3
    .param p1, "pin"    # I

    .prologue
    .line 250
    invoke-virtual {p0, p1}, Lioio/lib/impl/Board$Hardware;->checkValidPin(I)V

    .line 251
    iget-object v0, p0, Lioio/lib/impl/Board$Hardware;->map_:[[Z

    aget-object v0, v0, p1

    sget-object v1, Lioio/lib/impl/Board$Hardware$Function;->PERIPHERAL_OUT:Lioio/lib/impl/Board$Hardware$Function;

    invoke-virtual {v1}, Lioio/lib/impl/Board$Hardware$Function;->ordinal()I

    move-result v1

    aget-boolean v0, v0, v1

    if-nez v0, :cond_0

    .line 252
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Pin "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 253
    const-string v2, " does not support peripheral output"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 252
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_0
    return-void
.end method

.method checkValidPin(I)V
    .locals 3
    .param p1, "pin"    # I

    .prologue
    .line 258
    if-ltz p1, :cond_0

    iget-object v0, p0, Lioio/lib/impl/Board$Hardware;->map_:[[Z

    array-length v0, v0

    if-lt p1, v0, :cond_1

    .line 259
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Illegal pin: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 261
    :cond_1
    return-void
.end method

.method icspPins()[I
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lioio/lib/impl/Board$Hardware;->icspPins_:[I

    return-object v0
.end method

.method incapDoubleModules()[I
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lioio/lib/impl/Board$Hardware;->incapDoubleModules_:[I

    return-object v0
.end method

.method incapSingleModules()[I
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lioio/lib/impl/Board$Hardware;->incapSingleModules_:[I

    return-object v0
.end method

.method numAnalogPins()I
    .locals 6

    .prologue
    .line 192
    const/4 v1, 0x0

    .line 193
    .local v1, "result":I
    iget-object v3, p0, Lioio/lib/impl/Board$Hardware;->map_:[[Z

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 198
    return v1

    .line 193
    :cond_0
    aget-object v0, v3, v2

    .line 194
    .local v0, "b":[Z
    sget-object v5, Lioio/lib/impl/Board$Hardware$Function;->ANALOG_IN:Lioio/lib/impl/Board$Hardware$Function;

    invoke-virtual {v5}, Lioio/lib/impl/Board$Hardware$Function;->ordinal()I

    move-result v5

    aget-boolean v5, v0, v5

    if-eqz v5, :cond_1

    .line 195
    add-int/lit8 v1, v1, 0x1

    .line 193
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method numPins()I
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lioio/lib/impl/Board$Hardware;->map_:[[Z

    array-length v0, v0

    return v0
.end method

.method numPwmModules()I
    .locals 1

    .prologue
    .line 202
    iget v0, p0, Lioio/lib/impl/Board$Hardware;->numPwmModules_:I

    return v0
.end method

.method numSpiModules()I
    .locals 1

    .prologue
    .line 210
    iget v0, p0, Lioio/lib/impl/Board$Hardware;->numSpiModules_:I

    return v0
.end method

.method numTwiModules()I
    .locals 1

    .prologue
    .line 214
    invoke-virtual {p0}, Lioio/lib/impl/Board$Hardware;->twiPins()[[I

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method numUartModules()I
    .locals 1

    .prologue
    .line 206
    iget v0, p0, Lioio/lib/impl/Board$Hardware;->numUartModules_:I

    return v0
.end method

.method twiPins()[[I
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lioio/lib/impl/Board$Hardware;->twiPins_:[[I

    return-object v0
.end method
