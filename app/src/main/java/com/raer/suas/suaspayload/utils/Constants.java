package com.raer.suas.suaspayload.utils;

/**
 * Created by Brian on 2/9/16.
 * RAER Androne 2016
 */
public class Constants {


    public interface ACTION {
        public static String MAIN_ACTION = "org.raer.suas.suaspayload.PayloadWD.action.main";
        public static String INIT_ACTION = "org.raer.suas.suaspayload.PayloadWD.action.init";
        public static String PREV_ACTION = "org.raer.suas.suaspayload.PayloadWD.action.prev";
        public static String PLAY_ACTION = "org.raer.suas.suaspayload.PayloadWD.action.play";
        public static String NEXT_ACTION = "org.raer.suas.suaspayload.PayloadWD.action.next";
        public static String STARTFOREGROUND_ACTION = "org.raer.suas.suaspayload.PayloadWD.action.startforeground";
        public static String STOPFOREGROUND_ACTION = "org.raer.suas.suaspayload.PayloadWD.action.stopforeground";
    }

    public interface NOTIFICATION_ID {
        public static int FOREGROUND_SERVICE = 101;
    }

    //Defines Communication Constants in App
    public interface COMMCONST {

        //Dorm IP
        //public static String PY_IP_ADDRESS = "10.33.55.167";
        //Lab IP
        public static String PY_IP_ADDRESS = "10.10.16.135";

        public static int PORT_NUM = 31954;

    }
}