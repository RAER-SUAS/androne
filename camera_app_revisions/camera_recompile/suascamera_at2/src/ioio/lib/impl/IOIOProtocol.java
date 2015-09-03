// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.spi.Log;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

class IOIOProtocol
{
    public static interface IncomingHandler
    {

        public abstract void handleAnalogPinStatus(int i, boolean flag);

        public abstract void handleCheckInterfaceResponse(boolean flag);

        public abstract void handleConnectionLost();

        public abstract void handleEstablishConnection(byte abyte0[], byte abyte1[], byte abyte2[]);

        public abstract void handleI2cClose(int i);

        public abstract void handleI2cOpen(int i);

        public abstract void handleI2cReportTxStatus(int i, int j);

        public abstract void handleI2cResult(int i, int j, byte abyte0[]);

        public abstract void handleIcspClose();

        public abstract void handleIcspOpen();

        public abstract void handleIcspReportRxStatus(int i);

        public abstract void handleIcspResult(int i, byte abyte0[]);

        public abstract void handleIncapClose(int i);

        public abstract void handleIncapOpen(int i);

        public abstract void handleIncapReport(int i, int j, byte abyte0[]);

        public abstract void handleRegisterPeriodicDigitalSampling(int i, int j);

        public abstract void handleReportAnalogInStatus(List list, List list1);

        public abstract void handleReportDigitalInStatus(int i, boolean flag);

        public abstract void handleReportPeriodicDigitalInStatus(int i, boolean aflag[]);

        public abstract void handleSetChangeNotify(int i, boolean flag);

        public abstract void handleSoftReset();

        public abstract void handleSpiClose(int i);

        public abstract void handleSpiData(int i, int j, byte abyte0[], int k);

        public abstract void handleSpiOpen(int i);

        public abstract void handleSpiReportTxStatus(int i, int j);

        public abstract void handleUartClose(int i);

        public abstract void handleUartData(int i, int j, byte abyte0[]);

        public abstract void handleUartOpen(int i);

        public abstract void handleUartReportTxStatus(int i, int j);
    }

    class IncomingThread extends Thread
    {

        private Set addedPins_;
        private List analogFramePins_;
        private List analogPinValues_;
        private byte inbuf_[];
        private List newFramePins_;
        private int readOffset_;
        private Set removedPins_;
        final IOIOProtocol this$0;
        private int validBytes_;

        private void calculateAnalogFrameDelta()
        {
            removedPins_.clear();
            removedPins_.addAll(analogFramePins_);
            addedPins_.clear();
            addedPins_.addAll(newFramePins_);
            Object obj = removedPins_.iterator();
            do
            {
                Integer integer;
                do
                {
                    if (!((Iterator) (obj)).hasNext())
                    {
                        obj = analogFramePins_;
                        analogFramePins_ = newFramePins_;
                        newFramePins_ = ((List) (obj));
                        return;
                    }
                    integer = (Integer)((Iterator) (obj)).next();
                } while (!addedPins_.contains(integer));
                ((Iterator) (obj)).remove();
                addedPins_.remove(integer);
            } while (true);
        }

        private void fillBuf()
            throws IOException
        {
            try
            {
                validBytes_ = in_.read(inbuf_, 0, inbuf_.length);
                if (validBytes_ <= 0)
                {
                    throw new IOException("Unexpected stream closure");
                }
            }
            catch (IOException ioexception)
            {
                Log.i("IOIOProtocol", "IOIO disconnected");
                throw ioexception;
            }
            readOffset_ = 0;
            return;
        }

        private int readByte()
            throws IOException
        {
            if (readOffset_ == validBytes_)
            {
                fillBuf();
            }
            byte abyte0[] = inbuf_;
            int i = readOffset_;
            readOffset_ = i + 1;
            return abyte0[i] & 0xff;
        }

        private void readBytes(int i, byte abyte0[])
            throws IOException
        {
            int j = 0;
            do
            {
                if (j >= i)
                {
                    return;
                }
                abyte0[j] = (byte)readByte();
                j++;
            } while (true);
        }

