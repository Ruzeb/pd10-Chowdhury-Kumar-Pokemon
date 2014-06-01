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
    this.user = u;
    this.times = t;
  }
  
  public int getAccuracy(){
    return this.accuracy;
  }
  
  public boolean canHit(Pokemon target){
    if ((this.getAccuracy() * (this.user.getAccuracy() / target.getPokeEvasion())) > 1 && 
        (Math.random() < .92)){
           return true;
        }
   else{
        return false;
   }
  }
  
  public int evaluateDamage(Pokemon target, int attack){
    int damage = 0;
    damage = ((((this.user.getLevel() *2)+10)/250)* 
      (this.user.getAttack() / this.user.getDefense())*
      (this.getPower() + 2));
     return damage;
  }
  
  public void lowerHP(Pokemon target, int attack){
   if(this.canHit(target)){
       target.addHealth(this.evaluateDamage(target, attack));
   }
  }
  
  public void lowerEvasion(Pokemon target, int a){
    if (this.canHit(target)){
      target.addAgility(a* -1);
    }
  }
  
  public int getPower(){
    return this.power;
  }
}
  
  
  
    
