class Bullet {
  final float bulletWidth = width/100;
  final PVector velocity = new PVector().set(0, -10);
  PVector displacement = new PVector();

  Bullet(float xPos, float yPos) {
    displacement.set(xPos, yPos);
  }

  void render() {
    //ellipse(displacement.x, displacement.y, bulletWidth, bulletWidth);
    image(bullet, displacement.x, displacement.y);
  }

  void update() {
    displacement.add(velocity);
  }
  
  boolean outOfRange() {
     return (displacement.y<0); 
  }
}
