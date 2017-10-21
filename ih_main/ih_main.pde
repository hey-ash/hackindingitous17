//load controlP5 library for GUI
import controlP5.*;

//load logo image & other icons
PImage logo;
PImage home_icon;
PImage save_icon;
PImage back_icon;
int icon_size = 40;

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
public color[] colorArray = {color(201,235,227), color(53,168,186), color(255,255,255,0), color(200)};
//key = [0]background, [1]button background, [2]transparent, [3]BUTTON HOVER

//buttons
Button write; //button for user to write a note
Button view; //button to view past notes
Button feed; //button to view feed
Button home; //button to go home
Button save; //button to save the note
Button back; //button to go back to note page
Button home_centered; //button to go back to home page but it is centered

void setup() {
  size(431, 767); //actual iPhone screen size scaled by 1.15x
  
  write = new Button(colorArray[1], colorArray[3], width/2, height/6 * 3, 200, 70, "WRITE A MEMO");
  view = new Button(colorArray[1], colorArray[3], width/2, height/6 * 4, 200, 70, "VIEW MY MEMOS");
  feed = new Button(colorArray[1], colorArray[3], width/2, height/6 * 5, 200, 70, "SEE MY FEED");
  home = new Button(colorArray[2], colorArray[2], width/5 * 1.3, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  save = new Button(colorArray[2], colorArray[2], width/5 * 3.7, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  back = new Button(colorArray[2], colorArray[2], width/5 * 3.7, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  home_centered = new Button(colorArray[2], colorArray[2], width/2, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  
  logo = loadImage("mems.png");
  home_icon = loadImage("home.png");
  save_icon = loadImage("save.png");
  back_icon = loadImage("back.png");
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
      break;
    case view_screen: 
      showView(); //show view screen of all notes
      break;
    case feed_screen:
      showFeed(); //show feed screen of friends
      break;
  }
  
}

//method for home screen, CHANGES IMAGE MODE TO CENTER
void showHome() {
  background(colorArray[0]);
  home.changeVisibility(false);
  save.changeVisibility(false);
  write.changeVisibility(true);
  back.changeVisibility(false);
  home_centered.changeVisibility(false);
  
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
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  back.changeVisibility(false);
  home_centered.changeVisibility(false);
  
  home.changeVisibility(true);
  save.changeVisibility(true);
  home_icon.resize(icon_size,0);
  save_icon.resize(icon_size,0);
  image(home_icon, width/5 * 1.3, height/6 * 5.65);
  image(save_icon, width/5 * 3.7, height/6 * 5.65);
  
  noStroke();
  fill(255);
  rect(width/2, height/2, width - 60, height - 250, 10);
  
  home.update();
  save.update();
  
 
}

//method for meme screen
void showMeme() {
  background(colorArray[0]);  
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  save.changeVisibility(false);
  home_centered.changeVisibility(false);
  
  back.changeVisibility(true);
  home.changeVisibility(true);
  home_icon.resize(icon_size,0);
  back_icon.resize(icon_size,0);
  image(home_icon, width/5 * 1.3, height/6 * 5.65);
  image(back_icon, width/5 * 3.7, height/6 * 5.65);
  
  home.update();
  back.update();
  
}

//method for view screen
void showView() {
  background(colorArray[0]); 
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  save.changeVisibility(false);
  back.changeVisibility(false);
  home.changeVisibility(false);
  
  home_centered.changeVisibility(true);
  home_icon.resize(icon_size,0);
  image(home_icon, width/2, height/6 * 5.65);
  
  home.update();
}

//method for feed screen
void showFeed() {
  background(colorArray[0]); 
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  save.changeVisibility(false);
  back.changeVisibility(false);
  home.changeVisibility(false);
  
  home_centered.changeVisibility(true);
  home_icon.resize(icon_size,0);
  image(home_icon, width/2, height/6 * 5.65);
  
  home.update();
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
  if (back.isOver()) {
    state = note_screen;
  }
  if (home_centered.isOver()) {
    state = home_screen;
  }
}