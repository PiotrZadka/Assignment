class explosion{
  float expX;
  float expY;

explosion(float expX, float expY){
  this.expX = expX;
  this.expY = expY;
}
  void drawExplosion(){
   image(explosionImage,expX,expY);
  }
}