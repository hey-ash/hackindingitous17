//load controlP5 library for GUI
import controlP5.*;

import java.util.Random;
import java.util.Collections;

//load logo image & other icons
PImage logo;
PImage home_icon;
PImage save_icon;
PImage back_icon;
int icon_size = 40;
String tMeme;
PImage currentMeme;
PImage forward_icon;
PImage alex1;
PImage emily1;
PImage omar1;
PImage ashley1;

//set font
PFont dense;
int font_size = 48;

/*public void createFriends(){
  User friend1 = new User();
  User friend2 = new User();
  User friend3 = new User();
  int m = month();
  int d = day();
  int y = year();
  String s = str(m) + "/" + str(d) + "/" + str(y);
  friend1.dates.append(s);
  friend2.dates.append(s);
  friend3.dates.append(s);
  
  String post1 = "Today one of my neighbors brought over my favorite dessert for my birthday. I am so grateful for the wonderful people God has brought into my life!";
  String post2 = "I am always so grateful for another beauitiful day with my friends and family. Bless the Lord for everything in my life.";
  String post3 = "I really enjoyed my classess today. My professors are very nice and gave me a lot of help with my homework.";
  friend1.inputs.append(post1);
  friend2.inputs.append(post2);
  friend3.inputs.append(post3);
  
  friend1.memes.append("11.jpeg");
  friend2.memes.append("2.jpeg");
  friend3.memes.append("32.jpeg");
  
}
*/

