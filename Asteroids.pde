float enemyWidth;
float enemyHeight;

PImage background;
PImage enemy;
PImage ship;
PImage bullet;

boolean spacePressed = false;
boolean upPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

ArrayList<EnemyTroop> troops;

Ship player;

void setup() {
  size(1280, 720);

  enemyWidth = width/20;
  enemyHeight = height/20;

  background = loadImage("background.png");
  enemy = loadImage("enemy.png");
  ship = loadImage("ship.png");
  bullet = loadImage("bullet.png");

  player = new Ship();
  troops = new ArrayList<EnemyTroop>();
  troops.add(new EnemyTroop());

  print(player.shipHeight);
}

void draw() {
  image(background, 0, 0);
  
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
  
  for (EnemyTroop e:troops) {
    counter+=e.troopSize();
  }
  
  if (((double)counter/((double)troops.size()*15))<0.34) {
    troops.add(new EnemyTroop());
  }
}
