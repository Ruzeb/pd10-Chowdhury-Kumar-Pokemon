public class Pokemon{
  
  private int health;
  private int attack;
  private int defense;
  private int agility;
  private int accuracy;
  private int level;
  private String name;
  private ArrayList<Moves> moves;
  private PImage back;
  private PImage front;
  
  public Pokemon(int h, int at, int d, int a, int acc,String n, ArrayList<Moves> m){
    this.health = h;
    this.attack = at;
    this.defense = d;
    this.agility = a;
    this.accuracy = acc;
    this.name = n;
    this.moves = m;
  }
  
  //this constructor is just being used for testing purposes
  public Pokemon(){
    
  }
  
  public void setLevel(int i){
    level = i;
  }
  
  public int getLevel(){
    return level; 
  }
  
  public void setFront(PImage p){
    front = p; 
  }
  
  public void setBack(PImage p){
    back = p; 
  }
  
  public PImage getBack(){
    return back; 
  }
  
  public PImage getFront(){
    return front; 
  }
  
  public int getHealth(){
    return this.health;
  }
  
  public void setHealth(int h){
    this.health = h;
  }
  
  public void addHealth(int h){
    this.setHealth(this.getHealth() + h);
  }
  
  public int getAgility(){
    return this.agility;
  }
  
  public void setAgility(int s){
    this.agility = s;
  }
  
  public void addAgility(int h){
    this.setAgility(this.getAgility() + h);
  }
  
  public int getAttack(){
    return this.attack;
  }
  
  public void setAttack(int s){
    this.attack = s;
  }
  
  public void addAttack(int h){
    this.setAttack(this.getAttack() + h);
  }
  
  
  public int getDefense(){
    return this.defense;
  }
  
  public void setDefense(int s){
    this.defense = s;
  }
  
  public void addDefense(int h){
    this.setDefense(this.getDefense() + h);
  }
  
  public int getAccuracy(){
    return this.accuracy;
  }
  
  public void setAccuracy(int s){
    this.accuracy = s;
  }
  
  public void addAccuracy(int h){
    this.setAccuracy(this.getAccuracy() + h);
  }
  
  public int getPokeEvasion(){
    return (this.getAccuracy() / this.getAgility()); 
  }
  
  public String getName(){
    return this.name;
  }
  
  public void setName(String s){
    this.name = s;
  }
}
  
  
  
  
  
  
    
