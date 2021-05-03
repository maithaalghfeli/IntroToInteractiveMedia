/*
  This is my second arduino homework for Intro to IM
  Assignment: Analog & Digital
  Title: CODE BLUE: RESUSCITATE!

  This program was written by Maitha AlGhfeli
  30 March 2021
*/


// DECLARING LED VARIABLES
const int LED1 = 3;
const int LED2 = 5;
const int LED3 = 6;

// DECLARING SWITCH VARIABLE
const int SWITCH = A1;
const int LDRSENSOR = A0;

//DECLARING FADING VARIABLES
int brightness = 0;
int fadeAmount = 5;


// SETTING UP ONCE
void setup() {

  Serial.begin(9600);

  // SETTING LED's AS OUTPUTS
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);

  //SETTING ANALOG AND DIGITAL SWITCHES AS INPUTS
  pinMode(SWITCH, INPUT);
  pinMode(LDRSENSOR, INPUT);
}


//DRAWS FUNCTION
void loop() {

  //CALL MY SENSOR AND SWITCH TO BE READ
  int LDRSENSOR = analogRead(A0);
  int switchPressed = digitalRead(SWITCH);

  //IF STATEMENT ONLY APPLICABLE WHEN DIGITAL SWITCH IS PRESSED
  if (switchPressed == HIGH) {
    if (LDRSENSOR < 500) { //VLAUE OF ANALOG SENSOR CHECKED

      analogWrite(LED1, brightness);
      analogWrite(LED2, brightness);
      analogWrite(LED3, brightness);

      //CHANGE BRIGHTNESS IN LOOP
      brightness = brightness + fadeAmount;

      //FADING BACK IN
      if (brightness <= 0 || brightness >= 250) {
        fadeAmount = -fadeAmount;
      }
      //DIMMING DELAY
      delay(5);

    } else if (LDRSENSOR > 500 && LDRSENSOR < 700) { //DIFF SENSOR VALUE

      analogWrite(LED1, brightness);
      analogWrite(LED2, brightness);
      analogWrite(LED3, brightness);

      brightness = brightness + fadeAmount;

      if (brightness <= 0 || brightness >= 150) { //CHANGED BRIGHTNESS OF LED
        fadeAmount = -fadeAmount;
      }

      delay(20);

    }  else  if (LDRSENSOR > 700) { //LAST SENSOR VALUE

      analogWrite(LED1, brightness);
      analogWrite(LED2, brightness);
      analogWrite(LED3, brightness);

      brightness = brightness + fadeAmount;

      if (brightness <= 0 || brightness >= 20) { //DIMMED BRIGHTNESS EVEN MORE
        fadeAmount = -fadeAmount;
      }

      delay(50);

    }

  } else if (switchPressed == LOW) { //IF THE SWITCH IS NOT PRESSED, ALL LEDs OFF
    analogWrite(LED1, 0);
    analogWrite(LED2, 0);
    analogWrite(LED3, 0);
  }

}


//------------------------------------------------------------END!
