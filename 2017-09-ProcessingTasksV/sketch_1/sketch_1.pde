Jelly bai;

void setup(){
  background(0);
  size(500,500);
  bai = new Jelly((int)random(0,500),(int)random(0,500));
}

void draw(){
  background(0);
  bai.move();
  bai.bounce();
  bai.display();
}

class Jelly{
  int x;
  int y;
  int xspeed;
  int yspeed;
  PShape jelly;
  
  Jelly(int xi, int yi){
    x = xi;
    y = yi;
    xspeed = (int)random(-5,-5);
    yspeed = (int)random(-5,-5);
  }
  
  void move(){
    x = x + xspeed;
    y = y + xspeed;
  }
  
  void bounce(){
    if ((x > width) || (x < 0)){
      xspeed = -1*xspeed;
    } else {
      yspeed = -1*yspeed;
    }
  }
  
  void display(){
    jelly = loadShape("emoji_u1f610.svg");
    shape(jelly,x,y);
  }
}