package com.example.restaurant;

import android.content.Intent;
import android.media.Image;
import android.net.Uri;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

public class RestaurantActivity extends AppCompatActivity {

    private String restName;
    private String restURL;
    private String rImg;
    private ImageView restImage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_restaurant);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        //Receive intent from last screen
        Intent intent = getIntent();
        restName = intent.getStringExtra("restaurantName");
        restURL = intent.getStringExtra("restaurantURL");
        rImg = intent.getStringExtra("restaurantImage");
        restImage = findViewById(R.id.restImage);
        restImage.setImageResource(R.drawable.table);

        if(rImg.equals("buff")){
            restImage.setImageResource(R.drawable.buff);
        } else if(rImg.equals("pub")){
            restImage.setImageResource(R.drawable.pub);
        } else if(rImg.equals("rincon")){
            restImage.setImageResource(R.drawable.rincon);
        } else if(rImg.equals("sc")){
            restImage.setImageResource(R.drawable.sc);
        }

        //Testing
//        Log.i("name received", restName);
//        Log.i("url received", restURL);
        Log.i("image", rImg);

        TextView nameResult = findViewById(R.id.restaurantNameResult);
        nameResult.setText(restName);

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                launchWebsite(view);
            }
        });
    }

    private void launchWebsite(View v){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(restURL));
        startActivity(intent);
    }

}
