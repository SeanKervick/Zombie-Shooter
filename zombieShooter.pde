//Objects
Zombie zombie;
Hero hero;

void setup(){
   size(1280, 720);
   noCursor();

   zombie = new Zombie(20.0);   //setting up the size of the zombies
   hero = new Hero(50);  //setting up the size of the hero
}

void draw(){
   background(0);    

   zombie.update();
   zombie.display();   
   
   hero.display();
}

void keyPressed(){
     hero.move();  // move hero once when key is pressed
}
