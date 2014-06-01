PImage pokemon;
PImage bar;
PImage enemyBar;
PImage pokeFS;
PImage trainerS;
PImage gold;

PImage img;
PImage img2;
PImage img3;
PImage img4;

PImage stage1;
PImage stage2;
PImage stage3;

PImage arrow;
PImage downArrow;
int arrXPos = 288;
int arrYPos = 432;

PImage battleBox;
PImage textBox;
PImage attackBox;
PFont f;
int trainerXPos;
int trainerYPos = 196;
int enemyPos = -96;
boolean startBattle = true;
boolean startText;
boolean movingPlayer;
boolean openPokemon;
boolean mainMenu;
boolean attackMenu;
boolean endBattle;
int count;
void setup(){
  //size(1000,1000);
  size(640,576);
  background(255);
  noStroke();
  trainerXPos = width;
  
  f = createFont("Arial",16,true);
  textFont(f,36);
  
  stage1 = loadImage("PokeStage1.png");
  stage2 = loadImage("PokeStage2.png");
  stage3 = loadImage("PokeStage3.png");
  stage1 = cleanUpImage(stage1);
  stage2 = cleanUpImage(stage2);
  stage3 = cleanUpImage(stage3);
  
  pokeFS = loadImage("PokemonFrontSprites.png");
  pokemon = loadImage("Charizard.png");
  gold = loadImage("GoldBack.png");
  gold = cleanUpImage(gold);
  //trainerS = loadImage("TrainerSprites.png"); 
  battleBox = loadImage("BattleBox.png");
  battleBox = battleBox.get(0,0,battleBox.width - 10,battleBox.height);
  textBox = loadImage("TextBox.png");
  attackBox = loadImage("AttackBox.png");
  arrow = loadImage("Arrow.png");
  downArrow = loadImage("DownArrow.png");
  bar = loadImage("PokemonBar.png");
  cleanUpImage(bar);
  bar = cleanUpImage(bar);
  img = pokeFS.get(32,96,224,224);
  img2 = pokeFS.get(288,96,224,224);
  img3 = pokeFS.get(544,96,224,224);
  img4 = pokeFS.get(32,352,224,224);
  img = cleanUpImage(img);
  //cleanUpImage(img);
  enemyBar = loadImage("EnemyBar.png");
  //cleanUpImage(enemyBar);
  enemyBar = cleanUpImage(enemyBar);
  //image(pokeBS, 0, 0);
  //image(pokeFS, 0, 0);
  //image(img, 0, 0);
  //image(img2,112,0);
  //image(img3,224,0);
  //image(img4,336,0);
  //image(battleBox,157,height-battleBox.height);
  image(battleBox,0,height-battleBox.height);
  //image(trainerS, 0, 0);
  //test();
}


//Arrow Postions: Upper Left: (288,432)
//                Lower Left: (288,494)
//                Upper Right:(484,432)
//                Lower Right:(484,494)
//DownArrow     :             (548,532);
//
//Back Sprite Pokemon: (24,196)
//Front Sprite Pokemon: (421,0)

//Front Pokemon Level: (212,80)
//Back Pokemon Level:  (522,292)

//Front Pokmeon Healthbar:(108,92);
//Back Pokemon Healthbar:(416,304 );
//Health Bar widthxheight(192,10);

//Front Pokemon Name:(12,46);
//Back Pokemon Name: (348,256);

//Back Pokemon Health:(394,356);
//             Out Of:(512,356);

//Upper text :        (36,462);

//PokemonBall : (54,234);
void draw(){
  if(startBattle){
    fill(255);
    noTint();
    rect(0,0,width,height);
    image(textBox,0,height-textBox.height);
    tint(100);
    image(img,enemyPos,2);
    rect(enemyPos-2,0,15,230);
    rect(enemyPos-2,0,224,10);
    rect(enemyPos+210,0,15,230);
    image(gold,trainerXPos,trainerYPos);
    if(trainerXPos > 36){
      trainerXPos = trainerXPos - 8;
    }else{
      startBattle = false;
      startText = true;
    }
    if(enemyPos < 416){
      enemyPos = enemyPos + 8;
    }
    //println(enemyPos);
  }
  if(startText){
    noTint();
    fill(255);
    rect(0,0,width,height);
    image(textBox,0,height-textBox.height);
    image(img,enemyPos,2);
    rect(enemyPos-2,0,15,230);
    rect(enemyPos-2,0,224,10);
    rect(enemyPos+210,0,15,230);
    image(gold,trainerXPos,196);
    fill(0);  
    text("Wild Chikorita appeared!",36,462);
    //image(downArrow,548,532);
    drawDownArrow();
  }
  if(movingPlayer){
    fill(255);
    rect(0,0,width,height);
    image(textBox,0,height-textBox.height);
    image(img,enemyPos,2);
    rect(enemyPos-2,0,15,230);
    rect(enemyPos-2,0,224,10);
    rect(enemyPos+210,0,15,230);
    image(gold,trainerXPos,trainerYPos);
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
    image(img,enemyPos,2);
    rect(enemyPos-2,0,15,230);
    rect(enemyPos-2,0,224,10);
    rect(enemyPos+210,0,15,230);
    //image(gold,trainerXPos,196);
    fill(0);  
    //text("Wild Chikorita appeared!",36,462);
    //image(stage1,54,234);
    //image(stage3,mouseX,mouseY);
    openUp();
  }
  if(mainMenu){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(battleBox,0,height-battleBox.height);
    image(arrow,arrXPos,arrYPos);
    image(pokemon, 36, 196);
    image(img,416,2);
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
    text("5",212,80);
    text("11",522,292);
    text("Chikorita",12,46);
    text("Charizard",348,256);
    text("215",394,356);
    text("215",512,356);
  }
  if(attackMenu){
    fill(255);
    rect(0,0,width,height);
    //image(battleBox,0,height-battleBox.height);
    image(attackBox,0,height-attackBox.height);
    image(pokemon, 36, 196);
    image(img,416,2);
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
    text("5",212,80);
    text("11",522,292);
    text("Chikorita",12,46);
    text("Charizard",348,256);
    text("215",394,356);
    text("215",512,356);
    image(arrow,arrXPos,arrYPos);
  }
  println(mouseX + ", " + mouseY);
}

//one(156,419)
//two(156,449)
//three(156,479)
//four(156,509);
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
 } 
 if(key == 'x'){
   if(startText){
      println("Goodbye");
      startText = false;
      movingPlayer = true;
   } 
   if(mainMenu && arrXPos == 288 && arrYPos == 432){
     mainMenu = false;
     attackMenu = true;
     arrXPos = 156;
     arrYPos = 419;
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
    
  }
  if(count > 30){
    image(stage1,54,234);
  }else{
    if(count > 20){
      image(stage3,90,265);
    }else{
      if(count > 10){
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
