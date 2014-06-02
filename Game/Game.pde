boolean movingLeft;
boolean movingRight;
boolean movingUp;
boolean movingDown;
boolean walking;
boolean shiftingRight = false;
boolean shiftingLeft = false;
int currentStep;     //this will probably be used to see when the character needs to stop moving in each step

boolean traveling = true;
boolean loadBattle;
boolean startBattle;
boolean startText;
boolean movingPlayer;
boolean openPokemon;
boolean mainMenu;
boolean attackMenu;
boolean playerAttacking;
boolean battleText;
boolean endBattle;

//battle variables
PImage bar;
PImage enemyBar;
PImage pokeFS;

PImage arrow;
PImage downArrow;
int arrXPos = 288;
int arrYPos = 432;

PImage stage1;
PImage stage2;
PImage stage3;

PFont f;
PImage battleBox;
PImage textBox;
PImage attackBox;
PImage attack;
int trainerXPos;
int trainerYPos = 196;
int enemyPos = -96;
int count;

Pokemon charizard;
Pokemon enemy;
PImage enemyFront;

//end here!
Map current;
PImage map;
PImage currentMap;
PImage leftMap;
PImage currentLeftMap;
PImage rightMap;
PImage currentRightMap;

PImage gold;
PImage goldBack;
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
Trainer enemy1;

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
  noStroke();  
  
  maps = new MapLoader();
  current = maps.getNewBark();
  map = current.getMap();
  xpos = -256;
  ypos = 32;
  currentMap = map.get(xpos,ypos,width,width);
  image(currentMap,0,0);
  
  
  enemy1 = new Trainer("Valkyrie", xpos+32, ypos); 
  PImage trainer = loadImage("trainers.jpg");
  enemy1.setFront(trainer.get(49,94,32,32));
  
  PImage hero = loadImage("Gold.png");
  //loading all of the models 
  goldBack = loadImage("GoldBack.png");
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
  goldBack = cleanUpImage2(goldBack);
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
  
  //loading battle screen stuff
  f = createFont("Arial",16,true);
  textFont(f,36);
  stage1 = loadImage("PokeStage1.png");
  stage2 = loadImage("PokeStage2.png");
  stage3 = loadImage("PokeStage3.png");
  stage1 = cleanUpImage2(stage1);
  stage2 = cleanUpImage2(stage2);
  stage3 = cleanUpImage2(stage3);
  trainerXPos = width;
  
  battleBox = loadImage("BattleBox.png");
  battleBox = battleBox.get(0,0,battleBox.width - 10,battleBox.height);
  textBox = loadImage("TextBox.png");
  attackBox = loadImage("AttackBox.png");
  arrow = loadImage("Arrow.png");
  downArrow = loadImage("DownArrow.png");
  bar = loadImage("PokemonBar.png");
  bar = cleanUpImage2(bar);
  enemyBar = loadImage("EnemyBar.png");
  enemyBar = cleanUpImage2(enemyBar);
  attack = loadImage("Tackle.png");
  attack = cleanUpImage2(attack);
  
  //creating a pokemon for testing
  charizard = new Pokemon(100,"Charizard");
  charizard.setLevel(36);
  //charizard.setBack(loadImage("CharizardBack.png"));
  
  image(gold,256,256);
 //image(enemy1.getFront(), xpos+32, ypos);
}

