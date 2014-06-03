import java.util.*;

public class Pokemon{
  
  private int baseHealth;
  private int baseAttack;
  private int baseDefense;
  private int baseSpeed;
  private int maxHealth;
  private int IV;
  private int health;
  private int attack;
  private int defense;
  private int speed;
  private int accuracy;
  private int level;
  private String name;
  private ArrayList<Moves> moves;
  private PImage back;
  private PImage front;
  
  public Pokemon(int h, int at, int d, int a, int acc,String n, ArrayList<Moves> m){
    this.health = h;
    this.maxHealth = h;
    this.attack = at;
    this.defense = d;
    this.speed = a;
    this.accuracy = acc;
    this.name = n;
    this.moves = m;
    back = loadImage(name + "Back.png");
    front = loadImage(name + "Front.png");
  }
  
  //this constructor is just being used for testing purposes
  public Pokemon(int h,String n){
    health = h;
    maxHealth = h;
    name = n;
    level = 1;
    back = loadImage(name + "Back.png");
    front = loadImage(name + "Front.png");
  }
  
  public Pokemon(String n, int h, int d, int a, int s){
    Random r = new Random();
    baseHealth = h;
    baseDefense = d;
    baseAttack = a;
    baseSpeed = s;
    name = n;
    IV = r.nextInt(5) + 9;
    back = loadImage(name + "Back.png");
    front = loadImage(name + "Front.png");
    moves = new ArrayList<Moves>();
  }
  
  public void addMove(Moves m){
    if(moves.size() <= 4){
      m.setUser(this);
      moves.add(m); 
    }
  }
  
  public Moves getMoves(int i){
    return moves.get(i); 
  }
  
  public void setLevel(int i){
    level = i;
    setMaxHealth();
    setDefense();
    setAttack();
    setSpeed();
  }
  
  public void addLevel(){
    setLevel(level + 1); 
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
  
  public void setMaxHealth(){
    maxHealth = (((IV + baseHealth + 50)*level)/50) + 5;
    health = maxHealth;
  }
  
  public int getHealthBar(){
    double d = (double)health / (double)maxHealth;
    d = d * 192.0;
    return (int)d; 
  }
  
  public int getHealth(){
    return this.health;
  }
  
  public void setHealth(int h){
    this.health = h;
    if(health < 0){
      health = 0; 
    }
  }
  
  public void addHealth(int h){
    this.setHealth(this.getHealth() + h);
  }
  
  public int getSpeed(){
    return this.speed;
  }
  
  /*
  public void setspeed(int s){
    this.speed = s;
  }
  */
  
  public void setSpeed(){
    speed = (((IV + baseSpeed) * level)/50)+5;
    println(name + " has " + speed + " speed!");
  }
  /*
  public void addSpeed(int h){
    this.setSpeed(this.getSpeed() + h);
  }
  */
  
  public int getAttack(){
    return this.attack;
  }
  
  /*
  public void setAttack(int s){
    this.attack = s;
  }
  
  public void addAttack(int h){
    this.setAttack(this.getAttack() + h);
  }
  */
  public void setAttack(){
    attack = (((IV + baseAttack) * level)/50)+5;
  }
  
  
  public int getDefense(){
    return this.defense;
  }
  
  /*
  public void setDefense(int s){
    this.defense = s;
  }
  
  public void addDefense(int h){
    this.setDefense(this.getDefense() + h);
  }
  */
  public void setDefense(){
   defense = (((IV + baseDefense) * level)/50)+5;
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
    return (this.getAccuracy() / this.getSpeed()); 
  }
  
  public String getName(){
    return this.name;
  }
  
  public void setName(String s){
    this.name = s;
  }
}
  
  
  
  
  
  
    
