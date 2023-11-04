class Bullet {
  private float xCoord;//x coordinate of bullet
  private float yCoord;//x coordinate of bullet
  private int diameter;//diameter of bullet
  private int speed;//bullet speed


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
    return speed;
  }


  //setters
  public void setXCoord() {
    this.xCoord = hero.getXCoord();
  }
  public void setYCoord() {
    this.yCoord = hero.getYCoord();
  }
  public void setDiameter(int diameter) {
    if ((diameter >= 10) && (diameter <= 30)) {
      this.diameter = diameter;
    } 
    else {
      this.diameter = 15;// sets the diameter to 15 if an unsuitable value is chosen
    }
  }
  public void setSpeed() {
    this.speed = 30;
  }

  //Bullet Constructor
  public Bullet(int diameter) { 
    setDiameter(diameter);   
    setSpeed();
  }

  //Display bullet
  public void display() {
    circle(xCoord, yCoord, diameter);
  }


  //using key handley variables to aim bullets
  public void move() {
    if (aimRight == true) {
      xCoord += speed;
    } else if (aimLeft == true) {
      xCoord -= speed;
    }
    exitScreen();

  }


  //private helper method for when a bullet exits the screen
  private void exitScreen() {
    if (xCoord < 0 || xCoord > width) {
      resetBullet();
    }
  }

  //private helper method for ressetting bullets position
  private void resetBullet() {
    trigger = false;
    xCoord = hero.getXCoord();
    yCoord = hero.getYCoord();
  }
  
  //Determine the aim direction based on the mouse position
  public void aimTowardsMouse(float mouseX) {
    if (mouseX < hero.getXCoord()) {
      aimLeft = true;
      aimRight = false;
    } 
    else {
      aimLeft = false;
      aimRight = true;
    }
  }



}
