class explosion{
  float expX;
  float expY;
  int counter = 0;
  
explosion(float expX, float expY){
  this.expX = expX;
  this.expY = expY;
}
  void drawExplosion(){
    
   if(counter >= 0 && counter <=10){
   image(explosionImage0,expX,expY);
   }
   else if(counter > 10 && counter <=20){
   image(explosionImage1,expX,expY);
   }
   else if(counter > 20 && counter <=25){
   image(explosionImage2,expX,expY);
   }
   else{
   counter = 0;
   }
   counter = counter + 1;
  }
}