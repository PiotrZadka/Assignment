PImage background;
PImage shipImage;
PImage alienImage;
PImage explosionImage, explosionImage2, explosionImage3;

int col = 6;  // number of columns for alienArray
int row = 4;
int alienCount = col * row;
int missileCount = 0;  // reload counter - keep track on how many bullets there is on the screen at a time 

ArrayList<explosion>explosionList = new ArrayList<explosion>();
ArrayList<missile> missileList = new ArrayList<missile>();
alien [][] alienArray = new alien [row][col];

playerShip player1;
explosion explosion1;

void keyPressed(){
  float moveLength = 20;
  if(keyCode == LEFT){
    player1.moveShip(-moveLength);  // move object left
  }
  if(keyCode == RIGHT){
    player1.moveShip(moveLength);   // move object right
  } 
  if(key == ' '){
   if(missileCount < 3){
       missileList.add(new missile(player1.shipX+32,player1.shipY-10));
       missileCount = missileCount + 1;
     }
   }
  }

void setup(){
  size (600,700);
  background = loadImage("cosmosBg.jpg");
  shipImage = loadImage("playerShip.png");
  alienImage = loadImage("alien.png");

  explosionImage = loadImage("explosion.png");
  explosionImage.resize(70,70);
  explosionImage2 = loadImage("explosion2.png");
  explosionImage2.resize(70,70);
  explosionImage3 = loadImage("explosion3.png");
  explosionImage3.resize(70,70);
  background.resize(width,height);
  shipImage.resize(70,70);
  alienImage.resize(70,40);
  player1 = new playerShip(265,630);
  
    // 2d Array of Aliens spawn
    int xPosAlien = 25;
    int yPosAlien = 100;
    
    for(int k = 0; k < row; k++){
      for(int j = 0; j < col; j++){
        float leftLimit = xPosAlien - 25;
        float rightLimit = xPosAlien + 25;
        alienArray[k][j] = new alien(xPosAlien,yPosAlien,0.5,leftLimit,rightLimit);
        xPosAlien = xPosAlien + 96;
      }
      xPosAlien = 25;
      yPosAlien = yPosAlien + 50;
    }
  }


void draw(){
  image(background,0,0);
  player1.drawShip();
  

  // alienArray behaviours (visibility + move)
  for(int k = 0; k < row; k++){
      for(int j = 0; j < col; j++){
        if(alienArray[k][j].getVisible()){  // if alien is visible update it
        alienArray[k][j].updateAlien();
        }
      }
  }
  //check if missiles reached top
  for(int i = 0; i < missileList.size(); i++){
         missileList.get(i).updateMissile(); 
         if(missileList.get(i).reachedTop()){  
           missileList.remove(i);
            missileCount = missileCount -1 ;
         }
     }
     
  for(int i = 0; i < explosionList.size(); i++){  // render explosion
    explosionList.get(i).renderExp();
  }

  // test 2d array hit (remove off the screen if hit) // temporary fix for removing aliens
    for(int k = 0; k < row; k++){
      for(int j = 0; j< col; j++){
        for(int i = 0; i < missileList.size(); i++){
        if(alienArray[k][j].isHit(missileList.get(i)) && alienArray[k][j].getVisible()){  // if alien is hit & visible  remove it and set visibility  to false
          alienArray[k][j].makeVisible(false);
          
          explosion1 = new explosion (alienArray[k][j].getAlienX(), alienArray[k][j].getAlienY());
          explosionList.add(explosion1);

          missileList.remove(i);
          missileCount = missileCount -1;
          alienCount = alienCount - 1;
          break;
        }
      }
    }
  }
  //temporart end splash screen
  if(alienCount == 0){
    textSize(32);
    fill(255,255,255);
    text("Level Completed",width/2-125, height/2); 
  }
}