// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

// Referenced classes of package org.apache.commons.net.ftp:
//            FTPClient

private static class 
{

    static final Properties PROPERTIES;

    static 
    {
        Properties properties;
        Object obj;
        obj = org/apache/commons/net/ftp/FTPClient.getResourceAsStream("/systemType.properties");
        properties = null;
        if (obj == null)
        {
            break MISSING_BLOCK_LABEL_31;
        }
        properties = new Properties();
        properties.load(((InputStream) (obj)));
        Exception exception;
        IOException ioexception2;
        try
        {
            ((InputStream) (obj)).close();
        }
        catch (IOException ioexception) { }
        PROPERTIES = properties;
        return;
        ioexception2;
        try
        {
            ((InputStream) (obj)).close();
        }
        // Misplaced declaration of an exception variable
        catch (Object obj) { }
        if (true)
        {
            break MISSING_BLOCK_LABEL_31;
        }
        exception;
        try
        {
            ((InputStream) (obj)).close();
        }
        catch (IOException ioexception1) { }
        throw exception;
    }

    private ()
    {
    }
}
