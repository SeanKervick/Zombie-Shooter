public class Hero {
  private float xCoord;// X coordinate of hero
  private float yCoord;// Y coordinate of hero
  private int diameter;// diameter of hero
  private int speed;// hero speed

  //getters
  public float getXCoord() {
    return xCoord;
  }
  public float getYCoord() {
    return yCoord;
  }
  public int getDiameter() {
    return diameter;
  }
  public int getSpeed() {
    return diameter;
  }

  //setters
  public void setXCoord() {//sets hero in the middle of screen at beginning of game
    this.xCoord = width/2;
  }
  public void setYCoord() {//sets hero in the middle of screen at beginning of game
    this.yCoord = height/2;
  }
  public void setDiameter() {
    this.diameter = 50;//sets diameter of hero to 50
  }
  public void setSpeed() {//sets hero speed to 10 at beginning of game
    this.speed = 10;
  }

  //constructor 
  public Hero() {
    setXCoord();
    setYCoord();
    setDiameter();
    setSpeed();
  }

  //Public method to display hero
  public void display() {
    fill(102);
    noStroke();
    circle(xCoord, yCoord, diameter);
  }

  //Public method to move/update hero
  public void move() {
    if (left == true) {//move hero LEFT
      xCoord -= speed;
    }
    if (right == true) {//move hero RIGHT
      xCoord += speed;
    }
    if (up == true) {//move hero UP
      yCoord -= speed;
    }
    if (down == true) {//move hero DOWN
      yCoord += speed;
    }
    boundry();
  }

  //Set boundries so hero can't leave the screen
  private void boundry(){
    if (xCoord < (0+diameter/2)) {
      xCoord = 0+diameter/2;
    }
    if (xCoord > (width-diameter/2)) {
      xCoord = width-diameter/2;
    }
    if (yCoord < (0+diameter/2)) {
      yCoord = 0+diameter/2;
    }
    if (yCoord > (height-diameter/2)) {
      yCoord = height-diameter/2;
    }
  }
  
}
