class EnemyTroop {

  final int DOWN = 0;
  final int RIGHT = 1;
  final int LEFT = -1;
  int lastDirection;

  final int numRows;
  final int movesPerRow = 5;
  final int enemiesPerRow = 12;
  final float jumpDistance = enemyWidth;
  final int updateDelay = 1000;
  final int shootDelay = 400;

  int lastUpdateTime = 0;
  int lastShootTime = 2000;

  int moveCounter;

  ArrayList<Enemy> enemies;
  ArrayList<Bullet> bullets;

  EnemyTroop() {
    numRows = 1;
    enemies = new ArrayList<Enemy>();
    initialiseEnemies();
    moveCounter = 1;
    lastDirection = RIGHT;
    bullets = new ArrayList<Bullet>();
  }

  EnemyTroop(int n) {
    numRows = n;
    enemies = new ArrayList<Enemy>();
    initialiseEnemies();
    moveCounter = 1;
    lastDirection = RIGHT;
    bullets = new ArrayList<Bullet>();
  }

  void initialiseEnemies() {
    for (int row = 0; row<numRows; row++) {
      for (int i=0; i<enemiesPerRow; i++) {
        enemies.add(new Enemy(20+i*(enemyWidth+20), (row*enemyHeight)+20, jumpDistance));
      }
    }
  }

  void updateEnemies() {

    for (int i = enemies.size()-1; i>=0; i--) {
      Enemy e = enemies.get(i);
      if (e.isOutOfBounds()) {
        changeGameState(GAME_STATE_OVER);
      }
      if (e.isColliding()) {
        enemies.remove(e);
      }
    }

    int time = millis();
    if (time > lastShootTime + shootDelay) {
      shoot();
      lastShootTime = time;
    }
    updateBullets();
    renderBullets();
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

  void updateBullets() {
    for (int i = bullets.size()-1; i>=0; i--) {
      if (bullets.get(i).displacement.y > height) {
        bullets.remove(i);
      } else {
        bullets.get(i).update();
      }
    }
  }

  void renderBullets() {
    for (Bullet b : bullets) {
      b.render();
    }
  }

  void shoot() {
    Enemy enemy = enemies.get((int)random(0, enemies.size())); // pick a random enemy 
    bullets.add(new Bullet(enemy.xPos, enemy.yPos, bullets, BULLET_TYPE_ENEMY));
    bullets.get(bullets.size()-1).setVelocity(new PVector(0, 5));
  }
}
