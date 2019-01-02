class Bullet {
  ArrayList<Bullet> parent;
  final float bulletWidth = width/100;
  PVector velocity = new PVector().set(0, -10);
  PVector displacement = new PVector();
  PImage sprite;

  Bullet(float xPos, float yPos, ArrayList<Bullet> parent, int bulletType) {
    this.parent = parent;
    displacement.set(xPos, yPos);
    if (bulletType == BULLET_TYPE_PLAYER) {
      sprite = bulletPlayer;
    } else if (bulletType == BULLET_TYPE_ENEMY) {
      sprite = bulletEnemy;
    }
  }

  void render() {
    //ellipse(displacement.x, displacement.y, bulletWidth, bulletWidth);
    image(sprite, displacement.x, displacement.y);
  }

  void update() {
    displacement.add(velocity);
  }
  
  boolean outOfRange() {
     return (displacement.y<0); 
  }
  
  void setVelocity(PVector velocity) {
    this.velocity = velocity;
  }
  
  void remove() {
    parent.remove(this);
  }
}
