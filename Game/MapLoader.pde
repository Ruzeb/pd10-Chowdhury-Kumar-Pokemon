public class MapLoader{
 Map[] maps;
 public MapLoader(){
  maps = new Map[4];
  maps[0] = new Map("FuschiaTown");
  maps[0].setMap(loadImage("FuschiaTown.png").get(4,2,1280,1152));
  maps[1] = new Map("PalletTown"); 
  maps[1].setMap(loadImage("PalletTown.png").get(12,10,640,576));
  maps[2] = new Map("NewBarkTown");
  maps[2].setMap(loadImage("NewBarkTown.png").get(596,6,768,576));
  maps[3] = new Map("Route29");
  maps[3].setMap(loadImage("Route29.png").get(0,0,1920,576);
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
}
