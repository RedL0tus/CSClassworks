/*
* Write code (from scratch) that generates a small circle (any color) on a background (any
* color different from the circle) that grows overtime. After a few seconds, the circle should
* engulf the whole canvas.
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
  background(bg);
  circleRadius = 0; // Initialize raidus variable
  fill(circle); // Set circle color
}

void draw(){
  ellipse(250,250,circleRadius,circleRadius); // Draw the circle
  circleRadius++; // Increase radius
}