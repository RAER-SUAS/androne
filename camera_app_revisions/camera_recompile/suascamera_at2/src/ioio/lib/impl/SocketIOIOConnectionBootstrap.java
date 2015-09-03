// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.IOIOConnection;
import ioio.lib.spi.IOIOConnectionBootstrap;
import ioio.lib.spi.IOIOConnectionFactory;
import java.util.Collection;

// Referenced classes of package ioio.lib.impl:
//            SocketIOIOConnection

public class SocketIOIOConnectionBootstrap
    implements IOIOConnectionBootstrap
{

    public static final int IOIO_PORT = 4545;

    public SocketIOIOConnectionBootstrap()
    {
    }

    public void getFactories(Collection collection)
    {
        collection.add(new IOIOConnectionFactory() {

            private Integer port_;
            final SocketIOIOConnectionBootstrap this$0;

            public IOIOConnection createConnection()
            {
                return new SocketIOIOConnection(4545);
            }

            public Object getExtra()
            {
                return port_;
            }

            public String getType()
            {
                return ioio/lib/impl/SocketIOIOConnection.getCanonicalName();
            }

            
            {
                this$0 = SocketIOIOConnectionBootstrap.this;
                super();
                port_ = new Integer(4545);
            }
        });
    }
}