        public void run()
        {
            Object obj;
            super.run();
            setPriority(10);
            obj = new byte[256];
_L6:
            int i = readByte();
            i;
            JVM INSTR tableswitch 0 29: default 1456
        //                       0 222
        //                       1 325
        //                       2 1183
        //                       3 160
        //                       4 349
        //                       5 16
        //                       6 389
        //                       7 16
        //                       8 160
        //                       9 160
        //                       10 160
        //                       11 582
        //                       12 429
        //                       13 798
        //                       14 731
        //                       15 690
        //                       16 970
        //                       17 851
        //                       18 929
        //                       19 1023
        //                       20 1076
        //                       21 1142
        //                       22 1219
        //                       23 1254
        //                       24 160
        //                       25 160
        //                       26 1287
        //                       27 1327
        //                       28 1382
        //                       29 1437;
               goto _L1 _L2 _L3 _L4 _L1 _L5 _L6 _L7 _L6 _L1 _L1 _L1 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20 _L1 _L1 _L21 _L22 _L23 _L24
_L1:
            try
            {
                in_.close();
                obj = new IOException((new StringBuilder("Received unexpected command: 0x")).append(Integer.toHexString(i)).toString());
                Log.e("IOIOProtocol", "Protocol error", ((Throwable) (obj)));
                throw obj;
            }
            // Misplaced declaration of an exception variable
            catch (Object obj)
            {
                handler_.handleConnectionLost();
            }
            return;
_L2:
            if (readByte() != 73 || readByte() != 79 || readByte() != 73 || readByte() != 79)
            {
                throw new IOException("Bad establish connection magic");
            }
            byte abyte0[] = new byte[8];
            byte abyte1[] = new byte[8];
            byte abyte2[] = new byte[8];
            readBytes(8, abyte0);
            readBytes(8, abyte1);
            readBytes(8, abyte2);
            handler_.handleEstablishConnection(abyte0, abyte1, abyte2);
              goto _L6
_L3:
            analogFramePins_.clear();
            handler_.handleSoftReset();
              goto _L6
_L5:
            Object obj1;
            i = readByte();
            obj1 = handler_;
            int j;
            int j1;
            boolean flag;
            if ((i & 1) == 1)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            ((IncomingHandler) (obj1)).handleReportDigitalInStatus(i >> 2, flag);
              goto _L6
_L7:
            i = readByte();
            obj1 = handler_;
            if ((i & 1) == 1)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            ((IncomingHandler) (obj1)).handleSetChangeNotify(i >> 2, flag);
              goto _L6
_L9:
            j = readByte();
            newFramePins_.clear();
            i = 0;
_L29:
            if (i < j) goto _L26; else goto _L25
_L25:
            calculateAnalogFrameDelta();
            obj1 = removedPins_.iterator();
_L30:
            if (((Iterator) (obj1)).hasNext()) goto _L28; else goto _L27
_L27:
            obj1 = addedPins_.iterator();
            while (((Iterator) (obj1)).hasNext()) 
            {
                Integer integer = (Integer)((Iterator) (obj1)).next();
                handler_.handleAnalogPinStatus(integer.intValue(), true);
            }
              goto _L6
_L26:
            newFramePins_.add(Integer.valueOf(readByte()));
            i++;
              goto _L29
_L28:
            Integer integer1 = (Integer)((Iterator) (obj1)).next();
            handler_.handleAnalogPinStatus(integer1.intValue(), false);
              goto _L30
_L8:
            j1 = analogFramePins_.size();
            i = 0;
            analogPinValues_.clear();
            j = 0;
_L35:
            if (j < j1) goto _L32; else goto _L31
_L31:
            handler_.handleReportAnalogInStatus(analogFramePins_, analogPinValues_);
              goto _L6
_L32:
            if (j % 4 != 0) goto _L34; else goto _L33
_L33:
            i = readByte();
_L34:
            analogPinValues_.add(Integer.valueOf(readByte() << 2 | i & 3));
            i >>= 2;
            j++;
              goto _L35
_L12:
            i = readByte();
            j = readByte();
            handler_.handleUartReportTxStatus(i & 3, i >> 2 | j << 6);
              goto _L6
_L11:
            j = readByte();
            i = 0;
_L38:
            if (i < (j & 0x3f) + 1) goto _L37; else goto _L36
_L36:
            handler_.handleUartData(j >> 6, (j & 0x3f) + 1, ((byte []) (obj)));
              goto _L6
_L37:
            obj[i] = (byte)readByte();
            i++;
              goto _L38
_L10:
            i = readByte();
            if ((i & 0x80) == 0) goto _L40; else goto _L39
_L39:
            handler_.handleUartOpen(i & 3);
              goto _L6
_L40:
            handler_.handleUartClose(i & 3);
              goto _L6
_L14:
            j = readByte();
            j1 = readByte();
            i = 0;
_L43:
            if (i < (j & 0x3f) + 1) goto _L42; else goto _L41
_L41:
            handler_.handleSpiData(j >> 6, j1 & 0x3f, ((byte []) (obj)), (j & 0x3f) + 1);
              goto _L6
_L42:
            obj[i] = (byte)readByte();
            i++;
              goto _L43
_L15:
            i = readByte();
            j = readByte();
            handler_.handleSpiReportTxStatus(i & 3, i >> 2 | j << 6);
              goto _L6
_L13:
            i = readByte();
            if ((i & 0x80) == 0) goto _L45; else goto _L44
_L44:
            handler_.handleSpiOpen(i & 3);
              goto _L6
_L45:
            handler_.handleSpiClose(i & 3);
              goto _L6
_L16:
            i = readByte();
            if ((i & 0x80) == 0) goto _L47; else goto _L46
_L46:
            handler_.handleI2cOpen(i & 3);
              goto _L6
_L47:
            handler_.handleI2cClose(i & 3);
              goto _L6
_L17:
            j = readByte();
            j1 = readByte();
            if (j1 == 255) goto _L49; else goto _L48
_L48:
            i = 0;
              goto _L50
_L49:
            handler_.handleI2cResult(j & 3, j1, ((byte []) (obj)));
              goto _L6
_L55:
            obj[i] = (byte)readByte();
            i++;
            continue; /* Loop/switch isn't completed */
_L18:
            i = readByte();
            int k = readByte();
            handler_.handleI2cReportTxStatus(i & 3, i >> 2 | k << 6);
              goto _L6
_L4:
            i = readByte();
            obj1 = handler_;
            if ((i & 1) == 1)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            ((IncomingHandler) (obj1)).handleCheckInterfaceResponse(flag);
              goto _L6
_L19:
            i = readByte();
            int l = readByte();
            handler_.handleIcspReportRxStatus(l << 8 | i);
              goto _L6
_L20:
            obj[0] = (byte)readByte();
            obj[1] = (byte)readByte();
            handler_.handleIcspResult(2, ((byte []) (obj)));
              goto _L6
_L21:
            if ((readByte() & 1) != 1) goto _L52; else goto _L51
_L51:
            handler_.handleIcspOpen();
              goto _L6
_L52:
            handler_.handleIcspClose();
              goto _L6
_L22:
            i = readByte();
            if ((i & 0x80) == 0) goto _L54; else goto _L53
_L53:
            handler_.handleIncapOpen(i & 0xf);
              goto _L6
_L54:
            handler_.handleIncapClose(i & 0xf);
              goto _L6
_L23:
            j1 = readByte();
            int i1 = j1 >> 6;
            i = i1;
            if (i1 == 0)
            {
                i = 4;
            }
            readBytes(i, ((byte []) (obj)));
            handler_.handleIncapReport(j1 & 0xf, i, ((byte []) (obj)));
              goto _L6
_L24:
            Log.d("IOIOProtocol", "Received soft close.");
            throw new IOException("Soft close");
_L50:
            if (i < j1) goto _L55; else goto _L49
        }

