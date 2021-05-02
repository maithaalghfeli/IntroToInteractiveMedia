/* 
 This is my first arduino homework for Intro to IM
 Assignment: LED & Switch Puzzle
 Title: FIND THE PARTY!
 
 This program was written by Maitha AlGhfeli
 23 March 2021
 */

// DECLARING MY VARIABLES
const int RED = 2;
const int BLUE = 3;
const int YELLOW = 4;

const int SRED = A0;
const int SBLUE = A1;
const int SYELLOW = A2;

// SETUP
void setup() {
  // DECLARING MY LED's AS OUTPUTS 
  pinMode(RED, OUTPUT);
  pinMode(BLUE, OUTPUT);
  pinMode(YELLOW, OUTPUT);
  
}

// DRAWS CONTINOUSLY
void loop() {

  /* I MADE 7 POSSIBLE COMBINATIONS OF EITHER LIGHT ON OR OFF 
  AND WHICH CONTAIN DIFFERENT COMBINATIONS OF SWITCHES AND 
  LIGHT RESPONSES  */

    
  if (digitalRead(SRED) == HIGH && digitalRead(SBLUE) == LOW && digitalRead(SYELLOW) == LOW){
    
    // R:on, B:off, Y:off == yellow light on
    digitalWrite(YELLOW, HIGH);
    delay(100);
    digitalWrite(YELLOW, LOW); 
    
  } else if (digitalRead(SRED) == LOW && digitalRead(SBLUE) == HIGH && digitalRead(SYELLOW) == LOW){
    
    digitalWrite(RED, HIGH);
    delay(100);
    digitalWrite(RED, LOW);
    //R:off, B:on, Y: off == red light on
    
  } else if (digitalRead(SRED) == LOW && digitalRead(SBLUE) == LOW && digitalRead(SYELLOW) == HIGH){
    
    digitalWrite(YELLOW, HIGH);
    delay(100);
    digitalWrite(YELLOW, LOW);
    //R:off, B:off, Y:on == yellow light on
    
  } else if (digitalRead(SRED) == HIGH && digitalRead(SBLUE) == HIGH && digitalRead(SYELLOW) == LOW){
    
    digitalWrite(BLUE, HIGH);
    delay(100);
    digitalWrite(BLUE, LOW);
    //R:on, B:oon, Y:on == blue light on
    
  } else if (digitalRead(SRED) == HIGH && digitalRead(SBLUE) == LOW && digitalRead(SYELLOW) == HIGH){
   
    digitalWrite(RED, HIGH);
    digitalWrite(BLUE, HIGH);
    delay(100);
    digitalWrite(RED, LOW);
    digitalWrite(BLUE, LOW);
    //R:on, B:off, Y:on == blue and red lights on
    
  } else if (digitalRead(SRED) == LOW && digitalRead(SBLUE) == HIGH && digitalRead(SYELLOW) == HIGH){
   
    win(); //R:off, B:on, Y:on == YOU FOUND IT!!!
    
  } else if (digitalRead(SRED) == HIGH && digitalRead(SBLUE) == HIGH && digitalRead(SYELLOW) == HIGH){
   
    digitalWrite(YELLOW, HIGH);
    digitalWrite(RED, HIGH);
    delay(100);
    digitalWrite(YELLOW, LOW);
    digitalWrite(RED, LOW);
    //R:on, B:on, Y:on == yellow and red lights on
    
  }

}

// FUNCTION CALLS FOR FLASHING LIGHTS AT WIN
void win() {

  digitalWrite(RED, HIGH);
  delay(100);
  digitalWrite(RED, LOW);
  delay(100);

  digitalWrite(BLUE, HIGH);
  delay(100);
  digitalWrite(BLUE, LOW);
  delay(100);

  digitalWrite(YELLOW, HIGH);
  delay(100);
  digitalWrite(YELLOW, LOW);
  delay(100);
}


//------------------------------------------------------------END!
