// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;


// Referenced classes of package ioio.lib.impl:
//            Board

static class icspPins_
{
    private static final class Function extends Enum
    {

        public static final Function ANALOG_IN;
        private static final Function ENUM$VALUES[];
        public static final Function PERIPHERAL_IN;
        public static final Function PERIPHERAL_OUT;

        public static Function valueOf(String s)
        {
            return (Function)Enum.valueOf(ioio/lib/impl/Board$Hardware$Function, s);
        }

        public static Function[] values()
        {
            Function afunction[] = ENUM$VALUES;
            int i = afunction.length;
            Function afunction1[] = new Function[i];
            System.arraycopy(afunction, 0, afunction1, 0, i);
            return afunction1;
        }

        static 
        {
            PERIPHERAL_OUT = new Function("PERIPHERAL_OUT", 0);
            PERIPHERAL_IN = new Function("PERIPHERAL_IN", 1);
            ANALOG_IN = new Function("ANALOG_IN", 2);
            ENUM$VALUES = (new Function[] {
                PERIPHERAL_OUT, PERIPHERAL_IN, ANALOG_IN
            });
        }

        private Function(String s, int i)
        {
            super(s, i);
        }
    }


    static final <init> IOIO0002;
    static final <init> IOIO0003;
    static final <init> IOIO0004;
    private static final boolean MAP_IOIO0002_IOIO0003[][];
    private static final boolean MAP_IOIO0004[][];
    private final int icspPins_[];
    private final int incapDoubleModules_[];
    private final int incapSingleModules_[];
    private final boolean map_[][];
    private final int numPwmModules_;
    private final int numSpiModules_;
    private final int numUartModules_;
    private final int twiPins_[][];

    void checkSupportsAnalogInput(int i)
    {
        checkValidPin(i);
        if (!map_[i][Function.ANALOG_IN.ordinal()])
        {
            throw new IllegalArgumentException((new StringBuilder("Pin ")).append(i).append(" does not support analog input").toString());
        } else
        {
            return;
        }
    }

    void checkSupportsPeripheralInput(int i)
    {
        checkValidPin(i);
        if (!map_[i][Function.PERIPHERAL_IN.ordinal()])
        {
            throw new IllegalArgumentException((new StringBuilder("Pin ")).append(i).append(" does not support peripheral input").toString());
        } else
        {
            return;
        }
    }

    void checkSupportsPeripheralOutput(int i)
    {
        checkValidPin(i);
        if (!map_[i][Function.PERIPHERAL_OUT.ordinal()])
        {
            throw new IllegalArgumentException((new StringBuilder("Pin ")).append(i).append(" does not support peripheral output").toString());
        } else
        {
            return;
        }
    }

    void checkValidPin(int i)
    {
        if (i < 0 || i >= map_.length)
        {
            throw new IllegalArgumentException((new StringBuilder("Illegal pin: ")).append(i).toString());
        } else
        {
            return;
        }
    }

    int[] icspPins()
    {
        return icspPins_;
    }

    int[] incapDoubleModules()
    {
        return incapDoubleModules_;
    }

    int[] incapSingleModules()
    {
        return incapSingleModules_;
    }

    int numAnalogPins()
    {
        int j = 0;
        boolean aflag[][] = map_;
        int l = aflag.length;
        int i = 0;
        do
        {
            if (i >= l)
            {
                return j;
            }
            int k = j;
            if (aflag[i][Function.ANALOG_IN.ordinal()])
            {
                k = j + 1;
            }
            i++;
            j = k;
        } while (true);
    }

    int numPins()
    {
        return map_.length;
    }

    int numPwmModules()
    {
        return numPwmModules_;
    }

    int numSpiModules()
    {
        return numSpiModules_;
    }

    int numTwiModules()
    {
        return twiPins().length;
    }

    int numUartModules()
    {
        return numUartModules_;
    }

    int[][] twiPins()
    {
        return twiPins_;
    }

