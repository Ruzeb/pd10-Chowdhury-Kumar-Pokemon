import java.lang.Math;

public class Moves{
  
  private String name;
  private int accuracy;
  private int power;
  private int times;
  private Pokemon user;
  private PImage animation;
  
  public Moves(String s, int a, int p){
    this.name = s;
    this.accuracy = a;
    this.power = p;
  }
  
  public void setUser(Pokemon p){
    user = p; 
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
  public boolean canHit(){
    Random r = new Random();
    if(r.nextInt(255) <= this.accuracy-1){
      return true;
    }else{
      return false;
    }
  }
  
  public int evaluateDamage(Pokemon target){
    int damage = 0;
      damage = ((((this.user.getLevel() *2)+10)/250)* 
      (this.user.getAttack() / target.getDefense())*
      (this.getPower()) + 2);
     return damage;
  }
  
  public void lowerHP(Pokemon target){
   if(this.canHit()){
       target.addHealth(this.evaluateDamage(target)*-1);
   }
  }
  /*
  public void lowerEvasion(Pokemon target, int a){
    if (this.canHit(target)){
      target.addSpeed(a* -1);
    }
  }
  */
  
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
  
  public String toString(){
    return name; 
  }
  
}
  
  
  
    
