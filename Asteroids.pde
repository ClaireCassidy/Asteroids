float enemyWidth;
float enemyHeight;

PImage background;

boolean spacePressed = false;
boolean upPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

Ship player;

ArrayList<Enemy> enemies;

void setup() {
  size(1280, 720);
  
  enemyWidth = width/20;
  enemyHeight = height/20;


  background = loadImage("background.png");

  player = new Ship();
  
  enemies = new ArrayList<Enemy>();
  initialiseEnemies();
}

void draw() {
  image(background, 0, 0);

  player.updateShip();
  player.renderShip();
  player.renderBullets();
  
  updateEnemies();
  renderEnemies();

  
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

void initialiseEnemies() {
  for (int i=0; i<8; i++) {
    enemies.add(new Enemy(20+i*(enemyWidth+20),20));
  }
}

void updateEnemies() {
  for (int i=enemies.size()-1; i>=0; i--) {
    if (enemies.get(i).isColliding()) {
      enemies.remove(i);
    }
  }
}

void renderEnemies() {
  for (Enemy enemy:enemies) {
    enemy.render();
  }
}
