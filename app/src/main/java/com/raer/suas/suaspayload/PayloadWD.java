package com.raer.suas.suaspayload;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.support.annotation.Nullable;

/**
 * Created by Brian on 2/6/16.
 * RAER Androne 2016
 *
 * This class will define the Watch Dog Service on the Payload.
 *
 * The purpose of the Watch Dog service is to communicate with
 * the Watch Dog on the GCS, open socket channels, and send requested
 * Data to the GCS.
 */

public class PayloadWD extends Service{

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
