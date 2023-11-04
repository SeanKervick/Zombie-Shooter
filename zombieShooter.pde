import javax.swing.*;

//Objects
Zombie zombie;
Hero hero;
Player player;

//Global Variables

//Game Info
int livesLost = 0;         //keeps track of number of lives lost in current game
int maxLives = 3;   //maximum number of lives that can be lost before the game ends


void setup() {
  size(1280, 720);
  noCursor();

  zombie = new Zombie(20.0);   //setting up the size of the zombies
  hero = new Hero();  //setting up the size of the hero
  player = new Player(JOptionPane.showInputDialog("Enter the player name (max 6 chars: "));
}


void draw() {
  background(0);

  if (livesLost < maxLives) {
    zombie.update();

    zombie.display();   

    hero.display();

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


void keyPressed() {
  hero.move();  // move hero once when key is pressed
}



//Hero and Zombie collision detection
boolean hitHero(Hero hero, Zombie zombie) {
  float heroZombieDistanceX = abs(zombie.getXCoord() - hero.getXCoordHero());
  float heroZombieDistanceY = abs(zombie.getYCoord() - hero.getYCoordHero() - hero.getDiameter()/2);

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
