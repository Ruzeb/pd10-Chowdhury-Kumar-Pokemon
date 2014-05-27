public class MapLoader{
 Map[] maps;
 public MapLoader(){
  maps = new Map[2];
  maps[0] = new Map("FuschiaTown");
  maps[0].setMap(loadImage("FuschiaTown2.png").get(4,2,1280,1152));
  maps[1] = new Map("PalletTown"); 
  maps[1].setMap(loadImage("PalletTown2.png").get(12,10,640,576));
 }
 
 public Map getFuschia(){
   return maps[0];
 }
 
 public Map getPallet(){
   return maps[1];
 }
}
