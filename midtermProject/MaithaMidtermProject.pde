/*

 INTRO TO INTERACTIVE MEDIA
 PROF. MICHAEL SHILOH
 - MAITHA ALGHFELI
 
 MIDTERM PROJECT: FARM-VILLE
 MARCH 4, 2021
 
 INSTRUCTIONS
 - Game starts with an instructions screen. Press Enter to start game.
 - A scene of farm animals is presented with a word on the TOP LEFT CORNER.
 - Player must press on the animal that correspond with the word to win.
 - If the correct animal is not pressed a losing sound plays.
 - If the correct animal is pressed a winning page pops up.
 - When win page pops up, player can restart the game by pressing ARROW UP.
 - The game goes for one level at a time, it is meant for kids therefore trial and error is only performed with sounds.
 
 */


//------------------------------------------------------------CODE START!

//INITIATING SOUND UPLOAD
import processing.sound.*;
SoundFile soundWIN, soundWRONG, soundCOW, soundPIG, soundSHEEP, soundHORSE, soundROOSTER; 

//INITIATING IMAGE UPLOAD
PImage FARM; //BACKGROUND
PImage COW, PIG, SHEEP, HORSE, ROOSTER; //ANIMALS

//IMAGES WIDTH + HEIGHT
float widthCOW = 650/3, heightCOW = 726/3; //WIDTH + HEIGHT OF COW
float widthPIG = 766/6, heightPIG = 646/6; //WIDTH + HEIGHT OF PIG
float widthSHEEP = 445/3, heightSHEEP = 355/3; //WIDTH + HEIGHT OF SHEEP
float widthHORSE = 760/9, heightHORSE = 602/9; //WIDTH + HEIGHT OF HORSE
float widthROOSTER = 320/5, heightROOSTER = 345/5; //WIDTH + HEIGHT OF ROOSTER

//INITIATING FONT UPLOAD
PFont FONT;

//ARRAY LIST FOR ANIMAL NAMES
String ANIMALS[] = {"COW", "HORSE", "PIG", "SHEEP", "ROOSTER"};
int word; //INITIALISING GLOBAL VARIABLE TO CALL RANDOM ANIMAL FROM ARRAY LIST

//GAME STATE TO MOVE BETWEEN INSTRUCTIONS - GAME - WIN PAGES DEFINED AT 1 - 0 - 2 RESPECTIVELY
int gameState = 1; // INITIALISED AT INSTRUCTIONS PAGE

void setup() {
  size(1000, 665); //SIZE DRAWN FROM THE ORIGINAL SIZE OF THE BACKGROUND IMAGE (NON-DYNAMIC)

  //LOADING SOUNDFILES
  soundWIN = new SoundFile(this, "WIN.mp3");
  soundWRONG = new SoundFile(this, "WRONG.mp3");
  soundCOW = new SoundFile(this, "COW.mp3");
  soundPIG = new SoundFile(this, "PIG.mp3");
  soundSHEEP = new SoundFile(this, "SHEEP.mp3");
  soundHORSE = new SoundFile(this, "HORSE.mp3");
  soundROOSTER = new SoundFile(this, "ROOSTER.mp3");

  //LOADING IMAGES
  FARM = loadImage("FARM.jpg");
  COW = loadImage("COW.png");
  PIG = loadImage("PIG.png");
  SHEEP = loadImage("SHEEP.png");
  HORSE = loadImage("HORSE.png");
  ROOSTER = loadImage("ROOSTER.png");

  //LOADING FONT
  FONT = createFont("FONT.otf", 100);
}

