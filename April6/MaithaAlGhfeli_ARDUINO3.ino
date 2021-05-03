/*
  This is my third arduino homework for Intro to IM
  Assignment: Musical Instrument
  Title: PITCH PERFECT
  This program was written by Maitha AlGhfeli
  6 April 2021
*/


//IMPORTING THE DIFFERENT PITCHES
#include "pitches.h"

//DECLARING PIECE VARIABLES
const int LDRSENSOR = A1;
const int SWITCH = A0;
const int SPEAKER = 2;

//NOTES IN THE TUNE
int tune[] = {NOTE_E7, NOTE_A6, NOTE_G3, NOTE_A3, NOTE_DS5};

//NOTE DURATIONS RELATIVE TO NOTE
int noteDurations[] = {4, 2, 2, 4, 1};


//SETUP: RUN ONCE
void setup() {

  Serial.begin(9600);

  //SETTING UP THE PIECES
  pinMode(LDRSENSOR, INPUT);
  pinMode(SWITCH, INPUT);
  pinMode(SPEAKER, OUTPUT);

}


//DRAWS THE FUNCTION CONTINUOUSLY
void loop() {

  //READING THE VALUES OF THE PHOTORESISTOR
  int noteVal = analogRead(LDRSENSOR);

  //MAPPING PHOTORESISTOR INPUT TO PITCHES
  noteVal = map(note, 0, 1000, 800, 31);

  //IF THE SWITCH IS PRESSED, PLAY NOTE
  if (digitalRead(SWITCH) == HIGH) {
    tone(SPEAKER, noteVal);


    //    ITERATE OVER THE NOTES OF THE TUNE
    for (int thisNote = 0; thisNote < 5; thisNote++) {

      //CALCULATING NOTE DURATION
      int noteDuration = 100 / noteDurations[thisNote];
      tone(5, melody[thisNote], noteDuration);

      //NOTE DISTINGUISHER
      int distinguish = noteDuration * 1.3;
      delay(distinguish);

    }

  } else { //IF THE SWITCH IS NOT PRESSED< NOTHING PLAYS
    noTone(SPEAKER);
  }

}


//------------------------------------------------------------END!
