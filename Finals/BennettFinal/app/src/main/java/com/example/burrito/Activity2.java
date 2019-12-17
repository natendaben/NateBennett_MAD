package com.example.burrito;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.view.View;
import android.widget.TextView;

public class Activity2 extends AppCompatActivity {

    String restName;
    String restURL;
    TextView restResults;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_2);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        restResults = findViewById(R.id.restaurantTextView);

        Intent intent = getIntent();
        restName = intent.getStringExtra("name");
        restURL = intent.getStringExtra("url");
        restResults.setText("You should check out " + restName + ".");

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                launchWebsite(view);
            }
        });
    }

    private void launchWebsite(View view) {
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(restURL));
        startActivity(intent);
    }

}
