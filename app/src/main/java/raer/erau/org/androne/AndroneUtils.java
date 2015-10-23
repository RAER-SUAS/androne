package raer.erau.org.androne;


import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.text.format.Formatter;
import android.util.Log;
import android.widget.TextView;
import android.content.Context;

//import android.net.wifi.WifiInfo;
/**
 * Created by RAER on 10/12/2015.
 */
public class AndroneUtils {



    public static String ipAddress(Context context) {


        WifiManager myWifiManager = (WifiManager) context.getSystemService(context.WIFI_SERVICE);
        WifiInfo myWifiInfo = myWifiManager.getConnectionInfo();
        String myIp = Formatter.formatIpAddress(myWifiInfo.getIpAddress());



        if(myIp.equals("0.0.0.0"))
            return "N/A";
        else
            return myIp;

    }


}
