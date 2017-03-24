class explosion{
  float expX;
  float expY;
<<<<<<< Updated upstream
  int count = 0;
  
=======
<<<<<<< HEAD
  int counter = 0;
  int count = 0;

=======
  int count = 0;
  
>>>>>>> origin/master
>>>>>>> Stashed changes
explosion(float expX, float expY){
  this.expX = expX;
  this.expY = expY; 
}
<<<<<<< HEAD

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
=======
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
<<<<<<< Updated upstream
=======
>>>>>>> origin/master
>>>>>>> Stashed changes
  }
}