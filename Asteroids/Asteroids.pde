float enemyWidth;
float enemyHeight;

PImage background;
PImage enemy;
PImage ship;
PImage bulletPlayer;
PImage bulletEnemy;

boolean spacePressed = false;
boolean upPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

int background1Y;
int background2Y;

final int BULLET_TYPE_PLAYER = 0;
final int BULLET_TYPE_ENEMY = 1;

final int GAME_STATE_MAIN = 0;
final int GAME_STATE_OVER = 1;

ArrayList<EnemyTroop> troops;

Ship player;

int gameState;

void setup() {
  size(1280, 720);

  enemyWidth = width/20;
  enemyHeight = height/20;

  background1Y = 0;
  background2Y = 0-height;

  background = loadImage("background.png");
  enemy = loadImage("enemy.png");
  ship = loadImage("ship.png");
  bulletPlayer = loadImage("bullet.png");
  bulletEnemy = loadImage("bullet_enemy.png");

  player = new Ship();
  troops = new ArrayList<EnemyTroop>();
  troops.add(new EnemyTroop(5));

  print(player.shipHeight);

  gameState = 0;
}

void draw() {
  if (gameState == GAME_STATE_MAIN) {
    runMain();
  } else if (gameState == GAME_STATE_OVER) {
    runGameOver();
  }

  //adjustEnemyQuantity();
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

void adjustEnemyQuantity() {
  int counter = 0;

  for (EnemyTroop e : troops) {
    counter+=e.troopSize();
  }

  if (((double)counter/((double)troops.size()*15))<0.34) {
    troops.add(new EnemyTroop());
  }
}

void scrollBackground() {
  background1Y = (background1Y > height?0-height:background1Y+1);
  background2Y = (background2Y > height?0-height:background2Y+1);
}

void changeGameState(int gameState) {
  this.gameState = gameState;
}

void runMain() {
  scrollBackground();

  image(background, 0, background1Y);
  image(background, 0, background2Y);

  player.updateShip();
  player.renderShip();
  player.renderBullets();

  for (int i=troops.size()-1; i>=0; i--) {
    EnemyTroop enemyTroop = troops.get(i);
    if (enemyTroop.troopSize() == 0) {
      troops.remove(i);
    } else {
      enemyTroop.updateEnemies();
      enemyTroop.renderEnemies();
    }
  }
}

void runGameOver() {
  background(0);
  text("game over", width/2, height/2);
}
