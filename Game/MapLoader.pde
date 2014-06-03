public class MapLoader{
 Map[] maps;
 MovesLoader moves = new MovesLoader();
 public MapLoader(){
   
  maps = new Map[4];
  maps[0] = new Map("FuschiaTown");
  maps[0].setMap(loadImage("FuschiaTown.png").get(4,2,1280,1152));
  
  maps[1] = new Map("PalletTown"); 
  maps[1].setMap(loadImage("PalletTown.png").get(12,10,640,576));
  
  maps[2] = new Map("NewBarkTown");
  maps[2].setMap(loadImage("NewBarkTown.png").get(596,5,768,576));
  maps[2].setMapCollisions(loadImage("NewBarkTownColl.png").get(596,5,768,576));
  
  maps[3] = new Map("Route29");
  maps[3].setMap(loadImage("Route29.png").get(0,0,1920,576));
  maps[3].setMapCollisions(loadImage("Route29Coll.png").get(0,0,1920,576));
  //ArrayList<Moves> m = new ArrayList<Moves>();
  Pokemon chikorita = new Pokemon("Chikorita",45,65,49,45);
  Pokemon tododile = new Pokemon("Tododile",50,64,65,43);
  Pokemon cyndaquil = new Pokemon("Cyndaquil",39,43,52,65);
  chikorita.addMove(moves.getTackle());
  tododile.addMove(moves.getTackle());
  cyndaquil.addMove(moves.getTackle());
  //chikorita.setLevel(10);
  maps[3].addPokemon(chikorita);
  maps[3].addPokemon(tododile);
  maps[3].addPokemon(cyndaquil);
  
  //Setting wests,norths,souths
  maps[2].setWestMap(maps[3]);
  maps[3].setEastMap(maps[2]);
 }
 
 public Map getFuschia(){
   return maps[0];
 }
 
 public Map getPallet(){
   return maps[1];
 }
 
 public Map getNewBark(){
   return maps[2];
 }
 
 public Map getRoute29(){
   return maps[3]; 
 }
}
