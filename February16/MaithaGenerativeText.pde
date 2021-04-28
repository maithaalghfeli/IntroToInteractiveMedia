/* 
 This is my fourth homework for Intro to IM
 Assignment: Generative Text
 Title: A Letter from Me to You
 
 This program was written by Maitha AlGhfeli
 16 Feb 2021
 */


//initiating the variables for our data, images, and font
int n, c, f, w, image;
PImage bg, stamp, a, b, e, d;
PFont font;


//creating the strings to call from CSV file
String[] names = new String[27]; 
String[] cities = new String[27]; 
String[] foods = new String[27];
String[] weathers = new String[27];


//this function generates random number for each variable that is called at every loop of the program, it makes randomising easier
void randomNo(){
  
  n = int(random(26));
  c = int(random(26)); 
  f = int(random(26)); 
  w = int(random(26)); 
  image = int(random(4));
 
}

//loops on mouse click, since I will stop looping in draw
void mouseClicked(){
  loop();
}


void setup(){  
  
  //size of our board is the same as our background image
  size(900, 564);
  
  //loading the font
  font = createFont("type.ttf", 18);
  
  //parsing through the CSV file to get the data in the columns
  Table t;
  t = loadTable("words.csv", "header");
  names = t.getStringColumn("Name");
  cities = t.getStringColumn("Place");
  foods = t.getStringColumn("Food");
  weathers = t.getStringColumn("Weather");
  
  //loading the images
  bg = loadImage("postcard.jpg");
  stamp = loadImage("stamp.png");
  a = loadImage("a.jpg");
  b = loadImage("b.jpg");
  e = loadImage("e.jpg");
  d = loadImage("d.jpg");
  
}


void draw(){
  
  //background and stamp
  background(bg); 
  image(stamp, 740, 25, 150, 180);
  
  randomNo();
  
  //uploading the random images depending on the number called, (i did it like this so the size of the image can be manually inserted)
  if(image == 0){
    image(a, 90, 150, 250, 350);
  }
  if(image == 1){
    image(b, 90, 150, 250, 350);
  }
  if(image == 2){
    image(e, 90, 150, 250, 350);
  }
  if(image == 3){
    image(d, 90, 150, 250, 350);
  }
  
  //text characteristics
  fill(0,0,0); 
  textFont(font);
  
  //a simple paragraph with changing words
  text("A letter from me to you:", 470, 200);
  text( "On a " + weathers[w] + " day, \nI met a fellow human named " + names[n] + "\nwhom I sat in a park with in " + cities[c] +". \nTogether we looked into the abyss \nmunching on a plateful of " + foods[f] + " \nand talked endlessly about our simple lives." ,450, 260);      
  
  //stops from redrawing and printing continously
  noLoop();
}


//------------------------------------------------------------END!
