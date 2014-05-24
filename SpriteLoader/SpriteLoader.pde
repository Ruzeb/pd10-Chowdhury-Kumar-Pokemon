PImage Sprite;
PImage gold;
PImage right;
PImage left;
PImage walkingright;
PImage walkingleft;
int countx = 0;
int county = 0;

//we need to come up with better pixel numbers for the character models
//maybe we can use tiled for this?
void setup(){
  size(1100,800);
  Sprite = loadImage("FuschiaTown.png");  
  image(Sprite,0,0);
  PImage hero = loadImage("Gold.png"); 
  right = hero.get(0,0,15,20);
  walkingright = hero.get(15,0,15,20);
  left = hero.get(28,0,15,20);
  walkingleft = hero.get(42,0,15,20);
  
  gold = right;
  println(Sprite.width);
  println(Sprite.height);
  test();
}

//Gold is moving for now when keys are pressed
void draw(){
  
  image(Sprite,0,0);
  image(gold,countx,county);
}

//this is used to move the character
void keyPressed(){
  if(key == CODED){
    if(keyCode == DOWN){
     county++;
    }
    if(keyCode == UP){
      county--;
    }
    if(keyCode == RIGHT){
      countx++;
      if(countx % 4 == 0){   //after 4 steps, the animation will change
        gold = walkingright;
      }else{
        gold = right;
      }
    }
    if(keyCode == LEFT){
      countx--;
      if(countx % 4 == 0){
        gold = walkingleft;
      }else{
        gold = left;
      }
    }     
  }
}
    

//messing around and seeing how to change pixel color
//this can be ignored for now
void test(){
 println("Hello"); 
 loadPixels();
 Sprite.loadPixels();
 pixels[width*height - 100] = Sprite.pixels[4];
 updatePixels();
}

