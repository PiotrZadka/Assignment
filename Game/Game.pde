PImage background;

int col = 5;  // number of columns for tankArray
int row = 4;
float tankCount = col * row;
int missileCount = 0;  // reload counter - keep track on how many bullets there is on the screen at a time 
int score = 0;
int missileAmount = 50; // change later to 3
int missileLimit = 50;  // change later to 3
int life = 3;
float moveLength = 20;

//Draw a random tank to shot missile
int ranX = (int)random(row-1);
int ranY = (int)random(col-1);

// state of draw playerRudy image
final int IMG1 = 0;  //face forward
final int IMG2 = 1;  //face left
final int IMG3 = 2;  //face right
int image = IMG1;

boolean gameMode = true;
boolean gameOver = false;
boolean levelFinish = false;

//arrays
ArrayList<explosion>explosionList = new ArrayList<explosion>();
ArrayList<missile> missileList = new ArrayList<missile>();
ArrayList<playerRudy>playerList = new ArrayList<playerRudy>();
tanks [][] tankArray = new tanks [row][col];

//constructors
playerRudy player1;
explosion explosion1;
missile_drop missileDrop1;


//temporary score bar
void scorebar(){
  fill(255,255,255);
  rect(0,0,width,15);
  textSize(15);
  fill(0,0,0);
  text("Score: "+score, 30, 13); 
  text("Missiles: "+missileAmount, 120, 13);
  text("Life: "+life, 210, 13);
  
}

void keyPressed(){
  if(keyCode == LEFT){
    playerList.get(0).moveRudy(-moveLength);  // move object left
    image = IMG2;
    
  }
  if(keyCode == RIGHT){
    playerList.get(0).moveRudy(moveLength);   // move object right
    image = IMG3;
  } 
  if(key == ' '){
   if(missileCount < missileLimit){
       missileList.add(new missile(playerList.get(0).rudyX+22,playerList.get(0).rudyY-10));
       missileCount = missileCount + 1;
       missileAmount = missileAmount -1;
   }
  }
}
void keyReleased(){
  if(keyCode == LEFT){
    image = IMG1;
  }
  if(keyCode == RIGHT){
    image = IMG1;
  }
}

void setup(){
  size (600,700);
  background = loadImage("images/bg.png");
  background.resize(width,height);
  player1 = new playerRudy(width/2-25,625);
  playerList.add(player1);
 
    // 2d Array of Tanks spawn
    int xPosTank = 75;
    int yPosTank = 100;
    int limitAdj = 75;
    
    for(int k = 0; k < row; k++){
      for(int j = 0; j < col; j++){
        float leftLimit = xPosTank - limitAdj;
        float rightLimit = xPosTank + limitAdj;
        tankArray[k][j] = new tanks(xPosTank,yPosTank,0.75,leftLimit,rightLimit);
        xPosTank = xPosTank + 96;
      }
      xPosTank = limitAdj;
      yPosTank = yPosTank + 50;
    }
    
    
    missileDrop1 = new missile_drop(tankArray[ranX][ranY].getTankX(),tankArray[ranY][ranY].getTankY());
} 

void draw(){
  
  image(background,0,0);
  scorebar();
  
  if(gameMode == true){  
    
    if(image == IMG1){
    playerList.get(0).drawRudyFwd();
    }
    else if(image == IMG2){
    playerList.get(0).drawRudyLeft();
    }
    else{
    playerList.get(0).drawRudyRight();
    }

  missileDrop1.updateMissileDrop();


//player is shot by enemy tank
 if(playerList.get(0).isShot(missileDrop1)){
     life--;
     explosion1 = new explosion(playerList.get(0).rudyX,playerList.get(0).rudyY);
     explosionList.add(explosion1);
     ranX = (int)random(row);
     ranY = (int)random(col);
     missileDrop1 = new missile_drop(tankArray[ranX][ranY].getTankX(),tankArray[ranX][ranY].getTankY());
   }
// LOSE CONDITION
 if(life == 0){
   gameMode = false;
   gameOver = true;
 }
   
 // if enemy tank missile reach bottom limit choose another tank to shot. (Only draw a tank that is currently visible)
  if(missileDrop1.reachedBottom() == true){
    if(tankArray[ranX][ranY].getVisible() == true && tankArray[ranX][ranY].getCheck() == true){
    missileDrop1 = new missile_drop(tankArray[ranX][ranY].getTankX(),tankArray[ranX][ranY].getTankY());
    }
    //draw another tank
    ranX = (int)random(row);
    ranY = (int)random(col);
  }
  
  
  // tankArray behaviours (visibility + move)
  for(int k = 0; k < row; k++){
      for(int j = 0; j < col; j++){
        if(tankArray[k][j].getVisible()){  // if tank is visible update it
        tankArray[k][j].updateTank();
        }
      }
  }
   
   
  //check if missiles reached top
  for(int i = 0; i < missileList.size(); i++){
         missileList.get(i).updateMissile(); 
         if(missileList.get(i).reachedTop()){  
           missileList.remove(i);
           missileAmount = missileAmount +1;
            missileCount = missileCount -1 ;
         }
     }
    
  for(int i = 0; i < explosionList.size(); i++){  // render explosion
    explosionList.get(i).renderExp();
  }
  

  // test 2d array hit (remove off the screen if hit) // temporary fix for removing tanks
    for(int k = 0; k < row; k++){
      for(int j = 0; j< col; j++){
        for(int i = 0; i < missileList.size(); i++){
        if(tankArray[k][j].isHit(missileList.get(i)) && tankArray[k][j].getVisible()){  // if tank is hit & visible  remove it and set visibility  to false
          tankArray[k][j].makeVisible(false);
          tankArray[k][j].makeChecked(false);
          explosion1 = new explosion(tankArray[k][j].getTankX(), tankArray[k][j].getTankY());
          explosionList.add(explosion1);
          missileList.remove(i);
          score = score + 10;
          missileCount = missileCount -1;
          tankCount = tankCount - 1;
          missileAmount = missileAmount +1;
          break;
        }
      }
    }
  }
  
// WIN CONDITION
  if(tankCount == 0){ // all tanks destroyed
    gameMode = false;
    levelFinish = true;
  }
}

// TEMPORARY END GAME SPLASH SCREEN
  if(gameMode == false){
    if(levelFinish == true){
    textSize(32);
    fill(255,255,255);
    text("Level Completed",width/2-110, height/2);
    }
  
    if(gameOver == true){
      textSize(32);
      fill(255,255,255);
      text("Game Over",width/2-110, height/2);
    }
  }
}