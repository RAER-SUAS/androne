package com.raer.suas.suaspayload;

import android.app.Activity;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

/**
 * Created by Brian on 2/7/16.
 */
public class ColoredTextAdapter extends ArrayAdapter<String> {
    Activity context;
    String[] items;

    public ColoredTextAdapter(Activity aContext, String[] items) {
        super(aContext, R.layout.activity_main, items);
        context = aContext;
        this.items = items;
    }

    public View getView(int position, View convertView, ViewGroup parent) {

        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = (LayoutInflater) context
                    .getLayoutInflater();
            row = inflater.inflate(R.layout.activity_main, null);

        }
        TextView text = (TextView) row.findViewById(R.id.drawer_layout);
        text.setTextColor(Color.RED);
        text.setText(items[position]);

        return row;
    }
}

