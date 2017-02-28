class alien{
  float alienX;
  float alienY;
  
  alien(float alienX, float alienY){
    this.alienX = alienX;
    this.alienY = alienY;
  }
  void moveAlien(){
    alienX = alienX - 1;
    if(alienX <= 0){
      alienX = alienX +1;
    }
    if(alienX >= width){
      alienX = alienX - 1;
    }
   // moving aliens left to right
   // slowly down optional
  }
  void drawAlien(){
    image(alienImage,alienX,alienY);
  }
  
  void updateAlien(){
    drawAlien();
    moveAlien();
  }
  
  
}