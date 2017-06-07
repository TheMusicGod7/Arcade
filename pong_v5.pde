float x = 100;
float y = 100;
float x1 = 235;
float x2 = 235;
float y1 = 50;
float y2 = 450;

//String button = "";

color P1 = #FF0000;
color P2 = #F2EB16;

PImage img;

int startCount1 = 0;
int startCount2 = 0;

//Speed of the ball
float xSpeed = 5;
float ySpeed = 3;

int rect1 = 0;
int rect2 = 0;

void setup() {
  size(510, 510);
  frameRate(30);
  textSize(36);
  textAlign(LEFT);
  img = loadImage("resized.png");
}

void draw() {
  background(img);
  ellipse(x, y, 20, 20);
  
  fill(P1);
  text("Player 1", 10, 10, 200, 50);
  text(startCount1, 10, 100);
  
  fill(P2);
  text("Player 2", 350, 445, 200, 50);
  text(startCount2, 445, 430); //<>//
  
  
  //move the ball
  x = x + xSpeed;
  y = y + ySpeed;
  
  
  //Check if it hits the right or left
  if(x > 495 || x < 5) {
  xSpeed = xSpeed * -1;
  }
  if(y > 495){
    ySpeed = ySpeed * -1; //<>//
    startCount2++;
  }
  if(y < 5){
    ySpeed = ySpeed * -1; //<>//
    startCount1++;
  }



  //if(y == 475){
  //  text(startCount2++, 445, 430);
  //}
  //if(y == 65){
  //  text(startCount1++, 10, 100);
  //}  
  
  
  //collision with bottom paddle
  if(x > x1 && x < x1 + 65 && y + 10 > y2 && y < y2 + 10){
    ySpeed = ySpeed * -1;
    text(startCount2++, 445, 430);
    startCount2++;
  }
  
  //collision with top paddle
  if(x > x2 && x < x2 + 65 && y < y1 + 20) { // && y < y1 + 65) { 
    ySpeed = ySpeed * -1;
    text(startCount1++, 10, 100);
    startCount1++;
  }
  
  ////out of bounds and stop
  //if(y < 0){
  //  //ySpeed = 0;
  //  //xSpeed = 0;
  //  fill(P2);
  //  //text("Player 2 Wins!", 135, 400);
  //}
  
  //if(y > 500){
  //  ////ySpeed = 0;
  //  ////xSpeed = 0;
  //  //fill(P1);
  //  ////text("Player 1 Wins!", 135, 110);
  //}
////  
  
  //paddle formation
  fill(255);
  rect(x1, y2, 65, 10, 7);
  rect(x2, y1, 65, 10, 7);

}


//Controlling keys (P1 = arrows, P2 = a and d)

void keyPressed(){
  if (keyCode == LEFT && x1 > 0) {
    x1 = x1 - 8;
  }
  else if(keyCode == RIGHT && x1 < 440) {
    x1 = x1 + 8;
  }
  else if(key == 'a' && x2 > 0) {
    x2 = x2 - 8;
  }
  else if(key == 'd' && x2 < 440) {
    x2 = x2 + 8;
  }
}



    