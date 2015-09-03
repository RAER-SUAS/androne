// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.smtp;

import java.util.Enumeration;
import java.util.Vector;

public final class RelayPath
{

    String _emailAddress;
    Vector _path;

    public RelayPath(String s)
    {
        _path = new Vector();
        _emailAddress = s;
    }

    public void addRelay(String s)
    {
        _path.addElement(s);
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append('<');
        Enumeration enumeration = _path.elements();
        if (enumeration.hasMoreElements())
        {
            stringbuilder.append('@');
            stringbuilder.append((String)enumeration.nextElement());
            for (; enumeration.hasMoreElements(); stringbuilder.append((String)enumeration.nextElement()))
            {
                stringbuilder.append(",@");
            }

            stringbuilder.append(':');
        }
        stringbuilder.append(_emailAddress);
        stringbuilder.append('>');
        return stringbuilder.toString();
    }
}
