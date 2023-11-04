public class Zombie {
  private float xCoord;//x coordinate of zombie
  private float yCoord;//y coordinate of zombie
  private float diameter; //diameter of zombie
  private int i; //for reseting zombie from random side
  private float speed = 3;//zombie speed

  //getters
  public float getXCoord() {
    return xCoord;
  }
  public float getYCoord() {
    return yCoord;
  }
  public float getDiameter() {
    return diameter;
  }
  public float getI() {
    return i;
  }
  public float getSpeed() {
    return diameter;
  }

  //setters 
  public void setDiameter(float diameter) {
    if ((diameter >= 20) && (diameter <= 40)) {
      this.diameter = diameter;
    } else {
      this.diameter = 30;  // sets the diameter to 30 if an unsuitable value is chosen
    }
  }  
  public void setSpeed() {
    this.speed = 3;
  }

  //Constructor
  public Zombie(float diameter) {
    setDiameter(diameter);
    resetZombie();
  }


  //display method
  public void display() {
    fill(255, 20, 20);
    noStroke();
    circle(xCoord, yCoord, diameter);
  }

  //reset Zombie from the left side
  private void resetZombieLeft() {
    xCoord = 0;
    yCoord = random(height);
    i = int(random(4)); //choose random number between 0 & 3
  }

  //reset Zombie from the right side
  private void resetZombieRight() {
    xCoord = width;
    yCoord = random(height);
    i = int(random(4)); //choose random number between 0 & 3
  }

  //reset Zombie from the top
  private void resetZombieTop() {
    xCoord = random(width);
    yCoord = 0;
    i = int(random(4)); //choose random number between 0 & 3
  }

  //reset Zombie from the bottom
  private void resetZombieBottom() {
    xCoord = random(width);
    yCoord = height;
    i = int(random(4)); //choose random number between 0 & 3
  }


  private void resetZombie() {
    if (i == 0) { 
      resetZombieLeft();// if 'i' = 0, reset from left
    } else if (i == 1) {
      resetZombieRight();// if 'i' = 1, reset from right
    } else if (i == 2) {
      resetZombieTop();// if 'i' = 2, reset from top
    } else if (i == 3) {
      resetZombieBottom();// if 'i' = 3, reset from bottom
    }
  }

  //method for action when there is a collision
  public void hit() {
    background(255, 0, 0);
    if (speed < 6.6) {//puts limit on speed of zombie
      speed += 0.3; //speed of zombie increases
    } else if (score > 25) {
      speed += 0.2;//increases speed again if player gets a score over 25
    }
    resetZombie();
  }

  //update method to move zombie towards the hero object
  public void update() {
    float distanceX = xCoord - hero.getXCoord();  //distanceX is distance between hero and zombie on x axis
    float distanceY = yCoord - hero.getYCoord();  //distanceY is distance between hero and zombie on y axis  
    //update zombie coordinates   
    if (distanceX > 0) {
      xCoord -= speed;
    } else {
      xCoord += speed;
    }
    if (distanceY > 0) {
      yCoord -= speed;
    } else {
      yCoord += speed;
    }
  }
}
