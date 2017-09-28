void setup(){
  size(500,500);
  background(0);
  int[] location = {250,250};
  float radius = 500;
  int fill = 255;
  smallCircle(location,radius,fill);
}

void smallCircle(int[] location, float radius, int fill){
  noStroke();
  fill(fill);
  ellipse(location[0],location[1],radius,radius);
  radius = radius/2;
  if (radius > 2){
    fill = abs(fill-255);
    smallCircle(location,radius,fill);
  }
}