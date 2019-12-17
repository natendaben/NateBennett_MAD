package com.example.burrito;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    EditText name;
    TextView results;
    Spinner locationSpinner;
    RadioGroup burritoOrTacoRadio;
    Switch glutenFreeSwitch;
    ImageView foodImage;
    ToggleButton toggle;

    Burrito burritoLocation = new Burrito();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        name = findViewById(R.id.nameEditText);
        results = findViewById(R.id.results);
        locationSpinner = findViewById(R.id.spinner);
        burritoOrTacoRadio = findViewById(R.id.radioGroup);
        glutenFreeSwitch = findViewById(R.id.glutenFreeSwitch);
        foodImage = findViewById(R.id.foodImage);
        toggle = findViewById(R.id.toggleButton);
    }

    public void buildBurrito(View view) {
        String userName = name.getText().toString();
        if (userName.equals("")){
            Context context = getApplicationContext();
            CharSequence text = "Please enter your name";
            int duration = Toast.LENGTH_SHORT;

            Toast alertToast = Toast.makeText(context, text, duration);
            alertToast.show();
            return;
        }
        String foodType;
        String tortillaType;


        int burritoOrTacoId = burritoOrTacoRadio.getCheckedRadioButtonId();
        if(burritoOrTacoId == R.id.burritoRadio){ //if burrito is checked
            foodImage.setImageResource(R.drawable.burrito);
            foodType = "burrito";
        } else if (burritoOrTacoId == R.id.tacoRadio){ //if taco is checked
            foodImage.setImageResource(R.drawable.taco);
            foodType = "taco";
        } else {
            Context context = getApplicationContext();
            CharSequence text = "Please select either taco or burrito";
            int duration = Toast.LENGTH_SHORT;

            Toast alertToast = Toast.makeText(context, text, duration);
            alertToast.show();
            return;
        }

        String meatOrVeggie;
        if(toggle.isChecked()){
            meatOrVeggie = "meat";
        } else {
            meatOrVeggie = "veggie";
        }

        if(glutenFreeSwitch.isChecked()){
            tortillaType = "corn";
        } else {
            tortillaType = "flour";
        }

        String location = String.valueOf(locationSpinner.getSelectedItem());

        results.setText(userName + " wants a " + meatOrVeggie + " " + foodType + " in a " + tortillaType + " tortilla. You should eat on " + location + ".");
    }

    public void findBurrito(View view) {
        Integer locationSpinnerIndex = locationSpinner.getSelectedItemPosition();

        burritoLocation.setRestaurantName(locationSpinnerIndex);
        String restaurantName = burritoLocation.getRestaurantName();
        String restaurantURL = burritoLocation.getRestaurantURL();

        Log.i("name", restaurantName);
        Log.i("url", restaurantURL);

        Intent secondActivityIntent = new Intent(this, Activity2.class);
        secondActivityIntent.putExtra("name",restaurantName);
        secondActivityIntent.putExtra("url",restaurantURL);

        startActivity(secondActivityIntent);
    }
}
