/* Jelly! */
PShape jelly;

void setup(){
  background(255);
  size(500,500);
  jelly = loadShape("emoji_u1f610.svg");
}

void draw(){
  shape(jelly,150,150,200,200);
}