/* 
 This is my second homework for Intro to IM
 Assignment: If & While Looped Art
 
 This program was written by Maitha AlGhfeli
 2 Feb 2021
 */


//board set-up
size(500, 500);
background(0);

//circle madness: PLANETS & CELESTIAL OBJECTS
for (int xPos = 0; xPos < width; xPos += int(random(5, 100))) {
  for (int yPos=0; yPos < height; yPos += int(random(5, 100))) {
    stroke(random(100, 255), random(100, 255), random(100, 255));
    noFill();
    circle(xPos, yPos, int(random(10, 50)));
  }
}

//centre circle: MOON
float circumference = random(100, width - 50);
while (circumference > 5) {
  stroke(255);
  noFill();
  circle(width/2, height/2, circumference);
  circumference = circumference - 5;
}

//random colour generator: used here to predefine the colours in the for-loop
float red = random(100, 255);
float green = random(100, 255);
float blue = random(100, 255);

//ENERGY RAYS: to engulf the moon, a fun twist on the sun's illumination of the moon
for (int linePos = 0; linePos <= width; linePos += 10) {
  stroke(red, green, blue);
  line(linePos, 0, 0, height);
}


//------------------------------------------------------------END!
