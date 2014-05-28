boolean movingLeft;
boolean movingRight;
boolean movingUp;
boolean movingDown;
boolean walking;
int currentStep;     //this will probably be used to see when the character needs to stop moving in each step
PImage map;
PImage currentMap;
PImage leftMap;
PImage currentLeftMap;
PImage rightMap;
PImage currentRightMap;
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
int shiftLeft = 0;
int shiftRight = 0;
MapLoader maps;

//IMPORTANT! EACH PIXEL IS 32*32
//we need to come up with better pixel numbers for the character models
//maybe we can use tiled for this?

void setup(){
  size(640,572);        
  //size(1280,1152);
  maps = new MapLoader();
  //map = maps.getFuschia().getMap();
  //map = maps.getPallet().getMap();
  map = maps.getNewBark().getMap();
  //map = maps.getRoute29().getMap();
  currentMap = map.get(320,320,width,width);
  xpos = 320;
  ypos = 320;
  image(currentMap,0,0);
  PImage hero = loadImage("Gold.png");
 //I was up to here in doubling stuff 
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
  gold = up;
  
  image(gold,256,256);
}

//the map now moves as it should instead of gold!!!
void draw(){
  loadPixels();
  if(xpos * -1 > 256){
    println("Lets see if it works");
    rightMap = map;
    map = leftMap;
    xpos = leftMap.width - abs(xpos); 
    currentStep = xpos;
  }
  imageMode(CORNER);
  currentMap = map.get(xpos,ypos,width,height);
  image(currentMap,0,0);
  //image(map,0,0);
  imageMode(CORNER);
  //image(gold,xpos,ypos,xpos + 32, ypos + 32);
  image(gold,256,256);
  cleanUpGold();
  
  //this is for walking to the right animation
  if(movingRight){
    xpos++;
    cleanUpGold();
    if(abs(xpos) % 8 >= 4){   //makes him walk smoothly
      gold = walkingright;
    }else{
      gold = right;
    }    
    if(xpos-currentStep >= 32){
      movingRight = false;
      walking = false;
      gold = right;
    }
  }
  
  //this is for walking to the left animation
  if(movingLeft){
    println("help" + xpos);
    xpos--;
    cleanUpGold();
    if(abs(xpos) % 8 >= 4){   //makes him walk smoothly
      gold = walkingleft;
    }else{
      gold = left;
    }    
    if(currentStep-abs(xpos) >= 32){
      movingLeft = false;
      walking = false;
      gold = left;
    }
  }  
  
  //animation for moving up
  if(movingUp){
   ypos--;
   cleanUpGold();
   if(abs(ypos) % 8 >= 4){
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
   if(abs(ypos) % 8 >= 4){
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
  
  //these bits of code is to make parts of map outside the town BLACK
  if(xpos < 0){
    /*
    for(int x = 0; x < abs(xpos); x ++){
      for(int y = 0; y < height; y++){
        pixels[x + y * width] = color(0);
      }
    }
    */
    //println("Got here 1" + abs(xpos));
    shiftLeft = abs(xpos);
    leftMap = maps.getRoute29().getMap();
    currentLeftMap = leftMap.get(leftMap.width - abs(xpos), ypos, abs(xpos), height);
    image(currentLeftMap,0,0);
    //fill(240);
    //rect(0,0,100,100);
    //image(leftMap,0,0);
    //HAVING PROBLEMS HERE FROM SWITCHING MAPS
    /*
    if(abs(xpos) == 160){
      println("Lets see if it works");
      currentRightMap = currentMap;
      currentMap = currentLeftMap;
      xpos = leftMap.width - abs(xpos); 
    }
    */
  }
  /*
  if(xpos + width > map.width){
    println("Got here 2");
    for(int x = width - ((xpos + width) - map.width); x < width; x ++){
      for(int y = 0; y < height; y++){
        pixels[x + y * width] = color(0);
      }
    }
  }
  
  if(ypos < 0){
    println("Got here 2");
    for(int x = 0; x < width; x ++){
      for(int y = 0; y < abs(ypos); y++){
        pixels[x + y * width] = color(0);
      }
    }
  }
  if(ypos + height > map.height){
    println("Got here 15");
    for(int x = 0; x < width; x ++){
      for(int y = height - ((ypos + height) - map.height); y < height; y++){
        pixels[x + y * width] = color(0);
      }
    }
  }
  */
  //updatePixels();
  cleanUpGold();
}

//this is used to move the character

void keyPressed(){
  if(key == CODED){
    if(keyCode == DOWN && !(walking)){
      if(gold == down || gold == walkingdownRight || gold == walkingdownLeft){
        movingDown = true;
        walking = true;
        currentStep = ypos;
      }else{
        gold = down;
      }
    }
    if(keyCode == UP && !(walking)){
      if(gold == up || gold == walkingupRight || gold == walkingupLeft){
        movingUp = true;
        walking = true;
        currentStep = ypos;
      }else{
        gold = up;
      }      
    }
    if(keyCode == RIGHT && !(walking)){
      if(gold == right || gold == walkingright){
        movingRight = true;
        walking = true;
        currentStep = xpos;
      }else{
        gold = right;
      }      
    }
    if(keyCode == LEFT && !(walking)){
      if(gold == left || gold == walkingleft){
        movingLeft = true;
        walking = true;
        currentStep = xpos;
      }else{
        gold = left;
      }
    }     
  }
}

//dont need this for now I think
/*
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
*/

//this method cleans up the character models
//by removing the white space around them
//and also the dots from neighboring sprites in the "Gold.png"
void cleanUpGold(){
  loadPixels();
  currentMap.loadPixels();
  gold.loadPixels();
  color white = gold.pixels[0];
  for(int y = 0; y < 32; y ++){
    color g = gold.pixels[31 + y * 32];
    color g2 = gold.pixels[30 + y * 32];
    if(!(g == white)){
      gold.pixels[31 + y * 32] = white;
    }
    if(!(g2 == white)){
      gold.pixels[30 + y * 32] = white;
    }
  }
  gold.updatePixels();
  for(int x = 0; x < 32; x ++){ 
    for(int y = 0; y < 32; y ++){
      color g = gold.pixels[x + y * 32];
      if(g == white){
        color g2 = currentMap.pixels[(x + 256) + ((y + 256) * width)];
        pixels[(x + 256) + ((y + 256) * width)] = g2;
      }
    }
  }
  updatePixels();
}
