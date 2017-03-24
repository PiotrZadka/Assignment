class explosion{
  float expX;
  float expY;
  int counter = 0;
  
  
explosion(float expX, float expY){
  this.expX = expX;
  this.expY = expY;
  
}
  void renderExp(){
    if(counter >=0 && counter <=30){
    image(explosionImage,expX,expY);
    }
    if(counter > 30 && counter <=60){
    image(explosionImage2,expX,expY);
    }
    if(counter > 60 && counter <=90){
    image(explosionImage3,expX,expY);
    }
    counter++;
  }
}