class missile{
//player controlled missile 
  float x;
  float y;
  float axisY = 3;
  
  missile(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void updateMissile(){
    moveMissile();
    drawMissile();
  }
  
  void moveMissile(){
    y = y - axisY;
   }
   
  boolean reachedTop(){
    return y < 31;
  }
  
  
  void drawMissile(){
   fill(255,0,0);
   rect(x,y,5,10);
  }

}