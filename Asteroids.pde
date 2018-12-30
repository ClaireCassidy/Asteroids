PImage background;

boolean spacePressed = false;
boolean upPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

Ship player;

void setup() {
  size(1280, 720);

  background = loadImage("background.png");

  player = new Ship();
}

void draw() {
  image(background, 0, 0);

  player.updateShip();
  player.renderShip();
  player.renderBullets();
}

void keyPressed() {
  if (key == ' ') {
    spacePressed = true;
  }
  if (keyCode == UP) {
    upPressed = true;
  }
  if (keyCode == LEFT) {
    leftPressed = true;
  }
  if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    spacePressed = false;
  }
  if (keyCode == UP) {
    upPressed = false;
  }
  if (keyCode == LEFT) {
    leftPressed = false;
  }
  if (keyCode == RIGHT) {
    rightPressed = false;
  }
}
