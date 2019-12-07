package com.example.myboulderandroid;

import android.content.Context;
import android.content.Intent;
import android.content.res.AssetManager;
import android.graphics.Typeface;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.os.Parcelable;
import android.util.Log;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.RadioGroup;
import android.widget.Switch;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ThreadLocalRandom;

public class MainActivity extends AppCompatActivity {

    Switch outdoorExplorationSwitch;
    Switch entertainmentSwitch;
    Switch urbanAttractionsSwitch;

    RadioGroup moneyRadio;
    RadioGroup seasonRadio;

    private Idea one = new Idea("Take a Tour of Avery Brewing Company", "@drawable/avery", "Avery Brewing Company is a famed craft brewery just northeast of Boulder with excellent food and beer. Join a free tour to taste some samples and learn about the brewing process!","4910 Nautilus Ct, Boulder, CO 80301", "urban", true, true, true, true, false);
    private Idea two = new Idea("Rock Climb in Boulder Canyon", "@drawable/bocan", "Boulder Canyon offers a multitude of climbing adventures on its granite cliffs, including longer trad adventures or right-by-the-road sport climbs.", "Boulder Canyon Dr, Nederland, CO 80466", "outdoors", true, false, true, true, false);
    private Idea three = new Idea("Visit Eldorado Canyon State Park", "@drawable/eldo", "One of Colorado's most beautiful state parks, Eldorado Canyon features staggering sandstone cliffs, a beautiful river, and thriving wildlife.", "9 Kneale Rd, Eldorado Springs, CO 80025", "outdoors", true, false, true, true, true);
    private Idea four = new Idea("Drive Trail Ridge Road", "@drawable/rmnp", "Drive one of the most scenic roads in Colorado, which goes straight through Rocky Mountain National Park.", "Trail Ridge Rd, Estes Park, CO 80517", "outdoors", true, false, true, true, true);
    private Idea five = new Idea("Snowshoe Indian Peaks Wilderness", "@drawable/snowshoe", "Snowshoe through the winter wonderland of the Indian Peaks Wilderness! A great place to start from is the Brainard Lake winter parking lot.", "Brainard Lake Road, Ward, CO", "outdoors", false, true, true, false, false);
    private Idea six = new Idea("Hike to the Boulder Star", "@drawable/star", "Every winter, this star lights up the hills behind Boulder. You can hike to it easily from a nearby parking spot, but make sure to go at night!", "1138 Flagstaff Rd, Boulder, CO 80302", "outdoors", false, true, false, false, false);
    private Idea seven = new Idea("Shop Pearl Street", "@drawable/pearl", "Pearl Street has plenty to offer in any season, including quirky shops, great places to eat, and unique art installations and sculptures.", "1942 Broadway #301, Boulder, CO 80302", "urban", true, true, true, true, false);
    private Idea eight = new Idea("Paddleboard Boulder Reservoir", "@drawable/paddle", "Paddleboard on this scenic reservoir right outside of Boulder. You can bring your own equipment or rent boards at the reservoir!", "5565 51st St, Boulder, CO 80301", "outdoors", true, false, false, true, true);
    private Idea nine = new Idea("Beach Day at Boulder Reservoir", "@drawable/beach", "Enjoy a sunny day at the closest thing to a beach in Colorado. Bring your volleyball, hop into the swimming area, have a barbeque, or rent some boats to explore the reservoir with.", "5565 51st St, Boulder, CO 80301", "outdoors", false, false, false, true, true);
    private Idea ten = new Idea("Mountain Bike at Betasso Preserve", "@drawable/bike", "Bring your mountain bike for a cruise around Betasso Preserve, high up in Boulder Canyon. Fly through evergreen trees and around sandy banks while you complete this quick 3-mile loop.", "Betasso Rd, Boulder, CO 80302", "outdoors", true, false, true, true, false);
    private Idea eleven = new Idea("Hike the Royal Arch Trail", "@drawable/arch", "Hike up to this iconic spot in the Flatirons area for a neat rock formation and great views of Boulder.", "900 Baseline Rd, Boulder, CO 80302", "outdoors", true, true, true, true, false);
    private Idea twelve = new Idea("Run in Chautauqua", "@drawable/chau", "Go for a run right next to the Flatirons for a unique and beautiful workout. For extra Boulder points, bike to the trailhead! Make sure to bring traction in the winter.", "900 Baseline Rd, Boulder, CO 80302", "outdoors", true, true, true, true, false);
    private Idea thirteen = new Idea("Visit the Denver Botanic Gardens", "@drawable/garden", "This curated garden and assortment of plants is one of the top five botanic gardens in the nation, and you won't want to miss it.", "1007 York St, Denver, CO 80206", "urban", true, true, true, true, true);
    private Idea fourteen = new Idea("See the Denver Zoo Lights", "@drawable/zoo", "Every winter, the Denver Zoo creates an incredible display of magical lights to decorate the animal exhibits. It has never been more fun to visit the zoo!", "2900 E 23rd Ave, Denver, CO 80205", "urban", false, true, false, false, true);
    private Idea fifteen = new Idea("Visit the Denver Aquarium", "@drawable/fish", "Swim in shark tanks, see all kinds of amazing marine animals, or visit the brand new 4D theater. A great place to spend a few hours or a day!", "700 Water St, Denver, CO 80211", "urban", true, true, true, true,  true);
    private Idea sixteen = new Idea("Go to Water World", "@drawable/water", "This fully-featured water park has all kinds of slides, pools, and adventure attractions. It is one of America's largest water parks!", "8801 N. Pecos Street, Federal Heights, 80260", "urban", false, false, false, true, true);
    private Idea seventeen = new Idea("Play Pinball at Lyons Pinball", "@drawable/pinball", "Play over 40 different versions of pinball, and plenty of other arcade games, at this hidden spot in Lyons.", "339 Main St, Lyons, CO 80540", "urban", true, true, true, true, true);
    private Idea eighteen = new Idea("Visit the CU Campus", "@drawable/cu", "Boulder's CU campus is praised for being one of the most beautiful American college campuses, and it's easy to see why. Join a free tour of the unique buildings and fields in the heart of Boulder.", "1669 Euclid Ave, Boulder, CO 80309", "urban", true, true, true, true, false);
    private Idea nineteen = new Idea("Watch a Shakespeare Performance", "@drawable/shakes", "Every summer, CU puts on many different Shakespeare productions in its outdoor amphitheater. Don't miss out on the CU Shakespeare Festival!", "277 University Ave, Boulder, CO 80309", "entertainment", false, false, false, true, true);
    private Idea twenty = new Idea("Catch a Concert at the Fox Theater", "@drawable/fox", "Watch a show from local or traveling artists in the bustling Pearl Street District.", "1135 13th St, Boulder, CO 80302", "entertainment", true, true, true, true, true);
    private Idea twentyone = new Idea("Visit the Farmer's Market", "@drawable/farmer", "On Saturdays and Wednesdays, stop by the Boulder Farmer's Market for fresh produce, honey, crafts, and all sorts of other local products.", "13th St, Boulder, CO 80302", "urban", true, false, true, true, false);
    private Idea twentytwo = new Idea("Stargaze at Brainard Lake", "@drawable/stars", "One of the best places to stargaze in the Boulder area is Brainard Lake, which has crystal-clear skies and mountain seclusion.", "Brainard Lake Road, Ward, CO", "outdoors", true, true, true, true, true);
    private Idea twentythree = new Idea("Chill out at Boulder Public Library", "@drawable/books", "There is plenty to see and do at Boulder's Public Library, including a makerspace, an art gallery, a coffee shop, and all the books you could ever need.", "1001 Arapahoe Ave, Boulder, CO 80302", "urban", true, true, true, true, false);
    private Idea twentyfour = new Idea("Explore the Boulder Creek Path", "@drawable/path", "Walk or bike along the wandering Boulder Creek Path, which explores the city and runs next to its namesake creek.", "Boulder, CO 80302", "urban", true, true, true, true, false);
    private Idea twentyfive = new Idea("Visit Boulder Falls", "@drawable/falls", "A great spot for hiking and photography, Boulder Falls is a stunning location in any season.", "Boulder Canyon Dr, Nederland, CO 80466", "outdoors", true, true, true, true, false);
    private Idea twentysix = new Idea("Visit Fiske Planetarium", "@drawable/fiske", "Fiske Planetarium features informative talks, engaging tours of the solar system, and laser and light shows set to your favorite tunes.", "2414 Regent Dr, Boulder, CO 80309", "entertainment", true, true, true, true, true);
    private Idea twentyseven = new Idea("Explore the Hill", "@drawable/hill", "Boulder's University Hill has a ton of shops and restaurants to explore, and is a classic spot for college students to hang out.", "College Ave, Boulder, CO 80302", "urban", true, true, true, true, false);
    private Idea twentyeight = new Idea("Watch a Game at CU Events Center", "@drawable/events", "Catch the CU basketball or volleyball teams on the court in this huge arena, sure to be packed with CU students and Boulder locals.", "950 Regent Dr, Boulder, CO 80309", "entertainment", true, true, true, true, true);
    private Idea twentynine = new Idea("Tube Down Boulder Creek", "@drawable/tube", "Summer is prime time to tube down Boulder Creek with friends. There is even a Tube to Work Day once a year, where people tube straight to work in their business clothes or ridiculous costumes.", "Boulder, CO 80302", "outdoors", false, false, false, true, false);
    private Idea thirty = new Idea("Hang Out at the Boulder Bandshell", "@drawable/bandshell", "From concerts to scavenger hunts to ballet performances, there is always something happening at the Boulder Bandshell downtown.", "1212 Canyon Blvd, Boulder, CO 80302", "entertainment", true, true, true, true, false);
    private Idea thirtyone = new Idea("Watch Entertainers on Pearl Street", "@drawable/juggle", "From knife jugglers and fire throwers to singers and instrumentalists, there are always interesting entertainers playing for the crowds on Pearl Street.", "1942 Broadway #301, Boulder, CO 80302", "entertainment", true, false, true, true, false);
    private Idea thirtytwo = new Idea("Visit Folsom Stadium", "@drawable/folsom", "Whether you are there for a 4th of July celebration or a CU football game, Folsom Stadium is always worth checking out.", "2400 Colorado Ave, Boulder, CO 80302", "entertainment", true, false, false, true, true);
    private Idea thirtythree = new Idea("Visit the Denver Art Museum", "@drawable/art", "With a variety of modern and historical exhibits, the Denver Art Museum is sure to please art-lovers of all ages.", "100 W 14th Ave Pkwy, Denver, CO 80204", "entertainment", true, true, true, true, true);
    private Idea thirtyfour = new Idea("Red Rocks Amphitheater", "@drawable/rocks", "Red Rocks Amphitheater is one of the most unique and iconic concert venues in the world, nestled into the Rocky Mountains west of Denver.", "18300 W Alameda Pkwy, Morrison, CO 80465", "entertainment", true, false, true, true, true);
    private Idea thirtyfive = new Idea("Watch a Movie at Century Theaters", "@drawable/movie", "Go to Boulder's local movie theater to catch the latest blockbuster or indie film. There are plenty of restaurants nearby on the 29th Street Mall!", "1700 29th St, Boulder, CO 80301", "entertainment", true, true, true, true, true);

