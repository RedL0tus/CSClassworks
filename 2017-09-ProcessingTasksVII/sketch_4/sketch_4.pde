public void setup(){
  size(1000,500);
  background(0);
  fill(255);
  stroke(255);
  randomSeed((long)random(0,random(0,100000000)));
  int trees = (int)random(10,20);
  for (int i = 0; i < trees; i++){
    drawTree(random(0,1000),500,(int)random(2,5),random(0,200),random(0,0.9),random(36,80));
  }
}

/* Trigger for drawBranch function
*  Parameters:
*    initialLocationX: X-Axis of initnal location; intialLocationY: Y-Axis of initialLocation, branches: number of branches; 
*    lineLength: length of each branches; lengthDelta: how much the line length will be shorten; angle: angles between each branches;
*/
public void drawTree(float initialLocationX, float initialLocationY, int branches, float lineLength, float lengthDelta, float angle){
  line(initialLocationX,initialLocationY,initialLocationX,(initialLocationY-lineLength)); // Draw the trunk
  float initialTheta = 90 - ((angle*(branches-1))/2);
  for (int i = 0; i < branches; i++){
    drawBranches(initialLocationX, (initialLocationY-lineLength),(initialTheta+i*angle),(lineLength*lengthDelta),lengthDelta,branches,angle); // Start drawing branches
  }
}

/* Draw branches
*  Parameters:
*    initialLocationX: X-Axis of initnal location; intialLocationY: Y-Axis of initialLocation, theta: theta of the branch; 
*    lineLength: length of each branches; lengthDelta: how much the line length will be shorten; angle: angles between each branches;
*    branches: number of branches; angle: angles between each branches;
*/
public void drawBranches(float initialLocationX, float initialLocationY, float theta, float lineLength, float lengthDelta, int branches, float angle){
  float thetaR = -1*radians(theta);
  float finalLocationX = initialLocationX + lineLength*cos(thetaR);
  float finalLocationY = initialLocationY + lineLength*sin(thetaR);
  line(initialLocationX,initialLocationY,finalLocationX,finalLocationY);
  lineLength *= lengthDelta;
  float initialTheta = theta - ((angle*(branches-1))/2);
  if (lineLength > 2){
    for (int i = 0; i < branches; i++){
      drawBranches(finalLocationX,finalLocationY,(initialTheta+i*angle),lineLength,lengthDelta,branches,angle);
    }
  }
}