        IncomingThread()
        {
            this$0 = IOIOProtocol.this;
            super();
            readOffset_ = 0;
            validBytes_ = 0;
            inbuf_ = new byte[64];
            analogPinValues_ = new ArrayList();
            analogFramePins_ = new ArrayList();
            newFramePins_ = new ArrayList();
            removedPins_ = new HashSet();
            addedPins_ = new HashSet();
        }
    }

    static final class PwmScale extends Enum
    {

        private static final PwmScale ENUM$VALUES[];
        public static final PwmScale SCALE_1X;
        public static final PwmScale SCALE_256X;
        public static final PwmScale SCALE_64X;
        public static final PwmScale SCALE_8X;
        private final int encoding;
        public final int scale;

        public static PwmScale valueOf(String s)
        {
            return (PwmScale)Enum.valueOf(ioio/lib/impl/IOIOProtocol$PwmScale, s);
        }

        public static PwmScale[] values()
        {
            PwmScale apwmscale[] = ENUM$VALUES;
            int i = apwmscale.length;
            PwmScale apwmscale1[] = new PwmScale[i];
            System.arraycopy(apwmscale, 0, apwmscale1, 0, i);
            return apwmscale1;
        }

        static 
        {
            SCALE_1X = new PwmScale("SCALE_1X", 0, 1, 0);
            SCALE_8X = new PwmScale("SCALE_8X", 1, 8, 3);
            SCALE_64X = new PwmScale("SCALE_64X", 2, 64, 2);
            SCALE_256X = new PwmScale("SCALE_256X", 3, 256, 1);
            ENUM$VALUES = (new PwmScale[] {
                SCALE_1X, SCALE_8X, SCALE_64X, SCALE_256X
            });
        }


