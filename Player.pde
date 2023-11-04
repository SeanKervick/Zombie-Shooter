public class Player {
  private String playerName;
  
  public Player(String playerName){
    //this.playerName = playerName.trim().substring(0,6);
  }
  
  //getters
  public String getPlayerName(){
    return playerName;
  }
  
  //setters
  public void setPlayerName(String playerName){
    this.playerName = playerName.substring(0,6);
  }
  
}
