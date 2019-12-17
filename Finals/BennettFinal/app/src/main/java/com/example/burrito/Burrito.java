package com.example.burrito;

public class Burrito {
    private String restaurantName;
    private String restaurantURL;

    private void setRestaurant(Integer locationId){
        switch (locationId){
            case 0: //the hill
                restaurantName = "Illegal Petes";
                restaurantURL = "http://illegalpetes.com/";
                break;
            case 1: //29th street
                restaurantName = "Chipotle";
                restaurantURL = "https://www.chipotle.com/";
                break;
            case 2: //pearl street
                restaurantName = "Bartaco";
                restaurantURL = "https://bartaco.com/";
                break;
            default:
                restaurantName = "Restaurant";
                restaurantURL = "https://www.google.com/search?q=burrito+place+in+boulder&oq=burrito+place+in+boulder&aqs=chrome..69i57.2935j0j7&sourceid=chrome&ie=UTF-8";
        }
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(Integer locationId) {
        setRestaurant(locationId);
    }

    public String getRestaurantURL() {
        return restaurantURL;
    }

    public void setRestaurantURL(Integer locationId) {
        setRestaurant(locationId);
    }
}
