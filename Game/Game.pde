PImage background;
PImage shipImage;
PImage alienImage;
boolean shoot = false;
missile[] missiles = new missile[3];  // numbers of missiles in magazine
// alien[] aliens = new alien[1];
// add array of [][] aliens
playerShip player1;
alien alien1;

void keyPressed()
{
  if(keyCode == LEFT){
    player1.moveShip(-20);  // move object left
  }
  if(keyCode == RIGHT){
    player1.moveShip(20);   // move object right
  } 
  if(key == ' ')
  {
   for(int i = 0; i < missiles.length; i++){   // missiles length = 3 
     if(missiles[i] == null){
       missiles[i] = new missile(player1.shipX+32,player1.shipY-10);
       i = missiles.length;
       
     }
   }
  }
}

void setup(){
  size (600,700);
  background = loadImage("cosmosBg.jpg");
  shipImage = loadImage("playerShip.png");
  alienImage = loadImage("alien.png");
  background.resize(width,height);
  shipImage.resize(70,70);
  alienImage.resize(70,70);
  player1 = new playerShip(265,630);
  alien1 = new alien(265,100);
  
  
}

void draw(){
int count = 0;  // keep track on how many bullets there is on the screen at a time

  image(background,0,0);
  player1.drawShip();
  alien1.updateAlien();
  //for loop to draw aliens row/column
  for(int i = 0; i < missiles.length; i++){
     if(missiles[i] != null){ 
         missiles[i].updateMissile(); 
         if(missiles[i].reachedTop()){  
            count = count +1;
         }
     }
  }
  if(count == missiles.length){  // check if amount of bullets on the screen is 3
    for(int i=0; i< missiles.length; i++){  // refresh bullets in array
    missiles[i] = null;
    }
  }
}