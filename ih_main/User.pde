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
  
  
  void save(String st){
    dates.append(this.getDate());
    inputs.append(st);
    
  }
  
}