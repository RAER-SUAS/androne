package com.raer.suas.suaspayload;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.ToggleButton;

import com.raer.suas.suaspayload.utils.Constants;

/**
 * Created by Brian on 2/6/16.
 *
 * Home Fragment
 */
public class HomeFragment extends Fragment {

    private TextView value_home_payloadip;
    private Context context;
    private ToggleButton tggleBtnPayloadWDService;
    private TextView value_home_gcscommip;


    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_home, container, false);

        return view;
    }

//    Button btn = (Button) findViewById(R.id.mybutton);
//
//    btn.setOnClickListener(new View.OnClickListener() {
//        @Override
//        public void onClick(View v) {
//            myFancyMethod(v);
//        }
//    });

    //Put all code to access elements in fragment here:

    @Nullable
    @Override
    public void onActivityCreated(Bundle savedInstanceState){

        super.onActivityCreated(savedInstanceState);

        //Set ip address to main screen label
        value_home_payloadip = (TextView)getView().findViewById(R.id.value_home_payloadip);
        Context context=getActivity().getApplicationContext();
        value_home_payloadip.setText(NetInfo.ipAddress(context));

        value_home_gcscommip = (TextView)getView().findViewById(R.id.value_home_gcscommip);
        value_home_gcscommip.setText(Constants.COMMCONST.PY_IP_ADDRESS);

                //Get tggleBtnPayloadWDService
        tggleBtnPayloadWDService = (ToggleButton)getView().findViewById(R.id.tggleBtn_home_startPayloadWDService);

        tggleBtnPayloadWDService.setOnClickListener(new View.OnClickListener(){


            //Called when Toggle Button for starting payloadWD Service in Home Fragment is pressed
            @Override
            public void onClick(View view)
            {


                Intent service = new Intent(getActivity(), PayloadWD.class);
                if (!PayloadWD.IS_SERVICE_RUNNING) {
                    service.setAction(Constants.ACTION.STARTFOREGROUND_ACTION);
                    PayloadWD.IS_SERVICE_RUNNING = true;
                    tggleBtnPayloadWDService.setText("Stop Service");
                } else {
                    service.setAction(Constants.ACTION.STOPFOREGROUND_ACTION);
                    PayloadWD.IS_SERVICE_RUNNING = false;
                    tggleBtnPayloadWDService.setText("Start Service");

                }
                getActivity().startService(service);

            }
        });


    }


    public void tggleBtnPayloadWDServiceClicked() {

    }


}
