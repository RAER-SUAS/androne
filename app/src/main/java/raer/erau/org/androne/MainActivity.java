package raer.erau.org.androne;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ProgressBar;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {



        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        androneRefresh(); //Call refresh method

        new RetrieveNetworkTask().execute();




        /*Fab Commented due to it being hidden from the interface*/
//        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
//        fab.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
//                        .setAction("Action", null).show();
//            }
//        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {

            Intent settingIntent = new Intent(MainActivity.this, SettingsActivity.class);
            startActivity(settingIntent);

            return true;
        }else if(id == R.id.action_refresh){

            androneRefresh();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    public void androneRefresh(){
        //Declare Progress bar and set visible
        ProgressBar mainActivityProgressBar = (ProgressBar) findViewById(R.id.mainActivityProgressBar);
        mainActivityProgressBar.setVisibility(View.VISIBLE);


        //Do all refresh tasks:
        TextView mainActivityIPAddressField = (TextView) findViewById(R.id.mainActivityIPAddressField);
        Context context=getApplicationContext();
        mainActivityIPAddressField.setText(AndroneUtils.ipAddress(context));


        //Dismiss Progress bar
        mainActivityProgressBar.setVisibility(View.INVISIBLE);
    }
}
