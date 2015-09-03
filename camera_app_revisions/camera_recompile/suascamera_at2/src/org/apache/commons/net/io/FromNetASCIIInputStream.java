// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.io;

import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.io.UnsupportedEncodingException;

public final class FromNetASCIIInputStream extends PushbackInputStream
{

    static final String _lineSeparator = System.getProperty("line.separator");
    static final byte _lineSeparatorBytes[];
    static final boolean _noConversionRequired = _lineSeparator.equals("\r\n");
    private int __length;

    public FromNetASCIIInputStream(InputStream inputstream)
    {
        super(inputstream, _lineSeparatorBytes.length + 1);
        __length = 0;
    }

    private int __read()
        throws IOException
    {
        byte byte0 = 13;
        int j = super.read();
        int i = j;
        if (j == 13)
        {
            int k = super.read();
            if (k == 10)
            {
                unread(_lineSeparatorBytes);
                i = super.read();
                __length = __length - 1;
            } else
            {
                i = byte0;
                if (k != -1)
                {
                    unread(k);
                    return 13;
                }
            }
        }
        return i;
    }

    public static final boolean isConversionRequired()
    {
        return !_noConversionRequired;
    }

    public int available()
        throws IOException
    {
        if (in == null)
        {
            throw new IOException("Stream closed");
        } else
        {
            return (buf.length - pos) + in.available();
        }
    }

    public int read()
        throws IOException
    {
        if (_noConversionRequired)
        {
            return super.read();
        } else
        {
            return __read();
        }
    }

    public int read(byte abyte0[])
        throws IOException
    {
        return read(abyte0, 0, abyte0.length);
    }

    public int read(byte abyte0[], int i, int j)
        throws IOException
    {
        byte byte0 = -1;
        if (_noConversionRequired)
        {
            j = super.read(abyte0, i, j);
        } else
        {
            if (j < 1)
            {
                return 0;
            }
            int l = available();
            if (j > l)
            {
                j = l;
            }
            __length = j;
            if (__length < 1)
            {
                __length = 1;
            }
            l = __read();
            j = byte0;
            if (l != -1)
            {
                j = i;
                int k = l;
                do
                {
                    int i1 = j;
                    j = i1 + 1;
                    abyte0[i1] = (byte)k;
                    k = __length - 1;
                    __length = k;
                    if (k <= 0)
                    {
                        break;
                    }
                    k = __read();
                } while (k != -1);
                return j - i;
            }
        }
        return j;
    }

    static 
    {
        try
        {
            _lineSeparatorBytes = _lineSeparator.getBytes("US-ASCII");
        }
        catch (UnsupportedEncodingException unsupportedencodingexception)
        {
            throw new RuntimeException("Broken JVM - cannot find US-ASCII charset!", unsupportedencodingexception);
        }
    }
}
