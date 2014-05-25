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
  size(1100,800);
  Sprite = loadImage("FuschiaTown.png");  
  image(Sprite,0,0);
  PImage hero = loadImage("Gold.png"); 
  right = hero.get(0,4,16,16);
  walkingright = hero.get(14,4,16,16);
  left = hero.get(28,4,16,16);
  walkingleft = hero.get(42,4,16,16);
  down = hero.get(56,4,16,16);
  walkingdownLeft = hero.get(72,4,16,16);
  walkingdownRight = hero.get(88,4,16,16);
  up = hero.get(105,4,16,16);
  walkingupLeft = hero.get(121,4,16,16);
  walkingupRight = hero.get(136,4,16,16);
  gold = walkingupRight;
  
  image(gold,0,0);
}

//Gold is moving for now when keys are pressed
void draw(){
  image(Sprite,0,0);
  image(gold,xpos,ypos);
  cleanUpGold();
}

//this is used to move the character
void keyPressed(){
  if(key == CODED){
    if(keyCode == DOWN){
     ypos++;
     if(!(gold == down)){
       gold = down;
     }else{
       if(rightFoot && gold == down){
         gold = walkingdownRight;
         rightFoot = false;
         leftFoot = true;
       }else{
         if(leftFoot && gold == down){
           gold = walkingdownLeft;
           leftFoot = false;
           rightFoot = true;
         }
       }
     }
    }
    if(keyCode == UP){
      ypos--;
     if(!(gold == up)){
       gold = up;
     }else{
       if(rightFoot && gold == up){
         gold = walkingupRight;
         rightFoot = false;
         leftFoot = true;
       }else{
         if(leftFoot && gold == up){
           gold = walkingupLeft;
           leftFoot = false;
           rightFoot = true;
         }
       }
     }
    }
    if(keyCode == RIGHT){
      xpos++;
      if(xpos % 4 == 0){   //after 4 steps, the animation will change
        gold = walkingright;
      }else{
        gold = right;
      }
    }
    if(keyCode == LEFT){
      xpos--;
      if(xpos % 4 == 0){
        gold = walkingleft;
      }else{
        gold = left;
      }
    }     
  }
}

//321 to 353 are two tiles
//-1572988 need to somehow compare the color to this number but i wonder how
//messing around and seeing how to change pixel color
//this can be ignored for now
void test(){
  color c = Sprite.get(150,1);
  color green = Sprite.get(257,2);
  fill(c);
  rect(700,500,750,550); 
  for(int i = 0; i < Sprite.height; i ++){
    color cl = Sprite.get(2, i);
    if(cl == -1572988){
      println("This is the color: " + cl + " This is the y pixel: " + i);
    }
  }
}

//using this to try and get rid of the white surrounding the character models
//need to use this to also fix up the black dots surrounding the models
void cleanUpGold(){
  loadPixels();
  Sprite.loadPixels();
  gold.loadPixels();
  color white = gold.pixels[0];
  for(int x = 0; x < 16; x ++){
    for(int y = 0; y < 16; y ++){
      color g = gold.pixels[x + y * 16];
      if(g == white){
        color g2 = Sprite.pixels[(x + xpos) + ((y + ypos) * 814)];
        pixels[(x + xpos) + ((y + ypos) * 1100)] = g2;
      }
    }
  }
  updatePixels();
}

