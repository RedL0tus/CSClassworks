/*
* Write code (again, from scratch) that generates an enormous circle that, overtime, shrinks
* into oblivion. This is basically the opposite of the first task – but definitely a little trickier.
*/

// Author: Ken Wang <kaymw@member.fsf.org>

int circleRadius;
color circle,bg;

void setup(){
  size(500,500); // Set size to 500x500
  noStroke(); // Cancel stroke
  
  circle = color(random(0,255),random(0,255),random(0,255),random(1,255));
  bg = color(random(0,255),random(0,255),random(0,255),random(0,255));
  
  while (circle == bg){ // Prevent the circle to be invisible
    circle = color(random(0,255),random(0,255),random(0,255),random(1,255));
  }
  
  circleRadius = 300; // Initialize raidus variable
}

void draw(){
  //print(circleRadius + " "); // For debug use
  background(bg); // Set background color
  fill(circle); // Set circle color
  ellipse(250,250,circleRadius,circleRadius); // Draw the circle
  if (circleRadius > 0){
    circleRadius--; // Decrease radius
  }
}