public String getMeme(String memo){
  //images list
  String[] adimages = {"1.jpeg", "4.jpeg", "15.jpeg", "16.jpeg", "18.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "27.jpeg", "28.jpeg", "29.jpeg", "30.jpeg"};
  String[] acimages = {"1.jpeg", "4.jpeg", "7.jpeg", "8.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "16.jpeg", "18.jpeg", "19.jpeg", "20.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "26.jpeg", "27.jpeg", "28.jpeg", "29.jpeg", "30.jpeg", "31.jpeg", "32.jpeg"};
  String[] emimages = {"1.jpeg", "4.jpeg", "9.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "19.jpeg", "20.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "26.jpeg", "27.jpeg", "28.jpeg", "29.jpeg", "30.jpeg", "31.jpeg", "32.jpeg"};
  String[] eximages = {"2.jpeg", "5.jpeg", "6.jpeg", "7.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "23.jpeg", "25.jpeg", "30.jpeg"};
  String[] reimages = {"2.jpeg", "5.jpeg", "6.jpeg", "7.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "18.jpeg", "23.jpeg", "25.jpeg", "30.jpeg"};
  String[] rellimages = {"6.jpeg", "7.jpeg", "12.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "23.jpeg", "25.jpeg", "27.jpeg", "30.jpeg"};
  String[] thimages = {"6.jpeg", "9.jpeg", "11.jpeg", "12.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "21.jpeg", "23.jpeg", "25.jpeg", "27.jpeg", "29.jpeg", "30.jpeg", "32.jpeg"};
  
  String[] admiration = {"adoration", "affection", "applause", "appreciation", "delight", "love", "praise", "wonder", "approval", "favor", "glory", "honor", "like", "worship", "marvel", "you", "admire", "my", "mom", "is", "so", "amazing", "sent", "me", "food", "drove", "all", "way", "here", "deliver", "today", "saw", "someone", "help", "this", "homeless", "person", "always", "awe", "humanity", "people", "care", "each", "other", "every", "day", "admire", "God", "work", "world", "morning", "helped", "solve", "really", "difficult", "problem", "grateful", "they", "for", "I"};
  String[] accomplishment = {"ability", "achievement", "capability", "performance", "talent", "realization", "I", "made", "A", "my", "exam", "so", "blessed", "because", "think", "would", "do", "well", "today", "one", "business", "exams", "expecting", "it", "difficult", "proud", "myself"};
  String[] empowerment = {"trust", "vest", "privilege", "encouraged", "me", "become", "better", "person", "even", "though", "my", "day", "really", "long", "tired", "literally", "entire", "day", "able", "power", "through", "everything", "get", "through", "day", "while", "still", "feeling", "energized"};
  String[] excitement = {"I", "got", "into", "really", "excited", "about", "all", "that", "future", "holds", "because", "out", "my", "outcomes", "will", "be", "good"};
  String[] reflective = { "contemplative", "meditate","I", "realized", "that", "had", "very", "blessed", "childhood", "because", "grew", "up", "in", "great", "family", "environment", "know", "not", "everyone", "really", "lucky", "life", "fortunate", "have", "roof", "over", "head", "meal", "my", "table", "every", "day", "so", "blessed", "have", "this", "amazing", "life"};
  String[] relief = {"comfort", "happy","happiness", "help", "maintenance","satisfy", "satisfaction", "support", "cheer", "cure", "lift", "solace","I", "did", "not", "study", "for", "my", "exam", "but", "I", "did", "okay", "car", "almost", "ran", "me", "over", "but", "after", "lot", "prayer", "really", "relieved", "friend", "hospital", "after", "his", "injuries", "today", "almost", "accident", "which", "might", "have", "resulted", "people", "injured", "thankfully", "nothing", "went", "wrong", "okay"};
  String[] thankful = {"content", "grateful", "pleased", "relieved", "satisfied", "satisfy", "praise","my", "friend", "gave", "me", "present", "it", "was", "water", "bottle", "thankful", "for", "all", "that", "my", "family", "provided", "me", "in", "terms", "of", "love", "support", "today", "friends", "supported", "tough", "time", "life", "thankful", "support", "there"};
  int totalwordcounts = 0;
  int admirationcounts = 0;
  int accomplishmentcounts = 0;
  int empowermentcounts = 0;
  int excitementcounts = 0;
  int reflectivecounts = 0;
  int reliefcounts = 0;
  int thankfulcounts = 0;
  String[] parts = split(memo, ' ');
  int memosize = parts.length;
  int adlen = admiration.length;
  int aclen = accomplishment.length;
  int emlen = empowerment.length;
  int exlen = excitement.length;
  int relen = reflective.length;
  int rellen = relief.length;
  int thlen = thankful.length;
  
  int adimageslen = adimages.length;
  int acimageslen = acimages.length;
  int emimageslen = emimages.length;
  int eximageslen = eximages.length;
  int reimageslen = reimages.length;
  int relimageslen = rellimages.length;
  int thimageslen = thimages.length;
  for (int i = 0; i < memosize; i++){
    totalwordcounts ++;
    for (int j = 0; j < adlen; j++){
      if (parts[i].equals(admiration[j]) == true){
        
        admirationcounts ++;
      }
    }
    for (int j = 0; j < aclen; j++){
      if (parts[i].equals(accomplishment[j]) == true) {
        accomplishmentcounts ++;
      }
    }
    for (int j = 0; j < emlen; j++){
      if (parts[i].equals(empowerment[j]) == true){
        empowermentcounts ++;
      }
    }
    for (int j = 0; j < exlen; j++){
      if (parts[i].equals(excitement[j]) == true){
        excitementcounts ++;
      }
    }
    for (int j = 0; j < relen; j++){
      if (parts[i].equals(reflective[j]) == true){
        reflectivecounts ++;
      }
    }
    for (int j = 0; j < rellen; j++){
      if (parts[i].equals(relief[j]) == true){
        reliefcounts ++;
      }
    }
    for (int j= 0; j < thlen; j++){
      if (parts[i].equals(thankful[j]) == true){
        thankfulcounts ++;
      }
    }
    
    //checkList(parts[i], admiration, accomplishment, empowerment, excitement, reflective, relief, thankful);
  }
  int[] counts = {accomplishmentcounts, empowermentcounts, excitementcounts, reflectivecounts, reliefcounts, thankfulcounts, admirationcounts};
  int maxcounts = max(counts); 
  Random rand = new Random();

  
  if (accomplishmentcounts == maxcounts){
    int  n = rand.nextInt(acimageslen);
    return acimages[n];
  }
  if (empowermentcounts == maxcounts){
    int  n = rand.nextInt(emimageslen);
    return emimages[n];
  }
  if (excitementcounts == maxcounts){
    int  n = rand.nextInt(eximageslen);
    return eximages[n];
  }
  if (reflectivecounts == maxcounts){
    int  n = rand.nextInt(reimageslen);
    return reimages[n];
  }
  if (reliefcounts == maxcounts){
    int  n = rand.nextInt(relimageslen);
    return rellimages[n];
  }
  if (thankfulcounts == maxcounts){
    int  n = rand.nextInt(thimageslen);
    return thimages[n];
  }
  if (admirationcounts == maxcounts){
    int  n = rand.nextInt(adimageslen);
    return adimages[n];
  }
  String st = "";
  return st;
}

//setup for screens
final int home_screen = 0; //home screen
final int note_screen = 1; //screen for saving notes
final int meme_screen = 2; //screen for seeing the meme of the day
final int view_screen = 3; //screen for viewing past notes
final int feed_screen = 4; //screen for viewing friend feed
final int view_screen2 = 5; //second screen for viewing pastnotes
final int feed_screen2 = 6; //second screen for viewng past friend feeds
int state = home_screen; //set beginning state to home screen

//color array
public color[] colorArray = {color(201,235,227), color(237,106,90), color(255,255,255,0), color(255,186,170)};
//key = [0]background, [1]button background, [2]transparent, [3]BUTTON HOVER

//buttons
Button write; //button for user to write a note
Button view; //button to view past notes
Button feed; //button to view feed
Button home; //button to go home
Button save; //button to save the note
Button back; //button to go back to note page
Button home_centered; //button to go back to home page but it is centered
Button back_scroll; //button to scroll back
Button forward_scroll; //button to scroll forward
Button back_scroll_feed;
Button forward_scroll_feed;


//User input stuff
User P1; 
Textfield dailynote;
String st = "";
String tempSt = "";
StringList line = new StringList();
Boolean canType = false;

void setup() {
  size(431, 767); //actual iPhone screen size scaled by 1.15x
  
  write = new Button(colorArray[1], colorArray[3], width/2, height/6 * 3, 200, 70, "WRITE A MEMO");
  view = new Button(colorArray[1], colorArray[3], width/2, height/6 * 4, 200, 70, "VIEW MY MEMOS");
  feed = new Button(colorArray[1], colorArray[3], width/2, height/6 * 5, 200, 70, "SEE MY FEED");
  home = new Button(colorArray[2], colorArray[2], width/5 * 1.3, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  save = new Button(colorArray[2], colorArray[2], width/5 * 3.7, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  back = new Button(colorArray[2], colorArray[2], width/5 * 3.7, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  home_centered = new Button(colorArray[2], colorArray[2], width/2, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  back_scroll = new Button(colorArray[2], colorArray[2], width/5 * 1.3, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  forward_scroll = new Button(colorArray[2], colorArray[2], width/5 * 3.7, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  back_scroll_feed = new Button(colorArray[2], colorArray[2], width/5 * 1.3, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  forward_scroll_feed = new Button(colorArray[2], colorArray[2], width/5 * 3.7, height/6 * 5.65, icon_size + 5, icon_size + 5, "");
  
  logo = loadImage("mems.png");
  home_icon = loadImage("home.png");
  save_icon = loadImage("save.png");
  back_icon = loadImage("back.png");
  forward_icon = loadImage("forward.png");
  
  dense = createFont("Dense-Regular.otf", 48);
  textFont(dense, font_size);
  
  P1 = new User();
  
  alex1 = loadImage("29.jpeg");
  emily1 = loadImage("20.jpeg");
  omar1 = loadImage("12.jpeg");
  ashley1 = loadImage("15.jpeg");
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
    case view_screen2:
      showView2();
      break;
    case feed_screen2:
      showFeed2();
      break;
  }
  
}




// parse through the text
// create libraries of each of the themes
// clump the words, identify the most prominent words, classify into the theme based on the most frequently used words
// create dictionaries, lists for each of the images in the themes
// assign the entry to one of the dictionaries

// alternatively, 







//method for home screen, CHANGES IMAGE MODE TO CENTER
void showHome() {
  background(colorArray[0]);
  canType = false;
  home.changeVisibility(false);
  save.changeVisibility(false);
  write.changeVisibility(true);
  back.changeVisibility(false);
  home_centered.changeVisibility(false);
  back_scroll.changeVisibility(false);
  forward_scroll.changeVisibility(false);
  back_scroll_feed.changeVisibility(false);
  forward_scroll_feed.changeVisibility(false);
  
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
  canType = true;
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  back.changeVisibility(false);
  home_centered.changeVisibility(false);
  back_scroll.changeVisibility(false);
  forward_scroll.changeVisibility(false);
  back_scroll_feed.changeVisibility(false);
  forward_scroll_feed.changeVisibility(false);
  
  home.changeVisibility(true);
  save.changeVisibility(true);
  home_icon.resize(icon_size,0);
  save_icon.resize(icon_size,0);
  image(home_icon, width/5 * 1.3, height/6 * 5.65);
  image(save_icon, width/5 * 3.7, height/6 * 5.65);
  
  noStroke();
  fill(255);
  rect(width/2, height/2, width - 60, height - 250, 10);
  
  fill(colorArray[1]);
  textAlign(LEFT);
  textSize(60);
  text(P1.getDate(), 25, 80);
  home.changeVisibility(true);
  save.changeVisibility(true);
  home.update();
  save.update();
  
  fill(0);
  textAlign(LEFT);
  printClean(st);
  
  home.update();
  save.update();
  
 
}

//method for meme screen
void showMeme() {
  background(colorArray[0]); 
  canType = false;
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  save.changeVisibility(false);
  home_centered.changeVisibility(false);
  back_scroll.changeVisibility(false);
  forward_scroll.changeVisibility(false);
  back_scroll_feed.changeVisibility(false);
  forward_scroll_feed.changeVisibility(false);
  
  
  currentMeme = loadImage(tMeme);
  currentMeme.resize(width*2/5,0);
  currentMeme.resize(0, height*2/5);
  image(currentMeme, width/2, height/2 + 20);
  
  back.changeVisibility(true);
  home.changeVisibility(true);
  home_icon.resize(icon_size,0);
  back_icon.resize(icon_size,0);
  image(home_icon, width/5 * 1.3, height/6 * 5.65);
  image(back_icon, width/5 * 3.7, height/6 * 5.65);
  
  fill(colorArray[1]);
  textAlign(CENTER);
  textSize(60);
  text("Bless up!", width/2, height/2 - 250);
  
  home.update();
  back.update();
  
}

//method for view screen
void showView() {
  background(colorArray[0]); 
  canType = false;
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  save.changeVisibility(false);
  back.changeVisibility(false);
  home.changeVisibility(false);
  back_scroll_feed.changeVisibility(false);
  forward_scroll_feed.changeVisibility(false);
  
  back_scroll.changeVisibility(true);
  forward_scroll.changeVisibility(true);
  back_scroll.update();
  forward_scroll.update();
  back_icon.resize(icon_size,0);
  forward_icon.resize(icon_size,0);
  image(back_icon, width/5 * 1.3, height/6 * 5.65);
  image(forward_icon, width/5 * 3.7, height/6 * 5.65);
  
  
  home_centered.changeVisibility(true);
  home_icon.resize(icon_size,0);
  image(home_icon, width/2, height/6 * 5.65);
  
  textAlign(CENTER);
  textSize(150);
  fill(colorArray[1]);
  text("4", width/2, height/2 - 190);
  textSize(80);
  fill(0);
  text("MEMOS", width/2, height/2 - 100);
  
  
  textAlign(LEFT);
  textSize(35);
  fill(colorArray[1]);
  text("10/20/2017", 30, height/2);
  noStroke();
  fill(255);
  rect(width/2, height/2 + 70, width - 60, 100, 10);
  textAlign(LEFT);
  textSize(25);
  fill(0);
  text("My friday was great! I got at least 7 hours of sleep, the", 40, height/2 + 50);
  text("best I've had in awhile! I was well-rested and ready to face", 40, height/2 + 80);
  text("the day.", 40, height/2 + 110);
  
  textAlign(LEFT);
  textSize(35);
  fill(colorArray[1]);
  text("10/19/2017", 30, height/2 + 160);
  noStroke();
  fill(255);
  rect(width/2, height/2 + 230, width - 60, 100, 10);
  textAlign(LEFT);
  textSize(25);
  fill(0);
  text("Today was a good day. Even though I had an exam, I was", 40, height/2 + 210);
  text("sort of prepared and wasn't too destroyed by the questions.", 40, height/2 + 240);
  text("Hopefully I end up doing ok.", 40, height/2 + 270);
  
  home.update();
}


//method for second view screen
void showView2() {
  background(colorArray[0]); 
  canType = false;
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  save.changeVisibility(false);
  back.changeVisibility(false);
  home.changeVisibility(false);
  back_scroll_feed.changeVisibility(false);
  forward_scroll_feed.changeVisibility(false);
  
  back_scroll.changeVisibility(true);
  forward_scroll.changeVisibility(true);
  back_scroll.update();
  forward_scroll.update();
  back_icon.resize(icon_size,0);
  forward_icon.resize(icon_size,0);
  image(back_icon, width/5 * 1.3, height/6 * 5.65);
  image(forward_icon, width/5 * 3.7, height/6 * 5.65);
  
  
  home_centered.changeVisibility(true);
  home_icon.resize(icon_size,0);
  image(home_icon, width/2, height/6 * 5.65);
  
  textAlign(CENTER);
  textSize(150);
  fill(colorArray[1]);
  text("4", width/2, height/2 - 190);
  textSize(80);
  fill(0);
  text("MEMOS", width/2, height/2 - 100);
  
  
  textAlign(LEFT);
  textSize(35);
  fill(colorArray[1]);
  text("10/18/2017", 30, height/2);
  noStroke();
  fill(255);
  rect(width/2, height/2 + 70, width - 60, 100, 10);
  textAlign(LEFT);
  textSize(25);
  fill(0);
  text("Day started out kinda rough, but thankfully improved.", 40, height/2 + 50);
  text("Really appreciate my friends for their help today and", 40, height/2 + 80);
  text("for cheering me up :)", 40, height/2 + 110);
  
  textAlign(LEFT);
  textSize(35);
  fill(colorArray[1]);
  text("10/10/2017", 30, height/2 + 160);
  noStroke();
  fill(255);
  rect(width/2, height/2 + 230, width - 60, 100, 10);
  textAlign(LEFT);
  textSize(25);
  fill(0);
  text("Starting out this Mems thing. It seems pretty cool tbh.", 40, height/2 + 210);
  text("Blessed to have access to technology and ability to", 40, height/2 + 240);
  text("do neat things like this!", 40, height/2 + 270);
  
  home.update();
  
}



//method for feed screen
void showFeed() {
  background(colorArray[0]); 
  canType = false;
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  save.changeVisibility(false);
  back.changeVisibility(false);
  home.changeVisibility(false);
  back_scroll.changeVisibility(false);
  forward_scroll.changeVisibility(false);
  
  back_scroll_feed.changeVisibility(true);
  forward_scroll_feed.changeVisibility(true);
  back_icon.resize(icon_size,0);
  forward_icon.resize(icon_size,0);
  image(back_icon, width/5 * 1.3, height/6 * 5.65);
  image(forward_icon, width/5 * 3.7, height/6 * 5.65);
  
  home_centered.changeVisibility(true);
  home_icon.resize(icon_size,0);
  image(home_icon, width/2, height/6 * 5.65);
  
  
  textAlign(CENTER);
  textSize(80);
  fill(colorArray[1]);
  text("FRIEND FEED", width/2, height/2 - 280);
  
  noStroke();
  fill(255);
  rect(width/2, height/2 - 100, width - 60, 225, 10);
  textAlign(LEFT);
  textSize(35);
  fill(colorArray[1]);
  text("ALEX'S  MEME  ON  10/18/2017", 50, height/2 - 180);
  alex1.resize(200,0);
  image(alex1, width/2, height/2 - 80);
  
  noStroke();
  fill(255);
  rect(width/2, height/2 + 175, width - 60, 225, 10);
  textAlign(LEFT);
  textSize(35);
  fill(colorArray[1]);
  text("EMILY'S  MEME  ON  10/18/2017", 50, height/2 + 95);
  emily1.resize(200,0);
  image(emily1, width/2, height/2 + 195);
  
  home.update();
  back_scroll_feed.update();
  forward_scroll_feed.update();
}

//method for second feed screen
void showFeed2() {
  background(colorArray[0]); 
  canType = false;
  write.changeVisibility(false);
  view.changeVisibility(false);
  feed.changeVisibility(false);
  save.changeVisibility(false);
  back.changeVisibility(false);
  home.changeVisibility(false);
  back_scroll.changeVisibility(false);
  forward_scroll.changeVisibility(false);
  
  back_scroll_feed.changeVisibility(true);
  forward_scroll_feed.changeVisibility(true);
  back_icon.resize(icon_size,0);
  forward_icon.resize(icon_size,0);
  image(back_icon, width/5 * 1.3, height/6 * 5.65);
  image(forward_icon, width/5 * 3.7, height/6 * 5.65);
  
  home_centered.changeVisibility(true);
  home_icon.resize(icon_size,0);
  image(home_icon, width/2, height/6 * 5.65);
  
  
  textAlign(CENTER);
  textSize(80);
  fill(colorArray[1]);
  text("FRIEND FEED", width/2, height/2 - 280);
  
  noStroke();
  fill(255);
  rect(width/2, height/2 - 100, width - 60, 225, 10);
  textAlign(LEFT);
  textSize(35);
  fill(colorArray[1]);
  text("OMAR'S  MEME  ON  10/18/2017", 50, height/2 - 180);
  omar1.resize(170,0);
  image(omar1, width/2, height/2 - 80);
  
  noStroke();
  fill(255);
  rect(width/2, height/2 + 175, width - 60, 225, 10);
  textAlign(LEFT);
  textSize(35);
  fill(colorArray[1]);
  text("ASHLEY'S  MEME  ON  10/17/2017", 50, height/2 + 95);
  ashley1.resize(170,0);
  image(ashley1, width/2, height/2 + 195);
  
  home.update();
  back_scroll_feed.update();
  forward_scroll_feed.update();
  
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
    P1.save(st);
    tMeme = getMeme(P1.inputs.get(0));
    state = meme_screen;  
  }
  if (back.isOver()) {
    state = note_screen;
  }
  if (home_centered.isOver()) {
    state = home_screen;
  }
  if (back_scroll.isOver()) {
    state = view_screen;
  }
  if (forward_scroll.isOver()) {
    state = view_screen2;
  }
  if (back_scroll_feed.isOver()) {
    state = feed_screen;
  }
  if (forward_scroll_feed.isOver()) {
    state = feed_screen2;
  }
}

//TextWrap
void printClean(String s) {
  //TextWrap
  String holder ="";
  int w = 0;    // Accumulate width of chars
  int i = 0;      // Count through chars
  int rememberSpace = 0; // Remember where the last space was
  String[] allLines = {};
  String sub = "";
  int y = 160;
  // As long as we are not at the end of the String
  while (w < s.length()) {
    // Current char
    sub=sub+s.charAt(i);
    if (i == 35) {//reach end of line?
      holder = s.substring(rememberSpace, s.length()); // Make a substring
      allLines = append(allLines, holder);
      i = 0;
      holder = "";
      y = y + 30;
      rememberSpace = w;
    } else {
      i++;
      w++;
    }
    text(s.substring(rememberSpace, w), 45, y);
  }
}

//for input text
void keyPressed() {
  if (canType == true) {
    if (keyCode == ENTER) {
        st = st +"\n";
      }
    else if (keyCode == BACKSPACE) {
      if (st.length()==0) {
      } else {
        st = st.substring( 0, st.length()-1 );
      } 
    } else {
      st= st+key;
    }
  }
}