//load controlP5 library for GUI
import controlP5.*;
ControlP5 cp5; //gender


//color array
public color[] colorArray = {color(53,179,72), color(245), color(253,204,155), color(230,168,117),
color(165,117,97), color(83,36,31), color(17,89,158), color(48,118,17), color(29,23,32),
color(81,54,42), color(255,200,92), color(255), color(35,17,108)};
//key = {[0]logo green background, [1]light grey background, [2]light skin, [3]med skin,
//[4]dark skin, [5]brown eyes, [6]blue eyes, [7]green eyes, [8]black hair
//[9]brown hair, [10]blonde hair, [11]shirt color, [12]jeans color}

//setup for screens
final int logo_screen = 0; //screen upon opening
final int setup_screen = 1; //screen upon setup
final int move_screen = 2; //screen to move money from accounts
final int game_screen = 3; //screen for game after moving money
final int progress_screen = 4; //screen after game with game results
final int sim_screen = 5; //screen to simulate activity
final int push_screen = 6; //screen to push simulation live
final int sync_screen = 7; //screen to give api/connectivity permission
int state = logo_screen; //set beginning state to logo screen

//public variables
boolean newUser = true; //check if user is a new user

//avatar related stuff
Avatar user; //user's avatar

//font
PFont font;

//buttons
Button ready; //button to say "I'm ready!"
Button go; //button to say "Let's go!"
Button one_coffee; //button to save one coffee
Button five_coffees; //button to save five coffees
Button twenty_coffees; //button to save twenty coffees
Button alternatives; //button for saving alternatively
Button notifications; //button for sending notifications
Button commit; //button for pushing simulation live
Button back; //button to go back to save some more
Button go_back; //button to go back to sim page
Button share; //button to share to fb


RadioButton gender;
RadioButton skin;
RadioButton hair;
RadioButton eyes;
RadioButton invest_action;
RadioButton exercise_action;

Slider invest;
Slider exercise;
float invest_amount;
float exercise_amount;

//current
float current_invest;
float current_age = 20; //jimmy's age!


//OMAR's Stuff
CoinSystem cs;
int count = 0;
Catcher catcher;
int time;
int happinesspoints;
int wait;
import com.temboo.core.*;
import com.temboo.Library.Facebook.Reading.*;
TembooSession sessiongetfriends = new TembooSession("hack-the-earth", "myFirstApp", "Eu8hggd2WLT6HBM3gKjpEFReeqKr4ewt");
import com.temboo.Library.Withings.Measure.*;
// Create a session using your Temboo account application details
TembooSession session = new TembooSession("hack-the-earth", "myFirstApp", "Eu8hggd2WLT6HBM3gKjpEFReeqKr4ewt");
int current_friends; //current fb friends from fb api
int current_steps; //current step data

float life_expectancy;
float future_savings;

Bar status; //bar for happpiness levels
int hp;

boolean playedGame = false;


