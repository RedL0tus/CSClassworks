/*
* Write code that, at first, generates an enormous circle, but after a second or so, it makes
* a second smaller circle on top of the first circle, then a third even smaller circle on top of
* the second, and so forth. Naturally, each circle should be a different color than the circle
* that came before it. At first, I want you to replicate the basic black-and-white target, but
* then you can be creative with the color pattern: the circles can be random colors, or they
* can be progressively darker, it’s up to you!
*/

// Author: Ken Wang <kaymw@member.fsf.org>

int circleRadius,circleDiff,delayTime;
color circle,target,targetInner,targetOuter,bg;
boolean isTarget,targetRandomColor,targetRing;

void setup(){
  size(500,500); // Set size to 500x500
  noStroke(); // Cancel stroke
  
  /* Customization */
  circleRadius = 500; // Initialize raidus variable
  circleDiff = 10; // Define circle radius difference
  bg = color(random(0,255),random(0,255),random(0,255));
  delayTime = 0; // Delay time (ms)
  isTarget = true; // (Trigger) Target or not
  targetRandomColor = false; // (Trigger) Random color or not
  targetInner = color(#FFFFFF); // Target inner color
  targetOuter = color(#FF0000); // Target outer color
  /* Finish Customization */
  
  if (targetRandomColor){ // Prevent the circle be invisible
    circle = color(random(0,255),random(0,255),random(0,255));
    target = color(random(0,255),random(0,255),random(0,255));
    while ((circle == bg) || (circle == target) || (target == bg)){
      circle = color(random(0,255),random(0,255),random(0,255));
      target = color(random(0,255),random(0,255),random(0,255));
    }
    targetRing = true;
  } else {
    circle = targetOuter;
    target = targetInner;
  }
  background(bg); // Set background color
  fill(circle); // Set fill color
  ellipse(250,250,circleRadius,circleRadius); // Draw the first circle
}

void draw(){
  if (isTarget){
    if (targetRing){
      fill(circle);
      targetRing = false;
    } else {
      fill(target);
      targetRing = true;
    }
  } else {
    circle = color(random(0,255),random(0,255),random(0,255),random(0,255));
    while (circle == bg){ // Prevent the circle is the same color as the background.
      circle = color(random(0,255),random(0,255),random(0,255),random(0,255));
    }
    fill(circle); // Set fill color
  }
  
  if (circleRadius > 0){
    circleRadius = abs(circleRadius - circleDiff); // Decrease circle radius if it's bigger than zero.
  }
  
  ellipse(250,250,circleRadius,circleRadius); // DRAW! THE! CIRCLE!
  delay(delayTime);
}