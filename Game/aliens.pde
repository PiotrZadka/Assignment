class alien{
  float alienX;
  float alienY;
  final int LEFT = 0;
  final int RIGHT = 1;
  int direction = LEFT;
  
  alien(float alienX, float alienY){
    this.alienX = alienX;
    this.alienY = alienY;
  }
  void moveAlien(){
    
    if(direction == RIGHT){
      alienX = alienX + 1;
      if(alienX + (150) >= width) {
        direction = LEFT;
      }
    }
    if(direction == LEFT){
      alienX = alienX - 1;
      if(alienX <= 0) {
        direction = RIGHT;
      }
    }
   // moving aliens left to right
   // slowly down optional
  }
  void drawAlien(){
    imageMode(LEFT);
    image(alienImage,alienX,alienY);
  }
  
  void updateAlien(){
    drawAlien();
    moveAlien();
  }
  
  
}