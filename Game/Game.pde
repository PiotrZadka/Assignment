PImage background;
PImage shipImage;
PImage alienImage;
boolean shoot = false;
missile[] missiles = new missile[3];  // numbers of missiles in magazine
ArrayList<alien> alienList = new ArrayList<alien>();
playerShip player1;


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
  
  // spawn aliens
  float startAlien = 25;
  for(int i = 0; i < 6; i++){
    float leftLimit = startAlien - 25;
    float rightLimit = startAlien + 25;
    alienList.add(new alien(startAlien,100,0.5,leftLimit,rightLimit));
    startAlien = startAlien + 96.5;
  }
  
  
  
}

void draw(){
int count = 0;  // keep track on how many bullets there is on the screen at a time

  image(background,0,0);
  player1.drawShip();
  
  // show/move spawned aliens
  for(int k = 0; k < alienList.size(); k++){
    alienList.get(k).updateAlien();
  }
  
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
    for(int i=0; i< missiles.length; i++){  // reload
    missiles[i] = null;
    }
  }
  //check for each missile if any aliens is being hit if so remove it from arraylist.
  for(int i = 0; i < missiles.length; i++){
    for(int j = 0; j < alienList.size(); j++){
      if(alienList.get(j).isHit(missiles[i])){
        alienList.remove(j);
        missiles[i] = null;
        count = count +1;
      }
    }
  }
}