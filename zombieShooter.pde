/* Name: Seán Kervick
   Student Number: 20104300
   
   This game inspired by the concept of 'Call of Duty Zombies' whereby
   a zombie spawns & enters the game from a random, unknown starting position.
   The zombie then chases or follows the hero character while the hero
   must run away and shoot the zombie to stay alive. 

*/

import javax.swing.*;

//Declaring object varibales
Zombie zombie;
Hero hero;
Player player;
Bullet bullet;


//Global Variables

//Game Info
int livesLost = 0;   //keeps track of number of lives lost in current game
int maxLives = 3;   //maximum number of lives that can be lost before the game ends
int score = 0;     //keep track of score

boolean trigger = false;//variable for shooting

//moving hero keys
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;

//aiming bullets keys
boolean aimLeft = false;
boolean aimRight = true;

//Score display font
PFont myFont;

void setup() {
  size(1280, 720);
  zombie = new Zombie(40.0);//setting up the size of the zombies
  hero = new Hero();//setting up the size of the hero
  player = new Player(JOptionPane.showInputDialog("Enter the player name (max 6 characters)."));
  bullet = new Bullet(20);//setting up the size of the bullet
}


void draw() {

  background(0);

  if (livesLost < maxLives) {  
    //call methods from classes
    zombie.update();
    zombie.display();   
    hero.display();
    hero.move();
    bullet.display();

    bullet.aimTowardsMouse(mouseX); // Call this before checking trigger
    
    if (trigger) {
      bullet.move();//shoot bullet if trigger == true
    } else {
      bullet.setXCoord();//set bullet's position to hero's position by calling setter
      bullet.setYCoord();
    }       

    //call action when a colision is detected between hero and zombie objects
    boolean collision = hitHero(hero, zombie);
    if (collision == true) {
      zombie.hit();
      livesLost++;
      println("Lives lost = " + livesLost);
    }
    //call action when a colision is detected between bullet and zombie objects
    boolean collision2 = hitBullet(bullet, zombie);
    if (collision2 == true) {
      zombie.hit();
      bullet.resetBullet();
      score++;
    }
  } 

  //when player has no lives left
  else {
    int reply = JOptionPane.showConfirmDialog(null, 
      "Game Over!  \n" + player.getPlayerName() + "   your score is: " + score + "\nWould you like to play again?", 
      "Play next game?", 
      JOptionPane.YES_NO_OPTION);
    if (reply == JOptionPane.YES_OPTION) {  //player chooses to play the next game in their tournament.
      resetGame();
    } else {
      exit();  //player choses to exit
    }
  }
  scoreBoardUpdate();
}

//bespoke method for updating the score and lives on the screen
void scoreBoardUpdate() {
  fill(255);
  myFont = createFont("Georgia", 25);
  textFont(myFont);
  text("Score: " + score, 5, height-35);
  text("Lives: " + (3 - livesLost), 5, height-10);
}

void mousePressed() {
  trigger = true;
}

//key handler
void keyPressed() {
  if (key == 'a' || key == 'A') {
    left = true;
  }
  if (key == 'd' || key == 'D') {
    right = true;
  }
  if (key == 'w' || key == 'W') {
    up = true;
  }
  if (key == 's' || key == 'S') {
    down = true;
  }
}

void keyReleased() {  
  if (key == 'a' || key == 'A') {
    left = false;
  }
  if (key == 'd' || key == 'D') {
    right = false;
  }
  if (key == 'w' || key == 'W') {
    up = false;
  }
  if (key == 's' || key == 'S') {
    down = false;
  }
}


//Hero and Zombie collision detection
boolean hitHero(Hero hero, Zombie zombie) {
  float heroZombieDistanceX = abs(zombie.getXCoord() - hero.getXCoord());
  float heroZombieDistanceY = abs(zombie.getYCoord() - hero.getYCoord());

  if (heroZombieDistanceX > (zombie.getDiameter()/2)) {
    return false;
  }

  if (heroZombieDistanceY > (hero.getDiameter()/2 + zombie.getDiameter()/2)) {
    return false;
  }
  return true;
}

//Bullet and Zombie collision detection
boolean hitBullet(Bullet bullet, Zombie zombie) {
  float bulletZombieDistanceX = abs(zombie.getXCoord() - bullet.getXCoord());
  float bulletZombieDistanceY = abs(zombie.getYCoord() - bullet.getYCoord() - bullet.getDiameter()/2);

  if (bulletZombieDistanceX > (zombie.getDiameter()/2)) {
    return false;
  }

  if (bulletZombieDistanceY > (bullet.getDiameter()/2 + zombie.getDiameter()/2)) {
    return false;
  }
  return true;
}

//method to reset variables for ressetting the game
void resetGame() {
  println("Game Over!");
  println("Starting a new game...");
  livesLost = 0;   //resets the lives lost in the current game to zero
  maxLives = 3;   //resets maximum number of lives
  score = 0;     //resets score

  hero.setXCoord();
  hero.setYCoord();

  //reset hero keys
  right = false;
  left = false;
  up = false;
  down = false;

  //reset aiming bullets keys
  aimLeft = false;
  aimRight = false;

  //rest zombie to original speed
  zombie.setSpeed();
}
