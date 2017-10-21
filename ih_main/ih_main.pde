//load controlP5 library for GUI
import controlP5.*;
ControlP5 cp5; //for a radio button or something

//setup for screens
final int home_screen = 0; //home screen
final int note_screen = 1; //screen for saving notes
final int meme_screen = 2; //screen for seeing the meme of the day
final int view_screen = 3; //screen for viewing past notes
final int feed_screen = 4; //screen for viewing friend feed
int state = home_screen; //set beginning state to home screen

void setup() {
  size(431, 767); //actual iPhone screen size scaled by 1.15x
  
}