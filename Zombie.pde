public class Zombie {
  private float xCoord; //  x coordinate of zombie
  private float yCoord; // y coordinate of zombie
  private float diameter; // diameter of zombie
  private float speedX; // speed along x axis
  private float speedY; // speed along y axis


  //getter methods
  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public float getDiameter() {
    return diameter;
  }

  // setter method
  public void setDiameter(float diameter) {
    if ((diameter >= 20) && (diameter <= 40)) {
      this.diameter = diameter;
    } else {
      this.diameter = 30;  // sets the diameter to 30 if an unsuitable value is chosen
    }
  }
  
  //display method
  public void display() {
    fill(255, 20, 20);
    noStroke();
    circle(xCoord, yCoord, diameter);
  }


  //reset Zombie method
  private void resetZombie() {
    xCoord = 0;
    yCoord = random(height);
    speedX = random(2, 4);
    speedY = random(-2, 2);
  }

  //Constructor method
  public Zombie(float diameter) {
    setDiameter(diameter);
    resetZombie();
  }

  //update method
  public boolean update() {
    boolean lifeLost = false;

    //update zombie coordinates
    xCoord = xCoord + speedX;
    yCoord = yCoord + speedY;

    //reset position if zombie leaves the screen
    if (xCoord > width + diameter/2) {
      resetZombie();
      lifeLost = true;
    }
    /*
  // If ball hits the left edge of the display 
     // window, change direction of xCoord
     if (xCoord < diameter/2){
     xCoord = diameter/2;
     speedX = speedX * -1;
     }
     
     // If ball hits top or bottom of the display
     //  window, change direction of yCoord
     if (yCoord > height - diameter/2){
     yCoord = height - diameter/2;
     speedY = speedY * -1;
     } 
     else if (yCoord < diameter/2){
     yCoord = diameter/2;
     speedY = speedY * -1;
     }
     */
    return lifeLost;
  }
}
