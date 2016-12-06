/*
Madie Arcemont
 Final Project: Snake Game
 ASIM 1310: Art & Code
 */
 
 //Ask professor quick about timer-based movements

Snake mySnake = new Snake();
Apple a;
int appleX = round(random(0, width-25));
int appleY = round(random(0, height-25));
int snakeX = round(random(0, width));
int snakeY = round(random(0, height));
boolean gamelost = false;
boolean startscreen = true;

void setup() {
  size(400, 400);
  a = new Apple();
  gamelost = false;
}

void draw() {
  if (startscreen == true) {
    startScreen();
  } else if (startscreen == false) {
    gameplay();
  }
}

void gameplay() {
  if (gamelost == false) {
    background(0);
    a.display();
    mySnake.gamelost();
    mySnake.drawSnake();
    mySnake.moveSnake();
    mySnake.checkEdges();
    eatApple();
    fill(255);
    textSize(30);
    text("Score: " + ((mySnake.snakeLength-20)/7), 0, height-30);
  } else if (gamelost == true) {
    gameOver();
  }
}

void keyPressed() {
  if (keyCode == UP) {
    mySnake.up = true;
    mySnake.down = false;
    mySnake.right = false;
    mySnake.left = false;
  } else if (keyCode == DOWN) {
    mySnake.down = true;
    mySnake.up = false;
    mySnake.right = false;
    mySnake.left = false;
  } else if (keyCode == RIGHT) {
    mySnake.right = true;
    mySnake.left = false;
    mySnake.up = false;
    mySnake.down = false;
  } else if (keyCode == LEFT) {
    mySnake.left = true;
    mySnake.right = false;
    mySnake.up = false;
    mySnake.down = false;
  } 
  mySnake.checkDirection();
  if (key == ' ') {
    startscreen = false;
  }
  if (key == ENTER) {
    reset();
  }
}

void eatApple() {
  if (snakeX > appleX-5 && snakeX < appleX+ 30 && snakeY > appleY-5 && snakeY < appleY+ 30) {
    appleX = round(random(0, width-30));
    appleY = round(random(0, height-30));
    a.display();
    mySnake.addLength();
    println("eaten");
  }
}

void gameOver() {
  background(255, 0, 0);
  textSize(60);
  text("Game Over!", 20, 60); //FIX THIS
  textSize(20);
  text("Your final score was " + ((mySnake.snakeLength-20)/7) + ".", 30, 120);
  text("Hit enter to play again.", 35, 200);
}

void startScreen() {
  background(0, 225, 100);
  textSize(20);
  fill(255);
  text("Use the arrow keys to move the snake", 15, 20);
  text("& make him eat the apples,", 65, 45);
  text("but don't let him run into himself!", 35, 70);
  text("You'll lose!", 140, 95);
  text("Hit the spacebar to start the game!", 30, 200);
  text("Hit enter at any time to return to", 40, 250);
  text("this home screen.", 115, 275);
}

void reset() {
  mySnake.snakeXs = new float [mySnake.snakeLength];
  mySnake.snakeYs = new float [mySnake.snakeLength];
  startscreen = true;
  gamelost = false;
  mySnake.snakeLength = 20;
}