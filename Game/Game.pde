boolean movingLeft;
boolean movingRight;
boolean movingUp;
boolean movingDown;
boolean walking;
boolean shiftingRight = false;
boolean shiftingLeft = false;
int currentStep;     //this will probably be used to see when the character needs to stop moving in each step

boolean startGame = true;
boolean traveling;
boolean loadBattle;
boolean startBattle;
boolean startText;
boolean movingPlayer;
boolean openPokemon;
boolean mainMenu;
boolean attackMenu;
boolean friendlyAttacking;
boolean enemyAttacking;
boolean friendlyMiss;
boolean enemyMiss;
boolean battleText;
boolean enemyDead;
boolean startMenu;
boolean inBag;
boolean potionUsed;
boolean justUsedPotion;

PImage menu;
PImage bagMenu;

//battle variables
PImage bar;
PImage enemyBar;
PImage pokeFS;

PImage arrow;
PImage downArrow;
PImage redArrow;
int arrXPos = 80;
int arrYPos = 336;

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
int enemyXPos = -96;
int enemyYPos = 2;
int count;
int count2;

Pokemon friendly;
Pokemon enemy;
PImage  friendlyBack;
PImage enemyFront;
Moves friendlyAttack;
Moves enemyAttack;

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
Trainer player;
Trainer enemy1;

int xpos = 0;
int ypos = 0;
int shiftLeft = 0;
int shiftRight = 0;
MapLoader maps;
MovesLoader moves;
TrainerLoader trainer;
Pokedex dex;

//IMPORTANT! EACH PIXEL IS 32*32
//we need to come up with better pixel numbers for the character models
//maybe we can use tiled for this?

void setup(){
  size(640,576); 
  noStroke();  
  frameRate(80);
  maps = new MapLoader();
  moves = new MovesLoader();
  trainer = new TrainerLoader();
  current = maps.getNewBark();
  map = current.getMap();
  xpos = 0;
  ypos = -128;
  currentMap = map.get(xpos,ypos,width,width);
  image(currentMap,0,0);
  
  dex = new Pokedex();
  
  //enemy1 = new Trainer("Valkyrie", xpos+32, ypos); 
  //PImage trainer = loadImage("trainers.jpg");
  //enemy1.setFront(trainer.get(49,94,32,32));
  
  
  player = new Trainer("Gold", 256,256);
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
  gold = down;
  
  //loading battle screen stuff
  f = createFont("Pokemon GB",16,true);
  textFont(f,25);
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
  redArrow = loadImage("RedArrow.png");
  //redArrow = cleanUpImage2(redArrow);
  bar = loadImage("PokemonBar.png");
  bar = cleanUpImage2(bar);
  enemyBar = loadImage("EnemyBar.png");
  enemyBar = cleanUpImage2(enemyBar);
  attack = loadImage("Tackle.png");
  attack = cleanUpImage2(attack);
  
  menu = loadImage("StartMenu.png");
  bagMenu = loadImage("BagScreen.png");
  
  image(gold,256,256);
  
 //image(enemy1.getFront(), xpos+32, ypos);
}