void setup() {
  //size(375, 667); //actual iPhone screen size 
  size(431, 767); //actual iPhone screen size scaled by 1.15x
  //size(screen.width, screen.height); //for use on the phone!!
  logo = loadImage("logo.png"); //for use on laptop with datafile!
  //logo = loadImage("https://drive.google.com/open?id=0B4Q8UN-AZk-fOEVWSDRwaTVuN3c"); //for use on phone?
  transamerica = loadImage("transamerica.png");
  facebook = loadImage("facebook.png");
  withings = loadImage("withings.png");

//constructor for avatar class; takes in position, gender, hair color, eye color, skin color
  user = new Avatar(width/2, height/7*4, 0, 1, 0, 2);
  
  font = createFont("Roboto-Light-48.vlw", 16);
  
  ready = new Button(colorArray[0], width/2, height/9 * 8, 110, 50, "I'm ready!");
  go = new Button(color(100), width/2, height/5 * 3.95, 110, 50, "Let's go!");
  one_coffee = new Button(colorArray[0], width/4, 325, 150, 50, "save 1 coffee");
  five_coffees = new Button(colorArray[0], width/4, 425, 150, 50, "save 5 coffees");
  twenty_coffees = new Button(colorArray[0], width/4, 525, 150, 50, "save 20 coffees");
  alternatives = new Button(color(100,100,100,70), width/4, height - 80, 170, 75, "Show me other\nways to save!");
  notifications = new Button(color(100,100,100,70), width/4 * 3, height - 80, 170, 75, "Help me monitor\nmy spending!");
  commit = new Button(color(100,100,100,70), width - 85, height - 50, 150, 40, "set these goals");
  back = new Button(color(100,100,100,70), 85, height - 50, 150, 40, "back to saving");
  go_back = new Button(color(53,179,72), width/2, height - 80, 80, 40, "back");
  share = new Button(colorArray[0], width/2, height - 140, 80, 40, "share");
  
  cp5 = new ControlP5(this);
  gender = cp5.addRadioButton("Gender")
            .setId(1)
            .setNoneSelectedAllowed(false)
            .setSize(80, 35)
            .setSpacingColumn(0)
            .setPosition(135, 120)
            .setItemsPerRow(2)
            .setColorLabel(colorArray[0])
            .addItem("Male",0)
            .addItem("Female",1);
  for (Toggle t:gender.getItems()) {
    t.getCaptionLabel().align(CENTER,CENTER);
    t.getCaptionLabel().setFont(font);
    t.setSize(80, 35);
    t.setColorBackground(color(200));
    t.setColorActive(color(255));
    t.setColorForeground(color(255));
  }
  
  skin = cp5.addRadioButton("Skin")
            .setId(2)
            .setNoneSelectedAllowed(false)
            .setSize(80, 35)
            .setSpacingColumn(0)
            .setPosition(95, 190)
            .setItemsPerRow(3)
            .setColorLabel(colorArray[0])
            .addItem("Light",0)
            .addItem("Medium",1)
            .addItem("Dark",2);
  for (Toggle r:skin.getItems()) {
    r.getCaptionLabel().align(CENTER,CENTER);
    r.getCaptionLabel().setFont(font);
    r.setSize(80, 35);
    r.setColorBackground(color(200));
    r.setColorActive(color(255));
    r.setColorForeground(color(255));
  }
  
   hair = cp5.addRadioButton("Hair")
            .setId(3)
            .setNoneSelectedAllowed(false)
            .setSize(80, 35)
            .setSpacingColumn(0)
            .setPosition(95, 260)
            .setItemsPerRow(3)
            .setColorLabel(colorArray[0])
            .addItem("Black",0)
            .addItem("brown",1)
            .addItem("Blonde",2);
  for (Toggle s:hair.getItems()) {
    s.getCaptionLabel().align(CENTER,CENTER);
    s.getCaptionLabel().setFont(font);
    s.setSize(80, 35);
    s.setColorBackground(color(200));
    s.setColorActive(color(255));
    s.setColorForeground(color(255));
  }
  
  eyes = cp5.addRadioButton("Eyes")
            .setId(4)
            .setNoneSelectedAllowed(false)
            .setSize(80, 35)
            .setSpacingColumn(0)
            .setPosition(95, 330)
            .setItemsPerRow(3)
            .setColorLabel(colorArray[0])
            .addItem("Brown",0)
            .addItem("Blue",1)
            .addItem("Green",2);
  for (Toggle e:eyes.getItems()) {
    e.getCaptionLabel().align(CENTER,CENTER);
    e.getCaptionLabel().setFont(font);
    e.setSize(80, 35);
    e.setColorBackground(color(200));
    e.setColorActive(color(255));
    e.setColorForeground(color(255));
  }
  
  invest_action = cp5.addRadioButton("invest action")
            .setId(5)
            .setNoneSelectedAllowed(false)
            .setSize(width/3, 60)
            .setSpacingColumn(0)
            .setPosition(width/6, 265)
            .setItemsPerRow(2)
            .setColorLabel(colorArray[0])
            .addItem("SAVINGS",0)
            .addItem("INVESTMENTS",1);
  for (Toggle f:invest_action.getItems()) {
    f.getCaptionLabel().align(CENTER,CENTER);
    f.getCaptionLabel().setFont(font);
    f.setSize(width/3, 60);
    f.setColorBackground(color(200));
    f.setColorActive(color(255));
    f.setColorForeground(color(255));
  }
  
  exercise_action = cp5.addRadioButton("exercise action")
            .setId(6)
            .setNoneSelectedAllowed(false)
            .setSize(width/3, 60)
            .setSpacingColumn(0)
            .setPosition(width/6, 390)
            .setItemsPerRow(2)
            .setColorLabel(colorArray[0])
            .addItem("DAILY",0)
            .addItem("WEEKLY",1);
  for (Toggle g:exercise_action.getItems()) {
    g.getCaptionLabel().align(CENTER,CENTER);
    g.getCaptionLabel().setFont(font);
    g.setSize(width/3, 60);
    g.setColorBackground(color(200));
    g.setColorActive(color(255));
    g.setColorForeground(color(255));
  }
  
  invest = cp5.addSlider(" ")
              .setPosition(width/6, 240)
              .setSize(width/3 * 2, 20)
              .setRange(0, 1000)
              .setValue(200)
              .setFont(font)
              .setColorActive(color(255))
              .setColorBackground(color(100))
              .setColorCaptionLabel(color(255))
              .setColorForeground(color(235))
              .setColorValueLabel(colorArray[0]);
                
  exercise = cp5.addSlider("")
              .setPosition(width/4, 290)
              .setSize(width/2, 20)
              .setRange(0, 3)
              .setValue(1)
              .setFont(font)
              .setColorActive(color(255))
              .setColorBackground(color(100))
              .setColorCaptionLabel(color(255))
              .setColorForeground(color(235))
              .setColorValueLabel(colorArray[0]);    
  
  //OMAR's stuff
  cs = new CoinSystem();
  catcher = new Catcher(1);
  status = new Bar();
  
  //Facebook API
  // Run the Friends Choreo function
  runFriendsChoreo();
  runGetActivityMetricsChoreo();
}

