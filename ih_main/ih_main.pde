//load controlP5 library for GUI
import controlP5.*;

//load logo image
PImage logo;

//set font
PFont dense;
int font_size = 48;


//setup for screens
final int home_screen = 0; //home screen
final int note_screen = 1; //screen for saving notes
final int meme_screen = 2; //screen for seeing the meme of the day
final int view_screen = 3; //screen for viewing past notes
final int feed_screen = 4; //screen for viewing friend feed
int state = home_screen; //set beginning state to home screen

//color array
public color[] colorArray = {color(201,235,227), color(53,168,186)};
//key = [0]background, [1]button background

//buttons
Button write; //button for user to write a note
Button view; //button to view past notes
Button feed; //button to view feed
Button home; //button to go home
Button save; //button to save the note

void setup() {
  size(431, 767); //actual iPhone screen size scaled by 1.15x
  
  write = new Button(colorArray[1], width/2, height/6 * 3, 200, 70, "WRITE A MEMO");
  view = new Button(colorArray[1], width/2, height/6 * 4, 200, 70, "VIEW MY MEMOS");
  feed = new Button(colorArray[1], width/2, height/6 * 5, 200, 70, "SEE MY FEED");
  home = new Button(colorArray[1], width/5 * 1.5, height/6 * 5.5, 110, 30, "HOME");
  save = new Button(colorArray[1], width/5 * 3.5, height/6 * 5.5, 110, 30, "SAVE MEMO");
  
  logo = loadImage("mems.png");
  dense = createFont("Dense-Regular.otf", 48);
  textFont(dense, font_size);
}

void draw() {
  //handle screens
  switch (state) {
    case home_screen:
      showHome(); //show logo screen at the start
      break;
    case note_screen:
      showNote(); //show note screen
      break;
    case meme_screen:
      showMeme(); //show meme screen after note has been saved
    case view_screen: 
      showView(); //show view screen of all notes
    case feed_screen:
      showFeed(); //show feed screen of friends
  }
  
}

//method for home screen, CHANGES IMAGE MODE TO CENTER
void showHome() {
  background(colorArray[0]);  
  write.changeVisibility(true);
  view.changeVisibility(true);
  feed.changeVisibility(true);
  imageMode(CENTER);
  logo.resize(550,0);
  image(logo, width/2 - 10, height/5 + 30);
  
  write.update();
  view.update();
  feed.update();
}

//method for note screen
void showNote() {
  background(colorArray[0]);  
  
  home.changeVisibility(true);
  save.changeVisibility(true);
  home.update();
  save.update();
 
}

//method for meme screen
void showMeme() {
  background(colorArray[0]);  
  
  home.changeVisibility(true);
  home.update();
}

//method for view screen
void showView() {
  background(colorArray[0]);  
}

//method for feed screen
void showFeed() {
  background(colorArray[0]);  
}


//method for button functions
void mousePressed() {
  if (write.isOver()){
    state = note_screen;  
  }
  if (view.isOver()){
    state = view_screen;
  }
  if (feed.isOver()){
    state = feed_screen;  
  }
  if (home.isOver()) {
    state = home_screen;  
  }
  if (save.isOver()) {
    state = meme_screen;  
  }
}