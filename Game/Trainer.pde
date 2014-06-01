public class Trainer{
  
  private int health;
  private ArrayList<Pokemon> pokemon;
  private PImage battleFront;
  private PImage mapFront;
  private PImage mapBack;
  private String name;
  private int locX;
  private int locY;
  private String textBox = "";
  
  public void Trainer(int h, String n, ArrayList<Pokemon>, int x, int y){
    this.health = h;
    this.name = n;
    this.pokemon = p;
    this.locX = x;
    this.loxY = y;
  }
  
  public String getLocation(){
    return "( " + x + " , " + y + " )"
  }
  
  public int getHealth(){
    return this.health;
  }
  
  public String getName(){
    return this.name;
  }
  
  public ArrayList<Pokemon> getPokemon(){
    return this.pokemon;
  }
  
  public void setHealth(int h){
    this.health = h;
  }
  
  public void addHealth(int h){
    this.setHealth(this.getHealth + h);
  }
  
  public String getText(){
    return this.textBox;
  }
  
  public void setText(String text){
    this.textBox = text;
  }
  
}
  
