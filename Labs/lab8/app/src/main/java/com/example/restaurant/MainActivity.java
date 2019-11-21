package com.example.restaurant;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    Spinner mealSpinner;
    Button findButton;
    TextView text;

    Restaurant selectedRestaurant = new Restaurant();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        mealSpinner = findViewById(R.id.spinner);
        findButton = findViewById(R.id.button);

        //Set up an event listener
        View.OnClickListener buttonOnClick = new View.OnClickListener(){
            public void onClick(View v){
                findRestaurant(v);
            }
        };

        //Add listener to button
        findButton.setOnClickListener(buttonOnClick);
    }

    public void findRestaurant(View view) {
        //Get selected meal choice
        Integer spinnerIndex = mealSpinner.getSelectedItemPosition();

        //Set up restaurant object
        selectedRestaurant.setRestaurantName(spinnerIndex);

        //Get restaurant name and URL
        String restName = selectedRestaurant.getRestaurantName();
        String restURL = selectedRestaurant.getRestaurantURL();
        String restImage = selectedRestaurant.getRestaurantImage();

        //Log results for testing
        Log.i("restaurant name", restName);
        Log.i("restaurant url", restURL);

        //FOR TESTING: text.setText(spinnerIndex.toString());

        //Set up our intent
        Intent secondScreenIntent = new Intent(this, RestaurantActivity.class);
        secondScreenIntent.putExtra("restaurantName", restName);
        secondScreenIntent.putExtra("restaurantURL", restURL);
        secondScreenIntent.putExtra("restaurantImage", restImage);

        //Start the intent
        startActivity(secondScreenIntent);
    }

}
