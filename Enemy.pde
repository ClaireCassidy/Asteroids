class Enemy {

  float xPos;
  float yPos;
  
  Enemy(float xPos, float yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  void render() {
    //rectMode(CENTER);
    rect(xPos, yPos, enemyWidth, enemyHeight);
  }
  
  boolean isColliding() {
    for (Bullet bullet:player.onScreenBullets) {
      if (bullet.displacement.y-bullet.bulletWidth <= this.yPos+enemyHeight/2
            && bullet.displacement.x-bullet.bulletWidth >= this.xPos
            && bullet.displacement.x+bullet.bulletWidth <= this.xPos+enemyWidth) {
        return true;
      }
    }
    return false;
  }
}
