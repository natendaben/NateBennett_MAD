package com.example.lab7;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private EditText nameInput;
    private Spinner stateSelector;
    private RadioGroup climbingTypeRadio;
    private Switch robotSwitch;
    private TextView introText;
    private TextView resultText;
    private ImageView climbingPic;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        nameInput = findViewById(R.id.nameInput);
        stateSelector = findViewById(R.id.stateSpinner);
        climbingTypeRadio = findViewById(R.id.type);
        robotSwitch = findViewById(R.id.robotSwitch);
        introText = findViewById(R.id.resultIntro);
        resultText = findViewById(R.id.routeName);
        climbingPic = findViewById(R.id.imageView);
    }

    public void doStuff(View view) {
        if(robotSwitch.isChecked())
        {
            String username = nameInput.getText().toString();
            String state = String.valueOf(stateSelector.getSelectedItem());
            int climbingType = climbingTypeRadio.getCheckedRadioButtonId();

            if(username.isEmpty()){
                Context context = getApplicationContext();
                CharSequence text = "Please enter a name";
                int duration = Toast.LENGTH_SHORT;

                Toast alertToast = Toast.makeText(context, text, duration);
                alertToast.show();
            } else if (climbingType == -1){
                Context context = getApplicationContext();
                CharSequence text = "Please select a climbing type";
                int duration = Toast.LENGTH_SHORT;

                Toast alertToast = Toast.makeText(context, text, duration);
                alertToast.show();
            } else {
                switch (state){
                    case "Colorado":
                        if(climbingType == R.id.trad){
                            resultText.setText("The Naked Edge, 5.11b, 6 pitches");
                            climbingPic.setImageResource(R.drawable.edge);
                        } else if(climbingType == R.id.sport){
                            resultText.setText("Bullet the Blue Sky, 5.12c/d, 1 pitch");
                            climbingPic.setImageResource((R.drawable.bullet));
                        }
                        break;
                    case "Utah":
                        if(climbingType == R.id.trad){
                            resultText.setText("Supercrack of the Desert, 5.10, 1 pitch");
                            climbingPic.setImageResource(R.drawable.superc);
                        } else if(climbingType == R.id.sport){
                            resultText.setText("Namaste, 5.11d, 1 pitch");
                            climbingPic.setImageResource((R.drawable.nam));
                        }
                        break;
                    case "Wyoming":
                        if(climbingType == R.id.trad){
                            resultText.setText("Upper Exum Ridge, 5.5, 12 pitches");
                            climbingPic.setImageResource(R.drawable.exum);
                        } else if(climbingType == R.id.sport){
                            resultText.setText("Wind and Rattlesnakes, 5.12a, 1 pitch");
                            climbingPic.setImageResource((R.drawable.wind));
                        }
                        break;
                    default:
                        Context context = getApplicationContext();
                        CharSequence text = "Choose a state!";
                        int duration = Toast.LENGTH_SHORT;

                        Toast alertToast = Toast.makeText(context, text, duration);
                        alertToast.show();
                }

                introText.setText("Here's a route for you, " + username + ":");
            }
        } else {
            //Set up variables for toast
            Context context = getApplicationContext();
            CharSequence text = "Prove you're not a robot!";
            int duration = Toast.LENGTH_SHORT;

            Toast alertToast = Toast.makeText(context, text, duration);
            alertToast.show();
        }
    }
}
