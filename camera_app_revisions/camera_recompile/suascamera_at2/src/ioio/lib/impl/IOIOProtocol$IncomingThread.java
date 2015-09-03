// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.spi.Log;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

// Referenced classes of package ioio.lib.impl:
//            IOIOProtocol

class addedPins_ extends Thread
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
            validBytes_ = IOIOProtocol.access$0(IOIOProtocol.this).read(inbuf_, 0, inbuf_.length);
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
    //                   0 222
    //                   1 325
    //                   2 1183
    //                   3 160
    //                   4 349
    //                   5 16
    //                   6 389
    //                   7 16
    //                   8 160
    //                   9 160
    //                   10 160
    //                   11 582
    //                   12 429
    //                   13 798
    //                   14 731
    //                   15 690
    //                   16 970
    //                   17 851
    //                   18 929
    //                   19 1023
    //                   20 1076
    //                   21 1142
    //                   22 1219
    //                   23 1254
    //                   24 160
    //                   25 160
    //                   26 1287
    //                   27 1327
    //                   28 1382
    //                   29 1437;
           goto _L1 _L2 _L3 _L4 _L1 _L5 _L6 _L7 _L6 _L1 _L1 _L1 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20 _L1 _L1 _L21 _L22 _L23 _L24
_L1:
        try
        {
            IOIOProtocol.access$0(IOIOProtocol.this).close();
            obj = new IOException((new StringBuilder("Received unexpected command: 0x")).append(Integer.toHexString(i)).toString());
            Log.e("IOIOProtocol", "Protocol error", ((Throwable) (obj)));
            throw obj;
        }
        // Misplaced declaration of an exception variable
        catch (Object obj)
        {
            IOIOProtocol.access$1(IOIOProtocol.this).handleConnectionLost();
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
        IOIOProtocol.access$1(IOIOProtocol.this).handleEstablishConnection(abyte0, abyte1, abyte2);
          goto _L6
_L3:
        analogFramePins_.clear();
        IOIOProtocol.access$1(IOIOProtocol.this).handleSoftReset();
          goto _L6
_L5:
        Object obj1;
        i = readByte();
        obj1 = IOIOProtocol.access$1(IOIOProtocol.this);
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
        (() (obj1)).handleReportDigitalInStatus(i >> 2, flag);
          goto _L6
_L7:
        i = readByte();
        obj1 = IOIOProtocol.access$1(IOIOProtocol.this);
        if ((i & 1) == 1)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        (() (obj1)).handleSetChangeNotify(i >> 2, flag);
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
            IOIOProtocol.access$1(IOIOProtocol.this).handleAnalogPinStatus(integer.intValue(), true);
        }
          goto _L6
_L26:
        newFramePins_.add(Integer.valueOf(readByte()));
        i++;
          goto _L29
_L28:
        Integer integer1 = (Integer)((Iterator) (obj1)).next();
        IOIOProtocol.access$1(IOIOProtocol.this).handleAnalogPinStatus(integer1.intValue(), false);
          goto _L30
_L8:
        j1 = analogFramePins_.size();
        i = 0;
        analogPinValues_.clear();
        j = 0;
_L35:
        if (j < j1) goto _L32; else goto _L31
_L31:
        IOIOProtocol.access$1(IOIOProtocol.this).handleReportAnalogInStatus(analogFramePins_, analogPinValues_);
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
        IOIOProtocol.access$1(IOIOProtocol.this).handleUartReportTxStatus(i & 3, i >> 2 | j << 6);
          goto _L6
_L11:
        j = readByte();
        i = 0;
_L38:
        if (i < (j & 0x3f) + 1) goto _L37; else goto _L36
_L36:
        IOIOProtocol.access$1(IOIOProtocol.this).handleUartData(j >> 6, (j & 0x3f) + 1, ((byte []) (obj)));
          goto _L6
_L37:
        obj[i] = (byte)readByte();
        i++;
          goto _L38
_L10:
        i = readByte();
        if ((i & 0x80) == 0) goto _L40; else goto _L39
