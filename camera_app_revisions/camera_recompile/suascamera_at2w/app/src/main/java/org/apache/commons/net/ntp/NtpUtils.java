// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ntp;


// Referenced classes of package org.apache.commons.net.ntp:
//            NtpV3Packet

public final class NtpUtils
{

    public NtpUtils()
    {
    }

    public static String getHostAddress(int i)
    {
        return (new StringBuilder()).append(i >>> 24 & 0xff).append(".").append(i >>> 16 & 0xff).append(".").append(i >>> 8 & 0xff).append(".").append(i >>> 0 & 0xff).toString();
    }

    public static String getModeName(int i)
    {
        switch (i)
        {
        default:
            return "Unknown";

        case 0: // '\0'
            return "Reserved";

        case 1: // '\001'
            return "Symmetric Active";

        case 2: // '\002'
            return "Symmetric Passive";

        case 3: // '\003'
            return "Client";

        case 4: // '\004'
            return "Server";

        case 5: // '\005'
            return "Broadcast";

        case 6: // '\006'
            return "Control";

        case 7: // '\007'
            return "Private";
        }
    }

    public static String getRefAddress(NtpV3Packet ntpv3packet)
    {
        int i;
        if (ntpv3packet == null)
        {
            i = 0;
        } else
        {
            i = ntpv3packet.getReferenceId();
        }
        return getHostAddress(i);
    }

    public static String getReferenceClock(NtpV3Packet ntpv3packet)
    {
        if (ntpv3packet == null)
        {
            return "";
        }
        int j = ntpv3packet.getReferenceId();
        if (j == 0)
        {
            return "";
        }
        ntpv3packet = new StringBuilder(4);
        int i = 24;
        do
        {
            char c;
label0:
            {
                if (i >= 0)
                {
                    c = (char)(j >>> i & 0xff);
                    if (c != 0)
                    {
                        break label0;
                    }
                }
                return ntpv3packet.toString();
            }
            if (!Character.isLetterOrDigit(c))
            {
                return "";
            }
            ntpv3packet.append(c);
            i -= 8;
        } while (true);
    }
}