        private PwmScale(String s, int i, int j, int k)
        {
            super(s, i);
            scale = j;
            encoding = k;
        }
    }


    static final boolean $assertionsDisabled;
    static final int CHECK_INTERFACE = 2;
    static final int CHECK_INTERFACE_RESPONSE = 2;
    static final int ESTABLISH_CONNECTION = 0;
    static final int HARD_RESET = 0;
    static final int I2C_CONFIGURE_MASTER = 19;
    static final int I2C_REPORT_TX_STATUS = 21;
    static final int I2C_RESULT = 20;
    static final int I2C_STATUS = 19;
    static final int I2C_WRITE_READ = 20;
    static final int ICSP_CONFIG = 26;
    static final int ICSP_PROG_ENTER = 24;
    static final int ICSP_PROG_EXIT = 25;
    static final int ICSP_REGOUT = 23;
    static final int ICSP_REPORT_RX_STATUS = 22;
    static final int ICSP_RESULT = 23;
    static final int ICSP_SIX = 22;
    static final int INCAP_CONFIGURE = 27;
    static final int INCAP_REPORT = 28;
    static final int INCAP_STATUS = 27;
    static final int REGISTER_PERIODIC_DIGITAL_SAMPLING = 7;
    static final int REPORT_ANALOG_IN_FORMAT = 12;
    static final int REPORT_ANALOG_IN_STATUS = 11;
    static final int REPORT_DIGITAL_IN_STATUS = 4;
    static final int REPORT_PERIODIC_DIGITAL_IN_STATUS = 5;
    static final int SCALE_DIV[] = {
        31, 30, 29, 28, 27, 26, 23, 22, 21, 20, 
        19, 18, 15, 14, 13, 12, 11, 10, 7, 6, 
        5, 4, 3, 2, 1
    };
    static final int SET_ANALOG_IN_SAMPLING = 12;
    static final int SET_CHANGE_NOTIFY = 6;
    static final int SET_DIGITAL_OUT_LEVEL = 4;
    static final int SET_PIN_ANALOG_IN = 11;
    static final int SET_PIN_DIGITAL_IN = 5;
    static final int SET_PIN_DIGITAL_OUT = 3;
    static final int SET_PIN_INCAP = 28;
    static final int SET_PIN_PWM = 8;
    static final int SET_PIN_SPI = 18;
    static final int SET_PIN_UART = 15;
    static final int SET_PWM_DUTY_CYCLE = 9;
    static final int SET_PWM_PERIOD = 10;
    static final int SOFT_CLOSE = 29;
    static final int SOFT_RESET = 1;
    static final int SPI_CONFIGURE_MASTER = 16;
    static final int SPI_DATA = 17;
    static final int SPI_MASTER_REQUEST = 17;
    static final int SPI_REPORT_TX_STATUS = 18;
    static final int SPI_STATUS = 16;
    private static final String TAG = "IOIOProtocol";
    static final int UART_CONFIG = 13;
    static final int UART_DATA = 14;
    static final int UART_REPORT_TX_STATUS = 15;
    static final int UART_STATUS = 13;
    private int batchCounter_;
    private final IncomingHandler handler_;
    private final InputStream in_;
    private final OutputStream out_;
    private byte outbuf_[];
    private int pos_;
    private final IncomingThread thread_ = new IncomingThread();

