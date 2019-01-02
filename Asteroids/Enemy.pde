class Enemy {

  float xPos;
  float yPos;

  final int DOWN = 0;
  final int RIGHT = 1;
  final int LEFT = -1;

  PVector velocity;

  float jumpDistance;

  Enemy(float xPos, float yPos, float jumpDistance) {
    this.xPos = xPos;
    this.yPos = yPos;

    this.jumpDistance = jumpDistance;

    velocity = new PVector(jumpDistance, 0);
  }

  void update(int direction) {
    if (direction == DOWN) {
      velocity.set(0, enemyHeight);
    } else if (direction == RIGHT) {
      velocity.set(jumpDistance, 0);
    } else if (direction == LEFT) {
      velocity.set(-jumpDistance, 0);
    }

    xPos += velocity.x;
    yPos += velocity.y;
  }

  void render() {
    //rectMode(CENTER);
    //rect(xPos, yPos, enemyWidth, enemyHeight);
    image(enemy, xPos, yPos);
  }

  boolean isColliding() {
    for (Bullet bullet : player.onScreenBullets) {
      if (bullet.displacement.y-bullet.bulletWidth <= this.yPos+enemyHeight/2
        && bullet.displacement.x+bullet.bulletWidth >= this.xPos
        && bullet.displacement.x-bullet.bulletWidth <= this.xPos+enemyWidth) {
        bullet.remove();
        return true;
      }
    }
    return false;

    //return rightPressed;
  }

  boolean isOutOfBounds() {
    //return yPos>height-(height/15);
    return yPos >= 3*height/4;
  }
}
