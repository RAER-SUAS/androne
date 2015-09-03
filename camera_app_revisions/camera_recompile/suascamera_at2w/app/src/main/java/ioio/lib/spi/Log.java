// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.spi;


public class Log
{

    public Log()
    {
    }

    public static void d(String s, String s1)
    {
        android.util.Log.d(s, s1);
    }

    public static void e(String s, String s1)
    {
        android.util.Log.e(s, s1);
    }

    public static void e(String s, String s1, Throwable throwable)
    {
        android.util.Log.e(s, s1, throwable);
    }

    public static void i(String s, String s1)
    {
        android.util.Log.i(s, s1);
    }

    public static int println(int j, String s, String s1)
    {
        return android.util.Log.println(j, s, s1);
    }

    public static void v(String s, String s1)
    {
        android.util.Log.v(s, s1);
    }

    public static void w(String s, String s1)
    {
        android.util.Log.w(s, s1);
    }

    public static void w(String s, String s1, Throwable throwable)
    {
        android.util.Log.w(s, s1);
    }
}