    public IOIOProtocol(InputStream inputstream, OutputStream outputstream, IncomingHandler incominghandler)
    {
        outbuf_ = new byte[256];
        pos_ = 0;
        batchCounter_ = 0;
        in_ = inputstream;
        out_ = outputstream;
        handler_ = incominghandler;
        thread_.start();
    }

    private void flush()
        throws IOException
    {
        out_.write(outbuf_, 0, pos_);
        pos_ = 0;
        return;
        Exception exception;
        exception;
        pos_ = 0;
        throw exception;
    }

    private void writeByte(int i)
        throws IOException
    {
        if (!$assertionsDisabled && (i < 0 || i >= 256))
        {
            throw new AssertionError();
        }
        if (pos_ == outbuf_.length)
        {
            flush();
        }
        byte abyte0[] = outbuf_;
        int j = pos_;
        pos_ = j + 1;
        abyte0[j] = (byte)i;
    }

    private void writeThreeBytes(int i)
        throws IOException
    {
        writeByte(i & 0xff);
        writeByte(i >> 8 & 0xff);
        writeByte(i >> 16 & 0xff);
    }

    private void writeTwoBytes(int i)
        throws IOException
    {
        writeByte(i & 0xff);
        writeByte(i >> 8);
    }

    public void beginBatch()
    {
        this;
        JVM INSTR monitorenter ;
        batchCounter_ = batchCounter_ + 1;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void checkInterface(byte abyte0[])
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (abyte0.length != 8)
        {
            throw new IllegalArgumentException("interface ID must be exactly 8 bytes long");
        }
        break MISSING_BLOCK_LABEL_24;
        abyte0;
        this;
        JVM INSTR monitorexit ;
        throw abyte0;
        beginBatch();
        writeByte(2);
        int i = 0;
_L2:
        if (i < 8)
        {
            break MISSING_BLOCK_LABEL_48;
        }
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        writeByte(abyte0[i]);
        i++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void endBatch()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        int i;
        i = batchCounter_ - 1;
        batchCounter_ = i;
        if (i != 0)
        {
            break MISSING_BLOCK_LABEL_22;
        }
        flush();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void hardReset()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(0);
        writeByte(73);
        writeByte(79);
        writeByte(73);
        writeByte(79);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void i2cClose(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(19);
        writeByte(i);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void i2cConfigureMaster(int i, ioio.lib.api.TwiMaster.Rate rate, boolean flag)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (rate != ioio.lib.api.TwiMaster.Rate.RATE_1MHz) goto _L2; else goto _L1
_L1:
        byte byte0 = 3;
_L4:
        beginBatch();
        writeByte(19);
        ioio.lib.api.TwiMaster.Rate rate1;
        char c;
        if (flag)
        {
            c = '\200';
        } else
        {
            c = '\0';
        }
        writeByte(c | byte0 << 5 | i);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        rate1 = ioio.lib.api.TwiMaster.Rate.RATE_400KHz;
        if (rate == rate1)
        {
            byte0 = 2;
        } else
        {
            byte0 = 1;
        }
        if (true) goto _L4; else goto _L3
_L3:
        rate;
        throw rate;
    }

    public void i2cWriteRead(int i, boolean flag, int j, int k, int l, byte abyte0[])
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(20);
        byte byte0;
        if (flag)
        {
            byte0 = 32;
        } else
        {
            byte0 = 0;
        }
        writeByte(byte0 | (j >> 8) << 6 | i);
        writeByte(j & 0xff);
        writeByte(k);
        writeByte(l);
        i = 0;
_L2:
        if (i < k)
        {
            break MISSING_BLOCK_LABEL_78;
        }
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        writeByte(abyte0[i] & 0xff);
        i++;
        if (true) goto _L2; else goto _L1
_L1:
        abyte0;
        throw abyte0;
    }

