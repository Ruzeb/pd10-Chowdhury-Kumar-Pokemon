public class Trainer{
  
  private ArrayList<Pokemon> pokemon;
  private PImage battleFront;
  private PImage mapFront;
  private String name;
  private int locX;
  private int locY;
  private int numPotions;
  private String textBox = "";
  
  public Trainer(String n, int x, int y){
    this.name = n;
    this.locX = x;
    this.locY = y;
    numPotions = 10;
    pokemon = new ArrayList<Pokemon>();
  }
  
  public void addPokemon(Pokemon p){
    pokemon.add(p); 
  }
  
  public String getLocation(){
    return "( " + locX + " , " + locY + " )";
  }
  
  
  public String getName(){
    return this.name;
  }
  
  public ArrayList<Pokemon> getPokemon(){
    return this.pokemon;
  }
  
  public String getText(){
    return this.textBox;
  }
  
  public void setText(String text){
    this.textBox = text;
  }
  
  public void setFront(PImage p){
    this.mapFront = p;
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
  
  public void setAnimation(PImage p){
    mapFront = p;
    mapFront = cleanUpImage2(mapFront);
  }
}
  
