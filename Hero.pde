public class Hero {
  private int xCoord; // X coordinate of person
  private int yCoord;  // Y coordinate of person
  private int diameter; // diameter of person

  public int getXCoord() {
    return xCoord;
  }

  public int getYCoord() {
    return yCoord;
  }

  public int getDiameter() {
    return diameter;
  }

  // setter methods
  public void setDiameter(int diameter) {
    if ((diameter >= 40) && (diameter <= 60)) {
      this.diameter = diameter;
    } else {
      this.diameter = 50;  // sets the diameter to 50 if an unsuitable value is chosen
    }
  }

  public void setXCoord() {  // sets hero in the middle of screen at beginning of game
    this.xCoord = width/2;
  }

  public void setYCoord() {  // sets hero in the middle of screen at beginning of game
    this.yCoord = height/2;
  }


  //constructor method
  public Hero(int diameter) {
    setXCoord();
    setYCoord();
    setDiameter(diameter);
  }

  public void display() {
    fill(102);
    noStroke();
    circle(xCoord, yCoord, diameter);
  }

  public void move() {
    if (key == CODED){
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
      else {
        xCoord += 0;
        yCoord += 0;
      }
    }
  }
}
