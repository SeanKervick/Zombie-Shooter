public class Zombie {
  private float xCoord; //  x coordinate of zombie
  private float yCoord; // y coordinate of zombie
  private float diameter; // diameter of zombie
  private int x; // for reseting from different side


  //getter methods
  public float getXCoord(){
    return xCoord;
  }

  public float getYCoord(){
    return yCoord;
  }

  public float getDiameter(){
    return diameter;
  }

  // setter 
  public void setDiameter(float diameter){
    if ((diameter >= 20) && (diameter <= 40)){
      this.diameter = diameter;
    } else {
      this.diameter = 30;  // sets the diameter to 30 if an unsuitable value is chosen
    }
  }
  
  //Constructor method
  public Zombie(float diameter){
    setDiameter(diameter);
    resetZombie();
  }
  
  
  //display method
  public void display(){
    fill(255, 20, 20);
    noStroke();
    circle(xCoord, yCoord, diameter);
  }

  //reset Zombie from the left side
  private void resetZombieLeft(){
    xCoord = 0;
    yCoord = random(height);
    x ++; //increment x each reset to alternate from even to odd
  }
  
  //reset Zombie from the right side
  private void resetZombieRight(){
    xCoord = width;
    yCoord = random(height);
    x ++; //increment x each reset to alternate from even to odd
  }
  
  private void resetZombie(){
    if (x % 2 == 0){ 
      resetZombieLeft();// if 'x' is even, reset from left
    }
    else if (x % 2 == 1){
      resetZombieRight();// if 'x' is odd, reset from right
    }
  }
  
  public void hit(){  // hit() method for action when there is a collision
    background(255, 0, 0);
    resetZombie();
  }

  //update method
  public void update(){
    float distanceX = xCoord - hero.getXCoord();  //distanceX is distance between hero and zombie on x axis
    float distanceY = yCoord - hero.getYCoord();  //distanceY is distance between hero and zombie on y axis
    int speed = 2; // speed of zombie  
    //update zombie coordinates   
    if (distanceX > 0){
      xCoord -= speed;
    }
    else {
      xCoord += speed;
    }
    if (distanceY > 0){
      yCoord -= speed;
    }
    else {
      yCoord += speed;
    }
  }
}

      
      




/*
    //TO DELTE WHEN FINISHED
    //reset position if zombie leaves the screen right
    if (xCoord > width + diameter) {
    if (x % 2 == 0){ // if 'int reset' is even, reset from left
    resetZombieLeft();
    }
    else if (x % 2 == 1){
      resetZombieRight();// if 'int reset' is odd, reset from right
    }
    }
    
    //reset position if zombie leaves the screen left
    if (xCoord < 0) {
    if (x % 2 == 0){ // if 'int reset' is even, reset from left
    resetZombieLeft();
    }
    else if (x % 2 == 1){
      resetZombieRight();// if 'int reset' is odd, reset from right
    }
    }
    
    //reset position if zombie leaves the screen top
    if (yCoord < 0 + diameter) {
    if (x % 2 == 0){ // if 'int reset' is even, reset from left
    resetZombieLeft();
    }
    else if (x % 2 == 1){
      resetZombieRight();// if 'int reset' is odd, reset from right
    }
    }
    //reset position if zombie leaves the screen bottom
    if (yCoord > height + diameter) {
    if (x % 2 == 0){ // if 'int reset' is even, reset from left
    resetZombieLeft();
    }
    else if (x % 2 == 1){
      resetZombieRight();// if 'int reset' is odd, reset from right
    }
    }
  }
*/
