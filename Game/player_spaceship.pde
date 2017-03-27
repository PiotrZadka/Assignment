 class playerShip{
float shipX;
float shipY;
PImage shipImage;
  
  playerShip (float shipX, float shipY){
    this.shipX = shipX;
    this.shipY = shipY;
    shipImage = loadImage("images/defender.png");
    shipImage.resize(70,70);
  }
  
  void moveShip(float axisX){
    shipX = shipX + axisX;
    if(shipX < 0){
      shipX = 0;
    }
    
    if(shipX > width - 70){
      shipX = width - 70;
    } 
  }
  
  void drawShip(){
   image(shipImage,shipX,shipY);
  }
}