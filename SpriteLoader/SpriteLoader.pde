int time;
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
  Sprite = loadImage("FuschiaTown2.png");     //this is 1628,1084
  image(Sprite,0,0);
  PImage hero = loadImage("Gold2.png"); 
  right = hero.get(0,8,32,32);
  walkingright = hero.get(28,8,32,32);
  left = hero.get(56,8,32,32);
  walkingleft = hero.get(84,8,32,32);
  down = hero.get(112,8,32,32);
  walkingdownLeft = hero.get(144,8,32,32);
  walkingdownRight = hero.get(176,8,32,32);
  up = hero.get(210,8,32,32);
  walkingupLeft = hero.get(242,8,32,32);
  walkingupRight = hero.get(272,8,32,32);
  gold = right;
  
  image(gold,0,0);
}

//Gold is moving for now when keys are pressed
void draw(){
  imageMode(CORNER);
  image(Sprite,0,0);
  imageMode(CORNERS);
  image(gold,xpos,ypos,xpos + 32, ypos + 32);
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
      
      //moveRight();

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

void moveRight(){
 moveRight(millis(), 0); 
}
void moveRight(int t, int count){
 if(count == 32){
 }else{
  if(millis() - t >= 2){
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
        color g2 = Sprite.pixels[(x + xpos) + ((y + ypos) * 1628)];
        pixels[(x + xpos) + ((y + ypos) * 1628)] = g2;
      }
    }
  }
  updatePixels();
}

