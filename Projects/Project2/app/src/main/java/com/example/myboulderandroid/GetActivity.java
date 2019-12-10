package com.example.myboulderandroid;

import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import org.w3c.dom.Text;

public class GetActivity extends AppCompatActivity {

    private String title;
    private String imageName;
    private String description;
    private String address;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_get);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        Intent intent = getIntent();
        title = intent.getStringExtra("title");
        imageName = intent.getStringExtra("imageName");
        description = intent.getStringExtra("description");
        address = intent.getStringExtra("address");

        TextView ideaTitle = findViewById(R.id.ideaTitle);
        ideaTitle.setText(title);

        ImageView ideaImage = findViewById(R.id.imageView);

        //Below code adapted from this stack overflow question: https://stackoverflow.com/questions/11737607/how-to-set-the-image-from-drawable-dynamically-in-android
        int imageResource = getResources().getIdentifier(imageName, null, getPackageName());
        Drawable img = getResources().getDrawable(imageResource);
        ideaImage.setImageDrawable(img);
        //End stack overflow section

        TextView ideaDescription = findViewById(R.id.ideaDescription);
        ideaDescription.setText(description);
        TextView ideaAddress = findViewById(R.id.ideaAddress);
        ideaAddress.setText(address);

    }

}
