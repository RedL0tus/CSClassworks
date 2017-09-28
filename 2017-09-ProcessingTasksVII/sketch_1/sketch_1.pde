void setup(){
  size(1000,500);
  background(0);
  fill(255);
  stroke(255);
}

void draw(){
  line(250,500,250,400);
  drawBranches(250,400,45,100);
  drawBranches(250,400,135,100);
}

void drawBranches(float initialLocationX, float initialLocationY, float theta, float lineLength){
  float thetaR = -1*radians(theta);
  float finalLocationX = initialLocationX + lineLength*cos(thetaR);
  float finalLocationY = initialLocationY + lineLength*sin(thetaR);
  line(initialLocationX,initialLocationY,finalLocationX,finalLocationY);
  lineLength *= 0.66;
  if (lineLength > 2){
    drawBranches(finalLocationX,finalLocationY,theta+45,lineLength);
    drawBranches(finalLocationX,finalLocationY,theta-45,lineLength);
  }
}