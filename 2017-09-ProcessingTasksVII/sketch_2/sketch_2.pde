void setup(){
  size(1000,500);
  background(0);
  fill(255);
  stroke(255);
  
  randomSeed((long)random(0,1000));
  int quantity = (int)random(10,20);
  for (int i = 0; i < quantity; i++){
    float randomX = random(0,width);
    float treeSize = random(0,300);
    line(randomX,500,randomX,500-(treeSize));
    drawBranches(randomX,(500-treeSize),45,treeSize);
    drawBranches(randomX,(500-treeSize),135,treeSize);
  }
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