void draw(){ 
  if(traveling){
    
    setNewMap();
    loadBorders();
    
    imageMode(CORNER);
    currentMap = map.get(xpos,ypos,width,height);
    image(currentMap,0,0);
    //image(enemy1.getFront(), 160-xpos, 160-ypos);
    imageMode(CORNER);
    image(gold,256,256);
    walkingAnimation();
  }
  if(loadBattle){
    loadUp();
  }
  if(startBattle){
    fill(255);
    noTint();
    rect(0,0,width,height);
    image(textBox,0,height-textBox.height);
    tint(100);
    image(enemyFront,enemyPos,2);
    rect(enemyPos-2,0,15,230);
    rect(enemyPos-2,0,224,10);
    rect(enemyPos+210,0,15,230);
    image(goldBack,trainerXPos,trainerYPos);
    if(trainerXPos > 36){
      trainerXPos = trainerXPos - 8;
    }else{
      noTint();
      startBattle = false;
      startText = true;
    }
    if(enemyPos < 416){
      enemyPos = enemyPos + 8;
    }
  }
  if(startText){
    fill(255);
    rect(0,0,width,height);
    image(textBox,0,height-textBox.height);
    image(enemyFront,enemyPos,2);
    rect(enemyPos-2,0,15,230);
    rect(enemyPos-2,0,224,10);
    rect(enemyPos+210,0,15,230);
    image(goldBack,trainerXPos,196);
    fill(0);  
    text("Wild " + enemy.getName() + " appeared!",36,462);
    //image(downArrow,548,532);
    drawDownArrow();
  }
  if(movingPlayer){
    fill(255);
    rect(0,0,width,height);
    image(textBox,0,height-textBox.height);
    image(enemyFront,enemyPos,2);
    rect(enemyPos-2,0,15,230);
    rect(enemyPos-2,0,224,10);
    rect(enemyPos+210,0,15,230);
    image(goldBack,trainerXPos,trainerYPos);
    trainerXPos = trainerXPos - 16;
    if(trainerXPos <= -211){
      count = 0;
      movingPlayer = false;
      openPokemon = true;
    }
  }
  if(openPokemon){
    fill(255);
    rect(0,0,width,height);
    image(textBox,0,height-textBox.height);
    image(enemyFront,enemyPos,2);
    rect(enemyPos-2,0,15,230);
    rect(enemyPos-2,0,224,10);
    rect(enemyPos+210,0,15,230);
    fill(0);  
    openUp();
  }
  if(mainMenu){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(battleBox,0,height-battleBox.height);
    image(arrow,arrXPos,arrYPos);
    image(charizard.getBack(), 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    fill(#47C448);
    rect(108,92,192,10);
    rect(416,304,192,10);
    fill(0);
    text(enemy.getLevel()+"",212,80);
    text(charizard.getLevel()+"",522,292);
    text(enemy.getName(),12,46);
    text(charizard.getName(),348,256);
    text(charizard.getHealth()+"",394,356);
    text(charizard.getHealth()+"",512,356);
  }
  if(attackMenu){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(attackBox,0,height-attackBox.height);
    image(charizard.getBack(), 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    fill(#47C448);
    rect(108,92,192,10);
    rect(416,304,192,10);
    fill(0);
    text(enemy.getLevel()+"",212,80);
    text(charizard.getLevel()+"",522,292);
    text(enemy.getName(),12,46);
    text(charizard.getName(),348,256);
    text(charizard.getHealth()+"",394,356);
    text(charizard.getHealth()+"",512,356);
    image(arrow,arrXPos,arrYPos);
  }
  if(playerAttacking){    
    tackle();
  }
  if(battleText){
     
  }
}

//this is used to move the character

void keyPressed(){
  if(key == CODED){
   if(keyCode == UP){
     if(mainMenu){
       arrYPos = 432;
     }
     if(attackMenu){
       if(arrYPos > 419){
         arrYPos = arrYPos - 30;
       } 
     }
   }
   if(keyCode == RIGHT){
     if(mainMenu){
       arrXPos = 484;
     }
   }
   if(keyCode == LEFT){
     if(mainMenu){
       arrXPos = 288;
     }
   }   
   if(keyCode == DOWN){
     if(mainMenu){
       arrYPos = 494;
     }
     if(attackMenu){
       if(arrYPos < 509){
         arrYPos = arrYPos + 30;
       } 
     }
   }
    //working over here
    if(keyCode == DOWN && !(walking) && traveling){
      if((gold == down || gold == walkingdownRight || gold == walkingdownLeft) && current.checkValid(xpos+272,ypos+304)){
        movingDown = true;
        walking = true;
        currentStep = ypos;
      }else{
        gold = down;
      }
    }
    if(keyCode == UP && !(walking) && traveling){
      if((gold == up || gold == walkingupRight || gold == walkingupLeft) && current.checkValid(xpos+272,ypos+240)){
        movingUp = true;
        walking = true;
        currentStep = ypos;
      }else{
        gold = up;
      }      
    }
    if(keyCode == RIGHT && !(walking) && traveling){
      if((gold == right || gold == walkingright) && current.checkValid(xpos+304,ypos+272)){
        movingRight = true;
        walking = true;
        currentStep = xpos;
      }else{
        gold = right;
      }      
    }
    if(keyCode == LEFT && !(walking) && traveling){
      if((gold == left || gold == walkingleft) && current.checkValid(xpos+240,ypos+272)){
        movingLeft = true;
        walking = true;
        currentStep = xpos;
      }else{
        gold = left;
      }
    }    
  }
  if(key == 'x'){
   if(startText){
      //println("Goodbye");
      startText = false;
      movingPlayer = true;
   } 
   if(attackMenu && arrXPos == 156){
     attackMenu = false;
     playerAttacking = true;
   } 
   if(mainMenu && arrXPos == 288 && arrYPos == 432){
     mainMenu = false;
     attackMenu = true;
     arrXPos = 156;
     arrYPos = 419;
   }
   if(mainMenu && arrXPos == 484 && arrYPos == 494){
     traveling = true;
     mainMenu = false;
   }  
 }
 if(key == 'z'){
   if(attackMenu){
     attackMenu = false;
     mainMenu = true;
     arrXPos = 288;
     arrYPos = 432;
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
      if(current.checkBattle(xpos+272,ypos+272)){
        traveling = false; 
        loadBattle = true;
        enemy = current.getRandPokemon();
        enemyFront = enemy.getFront();
        enemyFront = cleanUpImage2(enemyFront);
        trainerXPos = width;
        trainerYPos = 196;
        enemyPos = -96;
      }
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
      if(current.checkBattle(xpos+272,ypos+272)){
        traveling = false; 
        loadBattle = true;
        enemy = current.getRandPokemon();
        enemyFront = enemy.getFront();
        enemyFront = cleanUpImage2(enemyFront);
        trainerXPos = width;
        trainerYPos = 196;
        enemyPos = -96;
      }
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
     if(current.checkBattle(xpos+272,ypos+272)){
        traveling = false; 
        loadBattle = true;
        enemy = current.getRandPokemon();
        enemyFront = enemy.getFront();
        enemyFront = cleanUpImage2(enemyFront);
        trainerXPos = width;
        trainerYPos = 196;
        enemyPos = -96;
     }
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
     if(current.checkBattle(xpos+272,ypos+272)){
        traveling = false; 
        loadBattle = true;
        enemy = current.getRandPokemon();
        enemyFront = enemy.getFront();
        enemyFront = cleanUpImage2(enemyFront);
        trainerXPos = width;
        trainerYPos = 196;
        enemyPos = -96;
     }
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

void loadUp(){
  if(count%30 > 20){
     tint(100,0,0);
  }else{
    if(count%30 > 10){
      noTint(); 
    }else{
      if(count%30 > 0){
        tint(100); 
      }
    }
  }
  if(count == 60){
    loadBattle = false;
    startBattle = true;
    count = 0;
  }
  setNewMap();
  loadBorders();
  imageMode(CORNER);
  currentMap = map.get(xpos,ypos,width,height);
  image(currentMap,0,0);
  //image(enemy1.getFront(), 160-xpos, 160-ypos);
  imageMode(CORNER);
  noTint();
  image(gold,256,256);
  walkingAnimation(); 
  count ++;
}

void drawDownArrow(){
  if(count < 30){
   image(downArrow, 548,532);
  }
  count++;
  if(count == 60){
   count = 0;
  }  
}

void openUp(){
  if(count == 30){
    openPokemon = false;
    mainMenu = true;
    arrXPos = 288;
    arrYPos = 432;
    count = 0;
    
  }
  if(count > 20){
    image(stage1,54,234);
  }else{
    if(count > 10){
      image(stage3,90,265);
    }else{
      if(count > 0){
        image(stage3,98,255); 
      }      
    }
  }  
  count++;
}

void tackle(){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(textBox,0,height-textBox.height);
    image(charizard.getBack(), 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    fill(#47C448);
    rect(108,92,192,10);
    rect(416,304,192,10);
    fill(0);
    text(enemy.getLevel()+"",212,80);
    text(charizard.getLevel()+"",522,292);
    text(enemy.getName(),12,46);
    text(charizard.getName(),348,256);
    text(charizard.getHealth()+"",394,356);
    text(charizard.getHealth()+"",512,356);
    text(charizard.getName() + " used tackle!", 36, 462);
    if(count > 10 && count < 30){
      image(attack,444,92);  
    }
    count++;
    if(count == 60){
      playerAttacking = false;
      count = 0;
      mainMenu = true; 
      arrXPos = 288;
      arrYPos = 432;
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

PImage cleanUpImage2(PImage p){
 PImage newImg = createImage(p.width,p.height,ARGB);
 newImg.loadPixels();
 p.loadPixels();
 color white = p.get(10,10);
 color white2 = p.get(4,4);
 color white3 = p.get(3,3);
 color white4 = p.get(9,9);
 color white5 = p.get(2,2);
  //make it transparent
  for(int x = 0; x < p.width; x ++){
    for(int y = 0; y < p.height; y ++){
      color g = p.pixels[x + y * p.width];
      if(g == white || g == white2 || g == white3 || g == white4 || g == white5){
        //println("hello");
        p.pixels[x + y * p.width] = color(255);
      }
    }
  }
  //newImg.updatePixels();
  
  for(int x = 0; x < p.width; x ++){ 
    for(int y = 0; y < p.height; y ++){
      color g = p.pixels[x + y * p.width];
      if(g == color(255)){
        newImg.pixels[x + y * p.width] = color(0,0,0,0);
      }else{
        newImg.pixels[x + y * p.width] = p.pixels[x + y * p.width];
      }
    }
  }
  
  p.updatePixels();
  newImg.updatePixels();
  return newImg; 
}


