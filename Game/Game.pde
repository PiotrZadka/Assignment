PImage background;
PImage shipImage;
PImage alienImage;

boolean shoot = false;

int count = 0;  // reload counter - keep track on how many bullets there is on the screen at a time 
<<<<<<< HEAD
int col = 6;
int row = 3;

ArrayList<missile> missileList = new ArrayList<missile>();
ArrayList<alien> alienList = new ArrayList<alien>();
alien [][] alienArray = new alien [row][col];  // 2d array of temporary aliens



ArrayList<missile> missileList = new ArrayList<missile>();
ArrayList<alien> alienList = new ArrayList<alien>();
>>>>>>> origin/master

playerShip player1;


void keyPressed(){
  float moveLength = 20;
  if(keyCode == LEFT){
    player1.moveShip(-moveLength);  // move object left
  }
  if(keyCode == RIGHT){
    player1.moveShip(moveLength);   // move object right
  } 
  if(key == ' '){
   if(count < 3){
       missileList.add(new missile(player1.shipX+32,player1.shipY-10));
       count = count + 1;
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
  alienImage.resize(70,40);
  player1 = new playerShip(265,630);
  
  // spawn aliens
  float startAlien = 25;
  for(int i = 0; i < 6; i++){
    float leftLimit = startAlien - 25;  // comment out to stop aliens
    float rightLimit = startAlien + 25;
    //alien(alienX,alienY,alienSpeed,leftLimit,rightLimit) REFERANCE
    alienList.add(new alien(startAlien,100,0.5,leftLimit,rightLimit));
    startAlien = startAlien + 96;

    
    // TEST 2d array arlien create
    int s1 = 25;
    int s2 = 300;
    int val = 96;
    
    for(int k = 0; k < row; k++){
      for(int j = 0; j < col; j++){
        alienArray[k][j] = new alien(s1,s2,0,0,0);
        s1 = s1+val;
      }
      s1 = 25;
      s2 = s2 + 50;
    }
  }
}

void draw(){
  image(background,0,0);
  player1.drawShip();
  //test 2d spawn/move
  for(int k = 0; k < row; k++){
      for(int j = 0; j < col; j++){
        alienArray[k][j].updateAlien();
      }
  }
  
  
  // show/move spawned aliens
  for(int k = 0; k < alienList.size(); k++){
    alienList.get(k).updateAlien();
  }
  //check if missiles reached top
  for(int i = 0; i < missileList.size(); i++){
         missileList.get(i).updateMissile(); 
         if(missileList.get(i).reachedTop()){  
           missileList.remove(i);
            count = count -1 ;
         }
     }
     

     //test array size

     //test

     println(count);
     println("Size: "+missileList.size());
       
  //check for each missile if any aliens is being hit if so remove it from arraylist.
  for(int i = 0; i < missileList.size(); i++){
    for(int j = 0; j < alienList.size(); j++){
      if(alienList.get(j).isHit(missileList.get(i))){  // crash is being triggered here sometimes
        alienList.remove(j);  //remove alien from array
        missileList.remove(i);
        count = count - 1;     // add count to reload counter
        break;  // should prevent from crashes

      }
    }
  }
  // test 2d array hit (remove off the screen if hit) // temporary fix for removing aliens
    for(int j = 0; j < row; j++){
      for(int k = 0; k < col; k++){
        for(int i = 0; i < missileList.size(); i++){
        if(alienArray[j][k].isHit(missileList.get(i))){
          alienArray[j][k] = new alien(-50,-50,0,0,0); // No clue how to remove array element without changing it size so just move if off the screen lol
          missileList.remove(i);
          count = count -1;
          break;
        }
      }
    }
  }
}