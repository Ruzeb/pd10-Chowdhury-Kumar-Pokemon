public class Trainer{
  
  private ArrayList<Pokemon> pokemon = new ArrayList<Pokemon>();
  private PImage battleFront;
  private PImage mapFront;
  private PImage mapBack;
  private String name;
  private int locX;
  private int locY;
  private String textBox = "";
  
  public Trainer(String n, int x, int y){
    this.name = n;
    
    this.locX = x;
    this.locY = y;
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
}
  
