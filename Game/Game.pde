// -- VARIABLES -- 
//Enemy "Tiger" tanks variables
  final int col = 5;  // number of columns for tankArray
  final int row = 4;
  float tankCount = col * row;
  
// Tank spawn 2D array variables
  int xPosTank = 75; // X position of array
  int yPosTank = 100; // Y possition of array
  int limitAdj = 75;  // distance between objects in array
  float leftLimit;  // left limit where a enemy tank can move
  float rightLimit;  // right limit where a enemy tank can move
  float speed = 0.75;
// Player Missile variables
  int missileCount = 0;  //control how many missiles is on the screen
  final int missileLimit = 5;   // maximum amount of missiles on the screen

// Score variables
  int level = 1;
  int score = 0;
  int missileAmount = 5;
  int life = 3;

// Player movement speed
  float moveLength = 20;

//Enemy "Tiger" tanks missile shooting variables
  int ranX = (int)random(row-1);
  int ranY = (int)random(col-1);

// Display player tank image depending which way it is facing
  final int IMG1 = 0;  //face forward
  final int IMG2 = 1;  //face left
  final int IMG3 = 2;  //face right
  int image = IMG1;

// Game states
  boolean gameMode = false;  // Controlls current state of the game
  boolean gameOver = false;  // Player reached LOSE CONDITION
  boolean levelFinish = false; // Player reched WIN CONDITION
  boolean menu = true;
  boolean gameFinish = false;

// Arrays to hold game objects
  ArrayList<explosion>explosionList = new ArrayList<explosion>();
  ArrayList<missile> missileList = new ArrayList<missile>();
  ArrayList<playerRudy>playerList = new ArrayList<playerRudy>();
  tanks [][] tankArray = new tanks [row][col];

// Background
  PImage background;

// -- END OF VARIABLES -- 

//Constructors
playerRudy player1;
explosion explosion1;
missile_drop missileDrop1;
tanks tanks1;

// Scoreboard
void scorebar(){
  fill(255,255,255);
  rect(0,0,width,30);
  textSize(20);
  fill(0,0,0);
  text("Score: "+score, 30, 23); 
  text("Level: "+level, 150,23);
  text("Missiles: "+missileAmount, width/2+40, 23);
  text("Life: "+life, width-100, 23);
}

// New level
void newLevel(int xPosTank, int yPosTank, float speed){
  // Enemy tank spawn 2D array  
    for(int k = 0; k < row; k++){
      for(int j = 0; j < col; j++){
        leftLimit = xPosTank - limitAdj;
        rightLimit = xPosTank + limitAdj;
        tankArray[k][j] = new tanks(xPosTank,yPosTank,speed,leftLimit,rightLimit);
        xPosTank = xPosTank + 96;
      }
      xPosTank = limitAdj;
      yPosTank = yPosTank + 50;
    }
}

// Resets counters and level before returning to Menu
void resetCounts(){
  score = 0;
  life = 3;
  level = 1;
  missileAmount = 5;
  missileCount = 0;
  speed = 0.75;
  newLevel(75,100,speed);
  tankCount = col * row;
  gameMode = false;
  menu = true;
}

// -- KEYBAORD CONTROLLS --
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
         image = IMG1;
     }
    }
}

// PLAYER IMAGE CONTROL
void keyReleased(){
  if(keyCode == LEFT){
    image = IMG1;
  }
  if(keyCode == RIGHT){
    image = IMG1;
  }
}

// -- END OF KEYBAORD CONTROLLS --

void setup(){
  size (600,700);
  background = loadImage("images/bg.png");
  background.resize(width,height);
  player1 = new playerRudy(width/2-25,625);
  playerList.add(player1);
 
    // Enemy tank spawn 2D array  
    newLevel(75,100,0.75);
    //Spawn missile at the begining of the game
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
  
// Player is shot by enemy tank
 if(playerList.get(0).isShot(missileDrop1)){
     life--;
     explosion1 = new explosion(playerList.get(0).rudyX-10,playerList.get(0).rudyY);
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
   
// If enemy tank missile reach bottom limit choose another tank to shot. (Only visible(available) tanks can be drawn)
  if(missileDrop1.reachedBottom() == true){
    if(tankArray[ranX][ranY].getVisible() == true && tankArray[ranX][ranY].getCheck() == true){
    missileDrop1 = new missile_drop(tankArray[ranX][ranY].getTankX(),tankArray[ranX][ranY].getTankY());
    }
    // Choose another tank
    ranX = (int)random(row);
    ranY = (int)random(col);
  }
  
// 2D Tank Array behaviour (visibility + movement)
  for(int k = 0; k < row; k++){
      for(int j = 0; j < col; j++){
        if(tankArray[k][j].getVisible()){  // if tank is visible update it
        tankArray[k][j].updateTank();
        }
      }
  }

// Game ends if enemy reaches player
  for(int k = 0; k < row; k++){
    for(int j = 0; j < col; j++){
      if(tankArray[k][j].isBottom() == true && tankArray[k][j].getVisible()){
        gameMode = false;
        gameOver = true;
      }
    }
  }
   
// Check if missiles reached top
  for(int i = 0; i < missileList.size(); i++){
         missileList.get(i).updateMissile(); 
         if(missileList.get(i).reachedTop()){  
           missileList.remove(i);
           missileAmount = missileAmount +1;
           missileCount = missileCount -1 ;
         }
     }
// Render explosion event
  for(int i = 0; i < explosionList.size(); i++){  // render explosion
    explosionList.get(i).renderExp();
  }
  

// Enemy Tank events trigger conditions
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

// -- END GAME SPLASH SCREEN --
// WIN EVENT
    if(gameMode == false){
      
// MENU SPLASH
      if(menu == true){
        textSize(32);
        fill(51,102,0);
        text("Tonk Defender",width/2-120,height/2-100);
        fill(255,255,255);
        text("Press ENTER to play",width/2-155,height/2);
        text("Press ESC to exit", width/2-130,height/2+40);
          if(keyCode == ENTER){
            gameMode = true;
            menu = false;
          }
          if(keyCode == ESC){
            exit();
          }
      }
      
// ADDING LEVELS
    if(levelFinish == true && level < 4){
    textSize(32);
    fill(255,255,255);
    text("Level Completed",width/2-140, height/2);
    text("Press ENTER to continue", width/2-190, height/2+50);
      if(keyCode == ENTER){
        //remove existing missiles & explosions
           missileList.clear();
           explosionList.clear();
        // create new level and add speed to tank
        speed = speed + 0.50;
        level = level + 1;
        missileAmount = 5;
        missileCount = 0;
        newLevel(75,100,speed);
        tankCount = col * row;
        gameMode = true;
        levelFinish = false;
      }
    }    

// LAST LEVEL EVENT
    if(levelFinish == true && level == 4){
       missileList.clear();
       explosionList.clear();
      textSize(32);
      fill(255,255,255);
      text("Game Finished",width/2-140, height/2);
      text("Your Score:"+score, width/2-140, height/2+50);
      text("Press R to return to menu", width/2-210, height/2+100);
       if(key == 'r'){
         resetCounts();
         levelFinish = false;
         menu = true;
       }
    }
    
// 0 LIFE LOSE EVENT
    if(gameOver == true){
      textSize(32);
      fill(255,255,255);
      text("Game Over",width/2-105, height/2);
      text("Your Score:"+score,width/2-115, height/2+50);
      text("Press R to return to menu", width/2-190, height/2+100);
      missileList.clear();
      explosionList.clear();
      if(key == 'r'){
         resetCounts();
         levelFinish = false;
         gameOver = false;
       }
    }
  }
}