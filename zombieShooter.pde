import javax.swing.*;

//Objects
Zombie zombie;
Hero hero;
Player player;
Bullet bullet;

//Global Variables
boolean pressed = false;

//Game Info
int livesLost = 0;         //keeps track of number of lives lost in current game
int maxLives = 3;   //maximum number of lives that can be lost before the game ends


void setup() {
  size(1280, 720);
  noCursor();

  zombie = new Zombie(20.0);   //setting up the size of the zombies
  hero = new Hero();  //setting up the size of the hero
  player = new Player(JOptionPane.showInputDialog("Enter the player name (max 6 chars: "));
  bullet = new Bullet(hero.getXCoord(), hero.getYCoord());
}


void draw() {
  background(0);

  if (livesLost < maxLives) {
    zombie.update();
    zombie.display();   
    hero.display();
    hero.move();  // move hero once when key is pressed
    
    if (pressed == true){
    bullet.render();
    bullet.move();
    }

    boolean collision = hitHero(hero, zombie);
    if (collision == true) {
      zombie.hit();
      println(collision);
      livesLost++;
      println("Lives lost = " + livesLost);
    }
  } 
  else {
    int reply = JOptionPane.showConfirmDialog(null, 
      "Game Over! You reached level:  . \nWould you like to play again?", 
      "Play next game?",
      JOptionPane.YES_NO_OPTION);
    if (reply == JOptionPane.YES_OPTION) {  //player chooses to play the next game in their tournament.
      resetGame();
    } 
    else {
      exit();
    }
  }
}


void mousePressed() {
  if (mouseButton == LEFT){
    pressed = true;
    bullet.setX();
    bullet.setY();
  }
  else{
    pressed = false;
  }
}



//Hero and Zombie collision detection
boolean hitHero(Hero hero, Zombie zombie) {
  float heroZombieDistanceX = abs(zombie.getXCoord() - hero.getXCoord());
  float heroZombieDistanceY = abs(zombie.getYCoord() - hero.getYCoord() - hero.getDiameter()/2);

  if (heroZombieDistanceX > (zombie.getDiameter()/2)) {
    return false;
  }

  if (heroZombieDistanceY > (hero.getDiameter()/2 + zombie.getDiameter()/2)) {
    return false;
  }
  return true;
}

void resetGame() {
  println("Game Over!");
  println("Starting a new game...");
  livesLost = 0;        //resets the lives lost in the current game to zero
}
