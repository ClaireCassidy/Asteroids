class Bullet {
  ArrayList<Bullet> parent;
  final float bulletWidth = width/100;
  final PVector velocity = new PVector().set(0, -10);
  PVector displacement = new PVector();

  Bullet(float xPos, float yPos, ArrayList<Bullet> parent) {
    this. parent = parent;
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
  
  void remove() {
    parent.remove(this);
  }
}