void draw(){ 
  //(80,336)
  //(286,336);
  //(484,336);
  if(startGame){
    fill(255);
    rect(0,0,width,height);
    image(downArrow,arrXPos,arrYPos);
    image(loadImage("TotodileFront.png"),-2,90);
    image(loadImage("ChikoritaFront.png"),195,86);
    image(loadImage("CyndaquilFront.png"),392,83);
    fill(0);
    text("CHOOSE YOUR STARTER!",83,76);
    //println(mouseX + ", " + mouseY); 
  }
  

  
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
  if(startMenu){
    setNewMap();
    loadBorders();
    
    imageMode(CORNER);
    currentMap = map.get(xpos,ypos,width,height);
    image(currentMap,0,0);
    //image(enemy1.getFront(), 160-xpos, 160-ypos);
    imageMode(CORNER);
    image(gold,256,256);
    
    walkingAnimation();
    image(menu,454,1);
    textFont(f,19);
    text("Pokemon",490,52);
    text("Pack",490,74);
    image(arrow,mouseX,mouseY);
    println(mouseX + ", " + mouseY); 
  }
  if(loadBattle){
    loadUp();
    enemyYPos = 2;
  }
  if(startBattle){
    fill(255);
    noTint();
    rect(0,0,width,height);
    image(textBox,0,height-textBox.height);
    tint(100);
    image(enemyFront,enemyXPos,2);
    rect(enemyXPos-2,0,15,230);
    rect(enemyXPos-2,0,224,10);
    rect(enemyXPos+210,0,15,230);
    image(goldBack,trainerXPos,trainerYPos);
    if(trainerXPos > 36){
      trainerXPos = trainerXPos - 8;
    }else{
      noTint();
      startBattle = false;
      startText = true;
    }
    if(enemyXPos < 416){
      enemyXPos = enemyXPos + 8;
    }
  }
  if(startText){
    fill(255);
    rect(0,0,width,height);
    image(textBox,0,height-textBox.height);
    image(enemyFront,enemyXPos,2);
    rect(enemyXPos-2,0,15,230);
    rect(enemyXPos-2,0,224,10);
    rect(enemyXPos+210,0,15,230);
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
    image(enemyFront,enemyXPos,2);
    rect(enemyXPos-2,0,15,230);
    rect(enemyXPos-2,0,224,10);
    rect(enemyXPos+210,0,15,230);
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
    image(enemyFront,enemyXPos,2);
    rect(enemyXPos-2,0,15,230);
    rect(enemyXPos-2,0,224,10);
    rect(enemyXPos+210,0,15,230);
    fill(0);  
    openUp();
  }
  if(mainMenu){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(battleBox,0,height-battleBox.height);
    image(arrow,arrXPos,arrYPos);
    image(friendlyBack, 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    enemy.getHealthBarColor();
    rect(108,92,enemy.getHealthBar(),10);
    friendly.getHealthBarColor();
    rect(416,304,friendly.getHealthBar(),10);
    fill(0);
    text(":L" + enemy.getLevel()+"",192,80);
    text(":L" + friendly.getLevel()+"",502,292);
    text(enemy.getName(),12,46);
    text(friendly.getName(),348,256);
    text(friendly.getHealth()+"",384,356);
    text(friendly.getMaxHealth()+"",492,356);
    text("/",453,356);
    text("Fight",328,468);
    text("Pack",328,532);
    text("PKMN",517,468);
    text("Run",517,532);
    fill(#12A2FF);
    rect(608,371,friendly.getExpBar(),8);
  }
  //328,468
  //328,532
  //517,468
  //517,532
  if(inBag){
    image(bagMenu,0,0); 
    fill(0);
    text("Potion",250,80);
    text("Poke Balls", 250,140);
    text("x" + player.getNumPotions(),560,90);
    fill(255);
    text("ITEMS",22,288);
    image(redArrow,arrXPos,arrYPos);
    println(mouseX + ", " + mouseY);
  }
  if(potionUsed){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(textBox,0,height-textBox.height);
    image(friendlyBack, 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    //fill(#47C448);
    enemy.getHealthBarColor();
    rect(108,92,enemy.getHealthBar(),10);
    friendly.getHealthBarColor();
    rect(416,304,friendly.getHealthBar(),10);
    fill(0);
    text(":L" + enemy.getLevel()+"",192,80);
    text(":L" + friendly.getLevel()+"",502,292);
    text(enemy.getName(),12,46);
    text(friendly.getName(),348,256);
    text(friendly.getHealth()+"",384,356);
    text(friendly.getMaxHealth()+"",492,356);
    text("/",453,356);
    fill(#12A2FF);
    rect(608,371,friendly.getExpBar(),8);
    fill(0);
    text(friendly.getName() + " used a",36,462);
    text("Potion!",36,494);
    if(count > 50){
      drawDownArrow(); 
    }
    if(count < 100){
      count ++;
    } 
  }
  if(attackMenu){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(attackBox,0,height-attackBox.height);
    image(friendlyBack, 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    //fill(#47C448);
    enemy.getHealthBarColor();
    rect(108,92,enemy.getHealthBar(),10);
    friendly.getHealthBarColor();
    rect(416,304,friendly.getHealthBar(),10);
    fill(0);
    text(":L" + enemy.getLevel()+"",192,80);
    text(":L" + friendly.getLevel()+"",502,292);
    text(enemy.getName(),12,46);
    text(friendly.getName(),348,256);
    text(friendly.getHealth()+"",384,356);
    text(friendly.getMaxHealth()+"",492,356);
    text("/",453,356);
    text(friendly.getMoves(0).toString(),196,454);
    image(arrow,arrXPos,arrYPos);
    fill(#12A2FF);
    rect(608,371,friendly.getExpBar(),8);
  }
  if(friendlyAttacking){    
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(textBox,0,height-textBox.height);
    image(friendlyBack, 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    //fill(#47C448);
    enemy.getHealthBarColor();
    rect(108,92,enemy.getHealthBar(),10);
    friendly.getHealthBarColor();
    rect(416,304,friendly.getHealthBar(),10);
    fill(0);
    text(":L" + enemy.getLevel()+"",192,80);
    text(":L" + friendly.getLevel()+"",502,292);
    text(enemy.getName(),12,46);
    text(friendly.getName(),348,256);
    text(friendly.getHealth()+"",384,356);
    text(friendly.getMaxHealth()+"",492,356);
    text("/",453,356);
    text(friendly.getName() + " used", 36, 462);
    text(friendlyAttack.toString(),36,494);
    fill(#12A2FF);
    rect(608,371,friendly.getExpBar(),8);
    if(!friendlyAttack.animate(count,444,92)){
      count ++;
    }else{
      friendlyAttack.lowerHP(enemy);
      friendlyAttacking = false;
      count = 0;
      if(friendly.getSpeed() >= enemy.getSpeed()){
        enemyAttacking = true;
      }else{
        mainMenu = true;
        arrXPos = 288;
        arrYPos = 432; 
      }
    }
    if(enemy.getHealth() == 0){
      mainMenu = false;
      enemyAttacking = false;
      enemyDead = true; 
    }
  }
  if(enemyAttacking){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(textBox,0,height-textBox.height);
    image(friendlyBack, 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    //fill(#47C448);
    enemy.getHealthBarColor();
    rect(108,92,enemy.getHealthBar(),10);
    friendly.getHealthBarColor();
    rect(416,304,friendly.getHealthBar(),10);
    fill(0);
    text(":L" + enemy.getLevel()+"",192,80);
    text(":L" + friendly.getLevel()+"",502,292);
    text(enemy.getName(),12,46);
    text(friendly.getName(),348,256);
    text(friendly.getHealth()+"",384,356);
    text(friendly.getMaxHealth()+"",492,356);
    text("/",453,356);
    text(enemy.getName() + " used", 36, 462);
    text(enemyAttack.toString(),36,494);
    fill(#12A2FF);
    rect(608,371,friendly.getExpBar(),8);
    if(!enemyAttack.animate(count,64,266)){
      count ++;
    }else{
      enemyAttack.lowerHP(friendly);
      enemyAttacking = false;
      count = 0;
      if(friendly.getSpeed() < enemy.getSpeed() && justUsedPotion == false){
        friendlyAttacking = true;
      }else{
        justUsedPotion = false;
        mainMenu = true;
        arrXPos = 288;
        arrYPos = 432; 
      }
    }
  }
  if(friendlyMiss){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(textBox,0,height-textBox.height);
    image(friendlyBack, 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    //fill(#47C448);
    enemy.getHealthBarColor();
    rect(108,92,enemy.getHealthBar(),10);
    friendly.getHealthBarColor();
    rect(416,304,friendly.getHealthBar(),10);
    fill(0);
    text(":L" + enemy.getLevel()+"",192,80);
    text(":L" + friendly.getLevel()+"",502,292);
    text(enemy.getName(),12,46);
    text(friendly.getName(),348,256);
    text(friendly.getHealth()+"",384,356);
    text(friendly.getMaxHealth()+"",492,356);
    text("/",453,356);
    text(friendly.getName() + " used", 36, 462);
    text(friendlyAttack.toString(),36,494);
    fill(#12A2FF);
    rect(608,371,friendly.getExpBar(),8);
    if(count >= 50){
      fill(0);
      text("But it missed!", 36, 526);
      drawDownArrow();
    }
    if(count < 100){
      count++;
    }
  }
  if(enemyMiss){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(textBox,0,height-textBox.height);
    image(friendlyBack, 36, 196);
    image(enemyFront,416,2);
    image(bar,316,224);
    image(enemyBar,6,6);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    //fill(#47C448);
    enemy.getHealthBarColor();
    rect(108,92,enemy.getHealthBar(),10);
    friendly.getHealthBarColor();
    rect(416,304,friendly.getHealthBar(),10);
    fill(0);
    text(":L" + enemy.getLevel()+"",192,80);
    text(":L" + friendly.getLevel()+"",502,292);
    text(enemy.getName(),12,46);
    text(friendly.getName(),348,256);
    text(friendly.getHealth()+"",384,356);
    text(friendly.getMaxHealth()+"",492,356);
    text("/",453,356);
    text(enemy.getName() + " used", 36, 462);
    text(enemyAttack.toString(),36,494);
    fill(#12A2FF);
    rect(608,371,friendly.getExpBar(),8);
    if(count >= 50){
      fill(0);
      text("But it missed!", 36, 526);
      drawDownArrow();
    }
    if(count < 100){
      count++;
    }
  }
  if(enemyDead){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(textBox,0,height-textBox.height);
    image(friendlyBack, 36, 196);
    image(enemyFront,416,enemyYPos);
    rect(416,228,224,224);
    image(bar,316,224);
    image(enemyBar,6,6);
    image(textBox,0,height-textBox.height);
    rect(414,0,10,224);
    rect(414,0,224,10);
    rect(337,1,10,150);
    rect(312,216,10,170);
    //fill(#47C448);
    enemy.getHealthBarColor();
    rect(108,92,enemy.getHealthBar(),10);
    friendly.getHealthBarColor();
    rect(416,304,friendly.getHealthBar(),10);
    fill(0);
    text(":L" + enemy.getLevel()+"",192,80);
    text(":L" + friendly.getLevel()+"",502,292);
    text(enemy.getName(),12,46);
    text(friendly.getName(),348,256);
    text(friendly.getHealth()+"",384,356);
    text(friendly.getMaxHealth()+"",492,356);
    text("/",453,356);
    fill(#12A2FF);
    rect(608,371,friendly.getExpBar(),8);
    if(enemyYPos > 113){
      fill(0);
      drawDownArrow();
      text("Enemy " + enemy.getName() + " fainted!",36,462); 
      text(friendly.getName() + " gained " + enemy.getExp(),36,494);
      text("EXP points.",36,526);
    }
    if(enemyYPos < 228){
      enemyYPos = enemyYPos + 8; 
    }
  }
  
}

//this is used to move the character
//286,484
//336 y
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
     if(inBag){
       if(arrYPos > 50){
         arrYPos = arrYPos - 60;
       }
     }
   }
   if(keyCode == RIGHT){
     if(startGame){
       if(arrXPos == 286){
        arrXPos = 484; 
       }
       if(arrXPos == 80){
        arrXPos = 286;
       } 
     }
     if(mainMenu){
       arrXPos = 484;
     }
   }
   if(keyCode == LEFT){
     if(startGame){
       if(arrXPos == 286){
        arrXPos = 80;
       }
       if(arrXPos == 484){
        arrXPos = 286;
       } 
     }
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
     if(inBag){
       if(arrYPos < 110){
         arrYPos = arrYPos + 60;
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
   if(enemyDead){
     friendly.addExp(enemy.getExp());
     enemyDead = false;
     traveling = true; 
   }
    
   if(attackMenu && arrXPos == 156){
     friendlyAttack = friendly.getMoves(0);
     enemyAttack = enemy.getRandomMove();
     attackMenu = false;
     if(friendly.getSpeed() < enemy.getSpeed()){
       if(enemyAttack.canHit(friendly)){
         enemyAttacking = true;
       }else{
         enemyMiss = true;
       }
     }else{
       if(friendlyAttack.canHit(enemy)){
         friendlyAttacking = true; 
       }else{
         friendlyMiss = true;
       }
     }
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
   if(inBag){
    if(arrYPos == 50 && player.getNumPotions() > 0){
      inBag = false;
      potionUsed = true;
    } 
   }
   if(mainMenu && arrXPos == 288 && arrYPos == 494){
     mainMenu = false;
     inBag = true; 
     arrXPos = 196;
     arrYPos = 50; 
   }
   if(startGame){
     
     if(arrXPos == 80){
       Pokemon totodile = dex.getTotodile();
       totodile.setLevel(5);
       totodile.addMove(moves.getTackle());
       player.addPokemon(totodile); 
       startGame = false;
       traveling = true;
       
     }
     if(arrXPos == 286){
       Pokemon chikorita = dex.getChikorita();
       chikorita.setLevel(5);
       chikorita.addMove(moves.getTackle());
       player.addPokemon(chikorita);
       startGame = false;
       traveling = true;
     }  
     if(arrXPos == 484){
       Pokemon cyndaquil = dex.getCyndaquil();
       cyndaquil.setLevel(5);
       cyndaquil.addMove(moves.getTackle());
       player.addPokemon(cyndaquil);
       startGame = false;
       traveling = true;
     }
     
   }
   
   if(startText){
      //println("Goodbye");
      startText = false;
      movingPlayer = true;
   } 
   
   if(friendlyMiss && count >=50){
     friendlyMiss = false;
      count = 0;
      if(friendly.getSpeed() >= enemy.getSpeed()){
        if(enemyAttack.canHit(friendly)){
           enemyAttacking = true;
        }else{
           enemyMiss = true; 
        }
      }else{
        mainMenu = true;
        arrXPos = 288;
        arrYPos = 432; 
      }  
   }
   
   if(enemyMiss && count >= 50){
      count = 0;
      enemyMiss = false;
      if(friendly.getSpeed() < enemy.getSpeed() && justUsedPotion == false){
        if(friendlyAttack.canHit(enemy)){
           friendlyAttacking = true;
        }else{
           friendlyMiss = true; 
        }
      }else{
        justUsedPotion = false;
        mainMenu = true;
        arrXPos = 288;
        arrYPos = 432; 
      }  
   }
   if(potionUsed && count >= 50){
      potionUsed = false;
      justUsedPotion = true;
      count = 0;
      player.usePotion(friendly);
      if(enemyAttack.canHit(friendly)){
        enemyAttacking = true;
      }else{
        enemyMiss = true; 
      }
   }
    

 }
 if(key == 'z'){
   if(attackMenu){
     attackMenu = false;
     mainMenu = true;
     arrXPos = 288;
     arrYPos = 432;
   } 
   if(startMenu){
     textFont(f,25);
     traveling = true;
     startMenu = false; 
   }
   if(inBag){
     inBag = false;
     mainMenu = true; 
     arrXPos = 288;
     arrYPos = 432; 
   }
 }
 
 if(key == 'm'){
   if(traveling){
     traveling = false;
     startMenu = true;
   } 
 }
 if(key == 'r'){
   println("Hello");
   fill(0);
   for(int i = 0; i <width; i = i + 50 ){
     line(i,0,i,height);
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
        friendly = player.getPokemon().get(0);
        friendlyBack = friendly.getBack();
        friendlyBack = cleanUpImage2(friendlyBack);
        trainerXPos = width;
        trainerYPos = 196;
        enemyXPos = -96;
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
        friendly = player.getPokemon().get(0);
        friendlyBack = friendly.getBack();
        friendlyBack = cleanUpImage2(friendlyBack);
        trainerXPos = width;
        trainerYPos = 196;
        enemyXPos = -96;
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
        friendly = player.getPokemon().get(0);
        friendlyBack = friendly.getBack();
        friendlyBack = cleanUpImage2(friendlyBack);
        trainerXPos = width;
        trainerYPos = 196;
        enemyXPos = -96;
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
        friendly = player.getPokemon().get(0);
        friendlyBack = friendly.getBack();
        friendlyBack = cleanUpImage2(friendlyBack);
        trainerXPos = width;
        trainerYPos = 196;
        enemyXPos = -96;
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
  if(count%60 > 40){
     tint(100,0,0);
  }else{
    if(count%60 > 20){
      noTint(); 
    }else{
      if(count%60 > 0){
        tint(100); 
      }
    }
  }
  if(count == 120){
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
  if(count2 < 30){
   image(downArrow, 548,532);
  }
  count2++;
  if(count2 == 60){
   count2 = 0;
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