_L39:
        IOIOProtocol.access$1(IOIOProtocol.this).handleUartOpen(i & 3);
          goto _L6
_L40:
        IOIOProtocol.access$1(IOIOProtocol.this).handleUartClose(i & 3);
          goto _L6
_L14:
        j = readByte();
        j1 = readByte();
        i = 0;
_L43:
        if (i < (j & 0x3f) + 1) goto _L42; else goto _L41
_L41:
        IOIOProtocol.access$1(IOIOProtocol.this).handleSpiData(j >> 6, j1 & 0x3f, ((byte []) (obj)), (j & 0x3f) + 1);
          goto _L6
_L42:
        obj[i] = (byte)readByte();
        i++;
          goto _L43
_L15:
        i = readByte();
        j = readByte();
        IOIOProtocol.access$1(IOIOProtocol.this).handleSpiReportTxStatus(i & 3, i >> 2 | j << 6);
          goto _L6
_L13:
        i = readByte();
        if ((i & 0x80) == 0) goto _L45; else goto _L44
_L44:
        IOIOProtocol.access$1(IOIOProtocol.this).handleSpiOpen(i & 3);
          goto _L6
_L45:
        IOIOProtocol.access$1(IOIOProtocol.this).handleSpiClose(i & 3);
          goto _L6
_L16:
        i = readByte();
        if ((i & 0x80) == 0) goto _L47; else goto _L46
_L46:
        IOIOProtocol.access$1(IOIOProtocol.this).handleI2cOpen(i & 3);
          goto _L6
_L47:
        IOIOProtocol.access$1(IOIOProtocol.this).handleI2cClose(i & 3);
          goto _L6
_L17:
        j = readByte();
        j1 = readByte();
        if (j1 == 255) goto _L49; else goto _L48
_L48:
        i = 0;
          goto _L50
_L49:
        IOIOProtocol.access$1(IOIOProtocol.this).handleI2cResult(j & 3, j1, ((byte []) (obj)));
          goto _L6
_L55:
        obj[i] = (byte)readByte();
        i++;
        continue; /* Loop/switch isn't completed */
_L18:
        i = readByte();
        int k = readByte();
        IOIOProtocol.access$1(IOIOProtocol.this).handleI2cReportTxStatus(i & 3, i >> 2 | k << 6);
          goto _L6
_L4:
        i = readByte();
        obj1 = IOIOProtocol.access$1(IOIOProtocol.this);
        if ((i & 1) == 1)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        (() (obj1)).handleCheckInterfaceResponse(flag);
          goto _L6
_L19:
        i = readByte();
        int l = readByte();
        IOIOProtocol.access$1(IOIOProtocol.this).handleIcspReportRxStatus(l << 8 | i);
          goto _L6
_L20:
        obj[0] = (byte)readByte();
        obj[1] = (byte)readByte();
        IOIOProtocol.access$1(IOIOProtocol.this).handleIcspResult(2, ((byte []) (obj)));
          goto _L6
_L21:
        if ((readByte() & 1) != 1) goto _L52; else goto _L51
_L51:
        IOIOProtocol.access$1(IOIOProtocol.this).handleIcspOpen();
          goto _L6
_L52:
        IOIOProtocol.access$1(IOIOProtocol.this).handleIcspClose();
          goto _L6
_L22:
        i = readByte();
        if ((i & 0x80) == 0) goto _L54; else goto _L53
_L53:
        IOIOProtocol.access$1(IOIOProtocol.this).handleIncapOpen(i & 0xf);
          goto _L6
_L54:
        IOIOProtocol.access$1(IOIOProtocol.this).handleIncapClose(i & 0xf);
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
        IOIOProtocol.access$1(IOIOProtocol.this).handleIncapReport(j1 & 0xf, i, ((byte []) (obj)));
          goto _L6
_L24:
        Log.d("IOIOProtocol", "Received soft close.");
        throw new IOException("Soft close");
_L50:
        if (i < j1) goto _L55; else goto _L49
    }

    ()
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
