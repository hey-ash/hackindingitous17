//class to create buttons
//note: sets rectMode to CENTER
//note: sets textAlign to CENTER, CENTER
//note: sets textSize to 14
//note: rectangles are rounded!
//NOTE THIS BUTTON CLASS HAS BEEN EDITED TO FIT THE APP SPECIFICALLY

class User {
  StringList dates;
  StringList inputs;
  ArrayList<PImage> memes;


  //constructor for button class
  User() {
    dates = new StringList();
    inputs = new StringList();
    memes = new ArrayList<PImage>();
  }

  //method to display button
  String getDate() {
    int m = month();
    int d = day();
    int y = year();
    String s = str(m) +"/" + str(d) +"/" + str(y);
    return s;
  }
  
  void save(){
  }
  
}