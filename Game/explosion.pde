class explosion{
  float expX;
  float expY;
  int counter = 0;
  PImage Image1, Image2, Image3,Image4,Image5,Image6,Image7,Image8,Image9,Image10,Image11,Image12,Image13,Image14;
  
explosion(float expX, float expY){
  this.expX = expX;
  this.expY = expY; 
  
  Image1 = loadImage("images/explosion/1.png");
  Image1.resize(70,70);
  Image2 = loadImage("images/explosion/2.png");
  Image2.resize(70,70);
  Image3 = loadImage("images/explosion/3.png");
  Image3.resize(70,70);
  Image4 = loadImage("images/explosion/4.png");
  Image4.resize(70,70);
  Image5 = loadImage("images/explosion/5.png");
  Image5.resize(70,70);
  Image6 = loadImage("images/explosion/6.png");
  Image6.resize(70,70); 
  Image7 = loadImage("images/explosion/7.png");
  Image7.resize(70,70); 
  Image8 = loadImage("images/explosion/8.png");
  Image8.resize(70,70); 
  Image9 = loadImage("images/explosion/9.png");
  Image9.resize(70,70); 
  Image10 = loadImage("images/explosion/10.png");
  Image10.resize(70,70); 
  Image11 = loadImage("images/explosion/11.png");
  Image11.resize(70,70); 
  Image12 = loadImage("images/explosion/12.png");
  Image12.resize(70,70); 
  Image13 = loadImage("images/explosion/13.png");
  Image13.resize(70,70); 
  Image14 = loadImage("images/explosion/14.png");
  Image14.resize(70,70); 

}

  void renderExp(){
    if(counter >=0 && counter <=5){
    image(Image1,expX,expY);
    }
    if(counter > 5 && counter <=10){
    image(Image2,expX,expY);
    }
    if(counter > 10 && counter <=15){
    image(Image3,expX,expY);
    }
    if(counter > 15 && counter <=20){
    image(Image4,expX,expY);
    }
    if(counter > 20 && counter <=25){
    image(Image5,expX,expY);
    }
    if(counter > 25 && counter <=30){
    image(Image6,expX,expY);
    }
    if(counter > 30 && counter <=35){
    image(Image7,expX,expY);
    }
    if(counter > 35 && counter <=40){
    image(Image8,expX,expY);
    }
    if(counter > 40 && counter <=45){
    image(Image9,expX,expY);
    }
    if(counter > 45 && counter <=50){
    image(Image10,expX,expY);
    }
    if(counter > 50 && counter <=55){
    image(Image11,expX,expY);
    }
    if(counter > 55 && counter <= 60){
    image(Image12,expX,expY);
    }
    if(counter > 60 && counter <=65){
    image(Image13,expX,expY);
    }
    if(counter > 65 && counter <=70){
    image(Image14,expX,expY);
    }
    counter++;
  }
}