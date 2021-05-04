/*

 INTRO TO INTERACTIVE MEDIA
 PROF. MICHAEL SHILOH
 - MAITHA ALGHFELI
 
 FINAL PROJECT: FEED THE DRAGON
 MAY, 2021
 
 ARDUINO COMMUNICATIONS SERIAL PROCESSING
 
 */

//------------------------------------------------------------CODE START!


//DECLARATIONS
int BLUE = A0;
int YELLOW = A1;
int GREEN = A2;

//RUNS ONCE TO START
void setup() {

  //PINS INPUT
  Serial.begin(9600);
  Serial.println("0");
  pinMode(BLUE, INPUT);
  pinMode(YELLOW, INPUT);
  pinMode(GREEN, INPUT);
  
}


//RUNS CONTINUOUSLY
void loop() {
  
  while (Serial.available()) {
    //MAPPING PINS TO PROCESSING 
    int right = digitalRead(BLUE);
    int left = digitalRead(YELLOW);
    int game = digitalRead(GREEN);

    if (right == HIGH) {
      
      Serial.println("1");
      
    } else if (left == HIGH) {
      
      Serial.println("2");
      
    } else if (game == HIGH) {
      
      Serial.println("3");
      
    }
  }
}


//------------------------------------------------------------END!
