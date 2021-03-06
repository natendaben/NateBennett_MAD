package com.example.birthday;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    EditText name;
    EditText age;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        name = findViewById(R.id.nameInput); //set up text input field
        age = findViewById(R.id.ageInput);
    }

    public void calculateAge(View view){
        if(!name.getText().toString().equals("") && !age.getText().toString().equals("")){
            String nameValue = name.getText().toString();
            int ageValue = Integer.parseInt(age.getText().toString());
            ageValue++;

            TextView results = findViewById(R.id.result);
            results.setText("Congrats " + nameValue + ", on your next birthday you will be " + ageValue + "!");
            ImageView cake = findViewById(R.id.cakeImage);
            cake.setImageResource(R.drawable.maincake);
        } else{
            TextView results = findViewById(R.id.result);
            results.setText("Make sure you have entered a name and a birthday!");
        }
    }


}
