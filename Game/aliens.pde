class alien{
  float alienX;
  float alienY;
  float leftLimit;
  float rightLimit;
  float alienSpeed;
  float range = 50;
  final int LEFT = 0;
  final int RIGHT = 1;
  int direction = LEFT;
  boolean visible = true;
  
  alien(float alienX, float alienY, float alienSpeed, float leftLimit, float rightLimit){
    this.alienX = alienX;
    this.alienY = alienY;
    this.leftLimit = leftLimit;
    this.rightLimit = rightLimit;
    this.alienSpeed = alienSpeed;
  }
  
  void moveAlien(){
    if(direction == RIGHT){
      alienX = alienX + alienSpeed;
      if(alienX >= rightLimit) {
        direction = LEFT;
      }
    }
    
    if(direction == LEFT){
      alienX = alienX - alienSpeed;
      if(alienX <= leftLimit) {
        direction = RIGHT;
      }
    }
  }
  void drawAlien(){
    imageMode(LEFT);
    image(alienImage,alienX,alienY);
  }

  boolean isHit(missile missile){
    if (missile!=null)
    {
    if (abs(this.alienX+35-missile.x) < 35 &&   // no clue what i did here but it works lol
    abs(this.alienY+20-missile.y) < 20)
    return true;
    }
  return false;
  }
  
  void makeVisible(boolean visStatus){  // set the current status of visibility 
    visible = visStatus;
  }
  
  boolean getVisible(){  // return current status of visibility
    return visible;
  }
  
  float getAlienX(){
    return alienX;
  }
  
  float getAlienY(){
    return alienY;
  }
  
  void updateAlien(){
    drawAlien();
    moveAlien();
  }

 
  
}