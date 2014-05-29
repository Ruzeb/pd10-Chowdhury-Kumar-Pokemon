boolean movingLeft;
boolean movingRight;
boolean movingUp;
boolean movingDown;
boolean walking;
boolean shiftingRight = false;
boolean shiftingLeft = false;
boolean diffCleanUp;
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
int xpos;
int ypos;
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
  current = maps.getNewBark();
  //current = maps.getRoute29();
  map = current.getMap();
  xpos = -128;
  //xpos = 1632;
  //ypos = 640;
  ypos = 32;
  currentMap = map.get(xpos,ypos,width,width);
  image(currentMap,0,0);
  PImage hero = loadImage("Gold.png");
 //I was up to here in doubling stuff 
  right = hero.get(0,8,32,32);
  right = cleanUpImage(right);
  walkingright = hero.get(28,8,32,32);
  walkingright = cleanUpImage(walkingright);
  left = hero.get(56,8,32,32);
  left = cleanUpImage(left);
  walkingleft = hero.get(86,8,32,32);
  walkingleft = cleanUpImage(walkingleft);
  down = hero.get(114,8,32,32);
  down = cleanUpImage(down);
  walkingdownLeft = hero.get(146,8,32,32);
  walkingdownLeft = cleanUpImage(walkingdownLeft);
  walkingdownRight = hero.get(178,8,32,32);
  walkingdownRight = cleanUpImage(walkingdownRight);
  up = hero.get(212,8,32,32);
  up = cleanUpImage(up);
  walkingupLeft = hero.get(244,8,32,32);
  walkingupLeft = cleanUpImage(walkingupLeft);
  walkingupRight = hero.get(274,8,32,32);
  walkingupRight = cleanUpImage(walkingupRight);
  gold = up;
  
  image(gold,256,256);
}

//the map now moves as it should instead of gold!!!
void draw(){
  loadPixels();
  //this part isnt working properly
  //transitions work when each snippet of code is used by itself but not together
  
  
  if(xpos + 256 + 32 > map.width && current.hasEastMap() && !shiftingLeft){
    println("Lets see if it works");
    leftMap = map;
    map = rightMap;
    current = current.getEastMap();
    //xpos = map.width - (xpos + 256 +32);
    xpos = -288;
    currentStep = xpos;
  }
  
  //working over here now!
  if((gold == walkingright || gold == right) && map.width-xpos-256 >= 0 && map.width-xpos-256<32){
    println("Shifting left is true");
    shiftingLeft = true;
  }
  if(map.width-xpos-256==32){
    shiftingLeft = false;
    println("Now false");
  }
  
  
  if(xpos * -1 > 256 && current.hasWestMap() && !shiftingRight){
    println("Or not");
    rightMap = map;
    map = leftMap;
    current = current.getWestMap();
    xpos = leftMap.width - abs(xpos)+1; 
    currentStep = xpos;
    if(!(currentRightMap == null)){
      //cleanUpGold(b);
      //diffCleanUp = true;
    }
    //diffCleanUp = true;
    println(map.width - xpos - 256);
  }
  if((gold == walkingleft || gold == left) && map.width-xpos-256 >= 0 && map.width-xpos-256<32){
    println("Shifting left is true");
    shiftingLeft = true;
  }
  if(map.width-xpos-256==32){
    shiftingLeft = false;
    println("Now false");
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
    //println("This is the xpos: " + abs(xpos) + ", and this is the currentwidth: " + currentMap.width);
    cleanUpGold();
    if(abs(xpos) % 8 >= 4){   //makes him walk smoothly
      gold = walkingright;
      //cleanUpGold();
    }else{
      gold = right;
      //cleanUpGold();
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
    //println("This is the xpos: " + abs(xpos) + ", and this is the currentwidth: " + currentMap.width);
    cleanUpGold();
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
    
    for(int x = 0; x < abs(xpos); x ++){
      for(int y = 0; y < height; y++){
        pixels[x + y * width] = color(0);
      }
    }
    
    updatePixels();
    //println("Got here 1" + abs(xpos));
    //leftMap = maps.getRoute29().getMap();
    if(current.hasWestMap()){
      leftMap = current.getWestMap().getMap();
      currentLeftMap = leftMap.get(leftMap.width - abs(xpos), ypos, abs(xpos), height);
      image(currentLeftMap,0,0);
    }
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
  
  if(xpos + width > map.width){
   
    for(int x = width - ((xpos + width) - map.width); x < width; x ++){
      for(int y = 0; y < height; y++){
        pixels[x + y * width] = color(0);
      }
    }
    
    updatePixels();
    if(current.hasEastMap()){
      rightMap = current.getEastMap().getMap();
      currentRightMap = rightMap.get(0, ypos, (xpos + width) - map.width, height);
      image(currentRightMap,map.width-xpos,0);
    }
  }
  /*
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

PImage cleanUpImage(PImage p){
 PImage newImg = createImage(p.width,p.height,ARGB);
 newImg.loadPixels();
 p.loadPixels();
 color white = p.pixels[0];
  //to get of black dots
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

void cleanUpGold(){
  
  loadPixels();
  currentMap.loadPixels();
  gold.loadPixels();
  color white = gold.pixels[0];
  /*
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
  */
  gold.updatePixels();
  PImage newImg = createImage(gold.width,gold.height,ARGB);
  newImg.loadPixels();
  for(int x = 0; x < 32; x ++){ 
    /*
    for(int y = 0; y < 32; y ++){
      color g = gold.pixels[x + y * 32];
      if(g == white){
        
        color g2 = currentMap.pixels[(x + 256) + ((y + 256) * currentMap.width)];
        pixels[(x + 256) + ((y + 256) * width)] = g2;
        
        newImg.pixels[x + y * 32] = color(0,0,0,0);
      }else{
        newImg.pixels[x + y * 32] = gold.pixels[x + y * 32];
      }
    }
    */
  }
  newImg.updatePixels();
  //gold = newImg;
  //need extra cleanup between maps
  
  int test = map.width - xpos - 256;
  //println("Test: " + test);
  if(!(currentRightMap == null) && test > 0 && test < 32){
    /*
    println("Test: " + test);
    diffCleanUp = false;
    //println("Lets see if it works");
    currentRightMap.loadPixels();
    for(int x = test; x < 32; x ++){ 
      
      for(int y = 0; y < 32; y ++){
        color g = gold.pixels[x + y * 32];
        if(g == white){
          color g2 = currentRightMap.pixels[(x + 256 - test) + ((y + 256 - test) * currentRightMap.width)];
          pixels[(x + 256) + ((y + 256) * width)] = g2;
        }
      }
      
    }
    */
    /*
    for(int x = 0; x < test; x ++){ 
      for(int y = 0; y < 32; y ++){
        color g = gold.pixels[x + y * 32];
        if(g == white){
          color g2 = currentMap.pixels[(x + 256) + ((y + 256) * currentRightMap.width)];
          pixels[(x + 256) + ((y + 256) * width)] = g2;
        }
      }
    }
    */
  }
  updatePixels();
}