//get number of friends
void runFriendsChoreo() {
  // Create the Choreo object using your Temboo session
  Friends friendsChoreo = new Friends(session);
  
  // Set inputs
  friendsChoreo.setAccessToken("EAARaPZChuK1UBAHELWU0yMqeb7AhfCOZArre0IdtTTYZBK6GDnpvIk5iJWKrR6ZAw3oflIiQQrYubLSjdKCK1y0y3OCmXqOY4VZCggY618BVHZA2O3HhcQy9EktwJt43haTxaGbZBRFddECciFur3JZATZBWxybTkwg4TyPaRReGxwgZDZD");

  // Run the Choreo and store the results
  FriendsResultSet friendsResults = friendsChoreo.run();
  String data = friendsResults.getResponse();
  JSONObject fb = parseJSONObject (data);
    current_friends = fb.getJSONObject("summary").getInt("total_count");
}

void runGetActivityMetricsChoreo() {
  // Create the Choreo object using your Temboo session
  GetActivityMetrics getActivityMetricsChoreo = new GetActivityMetrics(session);

  // Set inputs
  getActivityMetricsChoreo.setUserID("9521676");
  getActivityMetricsChoreo.setConsumerKey("b5db2cb98729485f58106dd7ee51c32662e83e60df49847f21df50b233d");
  getActivityMetricsChoreo.setAccessToken("c01b37e78088b86eee0cecb2eb8969fd905532337107ec2ff43154683278");
  getActivityMetricsChoreo.setConsumerSecret("0b346938dc8b27e1f544f9301b93f99f12bfb92d63de0144bdd0c66275bb3");
  getActivityMetricsChoreo.setAccessTokenSecret("5df0578e3e3f24f9431e149ec05cf7b84c394dd3b6c16f80ec14b1362");

  // Run the Choreo and store the results
  GetActivityMetricsResultSet getActivityMetricsResults = getActivityMetricsChoreo.run();
  
  // Print results
  String data = getActivityMetricsResults.getResponse();
  JSONObject m = parseJSONObject (data);
    current_steps = m.getJSONObject("body").getInt("steps");
}


