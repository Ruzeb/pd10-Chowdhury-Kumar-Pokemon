import java.util.*;

public class Map{
 PImage map;
 PImage mapColl;
 Map northMap;
 Map southMap;
 Map westMap;
 Map eastMap;
 String name;
 ArrayList<Pokemon> pokeList = new ArrayList<Pokemon>();
  
  
 public Map(String s){
  name = s;
 }
 
 public PImage getMap(){
   return map;
 }
 
 public void setMap(PImage m){
   map = m;
 }
 
 public Map getNorthMap(){
   return northMap;
 }
 
 public Map getSouthMap(){
   return southMap;
 }
 
 public Map getWestMap(){
   return westMap;
 }
 
 public Map getEastMap(){
   return eastMap;
 }
 
 public void setNorthMap(Map m){
   northMap = m;
 }
 
 public void setSouthMap(Map m){
   southMap = m;
 }
 
 public void setWestMap(Map m){
   westMap = m;
 }
 
 public void setEastMap(Map m){
   eastMap = m;
 }
  
 public String toString(){
   return name;
 } 
 
 public boolean hasNorthMap(){
   return !(northMap == null);
 }
 
 public boolean hasSouthMap(){
   return !(southMap == null);
 }
 
 public boolean hasWestMap(){
   return !(westMap == null);
 }
 
 public boolean hasEastMap(){
   return !(eastMap == null);
 }
 
 public void setMapCollisions(PImage m){
   mapColl = m;
 }
 
 public void addPokemon(Pokemon p){
   pokeList.add(p); 
 }
 
 public Pokemon getRandPokemon(){
    Random r = new Random();
    int i = r.nextInt(pokeList.size());
    return pokeList.get(i);
 }
 
 public boolean checkValid(int x,int y){
   map.loadPixels();
   mapColl.loadPixels();
   if((x - 240 == -256 && this.hasWestMap()) || (map.width - x + 304 == 288 && this.hasEastMap())){
     return true;
   }
   if(map.height - y + 304 == 288){
     if(this.hasSouthMap()){
       return true;
     }else{
       return false;
     }
   }
   if(y - 240 == -256){
     if(this.hasNorthMap()){
       return true;
     }else{
       return false;
     }
   }
   if(map.pixels[x + y * map.width] == mapColl.pixels[x + y * mapColl.width]){
     return true;
   }else{
     return false;
   }
 }
 
 
}
