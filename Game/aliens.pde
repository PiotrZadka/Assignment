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

  boolean isHit(missile missile)
  {
    if (missile!=null)
    {
    if (abs(this.alienX-missile.x) < 50 &&
    abs(this.alienY-missile.y) < 50)
    return true;
    }
  return false;
  }
  
  void updateAlien(){
    drawAlien();
    moveAlien();
  }
  
  
}