    static 
    {
        Object obj = new boolean[3];
        obj[0] = true;
        obj[1] = true;
        int ai[] = new boolean[3];
        int ai1[] = new boolean[3];
        int ai2[] = new boolean[3];
        ai2[0] = true;
        ai2[1] = true;
        boolean aflag1[] = new boolean[3];
        aflag1[0] = true;
        aflag1[1] = true;
        boolean aflag2[] = new boolean[3];
        aflag2[0] = true;
        aflag2[1] = true;
        boolean aflag3[] = new boolean[3];
        aflag3[0] = true;
        aflag3[1] = true;
        boolean aflag4[] = new boolean[3];
        aflag4[0] = true;
        aflag4[1] = true;
        boolean aflag5[] = new boolean[3];
        boolean aflag6[] = new boolean[3];
        aflag6[1] = true;
        boolean aflag7[] = new boolean[3];
        aflag7[0] = true;
        aflag7[1] = true;
        boolean aflag8[] = new boolean[3];
        aflag8[0] = true;
        aflag8[1] = true;
        boolean aflag9[] = new boolean[3];
        aflag9[0] = true;
        aflag9[1] = true;
        boolean aflag10[] = new boolean[3];
        aflag10[0] = true;
        aflag10[1] = true;
        boolean aflag11[] = new boolean[3];
        aflag11[0] = true;
        aflag11[1] = true;
        boolean aflag12[] = new boolean[3];
        boolean aflag13[] = new boolean[3];
        boolean aflag14[] = new boolean[3];
        boolean aflag15[] = new boolean[3];
        boolean aflag16[] = new boolean[3];
        boolean aflag17[] = new boolean[3];
        boolean aflag18[] = new boolean[3];
        boolean aflag19[] = new boolean[3];
        boolean aflag20[] = new boolean[3];
        boolean aflag21[] = new boolean[3];
        boolean aflag22[] = new boolean[3];
        boolean aflag23[] = new boolean[3];
        boolean aflag24[] = new boolean[3];
        aflag24[0] = true;
        aflag24[1] = true;
        boolean aflag25[] = new boolean[3];
        aflag25[0] = true;
        aflag25[1] = true;
        boolean aflag26[] = new boolean[3];
        aflag26[0] = true;
        aflag26[1] = true;
        boolean aflag27[] = new boolean[3];
        aflag27[0] = true;
        aflag27[1] = true;
        boolean aflag35[] = {
            1, 1, 1
        };
        boolean aflag36[] = {
            1, 1, 1
        };
        boolean aflag28[] = new boolean[3];
        aflag28[2] = true;
        boolean aflag37[] = {
            1, 1, 1
        };
        boolean aflag38[] = {
            1, 1, 1
        };
        boolean aflag39[] = {
            1, 1, 1
        };
        boolean aflag40[] = {
            1, 1, 1
        };
        boolean aflag41[] = {
            1, 1, 1
        };
        boolean aflag42[] = {
            1, 1, 1
        };
        boolean aflag43[] = {
            1, 1, 1
        };
        boolean aflag29[] = new boolean[3];
        aflag29[2] = true;
        boolean aflag30[] = new boolean[3];
        aflag30[2] = true;
        boolean aflag31[] = new boolean[3];
        aflag31[2] = true;
        boolean aflag32[] = new boolean[3];
        aflag32[2] = true;
        boolean aflag44[] = {
            1, 1, 1
        };
        boolean aflag33[] = new boolean[3];
        aflag33[0] = true;
        aflag33[1] = true;
        boolean aflag34[] = new boolean[3];
        aflag34[0] = true;
        aflag34[1] = true;
        MAP_IOIO0002_IOIO0003 = (new boolean[][] {
            obj, ai, ai1, ai2, aflag1, aflag2, aflag3, aflag4, aflag5, aflag6, 
            aflag7, aflag8, aflag9, aflag10, aflag11, aflag12, aflag13, aflag14, aflag15, aflag16, 
            aflag17, aflag18, aflag19, aflag20, aflag21, aflag22, aflag23, aflag24, aflag25, aflag26, 
            aflag27, aflag35, aflag36, aflag28, aflag37, aflag38, aflag39, aflag40, aflag41, aflag42, 
            aflag43, aflag29, aflag30, aflag31, aflag32, new boolean[] {
                1, 1, 1
            }, aflag44, aflag33, aflag34
        });
        obj = new boolean[3];
        ai = new boolean[3];
        ai[0] = true;
        ai[1] = true;
        ai1 = new boolean[3];
        ai1[0] = true;
        ai1[1] = true;
        ai2 = new boolean[3];
        ai2[0] = true;
        ai2[1] = true;
        aflag1 = new boolean[3];
        aflag1[0] = true;
        aflag1[1] = true;
        aflag2 = new boolean[3];
        aflag2[0] = true;
        aflag2[1] = true;
        aflag3 = new boolean[3];
        aflag3[0] = true;
        aflag3[1] = true;
        aflag4 = new boolean[3];
        aflag4[0] = true;
        aflag4[1] = true;
        aflag5 = new boolean[3];
        aflag6 = new boolean[3];
        aflag6[1] = true;
        aflag7 = new boolean[3];
        aflag7[0] = true;
        aflag7[1] = true;
        aflag8 = new boolean[3];
        aflag8[0] = true;
        aflag8[1] = true;
        aflag9 = new boolean[3];
        aflag9[0] = true;
        aflag9[1] = true;
        aflag10 = new boolean[3];
        aflag10[0] = true;
        aflag10[1] = true;
        aflag11 = new boolean[3];
        aflag11[0] = true;
        aflag11[1] = true;
        aflag12 = new boolean[3];
        aflag13 = new boolean[3];
        aflag14 = new boolean[3];
        aflag15 = new boolean[3];
        aflag16 = new boolean[3];
        aflag17 = new boolean[3];
        aflag18 = new boolean[3];
        aflag19 = new boolean[3];
        aflag20 = new boolean[3];
        aflag21 = new boolean[3];
        aflag22 = new boolean[3];
        aflag23 = new boolean[3];
        aflag24 = new boolean[3];
        aflag24[0] = true;
        aflag24[1] = true;
        aflag25 = new boolean[3];
        aflag25[0] = true;
        aflag25[1] = true;
        aflag26 = new boolean[3];
        aflag26[0] = true;
        aflag26[1] = true;
        aflag27 = new boolean[3];
        aflag27[0] = true;
        aflag27[1] = true;
        aflag33 = (new boolean[] {
            1, 1, 1
        });
        aflag28 = new boolean[3];
        aflag28[2] = true;
        aflag34 = (new boolean[] {
            1, 1, 1
        });
        aflag35 = (new boolean[] {
            1, 1, 1
        });
        aflag36 = (new boolean[] {
            1, 1, 1
        });
        aflag37 = (new boolean[] {
            1, 1, 1
        });
        aflag38 = (new boolean[] {
            1, 1, 1
        });
        aflag29 = new boolean[3];
        aflag29[2] = true;
        aflag30 = new boolean[3];
        aflag30[2] = true;
        aflag31 = new boolean[3];
        aflag31[2] = true;
        aflag32 = new boolean[3];
        aflag32[2] = true;
        MAP_IOIO0004 = (new boolean[][] {
            obj, ai, ai1, ai2, aflag1, aflag2, aflag3, aflag4, aflag5, aflag6, 
            aflag7, aflag8, aflag9, aflag10, aflag11, aflag12, aflag13, aflag14, aflag15, aflag16, 
            aflag17, aflag18, aflag19, aflag20, aflag21, aflag22, aflag23, aflag24, aflag25, aflag26, 
            aflag27, new boolean[] {
                1, 1, 1
            }, aflag33, aflag28, aflag34, aflag35, aflag36, new boolean[] {
                1, 1, 1
            }, aflag37, aflag38, 
            new boolean[] {
                1, 1, 1
            }, aflag29, aflag30, aflag31, aflag32, new boolean[] {
                1, 1, 1
            }, new boolean[] {
                1, 1, 1
            }
        });
        obj = MAP_IOIO0002_IOIO0003;
        ai = new int[3];
        ai[1] = 2;
        ai[2] = 4;
        IOIO0002 = new <init>(((boolean [][]) (obj)), 9, 4, 3, ai, new int[] {
            6, 7, 8
        }, new int[][] {
            new int[] {
                4, 5
            }, new int[] {
                47, 48
            }, new int[] {
                26, 25
            }
        }, new int[] {
            36, 37, 38
        });
        IOIO0003 = IOIO0002;
        boolean aflag[][] = MAP_IOIO0004;
        ai = new int[3];
        ai[1] = 2;
        ai[2] = 4;
        ai1 = (new int[] {
            4, 5
        });
        ai2 = (new int[] {
            26, 25
        });
        IOIO0004 = new <init>(aflag, 9, 4, 3, ai, new int[] {
            6, 7, 8
        }, new int[][] {
            ai1, new int[] {
                1, 2
            }, ai2
        }, new int[] {
            36, 37, 38
        });
    }

    private Function(boolean aflag[][], int i, int j, int k, int ai[], int ai1[], int ai2[][], 
            int ai3[])
    {
        if (aflag == null)
        {
            throw new IllegalArgumentException("WTF");
        } else
        {
            map_ = aflag;
            numPwmModules_ = i;
            numUartModules_ = j;
            numSpiModules_ = k;
            incapSingleModules_ = ai1;
            incapDoubleModules_ = ai;
            twiPins_ = ai2;
            icspPins_ = ai3;
            return;
        }
    }
}
