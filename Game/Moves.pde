import java.lang.Math;

public class Moves{
  
  private String name;
  private int accuracy;
  private int power;
  private int times;
  private Pokemon user;
  private PImage animation;
  
  public void Moves(String s, int a, int p, Pokemon u, int t){
    this.name = s;
    this.accuracy = a;
    this.power = p;
    this.user = u;
    this.times = t;
  }
  
  //accuracy is from 255
  public int getAccuracy(){
    return this.accuracy;
  }
  
  //each pokemon should have the same accuracy and evasion
  //evasion and accuracy changes based on stat effecting attacks 
  //in the actual game.
  //Lets not implement this yet and keep the formula down there
  //which is used in the game
  /*
  public boolean canHit(Pokemon target){
    if ((this.getAccuracy() * (this.user.getAccuracy() / target.getPokeEvasion())) > 1 && 
        (Math.random() < .92)){
           return true;
        }
   else{
        return false;
   }
  }
  */
  public boolean canHit(Pokemon target){
    Random r = new Random();
    if(r.nextInt(255) <= this.accuracy-1){
      return true;
    }else{
      return false;
    }
  }
  
  public int evaluateDamage(Pokemon target, int attack){
    int damage = 0;
    damage = ((((this.user.getLevel() *2)+10)/250)* 
      (this.user.getAttack() / this.user.getDefense())*
      (this.getPower()) + 2);
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
  
  public void setAnimation(PImage p){
    animation = p; 
  }
  
  //  playerAttacking = false;
  //  count = 0;
  //  mainMenu = true; 
  //  arrXPos = 288;
  //  arrYPos = 432;
  public boolean animate(int count){
    if(count < 20 || (count > 40 && count < 60)){
      image(attack,444,92);  
    }
    if(count == 80){
      return true;
    }else{
      return false;
    }
  }
  
}
  
  
  
    
