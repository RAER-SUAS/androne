/**
 * Created by RAER on 10/23/2015.
 */
package raer.erau.org.androne;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.UnknownHostException;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.NetworkOnMainThreadException;
import android.util.Log;


public class AndroneNetworking  {

        private static final int TCP_SERVER_PORT = 21111;
        public void runTcpClient(int PortNum) {

            try {
                Socket s = new Socket("10.10.16.134", PortNum);
                BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));
                BufferedWriter out = new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
                //send output msg
                String outMsg = "TCP connecting to " + PortNum + System.getProperty("line.separator");
                out.write(outMsg);
                out.flush();
                Log.i("TcpClient", "sent: " + outMsg);
                //accept server response
                String inMsg = in.readLine() + System.getProperty("line.separator");
                Log.i("TcpClient", "received: " + inMsg);
                //close connection
                s.close();
            } catch (UnknownHostException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }catch(NetworkOnMainThreadException e){
                e.printStackTrace();
            }
        }

    }

