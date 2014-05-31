boolean movingLeft;
boolean movingRight;
boolean movingUp;
boolean movingDown;
boolean walking;
boolean shiftingRight = false;
boolean shiftingLeft = false;
int currentStep;     //this will probably be used to see when the character needs to stop moving in each step
Map current;
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
  size(640,576);        
  //size(1280,1152);
  maps = new MapLoader();
  current = maps.getNewBark();
  //current = maps.getRoute29();
  map = current.getMap();
  currentMap = map.get(160,96,width,width);
  xpos = -256;
  ypos = 32;
  image(currentMap,0,0);
  PImage hero = loadImage("Gold.png");
  //loading all of the models 
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
  
  //cleaning up each image
  right = cleanUpImage(right);
  walkingright = cleanUpImage(walkingright);
  left = cleanUpImage(left);
  walkingleft = cleanUpImage(walkingleft);
  down = cleanUpImage(down);
  walkingdownLeft = cleanUpImage(walkingdownLeft);
  walkingdownRight = cleanUpImage(walkingdownRight);
  up = cleanUpImage(up);
  walkingupLeft = cleanUpImage(walkingupLeft);
  walkingupRight = cleanUpImage(walkingupRight);
  gold = up;
  
  image(gold,256,256);
}

//the map now moves as it should instead of gold!!!
void draw(){
  loadPixels();
  //println("X: " + xpos + ", Y: " + ypos);
  
  setNewMap();
  loadBorders();
  
  imageMode(CORNER);
  currentMap = map.get(xpos,ypos,width,height);
  image(currentMap,0,0);
  imageMode(CORNER);
  image(gold,256,256);
  
  walkingAnimation();
}

//this is used to move the character

void keyPressed(){
  if(key == CODED){
    //working over here
    if(keyCode == DOWN && !(walking)){
      if((gold == down || gold == walkingdownRight || gold == walkingdownLeft) && current.checkValid(xpos+272,ypos+304)){
        movingDown = true;
        walking = true;
        currentStep = ypos;
      }else{
        gold = down;
      }
    }
    if(keyCode == UP && !(walking)){
      if((gold == up || gold == walkingupRight || gold == walkingupLeft) && current.checkValid(xpos+272,ypos+240)){
        movingUp = true;
        walking = true;
        currentStep = ypos;
      }else{
        gold = up;
      }      
    }
    if(keyCode == RIGHT && !(walking)){
      if((gold == right || gold == walkingright) && current.checkValid(xpos+304,ypos+272)){
        movingRight = true;
        walking = true;
        currentStep = xpos;
      }else{
        gold = right;
      }      
    }
    if(keyCode == LEFT && !(walking)){
      if((gold == left || gold == walkingleft) && current.checkValid(xpos+240,ypos+272)){
        movingLeft = true;
        walking = true;
        currentStep = xpos;
      }else{
        gold = left;
      }
    }     
  }
}

void walkingAnimation(){
  if(movingRight){
    xpos++;
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
    xpos--;
    if(abs(xpos) % 8 >= 4){   //makes him walk smoothly
      gold = walkingleft;
    }else{
      gold = left;
    }    
    if(currentStep-xpos >= 32){
      movingLeft = false;
      walking = false;
      gold = left;
    }
  }  
  
  //animation for moving up
  if(movingUp){
   ypos--;
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
}

void loadBorders(){
  if(xpos < 0){
    fill(0);
    rect(0,0,abs(xpos),height);
    shiftLeft = abs(xpos);
    if(current.hasWestMap()){
      leftMap = current.getWestMap().getMap();
      currentLeftMap = leftMap.get(leftMap.width - abs(xpos), ypos, abs(xpos), height);
      image(currentLeftMap,0,0);
    }
  }
  
  if(xpos + width > map.width){
    fill(0);
    int num = width - ((xpos + width) - map.width);
    rect(num,0,width-num,height);
    
    if(current.hasEastMap()){
      rightMap = current.getEastMap().getMap();
      currentRightMap = rightMap.get(0, ypos, (xpos + width) - map.width, height);
      image(currentRightMap,map.width-xpos,0);
    }
  }
  
  if(ypos < 0){
    fill(0);
    rect(0,0,width,abs(ypos));
  }
  
  if(ypos + height > map.height){
    //println("Ypos" + ypos + " ,map height: " + map.height + " ,height: " + height);
    int num = height - ((ypos + height) - map.height);
    fill(0);
    rect(0,num,width,height-num); 
  } 
}

void setNewMap(){
  //switch maps when entering right map
  if(xpos + 256 + 32 > map.width && current.hasEastMap() && !shiftingLeft){
    //println("Lets see if it works");
    leftMap = map;
    map = rightMap;
    current = current.getEastMap();
    xpos = -288;
    currentStep = xpos;
  }
  
  //set shiftingright 
  if((gold == walkingright || gold == right) && xpos >= -288 && xpos < -256){
    //println("Shifting right is true");
    shiftingRight = true;
  }
  if(xpos==-256){
    shiftingRight = false;
    //println("Now false");
  }
  
  //switch maps when entering left map
  if(xpos * -1 > 256 && current.hasWestMap() && !shiftingRight){
    //println("Or not");
    rightMap = map;
    map = leftMap;
    current = current.getWestMap();
    xpos = leftMap.width - abs(xpos)+1; 
    currentStep = xpos;
  }
  
  //set shiftingleft
  if((gold == walkingleft || gold == left) && map.width-xpos-256 >= 0 && map.width-xpos-256<32){
    //println("Shifting left is true");
    shiftingLeft = true;
  }
  if(map.width-xpos-256==32){
    shiftingLeft = false;
    //println("Now false");
  } 
}

PImage cleanUpImage(PImage p){
 PImage newImg = createImage(p.width,p.height,ARGB);
 newImg.loadPixels();
 p.loadPixels();
 color white = p.pixels[0];
  //to get rid of black dots
  
  for(int y = 0; y < 32; y ++){
    color g = p.pixels[31 + y * 32];
    color g2 = p.pixels[30 + y * 32];
    if(!(g == white)){
      p.pixels[31 + y * 32] = white;
    }
    if(!(g2 == white)){
      p.pixels[30 + y * 32] = white;
    }
  }
  
  //make it transparent
  for(int x = 0; x < 32; x ++){ 
    for(int y = 0; y < 32; y ++){
      color g = p.pixels[x + y * 32];
      if(g == white){
        newImg.pixels[x + y * 32] = color(0,0,0,0);
      }else{
        newImg.pixels[x + y * 32] = p.pixels[x + y * 32];
      }
    }
  }
  
  newImg.updatePixels();
  return newImg; 
}


