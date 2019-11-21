package com.example.restaurant;

public class Restaurant {
    private String restaurantName;
    private String restaurantURL;
    private String restaurantImage;

    private void setRestaurant(Integer mealType){
        switch (mealType){
            case 0: //breakfast
                restaurantName = "The Buff Restaurant";
                restaurantURL = "https://www.buffrestaurant.com/";
                restaurantImage = "buff";
                break;
            case 1: //lunch
                restaurantName = "Rincon Argentino";
                restaurantURL = "https://www.rinconargentinoboulder.com/";
                restaurantImage = "rincon";
                break;
            case 2: //dinner
                restaurantName = "Mountain Sun Pub & Brewery";
                restaurantURL = "http://www.mountainsunpub.com/";
                restaurantImage = "pub";
                break;
            case 3: //dessert
                restaurantName = "Sweet Cow Ice Cream";
                restaurantURL = "https://www.sweetcowicecream.com/";
                restaurantImage = "sc";
                break;
            default:
                restaurantName = "Restaurant";
                restaurantURL = "https://www.yelp.com/search?find_desc=food&find_loc=Boulder%2C%20CO";
                restaurantImage = "buff";
        }
    }

    public void setRestaurantName(Integer mealType){
        setRestaurant(mealType);
    }

    public String getRestaurantName(){
        return restaurantName;
    }

    public void setRestaurantURL(Integer mealType){
        setRestaurant(mealType);
    }

    public String getRestaurantURL(){
        return restaurantURL;
    }

    public void setRestaurantImage(Integer mealType){
        setRestaurant(mealType);
    }

    public String getRestaurantImage(){
        return restaurantImage;
    }
}
