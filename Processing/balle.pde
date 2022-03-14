class Balle {
  int x,y;
  int D;
  Balle(int newX, int newY){
  x=newX;
  y=newY;
  D=15;
  }
  void bouge(){
  x=x+xvalue;
  
  y=y+yvalue;
  }
  void display(){
  fill (0,255,125);
  noStroke();
  ellipse(x,y,D,D);
  
  }
  void testEcran(){
  
    if (x<=0+round(D/2)||x>=width-round(D/2)){
    x=x-xvalue;
    }
    if (y<=0+round(D/2)||y>=height-round(D/2)){
    y=y-yvalue;
    }
    
  }
}
