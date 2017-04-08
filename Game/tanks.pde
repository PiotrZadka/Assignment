class tanks{
//enemies German tanks "Tiger"
  float tankX;
  float tankY;
  float leftLimit;
  float rightLimit;
  float tankSpeed;
  int counter = 0;
  final int LEFT = 0;
  final int RIGHT = 1;
  int direction = LEFT;
  boolean visible = true;
  PImage tiger1,tiger2,tiger3,tiger4;
  
  tanks(float tankX, float tankY, float tankSpeed, float leftLimit, float rightLimit){
    this.tankX = tankX;
    this.tankY = tankY;
    this.leftLimit = leftLimit;
    this.rightLimit = rightLimit;
    this.tankSpeed = tankSpeed;
    tiger1 = loadImage("images/tiger/tigerright1.png");
    tiger1.resize(70,40);
    tiger2 = loadImage("images/tiger/tigerright2.png");
    tiger2.resize(70,40);
    tiger3 = loadImage("images/tiger/tigerleft1.png");
    tiger3.resize(70,40);
    tiger4 = loadImage("images/tiger/tigerleft2.png");
    tiger4.resize(70,40);
  }
  
  boolean isHit(missile missile){
    if (missile!=null){
      if (abs(this.tankX+35-missile.x) < 35 &&   // no clue what i did here but it works lol
      abs(this.tankY+20-missile.y) < 20){
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
  
  float getTankX(){
    return tankX;
  }
  
  float getTankY(){
    return tankY;
  }
  
  void updateTank(){
    movetank();
    if(direction == LEFT){
    drawTankLeft();
    }
    else if(direction == RIGHT){
      drawTankRight();
    }
  } 
  
  void movetank(){
    if(direction == LEFT){
      tankX = tankX - tankSpeed;
      if(tankX <= leftLimit){
        direction = RIGHT;
      }
    }
    if(direction == RIGHT){
      tankX = tankX + tankSpeed;
      if(tankX >= rightLimit){
        direction = LEFT;
      }
    }
  }
  void drawTankRight(){
    if(counter > 0 && counter <=30){
    image(tiger1,tankX,tankY);
    }
    else if(counter > 30 && counter <=60){
    image(tiger2,tankX,tankY);
    }
    else if(counter > 60 && counter <=90){
    image(tiger1,tankX,tankY);
    }
    else if(counter > 90 && counter <=120){
    image(tiger2,tankX,tankY);
    }
    else{
      counter = 0;
    }
    counter++;
  }
  
  void drawTankLeft(){
    if(counter > 0 && counter <=30){
    image(tiger3,tankX,tankY);
    }
    else if(counter > 30 && counter <=60){
    image(tiger4,tankX,tankY);
    }
    else if(counter > 60 && counter <=90){
    image(tiger3,tankX,tankY);
    }
    else if(counter > 90 && counter <=120){
    image(tiger4,tankX,tankY);
    }
    else{
      counter = 0;
    }
    counter++;
  }
}