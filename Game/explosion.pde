class explosion{
  float expX;
  float expY;
  int counter = 0;
  PImage explosionImage, explosionImage2, explosionImage3;
  
explosion(float expX, float expY){
  this.expX = expX;
  this.expY = expY; 
  explosionImage = loadImage("images/explosion.png");
  explosionImage.resize(70,70);
  explosionImage2 = loadImage("images/explosion2.png");
  explosionImage2.resize(70,70);
  explosionImage3 = loadImage("images/explosion3.png");
  explosionImage3.resize(70,70);
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