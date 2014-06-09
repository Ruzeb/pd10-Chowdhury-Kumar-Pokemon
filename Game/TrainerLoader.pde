public class TrainerLoader{
  
  private Trainer[] trainers;
  private Pokedex dex = new Pokedex();
  private MovesLoader moves = new MovesLoader();
  
  public TrainerLoader(){
    
    trainers = new Trainer[5];
    
    trainers[0] = new Trainer("Jeff", 672, 220);
    trainers[0].setAnimation(loadImage("Boy.png"));
    trainers[0].addPokemon(dex.getRattata());
    trainers[0].setText(loadImage("BoyText.png"));
    trainers[0].getPokemon().get(0).addMove(moves.getScratch());
    trainers[0].getPokemon().get(0).setLevel(5);
    
    
    trainers[1] = new Trainer("Matt", 800, 122);
    trainers[1].setAnimation(loadImage("Nerd.png"));
    trainers[1].addPokemon(dex.getSentret());
    trainers[1].setText(loadImage("NerdText.png"));
    trainers[1].getPokemon().get(0).addMove(moves.getPeck());
    trainers[1].getPokemon().get(0).setLevel(3);
    
    trainers[2] = new Trainer("Lana", -224, 200);
    trainers[2].setAnimation(loadImage("Girl.png"));
    trainers[2].addPokemon(dex.getPidgey());
    trainers[2].setText(loadImage("GirlText.png"));
    trainers[2].getPokemon().get(0).addMove(moves.getGust());
    trainers[2].getPokemon().get(0).setLevel(4);
    
    trainers[3] = new Trainer("Will", 192, 99);
    trainers[3].setAnimation(loadImage("OldMan.png"));
    trainers[3].addPokemon(dex.getHoothoot());
    trainers[3].setText(loadImage("OldManText.png"));
    trainers[3].getPokemon().get(0).addMove(moves.getTackle());
    trainers[3].getPokemon().get(0).setLevel(4);
    
    trainers[4] = new Trainer("Lily", 1344, 250);
    trainers[4].setAnimation(loadImage("Enemy.png"));
   
    trainers[4].setText(loadImage("EnemyText.png"));
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
  
    
