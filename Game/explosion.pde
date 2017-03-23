class explosion{
  float expX;
  float expY;
  int count = 0;
  
explosion(float expX, float expY){
  this.expX = expX;
  this.expY = expY;
}
  void drawExplosion(){
   if(count <= 60){
   image(explosionImage0,expX,expY);
   }
   if(count > 60 && count <= 120){
   image(explosionImage1,expX,expY);
   }
   if(count > 120 && count <= 190){
   image(explosionImage2,expX,expY);
   }
  }
}