    public void icspClose()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(26);
        writeByte(0);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void icspEnter()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(24);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void icspExit()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(25);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void icspOpen()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(26);
        writeByte(1);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void icspRegout()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(23);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void icspSix(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(22);
        writeThreeBytes(i);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void incapClose(int i, boolean flag)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(27);
        writeByte(i);
        if (flag)
        {
            i = 128;
        } else
        {
            i = 0;
        }
        writeByte(i);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void incapConfigure(int i, boolean flag, int j, int k)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(27);
        writeByte(i);
        if (flag)
        {
            i = 128;
        } else
        {
            i = 0;
        }
        writeByte(i | j << 3 | k);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void registerPeriodicDigitalSampling(int i, int j)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
    }

    public void setAnalogInSampling(int i, boolean flag)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(12);
        char c;
        if (flag)
        {
            c = '\200';
        } else
        {
            c = '\0';
        }
        writeByte(c | i & 0x3f);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setChangeNotify(int i, boolean flag)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(6);
        boolean flag1;
        if (flag)
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        writeByte(flag1 | i << 2);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setDigitalOutLevel(int i, boolean flag)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(4);
        boolean flag1;
        if (flag)
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        writeByte(flag1 | i << 2);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setPinAnalogIn(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(11);
        writeByte(i);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setPinDigitalIn(int i, ioio.lib.api.DigitalInput.Spec.Mode mode)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        byte byte0 = 0;
        if (mode != ioio.lib.api.DigitalInput.Spec.Mode.PULL_UP) goto _L2; else goto _L1
_L1:
        byte0 = 1;
_L4:
        beginBatch();
        writeByte(5);
        writeByte(i << 2 | byte0);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        ioio.lib.api.DigitalInput.Spec.Mode mode1 = ioio.lib.api.DigitalInput.Spec.Mode.PULL_DOWN;
        if (mode == mode1)
        {
            byte0 = 2;
        }
        if (true) goto _L4; else goto _L3
_L3:
        mode;
        throw mode;
    }

    public void setPinDigitalOut(int i, boolean flag, ioio.lib.api.DigitalOutput.Spec.Mode mode)
        throws IOException
    {
        byte byte0 = 0;
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(3);
        boolean flag1;
        if (mode == ioio.lib.api.DigitalOutput.Spec.Mode.OPEN_DRAIN)
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        if (flag)
        {
            byte0 = 2;
        }
          goto _L1
_L3:
        writeByte(byte0 | (flag1 | i << 2));
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        mode;
        throw mode;
_L1:
        if (true) goto _L3; else goto _L2
_L2:
    }

    public void setPinIncap(int i, int j, boolean flag)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(28);
        writeByte(i);
        if (flag)
        {
            i = 128;
        } else
        {
            i = 0;
        }
        writeByte(i | j);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setPinPwm(int i, int j, boolean flag)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(8);
        writeByte(i & 0x3f);
        if (flag)
        {
            i = 128;
        } else
        {
            i = 0;
        }
        writeByte(i | j & 0xf);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setPinSpi(int i, int j, boolean flag, int k)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(18);
        writeByte(i);
        writeByte(j << 2 | 0x10 | k);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setPinUart(int i, int j, boolean flag, boolean flag1)
        throws IOException
    {
        byte byte0 = 0;
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(15);
        writeByte(i);
        Exception exception;
        if (flag1)
        {
            i = 128;
        } else
        {
            i = 0;
        }
        if (flag)
        {
            byte0 = 64;
        }
          goto _L1
_L3:
        writeByte(byte0 | i | j);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        exception;
        throw exception;
_L1:
        if (true) goto _L3; else goto _L2
_L2:
    }

