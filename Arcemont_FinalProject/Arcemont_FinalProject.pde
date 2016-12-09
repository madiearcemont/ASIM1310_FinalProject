/*
 Madie Arcemont
 Final Project: Snake Game
 ASIM 1310: Art & Code
*/

int updateRate = 10;
Snake mySnake;
Apple a;
int appleX; 
int appleY; 
boolean gamelost = false;
boolean startscreen = true;
int moves = 0;
int snakeX;
int snakeY;

void setup() {
  snakeX = round(random(0, width));
  snakeY = round(random(0, height));
  size(400, 400);
  a = new Apple();
  gamelost = false;
  appleX = round(random(10, width-25));
  appleY = round(random(10, height-25));
  mySnake = new Snake();
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
    if (frameCount % updateRate == 0) {
      mySnake.moveSnake();
      mySnake.checkEdges();
      moves++;
    }
    eatApple();
    fill(255);
    textSize(30);
    text("Score: " + ((mySnake.snakeLength-10)/7), 0, height-30);
  } else if (gamelost == true) {
    gameOver();
  }
}

void keyPressed() {
  if (keyCode == UP && mySnake.ySpeed <=0) {
    mySnake.up = true;
    mySnake.down = false;
    mySnake.right = false;
    mySnake.left = false;
  } else if (keyCode == DOWN && mySnake.ySpeed >=0) {
    mySnake.down = true;
    mySnake.up = false;
    mySnake.right = false;
    mySnake.left = false;
  } else if (keyCode == RIGHT && mySnake.xSpeed >=0) {
    mySnake.right = true;
    mySnake.left = false;
    mySnake.up = false;
    mySnake.down = false;
  } else if (keyCode == LEFT && mySnake.xSpeed <=0) {
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
  if (snakeX > appleX-5 && snakeX < appleX+ 30 && snakeY > appleY-5 && snakeY < appleY+ 30 || key == 'm') {
    appleX = round(random(0, width-30));
    appleY = round(random(0, height-30));
    for (int i=0; i<mySnake.snakeXs.length; i++) {
      if (appleX < mySnake.snakeXs[i]-25 && appleX > mySnake.snakeXs[i]+25 && appleY < mySnake.snakeYs[i]-25 && appleY > mySnake.snakeYs[i]+25) {
        appleX = round(random(0, width-30));
        appleY = round(random(0, height-30));
        println("relocated");
      }
    }
    a.display();
    mySnake.addLength();
    println("eaten");
  }
}

void gameOver() {
  background(255, 0, 0);
  textSize(60);
  text("Game Over!", 20, 60);
  textSize(20);
  text("Your final score was " + ((mySnake.snakeLength-10)/7) + ".", 80, 120);
  text("Hit enter to play again.", 85, 200);
}

void startScreen() {
  background(0, 225, 100);
  textSize(20);
  fill(255);
  text("Use the arrow keys to move the snake", 15, 30);
  text("& make him eat the apples,", 65, 55);
  text("but don't let him run into himself!", 35, 80);
  text("You'll lose!", 140, 105);
  text("Hit the spacebar to start the game!", 30, 200);
  text("Hit enter at any time to return to", 40, 250);
  text("this home screen & start a new game.", 20, 275);
}

void reset() {
  mySnake.snakeXs = new float [mySnake.snakeLength];
  mySnake.snakeYs = new float [mySnake.snakeLength];
  startscreen = true;
  gamelost = false;
  mySnake.snakeLength = 20;
}