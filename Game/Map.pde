public class Map{
 PImage map;
 Map northMap;
 Map southMap;
 Map westMap;
 Map eastMap;
 String name;
  
  
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
 
}
