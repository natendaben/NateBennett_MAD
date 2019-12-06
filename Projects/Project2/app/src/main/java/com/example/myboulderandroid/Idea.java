package com.example.myboulderandroid;

public class Idea {
    private String title;
    private String imageName; //name of image for activity
    private String description; //short description
    private String address; //address of activity location
    private String category; //can be "outdoors", "urban", or "entertainment"
    private Boolean summer;
    private Boolean fall;
    private Boolean winter;
    private Boolean spring;
    private Boolean paid;

    public Idea(String nTitle, String nImgName, String nDesc, String nAddress, String nCategory, Boolean nFall, Boolean nWinter, Boolean nSpring, Boolean nSummer, Boolean nPaid){
        title = nTitle;
        imageName = nImgName;
        description = nDesc;
        address = nAddress;
        category = nCategory;
        summer = nSummer;
        fall = nFall;
        winter = nWinter;
        spring = nSpring;
        paid = nPaid;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Boolean getSummer() {
        return summer;
    }

    public void setSummer(Boolean summer) {
        this.summer = summer;
    }

    public Boolean getFall() {
        return fall;
    }

    public void setFall(Boolean fall) {
        this.fall = fall;
    }

    public Boolean getWinter() {
        return winter;
    }

    public void setWinter(Boolean winter) {
        this.winter = winter;
    }

    public Boolean getSpring() {
        return spring;
    }

    public void setSpring(Boolean spring) {
        this.spring = spring;
    }

    public Boolean getPaid() {
        return paid;
    }

    public void setPaid(Boolean paid) {
        this.paid = paid;
    }
}
