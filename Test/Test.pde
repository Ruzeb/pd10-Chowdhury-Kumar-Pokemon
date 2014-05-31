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
PImage arrow;
int arrXPos = 288;
int arrYPos = 432;
PImage battleBox;
PImage textBox;
PFont f;
int trainerPos;
int enemyPos = 0;
void setup(){
  //size(1000,1000);
  size(640,576);
  background(255);
  noStroke();
  trainerPos = width;
  
  f = createFont("Arial",16,true);
  textFont(f,36);
  
  pokeFS = loadImage("PokemonFrontSprites.png");
  pokemon = loadImage("Charizard.png");
  gold = loadImage("GoldBack.png");
  //trainerS = loadImage("TrainerSprites.png"); 
  battleBox = loadImage("BattleBox.png");
  battleBox = battleBox.get(0,0,battleBox.width - 10,battleBox.height);
  textBox = loadImage("TextBox.png");
  arrow = loadImage("Arrow.png");
  bar = loadImage("PokemonBar.png");
  cleanUpImage(bar);
  img = pokeFS.get(32,96,224,224);
  cleanUpImage(img);
  img2 = pokeFS.get(288,96,224,224);
  img3 = pokeFS.get(544,96,224,224);
  img4 = pokeFS.get(32,352,224,224);
  cleanUpImage(img);
  enemyBar = loadImage("EnemyBar.png");
  cleanUpImage(enemyBar);
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
void draw(){
  
  fill(255);
  rect(0,0,width,height);
  image(textBox,0,height-textBox.height);
  image(gold,trainerPos,196);
  image(img,enemyPos,2);
  if(trainerPos > 36){
    trainerPos = trainerPos - 8;
  }
  if(enemyPos < 416){
    enemyPos = enemyPos + 8;
  }
  rect(414,0,10,224);
  rect(414,0,224,10);
  println(enemyPos);
  
  /*
  fill(255);
  rect(0,0,width,height);
  //image(battleBox,0,height-battleBox.height);
  image(textBox,0,height-textBox.height);
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
  println(mouseX + ", " + mouseY);
  */
}

void keyPressed(){
 if(key == CODED){
   if(keyCode == UP){
     arrYPos = 432;
   }
   if(keyCode == RIGHT){
     arrXPos = 484;
   }
   if(keyCode == LEFT){
     arrXPos = 288;
   }   
   if(keyCode == DOWN){
     arrYPos = 494;
   }
 } 
}

//8 in from left, 24 in from top
//or 16 and 48 in double
//it is 56x56 or 112x112 in double size
//8 pixels between each front sprite, or 16 in this case
void test(){
  pokeFS.loadPixels();
  color g = pokeFS.get(0,0);
  fill(g);
  rect(800,0,100,100);
  for(int x = 64; x < pokeFS.width; x ++){
    color c = pokeFS.get(x,50);
    if(!(g == c)){
      fill(c);
      rect(800,0,100,100);
      println(x);
      break;
    } 
  }
}

void cleanUpImage(PImage p){
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
      }else{
        newImg.pixels[x + y * p.width] = p.pixels[x + y * p.width];
      }
    }
  }
  //newImg.updatePixels();
  /*
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
  */
  p.updatePixels();
  newImg.updatePixels();
  //return newImg; 
}
