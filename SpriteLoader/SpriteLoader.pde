boolean movingLeft;
boolean movingRight;
boolean movingUp;
boolean movingDown;
boolean walking;
int currentStep;     //this will probably be used to see when the character needs to stop moving in each step
PImage Sprite;
PImage gold;
PImage right;
PImage left;
PImage walkingright;
PImage walkingleft;
PImage down;
PImage walkingdownLeft;
PImage walkingdownRight;
PImage up;
PImage walkingupLeft;
PImage walkingupRight;
int xpos = 0;
int ypos = 0;
boolean rightFoot = false; //these next two booleans are to ensure correct animation for walking up and down
boolean leftFoot = true;

//IMPORTANT! EACH PIXEL IS 16*16
//we need to come up with better pixel numbers for the character models
//maybe we can use tiled for this?

void setup(){
  size(814*2,582*2);
  Sprite = loadImage("FuschiaTown2.png").get(4,2,1280,1152);     //this is 1628,1084
  image(Sprite,0,0);
  PImage hero = loadImage("Gold2.png"); 
  right = hero.get(0,8,32,32);
  walkingright = hero.get(28,8,32,32);
  left = hero.get(56,8,32,32);
  walkingleft = hero.get(86,8,32,32);
  down = hero.get(114,8,32,32);
  walkingdownLeft = hero.get(146,8,32,32);
  walkingdownRight = hero.get(178,8,32,32);
  up = hero.get(212,8,32,32);
  walkingupLeft = hero.get(244,8,32,32);
  walkingupRight = hero.get(274,8,32,32);
  gold = left;
  
  image(gold,0,0);
  println((int)0.6);
}

//Gold is moving for now when keys are pressed
//going to have to control the speed of Gold's movements over here
void draw(){
  imageMode(CORNER);
  image(Sprite,0,0);
  imageMode(CORNERS);
  image(gold,xpos,ypos,xpos + 32, ypos + 32);
  cleanUpGold();
  
  //this is for walking to the right animation
  if(movingRight){
    xpos++;
    cleanUpGold();
    if(xpos % 8 >= 4){   //makes him walk smoothly
      gold = walkingright;
    }else{
      gold = right;
    }    
    if(xpos-currentStep >= 32){
      movingRight = false;
      walking = false;
    }
  }
  
  //this is for walking to the left animation
  if(movingLeft){
    xpos--;
    cleanUpGold();
    if(xpos % 8 >= 4){   //makes him walk smoothly
      gold = walkingleft;
    }else{
      gold = left;
    }    
    if(currentStep-xpos >= 32){
      movingLeft = false;
      walking = false;
    }
  }  
  
  //animation for moving up
  if(movingUp){
   ypos--;
   cleanUpGold();
   if(ypos % 8 >= 4){
     gold = walkingupRight;
   }else{
     gold = walkingupLeft;
   }
   if(currentStep-ypos >= 32){
     movingUp = false;
     walking = false;
     gold = up;
   }
  }
  
  //animation for moving down
  if(movingDown){
   ypos++;
   cleanUpGold();
   if(ypos % 8 >= 4){
     gold = walkingdownRight;
   }else{
     gold = walkingdownLeft;
   }
   if(ypos - currentStep >= 32){
     movingDown = false;
     walking = false;
     gold = down;
   }
  }
  
  cleanUpGold();
}

//this is used to move the character
void keyPressed(){
  if(key == CODED){
    if(keyCode == DOWN && !(walking)){
      movingDown = true;
      walking = true;
      currentStep = ypos;
    }
    if(keyCode == UP && !(walking)){
      movingUp = true;
      walking = true;
      currentStep = ypos;
    }
    if(keyCode == RIGHT && !(walking)){
      movingRight = true;
      walking = true;
      currentStep = xpos;
    }
    if(keyCode == LEFT && !(walking)){
      movingLeft = true;
      walking = true;
      currentStep = xpos;
    }     
  }
}

void moveRight(){
 moveRight(millis(), 0); 
}
void moveRight(int t, int count){
 if(count == 32){
 }else{
  if(millis() - t >= 200){
   println("THE PROBLEM IS HERE");
   xpos++;
   moveRight(millis(),count + 1);
  }else{
    println("NOOOO!");
    moveRight(t,count);
  }
} 
}
void keyReleased(){
  if(gold == walkingleft){
    gold = left;
  }
  if(gold == walkingright){
    gold = right;
  }
  if(gold == walkingdownRight || gold == walkingdownLeft){
    gold = down;
  }
  if(gold == walkingupLeft || gold == walkingupRight){
    gold = up;
  }
}


//using this to try and get rid of the white surrounding the character models
//need to use this to also fix up the black dots surrounding the models
void cleanUpGold(){
  loadPixels();
  Sprite.loadPixels();
  gold.loadPixels();
  color white = gold.pixels[0];
  for(int x = 0; x < 32; x ++){ 
    for(int y = 0; y < 32; y ++){
      color g = gold.pixels[x + y * 32];
      if(g == white){
        color g2 = Sprite.pixels[(x + xpos) + ((y + ypos) * 1280)];
        pixels[(x + xpos) + ((y + ypos) * 1628)] = g2;
      }
    }
  }
  updatePixels();
}

