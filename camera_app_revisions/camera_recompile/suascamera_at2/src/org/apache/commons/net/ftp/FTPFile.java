// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.Calendar;
import java.util.Formatter;

public class FTPFile
    implements Serializable
{

    public static final int DIRECTORY_TYPE = 1;
    public static final int EXECUTE_PERMISSION = 2;
    public static final int FILE_TYPE = 0;
    public static final int GROUP_ACCESS = 1;
    public static final int READ_PERMISSION = 0;
    public static final int SYMBOLIC_LINK_TYPE = 2;
    public static final int UNKNOWN_TYPE = 3;
    public static final int USER_ACCESS = 0;
    public static final int WORLD_ACCESS = 2;
    public static final int WRITE_PERMISSION = 1;
    private static final long serialVersionUID = 0x7d0cc2180c52bb3cL;
    private Calendar _date;
    private String _group;
    private int _hardLinkCount;
    private String _link;
    private String _name;
    private final boolean _permissions[][];
    private String _rawListing;
    private long _size;
    private int _type;
    private String _user;

    public FTPFile()
    {
        _permissions = (boolean[][])Array.newInstance(Boolean.TYPE, new int[] {
            3, 3
        });
        _rawListing = null;
        _type = 3;
        _hardLinkCount = 0;
        _size = -1L;
        _user = "";
        _group = "";
        _date = null;
        _name = null;
    }

    private char formatType()
    {
        switch (_type)
        {
        default:
            return '?';

        case 0: // '\0'
            return '-';

        case 1: // '\001'
            return 'd';

        case 2: // '\002'
            return 'l';
        }
    }

    private String permissionToString(int i)
    {
        StringBuilder stringbuilder = new StringBuilder();
        if (hasPermission(i, 0))
        {
            stringbuilder.append('r');
        } else
        {
            stringbuilder.append('-');
        }
        if (hasPermission(i, 1))
        {
            stringbuilder.append('w');
        } else
        {
            stringbuilder.append('-');
        }
        if (hasPermission(i, 2))
        {
            stringbuilder.append('x');
        } else
        {
            stringbuilder.append('-');
        }
        return stringbuilder.toString();
    }

    public String getGroup()
    {
        return _group;
    }

    public int getHardLinkCount()
    {
        return _hardLinkCount;
    }

    public String getLink()
    {
        return _link;
    }

    public String getName()
    {
        return _name;
    }

    public String getRawListing()
    {
        return _rawListing;
    }

    public long getSize()
    {
        return _size;
    }

    public Calendar getTimestamp()
    {
        return _date;
    }

    public int getType()
    {
        return _type;
    }

    public String getUser()
    {
        return _user;
    }

    public boolean hasPermission(int i, int j)
    {
        return _permissions[i][j];
    }

    public boolean isDirectory()
    {
        return _type == 1;
    }

    public boolean isFile()
    {
        return _type == 0;
    }

    public boolean isSymbolicLink()
    {
        return _type == 2;
    }

    public boolean isUnknown()
    {
        return _type == 3;
    }

    public void setGroup(String s)
    {
        _group = s;
    }

    public void setHardLinkCount(int i)
    {
        _hardLinkCount = i;
    }

    public void setLink(String s)
    {
        _link = s;
    }

    public void setName(String s)
    {
        _name = s;
    }

    public void setPermission(int i, int j, boolean flag)
    {
        _permissions[i][j] = flag;
    }

    public void setRawListing(String s)
    {
        _rawListing = s;
    }

    public void setSize(long l)
    {
        _size = l;
    }

    public void setTimestamp(Calendar calendar)
    {
        _date = calendar;
    }

    public void setType(int i)
    {
        _type = i;
    }

    public void setUser(String s)
    {
        _user = s;
    }

    public String toFormattedString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        Formatter formatter = new Formatter(stringbuilder);
        stringbuilder.append(formatType());
        stringbuilder.append(permissionToString(0));
        stringbuilder.append(permissionToString(1));
        stringbuilder.append(permissionToString(2));
        formatter.format(" %4d", new Object[] {
            Integer.valueOf(getHardLinkCount())
        });
        formatter.format(" %-8s %-8s", new Object[] {
            getGroup(), getUser()
        });
        formatter.format(" %8d", new Object[] {
            Long.valueOf(getSize())
        });
        Calendar calendar = getTimestamp();
        if (calendar != null)
        {
            formatter.format(" %1$tY-%1$tm-%1$td %1$tH:%1$tM:%1$tS", new Object[] {
                calendar
            });
            formatter.format(" %1$tZ", new Object[] {
                calendar
            });
            stringbuilder.append(' ');
        }
        stringbuilder.append(' ');
        stringbuilder.append(getName());
        formatter.close();
        return stringbuilder.toString();
    }

    public String toString()
    {
        return getRawListing();
    }
}
