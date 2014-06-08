public class TrainerLoader{
  
  private Trainer[] trainers;
  private Pokedex dex = new Pokedex();
  
  public TrainerLoader(){
    
    trainers = new Trainer[5];
    
    trainers[0] = new Trainer("Jeff", 220, 220);
    trainers[0].setAnimation(loadImage("Boy.png"));
    trainers[0].addPokemon(dex.getRattata());
    trainers[0].setText("My RATTATA's looking awesome!");
    
    trainers[1] = new Trainer("Matt", 112, 122);
    trainers[1].setAnimation(loadImage("Nerd.png"));
    trainers[1].addPokemon(dex.getSentret());
    trainers[1].setText("Behold my Pokemon's dexterity!");
    
    trainers[2] = new Trainer("Lana", 200, 200);
    trainers[2].setAnimation(loadImage("Girl.png"));
    trainers[2].addPokemon(dex.getPidgey());
    trainers[2].setText("If you were a Pokemon, I wouldn't choose you!");
    
    trainers[3] = new Trainer("Will", 99, 99);
    trainers[3].setAnimation(loadImage("OldMan.png"));
    trainers[3].addPokemon(dex.getHoothoot());
    trainers[3].setText("These hands are frail but these Pokemon are the strongest!");
    
    trainers[4] = new Trainer("Lily", 250, 250);
    trainers[4].setAnimation(loadImage("Enemy.png"));
   
    trainers[4].setText("So Professor Oak chose to give you a Pokemon? Sigh... what a waste!");
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
  
    
