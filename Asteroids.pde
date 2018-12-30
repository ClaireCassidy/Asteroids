PImage background;

Ship player;
Bullet testBullet;

void setup() {
  size(1280, 720);
  
  background = loadImage("background.png");
  
  player = new Ship();
  testBullet = new Bullet(width/2, height/2);
}

void draw() {
  image(background,0,0);
  
  player.renderShip();
  player.renderBullets();
  //player.shoot();
  
  testBullet.update();
  testBullet.render();
}

void keyPressed(){
      player.shoot();
      print(player.onScreenBullets.size());
}
