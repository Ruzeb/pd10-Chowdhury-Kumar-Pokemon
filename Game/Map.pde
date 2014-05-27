public class Map{
 PImage map;
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
 
 public String toString(){
   return name;
 } 
 
}
