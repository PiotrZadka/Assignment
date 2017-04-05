 class playerRudy{
//Rudy is a famous polish tank
float rudyX;
float rudyY;
PImage rudyfwd,rudyleft,rudyright;
int counter = 0;
  
  playerRudy (float rudyX, float rudyY){
    this.rudyX = rudyX;
    this.rudyY = rudyY;
    rudyfwd = loadImage("images/rudy/tankfwd.png");
    rudyfwd.resize(50,70);
    rudyleft = loadImage("images/rudy/tankleft.png");
    rudyleft.resize(70,50);
    rudyright = loadImage("images/rudy/tankright.png");
    rudyright.resize(70,50);
     
  }
  
  void moveRudy(float axisX){
    rudyX = rudyX + axisX;
    if(rudyX < 0){
      rudyX = 0;
    }
    
    if(rudyX > width - 70){
      rudyX = width - 70;
    } 
  }
  
  void drawRudyFwd(){
   image(rudyfwd,rudyX,rudyY);
  }
  
  void drawRudyLeft(){
   image(rudyleft,rudyX,rudyY+30);
  }
  
  void drawRudyRight(){
   image(rudyright,rudyX,rudyY+30);
  }
}