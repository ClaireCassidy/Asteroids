class Ship {
  final float yPos = height-(height/5);
  final float shipWidth = width/30;
  final float shipHeight = height/15;
  final int bulletDelay = 500;
  final int shipSpeed = 4;
  float xPos;

  ArrayList<Bullet> onScreenBullets = new ArrayList<Bullet>();

  int lastBulletTime = 0;

  Ship() {
    xPos = width/2;
  }

  void updateShip() {

    if (leftPressed && !rightPressed) {
      moveLeft();
    }
    if (rightPressed && !leftPressed) {
      moveRight();
    }
    if (spacePressed || upPressed) {
      shoot();
    }
  }

  void renderShip() {
    fill(255);
    //triangle(xPos, yPos, xPos-(shipWidth/2), yPos+shipHeight, xPos+(shipWidth/2), yPos+shipHeight);
    image(ship, xPos-shipWidth/2-10, yPos);
  }

  void renderBullets() {
    if (!onScreenBullets.isEmpty()) {
      for (int i = onScreenBullets.size()-1; i>=0; i--) {
        if (onScreenBullets.get(i).outOfRange()) {
          onScreenBullets.remove(i);
        } else {
          onScreenBullets.get(i).update();
          onScreenBullets.get(i).render();
        }
      }
    }
  }

  void shoot() {


    int curTime = millis();
    if (curTime>lastBulletTime+bulletDelay) {
      lastBulletTime = curTime;
      onScreenBullets.add(new Bullet(xPos, yPos));
    }
  }

  void moveRight() {
    if (xPos + shipWidth/2 <= width) {
      xPos+=shipSpeed;
    }
  }

  void moveLeft() {
    if (xPos - shipWidth/2 >=0) {
      xPos-=shipSpeed;
    }
  }
}
