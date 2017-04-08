PImage background;

int col = 5;  // number of columns for tankArray
int row = 4;
float tankCount = col * row;
int missileCount = 0;  // reload counter - keep track on how many bullets there is on the screen at a time 
int score = 0;
int missileAmount = 3;
int life = 3;


int randomTank = (int)random(tankCount);
int countR = 0;
// state of draw playerRudy image
final int IMG1 = 0;  //face forward
final int IMG2 = 1;  //face left
final int IMG3 = 2;  //face right
int image = IMG1;

//arrays
ArrayList<explosion>explosionList = new ArrayList<explosion>();
ArrayList<missile> missileList = new ArrayList<missile>();
ArrayList<missile_drop> missileDrop = new ArrayList<missile_drop>();
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
float moveLength = 20;
  if(keyCode == LEFT){
    player1.moveRudy(-moveLength);  // move object left
    image = IMG2;
    
  }
  if(keyCode == RIGHT){
    player1.moveRudy(moveLength);   // move object right
    image = IMG3;
  } 
  if(key == ' '){
   if(missileCount < 3){
       missileList.add(new missile(player1.rudyX+22,player1.rudyY-10));
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
} 


void draw(){
  image(background,0,0);
  scorebar();
  
  if(image == IMG1){
  player1.drawRudyFwd();
  }
  else if(image == IMG2){
  player1.drawRudyLeft();
  }
  else{
  player1.drawRudyRight();
  }
  
  
  
  
  // tankArray behaviours (visibility + move)
  for(int k = 0; k < row; k++){
      for(int j = 0; j < col; j++){
        if(tankArray[k][j].getVisible()){  // if tank is visible update it
        tankArray[k][j].updateTank();
        }
      }
  }
  
  //add enemy missiles to array and spawn it
  for(int k = 0; k < row; k++){
    for(int j = 0; j < col; j++){
      missileDrop1 = new missile_drop(tankArray[k][j].getTankX(), tankArray[k][j].getTankY());
      missileDrop.add(missileDrop1);
      }
    }
  
  missileDrop.get(randomTank).updateMissileDrop();

  
  for(int i = 0; i < missileDrop.size(); i++){
    if(missileDrop.get(i).reachedBottom()){
      missileDrop.remove(i);
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

  // end splash screen
  if(tankCount == 0){
    textSize(32);
    fill(255,255,255);
    text("Level Completed",width/2-125, height/2); 
  }
}