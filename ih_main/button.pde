//class to create buttons
//note: sets rectMode to CENTER
//note: sets textAlign to CENTER, CENTER
//note: sets textSize to 14
//NOTE THIS BUTTON CLASS HAS BEEN EDITED TO FIT THE APP SPECIFICALLY

class Button {
  color buttonColor; //button's color
  float buttonX; //button's x position
  float buttonY; //button's y position
  float buttonWidth; //button's width
  float buttonHeight; //button's height
  String buttonText; //button's text
  boolean buttonOver = false; //boolean to check if mouse is over button
  boolean visible = false; //boolean to check if button is displayed on screen
  
  //constructor for button class
  Button(color bC, float bX, float bY, float bW, float bH, String bT) {
    buttonColor = bC;
    buttonX = bX;
    buttonY = bY;
    buttonWidth = bW;
    buttonHeight = bH;
    buttonText = bT;
  }
  
  //method to display button
  void update() {
    isOver();
    rectMode(CENTER); //set rectMode to center
    if (buttonOver) { //if mouse is over button make it black
      fill(200);
    }
    else {
      fill(buttonColor); //if mouse is not over button use specified color
    }
    noStroke();
    rect(buttonX, buttonY, buttonWidth, buttonHeight); //draw rectangular button
    if (buttonOver) { //if mouse is over button text is white
      fill(colorArray[0]);
    }
    else {
      fill(255); //if mouse is not over button text is black
    }
    textAlign(CENTER, CENTER); //align text to display center, center
    textSize(20); //text size is 14
    text(buttonText, buttonX, buttonY); //position text in the center of button
  }
 
  //method to check if mouse is over button
  boolean isOver() {
    if (visible == true) {
      if (mouseX >= (buttonX - (buttonWidth/2)) && mouseX <= (buttonX + (buttonWidth/2)) && mouseY >= (buttonY - (buttonHeight/2)) && mouseY <= (buttonY + (buttonHeight/2))) {
        buttonOver = true;
        return true;
      }
      else {
        buttonOver = false;
        return false;
      }
    }
    else {
      return false;
    }
  }  
 
  //method to check if button is visible
  void changeVisibility(boolean visibility) {
    visible = visibility;
  }

}