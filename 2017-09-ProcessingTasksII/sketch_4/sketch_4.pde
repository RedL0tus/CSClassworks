/*
* This task is essentially the same as the last task, but instead of starting out with the biggest
* circle first, begin with the smallest circle and work your way up. In other words, the code
* should generate a small circle, then a larger circle (different color) behind the first circle,
* then a third larger circle behind the second, etc. Again, start with the target, but then you
* can be creative.
*/

// Author: Ken Wang <kaymw@member.fsf.org>

int circleRadius,circleDiff,delayTime,ringCount,radiusTemp;
color targetInner,targetOuter,bg;
boolean targetRing;

void setup(){
  size(500,500); // Set size to 500x500
  noStroke(); // Cancel stroke
  
  /* Customization */
  circleRadius = 20; // Initialize raidus variable
  circleDiff = 20; // Define circle radius difference
  bg = color(random(0,255),random(0,255),random(0,255));
  delayTime = 10; // Delay time (ms)
  targetInner = color(#FFFFFF); // Target inner color
  targetOuter = color(#FF0000); // Target outer color
  /* Finish Customization */
  ringCount = 0;
}

void draw(){
  print("Ring " + ringCount + ":\n");
  background(bg);
  for (int i = ringCount; i >= 0; i--){
    if (i % 2 == 1){
      fill(targetInner);
      print("W");
      //fill(#FFFFFF);
    } else {
      fill(targetOuter);
      print("R");
      //fill(#FF0000);
    }
    radiusTemp = circleRadius + i*circleDiff;
    print(radiusTemp + " ");
    ellipse(250,250,radiusTemp,radiusTemp);
    //delay(delayTime);
  }
  ringCount++;
  print("\n");
  delay(delayTime);
}