void draw() {
  //background(colorArray[1]);
  //handle screens
  switch (state) {
    case logo_screen:
      showLogo(); //show logo screen at the start of every run
      break;
    case sync_screen:
      showSync(); //show sync screen for a new user
      break;
    case setup_screen:
      showSetup(); //show setup screen at the start of using the app
      break;
    case move_screen:
      showMove(); //show move money screen after opening the app and after button
      break;
    case game_screen:
      showGame(); //show game screen only after moving money
      break;
    case progress_screen:
      showProgress(); //show progress made from game
      break;
    case sim_screen:
      showSim(); //show simulation as main screen
      break;
    case push_screen:
      showPush(); //show screen to push simulation live
      break;
  }
      
}


//method for logo screen, CHANGES IMAGE MODE TO CENTER
void showLogo() {
  cp5.hide();
  background(colorArray[0]);
  imageMode(CENTER);
  logo.resize(250, 0);
  image(logo, width/2, height/9 * 4);
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(font);
  textSize(22);
  text("live healthy, be wealthy.", width/2, height/9 * 5);
  if (mousePressed == true) {
    if (newUser == true) {
      state = sync_screen; //go to setup screen so user can sync their accounts
    }
    else {
      state = move_screen; //go to move money screen if user has already personlized
    }
  }
}


//method for sync screen
void showSync() {
  background(colorArray[1]);
  textSize(20);
  fill(colorArray[0]);
  text("sync your bank, health, and social accounts\nto live a healthier and wealthier life", width/2, height/6 * 2); 
  transamerica.resize(70,0);
  image(transamerica, width/5 * 1.30, height/2);
  withings.resize(75,0);
  image(withings, width/2, height/2);
  facebook.resize(110,0);
  image(facebook, width/5 * 3.70, height/2);
  //if time permits, link images to their pages
  ready.changeVisibility(true);
  ready.update();
}


//method for setup screen
void showSetup() {
//show the personalization screen here, really only needs to run once
  background(colorArray[0]);
  ready.changeVisibility(false);
  cp5.show(); //show radio button list
  invest.hide();
  exercise.hide();
  invest_action.hide();
  exercise_action.hide();

  textSize(25);
  fill(color(255));
  text("create a character to see", width/2, 32);
  text("the benefits of living well", width/2, 60);
  textSize(20);
  text("gender", width/2, 100);
  text("skin", width/2, 170);
  text("hair", width/2, 240);
  text("eyes", width/2, 310);
  user.update();
  go.changeVisibility(true);
  go.update();
  

}

//method for move screen
void showMove() {
//show the option to move discretionary spending here 
  background(colorArray[1]);
  go.changeVisibility(false);
  invest.show();
  exercise.show();
  invest_action.show();
  exercise_action.show();
  cp5.hide();
  textSize(30);
  fill(colorArray[0]);
  text("ready to be healthy", width/2, 100);
  text("and", width/2, 135);
  text("get wealthy?", width/2, 170);
  textSize(35);
  text("=", width/2, 325);
  textSize(26);
  text("3 coffees", width/4 * 3, 308);
  text("in 20 years", width/4 * 3, 332);
  textSize(35);
  text("=", width/2, 425);
  textSize(26);
  text("15 coffees", width/4 * 3, 408);
  text("in 20 years", width/4 * 3, 432);
  textSize(35);
  text("=", width/2, 525);
  textSize(26);
  text("60 coffees", width/4 * 3, 508);
  text("in 20 years", width/4 * 3, 532);
  textSize(12);
  fill(color(100));
  text("5% APR Applied", width/2, height - 10);
  one_coffee.changeVisibility(true);
  five_coffees.changeVisibility(true);
  twenty_coffees.changeVisibility(true);
  alternatives.changeVisibility(true);
  notifications.changeVisibility(true);
  one_coffee.update();
  five_coffees.update();
  twenty_coffees.update();
  alternatives.update();
  notifications.update();
}

