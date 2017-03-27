class alien{
  float alienX;
  float alienY;
  float leftLimit;
  float rightLimit;
  float alienSpeed;
  float range = 50;
  int counter = 0;
  final int LEFT = 0;
  final int RIGHT = 1;
  int direction = LEFT;
  boolean visible = true;
  PImage alien,alien1,alien2,alien3,alien4,alien5,alien6,alien7,alien8;
  
  alien(float alienX, float alienY, float alienSpeed, float leftLimit, float rightLimit){
    this.alienX = alienX;
    this.alienY = alienY;
    this.leftLimit = leftLimit;
    this.rightLimit = rightLimit;
    this.alienSpeed = alienSpeed;
    alien1 = loadImage("images/alien1.png");
    alien1.resize(70,40);
    alien2 = loadImage("images/alien2.png");
    alien2.resize(70,40);
    alien3 = loadImage("images/alien3.png");
    alien3.resize(70,40);
    alien4 = loadImage("images/alien4.png");
    alien4.resize(70,40);
    alien5 = loadImage("images/alien5.png");
    alien5.resize(70,40);
    alien6 = loadImage("images/alien6.png");
    alien6.resize(70,40);
    alien7 = loadImage("images/alien7.png");
    alien7.resize(70,40);
    alien8 = loadImage("images/alien8.png");
    alien8.resize(70,40);
  }
  
  boolean isHit(missile missile){
    if (missile!=null){
      if (abs(this.alienX+35-missile.x) < 35 &&   // no clue what i did here but it works lol
      abs(this.alienY+20-missile.y) < 20){
      return true;
      }
    }
  return false;
  }
  
  boolean getVisible(){  // return current status of visibility
    return visible;
  }
  
  void makeVisible(boolean visStatus){  // set the current status of visibility 
    visible = visStatus;
  }
  
  float getAlienX(){
    return alienX;
  }
  
  float getAlienY(){
    return alienY;
  }
  
  void updateAlien(){
    moveAlien();
    drawAlien();
  } 
  
  void moveAlien(){
    if(direction == RIGHT){
      alienX = alienX + alienSpeed;
      if(alienX >= rightLimit){
        direction = LEFT;
      }
    }
    
    if(direction == LEFT){
      alienX = alienX - alienSpeed;
      if(alienX <= leftLimit){
        direction = RIGHT;
      }
    }
  }
  
  void drawAlien(){
    if(counter > 0 && counter <=30){
    image(alien1,alienX,alienY);
    }
    else if(counter > 30 && counter <=60){
    image(alien2,alienX,alienY);
    }
    else if(counter > 60 && counter <=90){
    image(alien3,alienX,alienY);
    }
    else if(counter > 90 && counter <=120){
    image(alien4,alienX,alienY);
    }
    else if(counter > 120 && counter <=150){
    image(alien5,alienX,alienY);
    }
    else if(counter > 150 && counter <=180){
    image(alien6,alienX,alienY);
    }
    else if(counter > 180 && counter <=210){
    image(alien7,alienX,alienY);
    }
    else if(counter > 210 && counter <=240){
    image(alien8,alienX,alienY);
    }
    else{
      counter = 0;
    }
    counter++;
  }
}