    private Idea selectedIdea;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = findViewById(R.id.fab);
        View.OnClickListener onFabClick = new View.OnClickListener(){
            public void onClick (View view){
                findActivity(view);
            }
        };
        fab.setOnClickListener(onFabClick);

        outdoorExplorationSwitch = findViewById(R.id.switch1);
        entertainmentSwitch = findViewById(R.id.switch2);
        urbanAttractionsSwitch = findViewById(R.id.switch3);

        moneyRadio = findViewById(R.id.moneyRadio);
        seasonRadio = findViewById(R.id.seasonRadio);
    }

    public void findActivity(View view){
        //variables for user preferences
        List<String> categories = new ArrayList<>();
        Boolean willingToPay = false;
        String season = "";

        if (outdoorExplorationSwitch.isChecked()){
            categories.add("outdoors");
        }
        if (entertainmentSwitch.isChecked()){
            categories.add("entertainment");
        }
        if (urbanAttractionsSwitch.isChecked()){
            categories.add("urban");
        }

//            for(int i=0; i<categories.size(); i++){
//                Log.i("category", categories.get(i));
//            }
        int paidActivity = moneyRadio.getCheckedRadioButtonId();
        if (paidActivity==R.id.yes) {
            willingToPay = true;
        } else if(paidActivity==R.id.no){
            willingToPay = false;
        } else if(paidActivity==-1){
            Context context = getApplicationContext();
            CharSequence text = "Please select whether you are willing to pay money";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
            return;
        }
//            Log.i("paid", willingToPay.toString());

        int selectedSeason = seasonRadio.getCheckedRadioButtonId();
        if (selectedSeason == R.id.spring){
            season = "spring";
        }else if (selectedSeason == R.id.summer){
            season = "summer";
        }else if (selectedSeason == R.id.fall){
            season = "fall";
        }else if (selectedSeason == R.id.winter){
            season = "winter";
        } else if(selectedSeason==-1){
            Context context = getApplicationContext();
            CharSequence text = "Please select a season";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
            return;
        }

//            Log.i("season", season);

        Idea[] masterList = {one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twentyone, twentytwo, twentythree, twentyfour, twentyfive, twentysix, twentyseven, twentyeight, twentynine, thirty, thirtyone, thirtytwo, thirtythree, thirtyfour, thirtyfive}; //create master list of all ideas
        List<Idea> validIdeas = new ArrayList<>();

        for (Idea idea : masterList){
            Boolean ideaMatches = true;
            if (season.equals("spring")){ //if user wants spring idea
                if (!idea.getSpring()){ //and it isn't a spring idea
                    ideaMatches = false; //idea doesn't match
                }
            }
            else if (season.equals("summer")){
                if (!idea.getSummer()){
                    ideaMatches = false;
                }
            } else if (season.equals("fall")){
                if (!idea.getFall()){
                    ideaMatches = false;
                }
            } else if (season.equals("winter")){
                if (!idea.getWinter()){
                    ideaMatches = false;
                }
            }

            if (!willingToPay){ //if user is not willing to pay
                if(idea.getPaid()){ //and idea costs money
                    ideaMatches = false; //invalidate idea
                }
            }

            Boolean ideaMatchesCategory = false; //assume idea doesn't match any categories, this condition has to become true for the idea to be included
            for (String category : categories){
                if (idea.getCategory().equals(category)){
                    ideaMatchesCategory = true;
                }
            }
            if (!ideaMatchesCategory){ //if idea doesn't match a category
                ideaMatches = false; //invalidate idea
            }

            if (ideaMatches){
                validIdeas.add(idea);
            }
        }
        if (validIdeas.isEmpty()){ //throw error
                Context context = getApplicationContext();
                CharSequence text = "Please select at least one category";
                int duration = Toast.LENGTH_SHORT;
                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                return;
        } else {
            int randomIndex = ThreadLocalRandom.current().nextInt(0, validIdeas.size());
            selectedIdea = validIdeas.get(randomIndex);
            Log.i("test","--------");
            for(Idea idea : validIdeas){
                Log.i("idea", idea.getTitle());
            }
        }

        String title = selectedIdea.getTitle();
        String imageName = selectedIdea.getImageName();
        String description = selectedIdea.getDescription();
        String address = selectedIdea.getAddress();

        Intent intent = new Intent(this, GetActivity.class);
        intent.putExtra("title", title);
        intent.putExtra("imageName", imageName);
        intent.putExtra("description", description);
        intent.putExtra("address", address);
        startActivity(intent);
    }


}