//method for game screen
void showGame() {
  one_coffee.changeVisibility(false);
  five_coffees.changeVisibility(false);
  twenty_coffees.changeVisibility(false);
  alternatives.changeVisibility(false);
  notifications.changeVisibility(false);
  background(colorArray[1]);
  wait = 8000;
  count++;
  cs.addCoin();
  int n = cs.coins.size()-1;
  if(count%2==0 || count%3==0 || count%7==0){
    cs.coins.remove(n);
  }
  if((millis()-time)>wait){
    state = progress_screen;
  }
  //time = millis();
  //wait = 4;
  hp = cs.run();
  playedGame = true;
  //happinesspoints = happinesspoints + hp;
  catcher.display();
}

//method for progress screen
void showProgress() {
//show the progress made from the game!!
  background(colorArray[0]);
  //show the progress made from the game!!
  for(int cell = 0;cell<cs.coins.size()-1;cell++){
    cs.coins.get(cell).position.y = 0;
  }
  if (playedGame == true) {
    status.updatePoints(hp);
    playedGame = false;
  }
  user.update();
  status.update();
  textSize(15);
  fill(color(255));
  text("Congratulations! You've earned", width/2, 320);
  text(hp + " life points by investing in your future!", width/2, 335);
  
  
  textSize(12);
  fill(color(255));
  text("new points!", (width/2)+50, 375);
  
  if (mousePressed == true) {
    state = sim_screen;
  }
  if (mousePressed == true) {
      state = sim_screen;
  }
}


//method for sim screen
void showSim() {
//show the simulation options & avatar here!!
  go_back.changeVisibility(false);
  share.changeVisibility(false);
  one_coffee.changeVisibility(false);
  five_coffees.changeVisibility(false);
  twenty_coffees.changeVisibility(false);
  alternatives.changeVisibility(false);
  notifications.changeVisibility(false);
  background(colorArray[0]);

  current_invest = 1000;
  
  rectMode(CENTER);
  fill(color(240));
  noStroke();
  rect(width/2,height/5, width, 100);
  cp5.show();
  gender.hide();
  skin.hide();
  hair.hide();
  eyes.hide();
  invest_action.hide();
  exercise_action.hide();
  textSize(16);
  fill(color(255));
  text("investment dollars per week", width/2, 222);
  text("exercise hours per week", width/2, 272);
  text("life points earned", width/2, 332);
  textSize(35);
  textAlign(LEFT);
  text("$" + str(round(current_invest)), 20, 40); 
  textAlign(CENTER);
  text(str(current_friends), width/2, 40);
  textAlign(RIGHT);
  text(str(current_steps), width - 20, 40);
  textSize(14);
  textAlign(LEFT);
  text("current savings", 20, 70);
  text("& investments", 20, 90);
  textAlign(CENTER);
  text("current friends", width/2, 70);
  text("through Facebook", width/2, 90);
  textAlign(RIGHT);
  text("current steps", width - 20, 70);
  text("through Withings", width - 20, 90);
  textAlign(CENTER);
  
  
  invest_amount = invest.getValue();
  exercise_amount = exercise.getValue();
  user.update();
  status.update();
  commit.changeVisibility(true);
  back.changeVisibility(true);
  commit.update();
  back.update();
  
  calculateLife();
  textAlign (RIGHT);
  fill(colorArray[0]);
  textSize(35);
  text(str(round(life_expectancy)) + " years", width - 10, height/5 - 10);
  textSize(18);
  text("predicted life expectancy", width - 10, height/5 + 25);
  
  calculateMoney();
  textAlign(LEFT);
  textSize(35);
  text("$"+ str(round(future_savings / 1000)) + "k", 10, height/5 - 10);
  textSize(18);
  text("predicted future savings", 10, height/5 + 25);
  
 
  textSize(12);
  fill(color(100));
  text("5% APR Applied", 5, height - 10);
  textAlign(CENTER,CENTER);

}

