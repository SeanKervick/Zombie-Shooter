class Bullet {
  private float x;
  private float y;
  int d;
  int speed;
  
  //constructor
  Bullet(float startingX, float startingY){
    x = startingX;
    y = startingY;    
    d = 15;   
    speed = 15;
  }
  
  //setters
  public void setX(){
    this.x = hero.getXCoord();
  }
  
  //setters
  public void setY(){
    this.y = hero.getYCoord();
  }
  
  void render(){
    circle(x, y, d);
  }
  
  void move(){
    x += speed;
  }
  
  
}
