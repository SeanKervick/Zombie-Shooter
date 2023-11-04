public class Hero {
  private float xCoordHero; // X coordinate of hero
  private float yCoordHero;  // Y coordinate of hero
  private int diameter; // diameter of hero

  //getters
  public float getXCoordHero() {
    return xCoordHero;
  }

  public float getYCoordHero() {
    return yCoordHero;
  }

  public float getDiameter() {
    return diameter;
  }

  //setters
  public void setDiameter() {
    this.diameter = 50;  // sets diameter of hero to 50
  }

  public void setXCoordHero() {  // sets hero in the middle of screen at beginning of game
    this.xCoordHero = width/2;
  }

  public void setYCoordHero() {  // sets hero in the middle of screen at beginning of game
    this.yCoordHero = height/2;
  }

  //constructor method
  public Hero() {
    setXCoordHero();
    setYCoordHero();
    setDiameter();
  }

  public void display() {
    fill(102);
    noStroke();
    circle(xCoordHero, yCoordHero, diameter);
    println("xCoordHero = " + xCoordHero + " yCoordHero = " + yCoordHero);
  }

  public void move() {
    if (key == CODED){
      if (keyCode == LEFT){
        xCoordHero -= 10;
      }
      if (keyCode == RIGHT){
        xCoordHero += 10;
      }
      if (keyCode == UP){
        yCoordHero -= 10;
      }
      if (keyCode == DOWN){
        yCoordHero += 10;
      }
    }
  }
}
