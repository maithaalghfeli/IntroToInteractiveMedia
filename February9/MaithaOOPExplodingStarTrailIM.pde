/* 
 This is my third homework for Intro to IM
 Assignment: Object-Oriented-Programming
 Title: Shooting Star Explosions
 
 This program was written by Maitha AlGhfeli
 9 Feb 2021
 */

class Star {
  //star code courtesy of Jeremy Rodrigo Guerrero Alejos
  void star(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle / 2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float starX = x + cos(a) * radius2;
      float starY = y + sin(a) * radius2;
      vertex(starX, starY);
      starX = x + cos(a+halfAngle) * radius1;
      starY = y + sin(a+halfAngle) * radius1;
      vertex(starX, starY);
    }
    endShape(CLOSE);
  }
}

//creating an array out of the class Star, this will later be the explosion.
Star[] starArray = new Star[1];
int n = 0;

//board set-up
void setup() {
  size(400, 400);
  background(0);
}

//calling background stars and shooting trail
void draw() {
  //background 
  //used rectangle instead of background to play with opacity and have a more realistic starry sky.
  fill(0, 10);
  rect(0, 0, width, height);

  //little scattered stars over the canvas
  fill(255);
  ellipse(random(width), random(height), 2, 2);

  //calling star cluster trail... shooting star resemblance following mouse position
  noStroke();
  for (int i = 0; i < n; i++) {
    starArray[i].star(mouseX, mouseY, random(5, 10), random(13, 20), int(random(3, 7)));
  }
}

//here comes the fun!
void mouseClicked() {
  //for every mouse clicked the shooting star trail explodes in a cosmos formation
  for (int i = 0; i < n; i++) {
    starArray[i].star(mouseX, mouseY, random(10, 60), random(20, 70), int(random(3, 5)));
  }

  while (n<starArray.length) {
    starArray[n] = new Star();
    n++;
  }
}


//------------------------------------------------------------END!
