class EnemyTroop {

  final int DOWN = 0;
  final int RIGHT = 1;
  final int LEFT = -1;
  int lastDirection;

  final int movesPerRow = 5;
  final int enemiesPerRow = 12;
  final float jumpDistance = enemyWidth;
  final int updateDelay = 1000;

  int lastUpdateTime = 0;

  int moveCounter;

  ArrayList<Enemy> enemies;

  EnemyTroop() {
    enemies = new ArrayList<Enemy>();
    initialiseEnemies();
    moveCounter = 1;
    lastDirection = RIGHT;
  }

  void initialiseEnemies() {
    for (int i=0; i<enemiesPerRow; i++) {
      enemies.add(new Enemy(20+i*(enemyWidth+20), 20, jumpDistance));
    }
  }

  void updateEnemies() {
    
    for (int i = enemies.size()-1; i>=0; i--) {
        Enemy e = enemies.get(i);
        if (e.isColliding() || e.isOutOfBounds()) {
          enemies.remove(e);
        }
      }
      
    int time = millis();
    if (time > lastUpdateTime + updateDelay) {
      int moveDirection;
      if (moveCounter == movesPerRow) {
        moveDirection = DOWN;
        moveCounter = 0;
        lastDirection*=-1; // swap x direction
      } else {
        moveDirection = lastDirection;
      }

      for (int i = enemies.size()-1; i>=0; i--) {
        Enemy e = enemies.get(i);
        if (e.isColliding() || e.isOutOfBounds()) {
          enemies.remove(e);
        } else {
          e.update(moveDirection);
        }
      }
      moveCounter++;
      lastUpdateTime = time;
    }
  }

  void renderEnemies() {
    for (Enemy enemy : enemies) {
      enemy.render();
    }
  }

  int troopSize() {
    return enemies.size();
  }
}
