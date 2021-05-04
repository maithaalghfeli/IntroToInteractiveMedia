/*

 INTRO TO INTERACTIVE MEDIA
 PROF. MICHAEL SHILOH
 - MAITHA ALGHFELI
 
 FINAL PROJECT: FEED THE DRAGON
 MAY, 2021
 
 INSTRUCTIONS
 - Game starts with an instructions screen. Press green button to start game.
 - Player must press on Yellow Button to move left and Blue to move right.
 - Player must get fire to fall inside dragon.
 - The game goes for one level at a time, if it is lost Game Over screen appears.
 
 */

//------------------------------------------------------------CODE START!

//IMPORT SERIAL LIBRARY
import processing.serial.*;
Serial port;  

//INITIATING SOUND UPLOAD
import processing.sound.*;
SoundFile soundWRONG; 

//FIRE AND DRAGON
Fire fire;
Dragon dragon;

//SCORE INITIALISATION
int score = 0;

//GAME AND GAME OVER STATES
boolean gameOver = false;
int gameState = 2;

void setup() {
  
  //SETUP SIZE OF WINDOW
  size(600, 600);
  frameRate(60);

  //NEW OBJECTS FROM OUR CLASS
  fire = new Fire();
  dragon = new Dragon();
  
  //LOADING SOUNDFILES
  soundWRONG = new SoundFile(this, "WRONG.mp3");

  //SERIAL PORT COMMUNICATION
  printArray(Serial.list());
  String portname=Serial.list()[3];
  println(portname);
  port = new Serial(this, portname, 9600);
  port.clear();
  port.bufferUntil('\n');
}


void draw()
{
  //PLAY GAME
  instructions();
  if (gameState == 1) {
    background(random(200, 256),random(200, 256),random(200, 256));

    //SCORE
    fill(0);
    textAlign(RIGHT);
    textSize(15);
    text("SCORE: " + score, width - 20, 30);

    if (!gameOver) { //CHECK GAME STATE TO PLAY
      fire.show();
      dragon.show();
    } else {
      //GAME OVER
      textSize(30);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      if (gameState == 1){
        soundWRONG.play();
        gameState = 0;
      }
    }
  }
}


//START INSTRUCTIONS PAGE
void instructions(){
  if (gameState == 2){
  
  fill(255);
  noStroke();
  rect(0, 0, width, height);
  
  fill(0);
  rect(50, 50, 500, 500);
  
  fill(255, 40, 40);
  textSize(20);
  textAlign(CENTER);
  text("Press the Green button to start. \n Yellow is Left \n Blue is Right", width/2, height/2.2);
  }
}


//CREATE CLASS FOR FIRE
public class Fire {
  
  public int firePosx; //HORIZONTAL POS OF FIRE
  public int firePosy; //VERTICAL POS OF FIRE
  public float speed;
  PImage fire;

  Fire() {
    //INITIALISE
    this.reset();
    this.speed = 5;
    this.fire = loadImage("fire.png");
  }

  //RANDOM START POSITION FOR FIRE
  public void reset() {
    this.firePosx = int(random(width/7, width/1.1));
    this.firePosy = 40;
  }

  //DISPLAY BALL
  public void show() {
    noStroke();
    fill(65, 112, 130);
    image(this.fire, this.firePosx, this.firePosy, 40, 50);
    this.update();
  }

  //FIRE POSITION
  public void update() {

    //DETECT MISSED COLLISION
    if (this.firePosy >= height - 20) {
      gameOver = true;
    }

    //INCREMENTING SPEED
    this.firePosy += this.speed;

    //COLLISION AND SCORE
    if (dist(this.firePosx, this.firePosy, dragon.dragonPosx, dragon.dragonPosy+140) <= 100) {
      score += 1;

      //SPEED INCREMENT
      this.speed += 0.2;
      this.reset(); //RESTART FROM TOP
    }
  }
}


//CREATE CLASS FOR DRAGON
public class Dragon {
  public int dragonPosx; //HORIZONTAL POSITION OF DRAGON
  public int dragonPosy; //VERTICAL POSITION OF DRAGON
  PImage dragon;

  Dragon() {
    //INITIALISE
    this.dragonPosx = width/2;
    this.dragonPosy = height - 150;
    this.dragon = loadImage("dragon.png");
  }

  //DISPLAY DRAGON
  public void show() {
    image(this.dragon, this.dragonPosx, this.dragonPosy, 150, 140);
  }
}


//SERIAL COMMUNICATION
void serialEvent(Serial myPort) {
  String val = myPort.readStringUntil('\n');
  //NOT EMPTY CHECK
  if (val != null) {
    val = trim(val);
    int value=int(val);

    if (value==1) {
      dragon.dragonPosx = dragon.dragonPosx + 2; //RIGHT
    } else if (value==2) {

      dragon.dragonPosx = dragon.dragonPosx - 2; //LEFT
    } else if (value==3) {
      gameState = 1;
    }
  }
  myPort.write("\n"); //HANDSHAKE
}


//------------------------------------------------------------END!
