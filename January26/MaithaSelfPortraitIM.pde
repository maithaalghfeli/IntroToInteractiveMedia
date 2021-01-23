/* 
 This is my first homework for Intro to IM
 Assignment: Self-Portrait
 
 This program was written by Maitha AlGhfeli
 21 Jan 2021
 */


//board set-up
size(500, 600);
background(220, 225, 225);

//background grid - reference for sketch-up
stroke(200, 200, 200);
//x-axis grid
for (int gridX = 0; gridX < width; gridX = gridX+(width/10)) {
  line(gridX, 0, gridX, height);
}
//y-axis grid
for (int gridY = 0; gridY < height; gridY = gridY+(height/10)) {
  line(0, gridY, width, gridY);
}

//bottom hair that comes below the face
stroke(0, 0, 0);
fill(0, 0, 0);
rectMode(CENTER);
rect(250, 320, 260, 300);

//face and neck
rectMode(CORNER);

//neck
stroke(216, 181, 139);
fill(216, 181, 139);
rect(200, 360, 100, 120);

//face
stroke(229, 194, 152);
fill(229, 194, 152);
arc(250, 180, 250, 450, 0, PI);
rect(150, 120, 200, 60);
triangle(125, 180, 150, 120, 200, 180);
triangle(375, 180, 350, 120, 350, 180);

//eyebrows
stroke(0, 0, 0);
fill(0, 0, 0);
arc(180, 200, 60, 10, PI, TWO_PI);
arc(320, 200, 60, 10, PI, TWO_PI);

//eyes
fill(255, 255, 255);
ellipse(180, 230, 55, 20);
ellipse(320, 230, 55, 20);

//eyeballs
fill(0, 0, 0);
circle(180, 230, 20);
circle(320, 230, 20);

//lips
stroke(160, 0, 0);
fill(160, 0, 0);
arc(250, 360, 60, 30, 0, PI);
arc(240, 360, 25, 13, PI, TWO_PI);
arc(260, 360, 25, 13, PI, TWO_PI);

//nose
stroke(210, 175, 133);
fill(210, 175, 133);
arc(250, 260, 20, 100, 0, PI);

//top hair - placed here to be in front of the face sketch-up
stroke(0, 0, 0);
fill(0, 0, 0);
arc(250, 170, 260, 220, PI, TWO_PI);

//body
stroke(30, 60, 80);
fill(30, 60, 80);
rect(150, 460, 200, 140);
triangle(150, 460, 150, height, 50, height);
triangle(350, 460, 350, height, width-50, height);

//pearl necklace for fun!
stroke(255, 255, 255);
fill(255, 255, 255);
for (int pearlX = 200; pearlX <= 300; pearlX = pearlX + 10) {
  circle(pearlX, 460, 10);
}


//------------------------------------------------------------END!
