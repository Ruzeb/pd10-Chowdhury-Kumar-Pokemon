public class TrainerLoader{
  
  private Trainer[] trainers;
  private Pokedex dex = new Pokedex();
  
  public TrainerLoader(){
    
    trainers = new Trainer[5];
    
    trainers[0] = new Trainer("Jeff", 220, 220);
    trainers[0].setAnimation(loadImage("Boy.png"));
    trainers[0].addPokemon(dex.getRattata());
    
    trainers[1] = new Trainer("Matt", 112, 122);
    trainers[1].setAnimation(loadImage("Nerd.png"));
    trainers[1].addPokemon(dex.getSentret());
    
    trainers[2] = new Trainer("Lana", 200, 200);
    trainers[2].setAnimation(loadImage("Girl.png"));
    trainers[2].addPokemon(dex.getPidgey());
    
    trainers[3] = new Trainer("Will", 99, 99);
    trainers[3].setAnimation(loadImage("OldMan.png"));
    trainers[3].addPokemon(dex.getHoothoot());
    
    trainers[4] = new Trainer("Lily", 250, 250);
    trainers[4].setAnimation(loadImage("Enemy.png"));
   
    
  }
  
  public Trainer getBoy(){
    return trainers[0];
  }
  public Trainer getNerd(){
    return trainers[1];
  }
  public Trainer getGirl(){
    return trainers[2];
  }
  public Trainer getOldMan(){
    return trainers[3];
  }
  public Trainer getEnemy(){
    return trainers[4];
  }
  
}
  
    
