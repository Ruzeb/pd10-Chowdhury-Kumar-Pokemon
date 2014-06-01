public class Trainer{
  
  private ArrayList<Pokemon> pokemon;
  private PImage battleFront;
  private PImage mapFront;
  private PImage mapBack;
  private String name;
  private int locX;
  private int locY;
  private String textBox = "";
  
  public void Trainer(String n, ArrayList<Pokemon> p, int x, int y){
    this.name = n;
    this.pokemon = p;
    this.locX = x;
    this.locY = y;
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
  
}
  
