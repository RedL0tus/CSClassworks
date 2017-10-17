/*
* Conway's Game of Life
*
* Author: Ken Wang <RedL0tus@noreply.github.com>
*
* Copyright © 2017 Ken Wang <RedLtus@noreply.github.com>
* This work is free. You can redistribute it and/or modify it under the
* terms of the Do What The Fuck You Want To Public License, Version 2,
* as published by Sam Hocevar. See the LICENSE file for more details.
*/
GameOfLife plusOneSecond = new GameOfLife(250,150,1000,600);

public void setup(){
  size(1000,650);
  /* Initializing */
  plusOneSecond.drawUI();
  plusOneSecond.drawCells();
  plusOneSecond.drawPlots();
}

public void draw(){
  /* Main loop */
  background(#CCCCCC);
  plusOneSecond.nextGen();
}

public class GameOfLife{
  int xQuantity, yQuantity; // Quantitles of cells in x & y axis.
  int mapWidth,mapHeight,gen; // Width & Height of the map; Count of generation
  boolean paused; // Pasued or not
  boolean[][] plotMap = new boolean[1000][1000]; // 2D array that stores the status of each cell
  
  GameOfLife (int xq, int yq,int mw,int mh) {
    xQuantity = xq;
    yQuantity = yq;
    mapWidth = mw;
    mapHeight = mh;
    /* Initialize map */
    for (int x = 0; x < xQuantity; x++){
      for (int y = 0; y < yQuantity; y++){
        plotMap[x][y] = false;
      }
    }
    /* Initialize generation count */
    gen = 0;

    /* Glider for testing */
    plotMap[3][3] = true;
    plotMap[4][3] = true;
    plotMap[5][3] = true;
    plotMap[5][2] = true;
    plotMap[4][1] = true;
  }

  public void drawPlots(){
    /* Draw frames of the map */
    fill(#FFFFFF);
    stroke(#FFFFFF);
    float xDelta = (mapWidth/xQuantity);
    float yDelta = (mapHeight/yQuantity);
    for (int x = 0; x <= xQuantity; x++){
      line((x*xDelta),0,(x*xDelta),mapHeight);
    }
    for (int y = 0; y <= yQuantity; y++){
      line(0,(y*yDelta),mapWidth,(y*yDelta));
    }
  }
  
  public void drawDot(int x, int y){
    /* Draw dot */
    fill(#FF0000);
    stroke(#FF0000);
    float dotWidth = (mapWidth/xQuantity);
    float dotHeight = (mapHeight/yQuantity);
    if ((x < xQuantity) && (y < yQuantity)){
      quad((x*dotWidth),(y*dotHeight),(x*dotWidth),((y+1)*dotWidth),((x+1)*dotWidth),((y+1)*dotHeight),((x+1)*dotWidth),(y*dotHeight));
    }
  }
  
  public void updateCells(){
    boolean[][] newPlotMap = new boolean[5000][5000];
    for (int x = 0; x < xQuantity; x++){
      for (int y = 0; y < yQuantity; y++){
        /* Count live cells around */
        int liveCount = 0;
        for (int i = -1; i < 2; i++){
          for (int j = -1; j < 2; j++){
            if (((x + i) >= 0) && ((y + j) >= 0) && 
                ((x + i) < xQuantity) && ((y + j) < yQuantity) &&
                (!((i == 0) && (j == 0))) &&
                (plotMap[x+i][y+j] == true)){
              liveCount++;
            }
          }
        }
        /* Update map */
        if (plotMap[x][y] == true){
          if (liveCount >= 2){
            if (liveCount > 3){
              newPlotMap[x][y] = false;
            } else {
              newPlotMap[x][y] = true;
            }
          } else {
            newPlotMap[x][y] = false;
          }
        } else {
          if (liveCount == 3){
            newPlotMap[x][y] = true;
          } else {
            newPlotMap[x][y] = false;
          }
        }
      }
    }
    plotMap = newPlotMap;
    gen++; 
  }
  
  public void drawCells(){
    /* Draw cells from the map */
    for (int x = 0; x < xQuantity; x++){
      for (int y = 0; y < yQuantity; y++){
        if (plotMap[x][y] == true){
          drawDot(x,y);
        }
      }
    }
  }

  public void mouseClickHandler(float x,float y){
    /* Add cells */
    if ((x < mapWidth) && (y < mapHeight)){
      int cellX = (((int)x)/(mapWidth/xQuantity));
      int cellY = (((int)y)/(mapHeight/yQuantity));
      if ((cellX >= 0) && (cellX < xQuantity) && (cellY >= 0) && (cellY < yQuantity)){ // Avoid array outbond.
        plotMap[cellX][cellY] = true;
      }
    }
    
    /* Pause */
    if ((x >= 5) && (y >= 605) && (x <= 105) && (y <= 625)){
      if (paused){
        paused = false;
      } else {
        paused = true;
      }
      delay(50);
    }
    
    /* Random generator */
    if ((x >= 125) && (y >= 605) && (x <= 225) && (y <= 625)){
      for (int X = 0; X < xQuantity; X++){
        for (int Y = 0; Y < yQuantity; Y++){
          if (random(0,200) > 100){
            plotMap[X][Y] = true;
          } else {
            plotMap[X][Y] = false;
          }
        }
      }
      delay(50);
    }
    
    /* Clear */
    if ((x >= 245) && (y >= 605) && (x <= 345) && (y <= 625)){
      for (int X = 0; X < xQuantity; X++){
        for (int Y = 0; Y < yQuantity; Y++){
          plotMap[X][Y] = false;
        }
      }
      gen = 0;
      delay(50);
    }
  }

  public void drawUI(){
    textSize(12);
    fill(#000000);
    stroke(#000000);

    /* Generation counter */
    String genPrompt = "Generation: " + gen;
    text(genPrompt,5,645);
    
    /* Pause */
    fill(#CCCCCC);
    quad(5,605,105,605,105,625,5,625);
    fill(#000000);
    if (paused){
      text("UNPAUSE",30,620);
    } else {
      text("PAUSE",35,620);
    }
    
    /* Random generator */
    fill(#CCCCCC);
    quad(125,605,225,605,225,625,125,625);
    fill(#000000);
    text("RANDOM",150,620);
    
    /* Clear */
    fill(#CCCCCC);
    quad(245,605,345,605,345,625,245,625);
    fill(#000000);
    text("CLEAR",275,620);
  }

  public void nextGen(){
    drawUI();
    if (mousePressed){
      mouseClickHandler(mouseX,mouseY);
      drawCells();
      drawPlots();
    } else {
      if (!paused){
        updateCells();
      }
      drawCells();
      drawPlots();
    }
    delay(50);
  }

}