void draw() {
  //SETTING FARM IMAGE AS BACKGROUND
  background(FARM); //SET OUTSIDE THE IF-ELSE LOOP TO MAINTAIN THROUGHOUT ALL GAME STAGES

  //IF - ELSE IF - ELSE STATEMENT TO MOVE BETWEEN GAME STATES INSTRUCTIONS - GAME - WIN PAGES
  if (gameState == 0) { //GAME PAGE: HERE THE GAME IS PLAYED

    //ANIMAL IMAGES PLACEMENT ON THE FARM SCENE (NON-DYNAMIC)
    image(COW, 0, 400, widthCOW, heightCOW);
    image(PIG, 200, 300, widthPIG, heightPIG);
    image(SHEEP, 860, 320, widthSHEEP, heightSHEEP);
    image(ROOSTER, 680, 160, widthROOSTER, heightROOSTER);
    image(HORSE, 400, 250, widthHORSE, heightHORSE);

    //CALLING RANDOM ANIMAL FROM ARRAY LIST
    String animal = ANIMALS[word];

    //DISPLAYING THE CALLED ANIMAL WORD ON TOP LEFT CORNER
    textSize(50);
    textFont(FONT);
    fill(0);
    text(animal, 50, 100);

    //CONDITIONAL BUZZERS FOR SOUND PLAY OR GAME WIN: I DECIDED TO KEEP THE CODE MANUAL AS I WANTED TO AVOID UNINTENDED MISHAPS

    //IF ANIMAL PRESSED CORRESPONDS WITH THE CORRECT MOUSE POSITION THAT CORRESPONDS TO THE WORD DISPLAYED CONDITION IS TRUE GAME IS WON!
    //SIMILAR SYNTAX IS REPEATED FOR THE REST OF THE ANIMALS
    if (animal == "COW" && mousePressed == true && mouseX > 0 && mouseX < 0 + widthCOW && mouseY > 400 && mouseY < 400 + heightCOW) {
      soundCOW.play(); //PLAYS ANIMAL SOUND
      gameWon(); //CALLS WIN PAGE 
      soundWIN.play(); //PLAYS WIN SOUND
    } else {
      //IF ANIMAL PRESSED DOES NOT CORRESPOND WITH THE CORRECT MOUSE POSITION AND WORD THEN WRONG BUZZER IS PLAYED: NO LOSING PAGE
      if (animal == "COW" && mousePressed == true) {
        soundWRONG.play(); //PLAYS WRONG SOUND
      }
    }

    if (animal == "PIG" && mousePressed == true && mouseX > 200 && mouseX < 200 + widthPIG && mouseY > 300 && mouseY < 300 + heightPIG) {
      soundPIG.play();
      gameWon();
      soundWIN.play();
    } else {
      if (animal == "PIG" && mousePressed == true) {
        soundWRONG.play();
      }
    }

    if (animal == "SHEEP" && mousePressed == true && mouseX > 860 && mouseX < 860 + widthSHEEP && mouseY > 320 && mouseY < 320 + heightSHEEP) {
      soundSHEEP.play();
      gameWon();
      soundWIN.play();
    } else {
      if (animal == "SHEEP" && mousePressed == true) {
        soundWRONG.play();
      }
    }

    if (animal == "ROOSTER" && mousePressed == true && mouseX > 680 && mouseX < 680 + widthROOSTER && mouseY > 160 && mouseY < 160 + heightROOSTER) {
      soundROOSTER.play();
      gameWon();
      soundWIN.play();
    } else {
      if (animal == "ROOSTER" && mousePressed == true) {
        soundWRONG.play();
      }
    }

    if (animal == "HORSE" && mousePressed == true && mouseX > 400 && mouseX < 400 + widthHORSE && mouseY > 250 && mouseY < 250 + heightHORSE) {
      soundHORSE.play();
      gameWon();
      soundWIN.play();
    } else {
      if (animal == "HORSE" && mousePressed == true) {
        soundWRONG.play();
      }
    }
  } else if (gameState == 1) { //INSTRUCTIONS PAGE: THIS IS THE GAMES LANDING PAGE ONLY AT THE VERY START

    //TRANSPARENT OVERLAY OVER BACKGROUND TO GIVE START PLAY EFFECT
    fill(0, 0, 0, 120);
    rect(0, 0, 1000, 665);

    //GAME TITLE
    textFont(FONT);
    textSize(120);
    fill(255);
    text("Welcome to Farm-ville", 30, 120);

    //GAME INSTRUCTIONS
    textSize(50);
    text("Press on the Farm animal", 50, 200);
    text("that matches the word on top", 50, 250);
    text("to hear their voice!", 50, 300);

    textSize(20);
    text("Press ENTER to start!", 50, 350);
  } else { //WIN PAGE: CALLED WHEN RIGHT ANIMAL IS PRESSED
    gameWon();
  }
}


//FUNCTION DEFINED FOR WINNING THE GAME: DEFINED TO AVOID REPEATING CODE IN THE CONDITIONAL BUZZERS' ELSE STATEMENTS
void gameWon() {
  gameState = 2; 

  //TRANSPARENT OVERLAY FOR WIN PAGE SIMILAR TO INSTRUCTIONS PAGE
  fill(0, 0, 0, 120);
  rect(0, 0, 1000, 665);

  //GAME WON TEXT
  textFont(FONT);
  textSize(120);
  fill(255);
  text("Congratulations!", 30, 120);
  textSize(50);
  text("You WON Farm-Ville!", 50, 200);

  //RESTART GAME TEXT
  textSize(20);
  text("Press ARROW UP to start again!", 50, 250);
}


//KEY PRESSED STATES TO MOVE BETWEEN GAME STATES AND INITIALISE NEW ANIMAL WORD
void keyPressed() {
  //DOUBLE CONDITION TO MOVE BETWEEN GAME STATES
  if (gameState == 1 && keyCode == ENTER) {
    gameState = 0;
    word = int(random(ANIMALS.length)); //CALLS FOR NEW WORD AT EACH GAME START
  }

  if (gameState == 2 && keyCode == UP) {
    gameState = 0;
    word = int(random(ANIMALS.length));
  }
}


//------------------------------------------------------------END!