    public void setPwmDutyCycle(int i, int j, int k)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(9);
        writeByte(i << 2 | k);
        writeTwoBytes(j);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setPwmPeriod(int i, int j, PwmScale pwmscale)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(10);
        writeByte((pwmscale.encoding & 2) << 6 | i << 1 | pwmscale.encoding & 1);
        writeTwoBytes(j);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        pwmscale;
        throw pwmscale;
    }

    public void softClose()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(29);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void softReset()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(1);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void spiClose(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(16);
        writeByte(i << 5);
        writeByte(0);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void spiConfigureMaster(int i, ioio.lib.api.SpiMaster.Config config)
        throws IOException
    {
        boolean flag = false;
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(16);
        writeByte(i << 5 | SCALE_DIV[config.rate.ordinal()]);
        if (config.sampleOnTrailing)
        {
            i = 0;
        } else
        {
            i = 2;
        }
        if (config.invertClk)
        {
            flag = true;
        }
        writeByte(flag | i);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        config;
        throw config;
    }

    public void spiMasterRequest(int i, int j, byte abyte0[], int k, int l, int i1)
        throws IOException
    {
        boolean flag1 = true;
        boolean flag2 = false;
        this;
        JVM INSTR monitorenter ;
        boolean flag;
        if (k != l)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        if (i1 == l)
        {
            flag1 = false;
        }
        beginBatch();
        writeByte(17);
        writeByte(i << 6 | j);
        {
            if (flag)
            {
                i = 128;
            } else
            {
                i = 0;
            }
            j = ((flag2) ? 1 : 0);
            if (flag1)
            {
                j = 64;
            }
        }
          goto _L1
_L4:
        writeByte(j | i | l - 1);
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_80;
        }
        writeByte(k);
        if (!flag1)
        {
            break MISSING_BLOCK_LABEL_161;
        }
        writeByte(i1);
        break MISSING_BLOCK_LABEL_161;
_L2:
        i++;
        for (; i < k; i = 0)
        {
            break MISSING_BLOCK_LABEL_124;
        }

        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        writeByte(abyte0[i] & 0xff);
          goto _L2
        abyte0;
        throw abyte0;
_L1:
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void uartClose(int i)
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        beginBatch();
        writeByte(13);
        writeByte(i << 6);
        writeTwoBytes(0);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void uartConfigure(int i, int j, boolean flag, ioio.lib.api.Uart.StopBits stopbits, ioio.lib.api.Uart.Parity parity)
        throws IOException
    {
        byte byte2 = 0;
        this;
        JVM INSTR monitorenter ;
        if (parity != ioio.lib.api.Uart.Parity.EVEN) goto _L2; else goto _L1
_L1:
        byte byte0 = 1;
_L4:
        beginBatch();
        writeByte(13);
        ioio.lib.api.Uart.Parity parity1;
        byte byte1;
        if (flag)
        {
            byte1 = 8;
        } else
        {
            byte1 = 0;
        }
        if (stopbits == ioio.lib.api.Uart.StopBits.TWO)
        {
            byte2 = 4;
        }
        writeByte(byte2 | (byte1 | i << 6) | byte0);
        writeTwoBytes(j);
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        parity1 = ioio.lib.api.Uart.Parity.ODD;
        if (parity == parity1)
        {
            byte0 = 2;
        } else
        {
            byte0 = 0;
        }
        if (true) goto _L4; else goto _L3
_L3:
        stopbits;
        throw stopbits;
    }

    public void uartData(int i, int j, byte abyte0[])
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (j <= 64)
        {
            break MISSING_BLOCK_LABEL_38;
        }
        throw new IllegalArgumentException((new StringBuilder("A maximum of 64 bytes can be sent in one uartData message. Got: ")).append(j).toString());
        abyte0;
        this;
        JVM INSTR monitorexit ;
        throw abyte0;
        beginBatch();
        writeByte(14);
        writeByte(j - 1 | i << 6);
        i = 0;
_L2:
        if (i < j)
        {
            break MISSING_BLOCK_LABEL_74;
        }
        endBatch();
        this;
        JVM INSTR monitorexit ;
        return;
        writeByte(abyte0[i] & 0xff);
        i++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    static 
    {
        boolean flag;
        if (!ioio/lib/impl/IOIOProtocol.desiredAssertionStatus())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        $assertionsDisabled = flag;
    }


}
