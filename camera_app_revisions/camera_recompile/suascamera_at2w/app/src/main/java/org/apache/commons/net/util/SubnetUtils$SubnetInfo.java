// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.util;


// Referenced classes of package org.apache.commons.net.util:
//            SubnetUtils

public final class <init>
{

    final SubnetUtils this$0;

    private int address()
    {
        return SubnetUtils.access$200(SubnetUtils.this);
    }

    private int broadcast()
    {
        return SubnetUtils.access$300(SubnetUtils.this);
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
        return SubnetUtils.access$000(SubnetUtils.this);
    }

    private int network()
    {
        return SubnetUtils.access$100(SubnetUtils.this);
    }

    public int asInteger(String s)
    {
        return SubnetUtils.access$400(SubnetUtils.this, s);
    }

    public String getAddress()
    {
        return SubnetUtils.access$600(SubnetUtils.this, SubnetUtils.access$500(SubnetUtils.this, address()));
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
                as[j] = SubnetUtils.access$600(SubnetUtils.this, SubnetUtils.access$500(SubnetUtils.this, k));
                k++;
                j++;
            }
        }
        return as;
    }

    public String getBroadcastAddress()
    {
        return SubnetUtils.access$600(SubnetUtils.this, SubnetUtils.access$500(SubnetUtils.this, broadcast()));
    }

    public String getCidrSignature()
    {
        return SubnetUtils.access$700(SubnetUtils.this, SubnetUtils.access$600(SubnetUtils.this, SubnetUtils.access$500(SubnetUtils.this, address())), SubnetUtils.access$600(SubnetUtils.this, SubnetUtils.access$500(SubnetUtils.this, netmask())));
    }

    public String getHighAddress()
    {
        return SubnetUtils.access$600(SubnetUtils.this, SubnetUtils.access$500(SubnetUtils.this, high()));
    }

    public String getLowAddress()
    {
        return SubnetUtils.access$600(SubnetUtils.this, SubnetUtils.access$500(SubnetUtils.this, low()));
    }

    public String getNetmask()
    {
        return SubnetUtils.access$600(SubnetUtils.this, SubnetUtils.access$500(SubnetUtils.this, netmask()));
    }

    public String getNetworkAddress()
    {
        return SubnetUtils.access$600(SubnetUtils.this, SubnetUtils.access$500(SubnetUtils.this, network()));
    }

    public boolean isInRange(String s)
    {
        return isInRange(SubnetUtils.access$400(SubnetUtils.this, s));
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("CIDR Signature:\t[").append(getCidrSignature()).append("]").append(" Netmask: [").append(getNetmask()).append("]\n").append("Network:\t[").append(getNetworkAddress()).append("]\n").append("Broadcast:\t[").append(getBroadcastAddress()).append("]\n").append("First Address:\t[").append(getLowAddress()).append("]\n").append("Last Address:\t[").append(getHighAddress()).append("]\n").append("# Addresses:\t[").append(getAddressCount()).append("]\n");
        return stringbuilder.toString();
    }

    private ()
    {
        this$0 = SubnetUtils.this;
        super();
    }

    this._cls0(this._cls0 _pcls0)
    {
        this();
    }
}
