package raer.erau.org.androne;

import android.os.AsyncTask;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

/**
 * Created by RAER on 10/23/2015.
 */

public class RetrieveNetworkTask extends AsyncTask<Void, Void, Void>{

    private Exception exception;
    private static final int TCP_SERVER_PORT = 21111;

    @Override
    protected Void doInBackground(Void... voids) {


        try{

            new AndroneNetworking().runTcpClient();

            return null;

        }catch(Exception e){
            this.exception = e;
            return null;
        }
    }


}
