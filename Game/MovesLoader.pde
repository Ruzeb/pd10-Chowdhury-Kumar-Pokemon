public class MovesLoader{
 private Moves[] moves;
 
 public MovesLoader(){
   moves = new Moves[1];
   moves[0] = new Moves("Tackle",255,50);
   moves[0].setAnimation(loadImage("Tackle.png")); 
 }
 
 public Moves getTackle(){
   return moves[0]; 
 }
}
