PImage pokemon;
PImage pokeFS;
PImage trainerS;
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  //size(1000,1000);
  size(640,576);
  background(255);
  pokeFS = loadImage("PokemonFrontSprites.png");
  //pokeFS = loadImage("Front.png");
  trainerS = loadImage("TrainerSprites.png");
  img = pokeFS.get(16,48,112,112);
  img2 = pokeFS.get(144,48,112,112);
  img3 = pokeFS.get(272,48,112,112);
  img4 = pokeFS.get(16,176,112,112);
  img = cleanUpImage(img);
  img.updatePixels();
  //image(pokeBS, 0, 0);
  //image(pokeFS, 0, 0);
  image(img, 0, 0);
  image(img2,112,0);
  image(img3,224,0);
  image(img4,336,0);
  //image(trainerS, 0, 0);
  //test();
}

//960x304

void draw(){
  
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

PImage cleanUpImage(PImage p){
 PImage newImg = createImage(p.width,p.height,ARGB);
 newImg.loadPixels();
 p.loadPixels();
 color white = p.get(1,1);
  //make it transparent
  for(int x = 0; x < p.width; x ++){
    for(int y = 0; y < p.height; y ++){
      color g = p.pixels[x + y * p.width];
      if(g == white){
        println("hello");
        newImg.pixels[x + y * p.width] = color(50);
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
  newImg.updatePixels();
  return newImg; 
}
