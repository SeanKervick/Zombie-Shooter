public class Hero {
  private float xCoord; // X coordinate of hero
  private float yCoord;  // Y coordinate of hero
  private int diameter; // diameter of hero

  //getters
  public float getXCoord(){
    return xCoord;
  }

  public float getYCoord(){
    return yCoord;
  }

  public float getDiameter(){
    return diameter;
  }

  //setters
  public void setDiameter(){
    this.diameter = 50;  // sets diameter of hero to 50
  }

  public void setXCoord(){  // sets hero in the middle of screen at beginning of game
    this.xCoord = width/2;
  }

  public void setYCoord(){  // sets hero in the middle of screen at beginning of game
    this.yCoord = height/2;
  }

  //constructor method
  public Hero(){
    setXCoord();
    setYCoord();
    setDiameter();
  }

  public void display(){
    fill(102);
    noStroke();
    circle(xCoord, yCoord, diameter);
  }

  public void move(){
    if (keyPressed && key == CODED){
      if (keyCode == LEFT){
        xCoord -= 10;
      }
      if (keyCode == RIGHT){
        xCoord += 10;
      }
      if (keyCode == UP){
        yCoord -= 10;
      }
      if (keyCode == DOWN){
        yCoord += 10;
      }
    }
  }
}
