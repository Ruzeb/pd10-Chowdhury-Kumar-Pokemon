import java.lang.Math;

public class Moves{
  
  private String name;
  private int accuracy;
  private int power;
  private int times;
  private Pokemon user;
  
  public void Moves(String s, int a, int p, Pokemon u, int t){
    this.name = s;
    this.accuracy = a;
    this.power = p;
    this.user = user;
    this.times = t;
  }
  
  public int getAccuracy(){
    return this.accuracy;
  }
  
  public boolean canHit(){
    if ((this.getAccuracy() * (this.user.getAccuracy() / target.getPokeEvasion)) > 1 && 
        (Math.random() < .92)){
           return true;
        }
   else{
        return false
   }
  
  public void lowerHP(Pokemon target, int attack){
   if (this.canHit()){
       target.addHealth(attack * -1);
   }
  }
  
  public void lowerEvasion(Pokemon target, int a){
    if (this.canHit()){
      target.addAgility(a* -1);
    }
  }
  
  
  
    
