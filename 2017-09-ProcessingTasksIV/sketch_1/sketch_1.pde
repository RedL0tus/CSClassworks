int count;
boolean randomColor,debug;
int[] circleRadius = new int[15]; // Determine the number of rings
color[] circleColor = new color[15];

void setup(){
  
  /* Customization */
  background(#000000); // Background color
  size(500,500); // Size
  circleRadius[0] = 1; // First two numbers in the fibonacci list.
  circleRadius[1] = 1;
  randomColor = false; // Whether color of stroke is randomized or not.
  circleColor[0] = color(#FFFFFF); // Only vaild if randomColor is false
  debug = false;
  /* End Customization*/
  
  randomSeed((long)random(0,1000));
  
  if (debug){
    print("Generating radius & color...");
  }
  for (int i = 2; i < (circleRadius.length - 1); i++){
    circleRadius[i] = circleRadius[i-1] + circleRadius[i-2];
    if (debug){
      print(i + ": " + circleRadius[i]+"\n");
    }
  }
  for (int i=0; i < (circleColor.length - 1); i++){
    if(randomColor){
      circleColor[i] = color(random(0,255),random(0,255),random(0,255));
    } else {
      circleColor[i] = circleColor[0];
    }
  }
  if (debug){
    print("Done!");
  }
  fill(0,0,0,0);
  count = 0;
}

void draw(){
  stroke(circleColor[count]);
  if (debug){
    print("Count:" + count + " Radius: " + circleRadius[count] + "\n");
  }
  ellipse(width/2,height/2,circleRadius[count],circleRadius[count]);
  if ((count < (circleRadius.length -1)) || (count < (circleColor.length -1))) {
    count++;
  }
  if (debug){
    delay(10);
  }
}