public class Trainer{
  
  private ArrayList<Pokemon> pokemon;
  private PImage battleFront;
  private PImage mapFront;
  private String name;
  private int locX;
  private int locY;
  private int numPotions;
  private int numPokeBalls;
  private PImage textBox;
  private boolean battled;
  
  public Trainer(String n, int x, int y){
    this.name = n;
    this.locX = x;
    this.locY = y;
    numPotions = 10;
    pokemon = new ArrayList<Pokemon>();
    battled = false;
  }
  
  public void addPokemon(Pokemon p){
    pokemon.add(p); 
  }
  
  public int getX(){
    return this.locX;
  }
  
  public int getY(){
    return this.locY;
  }
  
  
  public void setBattled(){
    this.battled = true;
  }
  
  public String getName(){
    return this.name;
  }
  
  public ArrayList<Pokemon> getPokemon(){
    return this.pokemon;
  }
  
  public PImage getText(){
    return this.textBox;
  }
  
  public void setText(PImage p){
    this.textBox = p;
  }
  
  public PImage getFront(){
    return this.mapFront;
  }
  
  public boolean usePotion(Pokemon p){
    if(numPotions == 0){
      return false;
    }else{
      p.addHealth(20);
      numPotions --;
      return true; 
    }
  }
  
  public int getNumPotions(){ 
    return numPotions;
  }
  
  public int getNumPokeBalls(){
    return numPokeBalls; 
  }
  
  public void usePokeBall(Pokemon p){
     
  }
  
  public void setAnimation(PImage p){
    mapFront = p;
    mapFront = cleanUpImage2(mapFront);
  }
}
  
