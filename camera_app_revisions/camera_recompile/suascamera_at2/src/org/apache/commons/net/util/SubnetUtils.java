// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SubnetUtils
{
    public final class SubnetInfo
    {

        final SubnetUtils this$0;

        private int address()
        {
            return SubnetUtils.this.address;
        }

        private int broadcast()
        {
            return SubnetUtils.this.broadcast;
        }

        private int high()
        {
            if (isInclusiveHostCount())
            {
                return broadcast();
            }
            if (broadcast() - network() > 1)
            {
                return broadcast() - 1;
            } else
            {
                return 0;
            }
        }

        private boolean isInRange(int i)
        {
            i -= low();
            return i >= 0 && i <= high() - low();
        }

        private int low()
        {
            if (isInclusiveHostCount())
            {
                return network();
            }
            if (broadcast() - network() > 1)
            {
                return network() + 1;
            } else
            {
                return 0;
            }
        }

        private int netmask()
        {
            return SubnetUtils.this.netmask;
        }

        private int network()
        {
            return SubnetUtils.this.network;
        }

        public int asInteger(String s)
        {
            return toInteger(s);
        }

        public String getAddress()
        {
            return format(toArray(address()));
        }

        public int getAddressCount()
        {
            int j = broadcast();
            int k = network();
            int i;
            if (isInclusiveHostCount())
            {
                i = 1;
            } else
            {
                i = -1;
            }
            j = (j - k) + i;
            i = j;
            if (j < 0)
            {
                i = 0;
            }
            return i;
        }

        public String[] getAllAddresses()
        {
            int i = getAddressCount();
            String as[] = new String[i];
            if (i != 0)
            {
                int k = low();
                int j = 0;
                while (k <= high()) 
                {
                    as[j] = format(toArray(k));
                    k++;
                    j++;
                }
            }
            return as;
        }

        public String getBroadcastAddress()
        {
            return format(toArray(broadcast()));
        }

        public String getCidrSignature()
        {
            return toCidrNotation(format(toArray(address())), format(toArray(netmask())));
        }

        public String getHighAddress()
        {
            return format(toArray(high()));
        }

        public String getLowAddress()
        {
            return format(toArray(low()));
        }

        public String getNetmask()
        {
            return format(toArray(netmask()));
        }

        public String getNetworkAddress()
        {
            return format(toArray(network()));
        }

        public boolean isInRange(String s)
        {
            return isInRange(toInteger(s));
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder();
            stringbuilder.append("CIDR Signature:\t[").append(getCidrSignature()).append("]").append(" Netmask: [").append(getNetmask()).append("]\n").append("Network:\t[").append(getNetworkAddress()).append("]\n").append("Broadcast:\t[").append(getBroadcastAddress()).append("]\n").append("First Address:\t[").append(getLowAddress()).append("]\n").append("Last Address:\t[").append(getHighAddress()).append("]\n").append("# Addresses:\t[").append(getAddressCount()).append("]\n");
            return stringbuilder.toString();
        }

        private SubnetInfo()
        {
            this$0 = SubnetUtils.this;
            super();
        }

    }


    private static final String IP_ADDRESS = "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})";
    private static final int NBITS = 32;
    private static final String SLASH_FORMAT = "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,3})";
    private static final Pattern addressPattern = Pattern.compile("(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})");
    private static final Pattern cidrPattern = Pattern.compile("(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,3})");
    private int address;
    private int broadcast;
    private boolean inclusiveHostCount;
    private int netmask;
    private int network;

    public SubnetUtils(String s)
    {
        netmask = 0;
        address = 0;
        network = 0;
        broadcast = 0;
        inclusiveHostCount = false;
        calculate(s);
    }

    public SubnetUtils(String s, String s1)
    {
        netmask = 0;
        address = 0;
        network = 0;
        broadcast = 0;
        inclusiveHostCount = false;
        calculate(toCidrNotation(s, s1));
    }

    private void calculate(String s)
    {
        Matcher matcher = cidrPattern.matcher(s);
        if (matcher.matches())
        {
            address = matchAddress(matcher);
            int j = rangeCheck(Integer.parseInt(matcher.group(5)), 0, 32);
            for (int i = 0; i < j; i++)
            {
                netmask = netmask | 1 << 31 - i;
            }

            network = address & netmask;
            broadcast = network | ~netmask;
            return;
        } else
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Could not parse [").append(s).append("]").toString());
        }
    }

    private String format(int ai[])
    {
        StringBuilder stringbuilder = new StringBuilder();
        for (int i = 0; i < ai.length; i++)
        {
            stringbuilder.append(ai[i]);
            if (i != ai.length - 1)
            {
                stringbuilder.append(".");
            }
        }

        return stringbuilder.toString();
    }

    private int matchAddress(Matcher matcher)
    {
        int j = 0;
        for (int i = 1; i <= 4; i++)
        {
            j |= (rangeCheck(Integer.parseInt(matcher.group(i)), -1, 255) & 0xff) << (4 - i) * 8;
        }

        return j;
    }

    private int rangeCheck(int i, int j, int k)
    {
        if (i > j && i <= k)
        {
            return i;
        } else
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Value [").append(i).append("] not in range (").append(j).append(",").append(k).append("]").toString());
        }
    }

    private int[] toArray(int i)
    {
        int ai[] = new int[4];
        for (int j = 3; j >= 0; j--)
        {
            ai[j] = ai[j] | i >>> (3 - j) * 8 & 0xff;
        }

        return ai;
    }

    private String toCidrNotation(String s, String s1)
    {
        return (new StringBuilder()).append(s).append("/").append(pop(toInteger(s1))).toString();
    }

    private int toInteger(String s)
    {
        Matcher matcher = addressPattern.matcher(s);
        if (matcher.matches())
        {
            return matchAddress(matcher);
        } else
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Could not parse [").append(s).append("]").toString());
        }
    }

    public final SubnetInfo getInfo()
    {
        return new SubnetInfo();
    }

    public boolean isInclusiveHostCount()
    {
        return inclusiveHostCount;
    }

    int pop(int i)
    {
        i -= i >>> 1 & 0x55555555;
        i = (i & 0x33333333) + (i >>> 2 & 0x33333333);
        i = (i >>> 4) + i & 0xf0f0f0f;
        i += i >>> 8;
        return i + (i >>> 16) & 0x3f;
    }

    public void setInclusiveHostCount(boolean flag)
    {
        inclusiveHostCount = flag;
    }









}
