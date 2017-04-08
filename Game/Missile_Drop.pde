class missile_drop{
//player controlled missile 
  float dropX;
  float dropY;
  float dropAxisY = 3;
  
  missile_drop(float dropX, float dropY){
    this.dropX = dropX;
    this.dropY = dropY;
  }
  
  void updateMissileDrop(){
    moveMissileDrop();
    drawMissileDrop();
  }
  
  void moveMissileDrop(){
    dropY = dropY + dropAxisY;
   }
   
  boolean reachedBottom(){
    return dropY > 700;
  }
  
  
  void drawMissileDrop(){
   fill(255,0,0);
   rect(dropX+35,dropY+40,5,10);
  }

}