void calculateMoney() {
  float years_left = life_expectancy - current_age;
  float yearly_investment = invest_amount * 52;
  future_savings = (current_invest*(pow(1.05, years_left-1)))+ (yearly_investment * (((pow(1.05, years_left)) - 1)/.05));
}

//method for push screen
void showPush() {
//show the push screen here!!
  background(colorArray[1]);
  commit.changeVisibility(false);
  back.changeVisibility(false);
  go_back.changeVisibility(true);
  go_back.update();
  share.changeVisibility(true);
  share.update();
  cp5.show();
  gender.hide();
  skin.hide();
  hair.hide();
  eyes.hide();
  invest.hide();
  exercise.hide();
  fill(colorArray[0]);
  textSize(30);
  text("CONGRATULATIONS", width/2, 60);
  textSize(22);
  text("you're well on your way to living a", width/2, 95);
  text("healthier and wealthier life!", width/2, 125);
  textSize(22);
  text("transfer the $" + str(round(invest_amount)) + " into:", width/2, 230);
  text("remind me to exercise " + str(round(exercise_amount * 60)) + "min:", width/2, 360);
  
  
}

//method for button functions
void mousePressed() {
  if (ready.isOver()) {
    state = setup_screen;
  }
  if (go.isOver()) {
    newUser = false;
    state = move_screen;
  }
  if (one_coffee.isOver()) {
    time = millis();
    state = game_screen;
  }
  if (five_coffees.isOver()) {
    time = millis();
    state = game_screen;  
  }
  if (twenty_coffees.isOver()) {
    time = millis();
    state = game_screen;
  }
  if (alternatives.isOver()) {
    state = sim_screen;  
  }
  if (commit.isOver()) {
    gender.show();
    skin.show();
    hair.show();
    eyes.show();
    invest_action.show();
    exercise_action.show();
    cp5.hide();
    state = push_screen;  
  }
  if (back.isOver()) {
    gender.show();
    skin.show();
    hair.show();
    eyes.show();
    invest_action.show();
    exercise_action.show();
    cp5.hide();
    hp = 0;
    state = move_screen;
  }
  if (go_back.isOver()) {
    gender.show();
    skin.show();
    hair.show();
    eyes.show();
    invest.show();
    exercise.show();
    cp5.hide();
    state = sim_screen;
  }
}

//method for radio button functionality

void controlEvent(ControlEvent theEvent) {
  switch (theEvent.getId()) {
    case(1):
      user.gender = (int) (theEvent.getValue());
      break;
    case(2):
      user.skin_color = (int) (theEvent.getValue());
      break;
    case(3):
      user.hair_color = (int) (theEvent.getValue());
      break;
    case(4):
      user.eye_color = (int) (theEvent.getValue());
      break;
  }
}


//method for calculating life expectancy
void calculateLife() {
  //assume 1 hour and walk 10,000
  int friend_unit = current_friends / 70; //adds one year of life expectancy
  int avg_expectancy = 79;
  float exercise_est = ((((avg_expectancy - current_age)) * 52)/60) * exercise_amount;
  float hours_walked = (current_steps / 10000) * 365 * (current_age/2) + exercise_est;

  if (user.gender == 0) {
    avg_expectancy = 76;
  }
  if (user.gender == 1) {
    avg_expectancy = 81;
  }
  life_expectancy = current_age + avg_expectancy + friend_unit + (hours_walked / 8);
}