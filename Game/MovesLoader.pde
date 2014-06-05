public class MovesLoader{
 private Moves[] moves;
 
 public MovesLoader(){
   moves = new Moves[14];
   moves[0] = new Moves("Tackle",95,35);
   moves[0].setAnimation(loadImage("Tackle.png")); 
   moves[1] = new Moves("Cut",95,50);
   moves[1].setAnimation(loadImage("Cut.png")); 
   moves[2] = new Moves("Flamethrower",100,95);
   moves[2].setAnimation(loadImage("Flamethrower.png")); 
   moves[3] = new Moves("Gust",100,40);
   moves[3].setAnimation(loadImage("Gust.png")); 
   moves[4] = new Moves("Razor Leaf",95,55);
   moves[4].setAnimation(loadImage("RazorLeaf.png")); 
   moves[5] = new Moves("Whirlwind",95,55);
   moves[5].setAnimation(loadImage("Whirlwind.png")); 
   moves[6] = new Moves("Bubble",100,20);
   moves[6].setAnimation(loadImage("Bubble.png")); 
   moves[7] = new Moves("Peck",100,35);
   moves[7].setAnimation(loadImage("Peck.png")); 
   moves[8] = new Moves("Scratch",100,40);
   moves[8].setAnimation(loadImage("Scratch.png")); 
   moves[9] = new Moves("Water Gun",100,40);
   moves[9].setAnimation(loadImage("WaterGun.png")); 
   moves[10] = new Moves("Bite",100,60);
   moves[10].setAnimation(loadImage("Bite.png")); 
   moves[11] = new Moves("Ember",100,40);
   moves[11].setAnimation(loadImage("Ember.png")); 
   moves[12] = new Moves("Quick Attack",100,40);
   moves[12].setAnimation(loadImage("Tackle.png")); 
   moves[13] = new Moves("Rock Throw",90,50);
   moves[13].setAnimation(loadImage("RockThrow.png")); 
 }
 
 public Moves getTackle(){
   return moves[0]; 
 }
 public Moves getCut(){
   return moves[1]; 
 }
 public Moves getFlameThrower(){
   return moves[2]; 
 }
 public Moves getGust(){
   return moves[3]; 
 }
 public Moves getRazorLeaf(){
   return moves[4]; 
 }
 public Moves getWhirlwind(){
   return moves[5]; 
 }
 public Moves getBubble(){
   return moves[6]; 
 }
 public Moves getPeck(){
   return moves[7]; 
 }
 
 public Moves getScratch(){
   return moves[8]; 
 }
 public Moves getWaterGun(){
   return moves[9]; 
 }
 public Moves getBite(){
   return moves[10]; 
 }
 public Moves getEmber(){
   return moves[11]; 
 }
 public Moves getQuickAttack(){
   return moves[12];
  } 
  public Moves getRockThrow(){
   return moves[13]; 

  }
}
