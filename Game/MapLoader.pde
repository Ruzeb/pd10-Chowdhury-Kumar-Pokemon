public class MapLoader{
 private Map[] maps;
 private MovesLoader moves = new MovesLoader();
 //private Pokedex dex = new Pokedex();
 public MapLoader(){
   
  maps = new Map[4];
  maps[0] = new Map("FuschiaTown");
  maps[0].setMap(loadImage("FuschiaTown.png").get(4,2,1280,1152));
  
  maps[1] = new Map("PalletTown"); 
  maps[1].setMap(loadImage("PalletTown.png").get(12,10,640,576));
  
  maps[2] = new Map("NewBarkTown");
  maps[2].setMap(loadImage("NewBarkTown.png").get(596,5,768,576));
  maps[2].setMapCollisions(loadImage("NewBarkTownColl.png").get(596,5,768,576));
  
  maps[3] = new Map("Route29",2,4);
  maps[3].setMap(loadImage("Route29.png").get(0,0,1920,576));
  maps[3].setMapCollisions(loadImage("Route29Coll.png").get(0,0,1920,576));
  
  Pokemon rattata = dex.getRattata();
  Pokemon pidgey = dex.getPidgey();
  Pokemon sentret = dex.getSentret();
  Pokemon hoothoot = dex.getHoothoot();
  rattata.addMove(moves.getTackle());
  sentret.addMove(moves.getTackle());
  pidgey.addMove(moves.getTackle());
  hoothoot.addMove(moves.getTackle());
  maps[3].addPokemon(rattata);
  maps[3].addPokemon(pidgey);
  maps[3].addPokemon(sentret);
  maps[3].addPokemon(hoothoot);
  
  
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
