/*
Madie Arcemont
 Final Project: Snake Game
 
 Requirements: 
 A grid-based model for the game environment. This should involve at least one new class definition.
 A Snake class to represent parts of the board currently belong to the snake’s body
 A method to represent where the next food square is. Each time one is eaten, a new one must appear. 
 Food squares should NEVER appear on top of the snake. In other words, if a square belongs to the snake’s body, 
 it is not a valid option to place the next food square.
 Handling keyboard input to control the direction the snake moves.
 Timer functionality to update the snake’s position and allow the user time to make a move before the next update. 
 The snake should move one square per some fixed amount of time.
 Loss detection and game reset functionality. Typically, there is no way to “win” snake - 
 you just a score at the end that is how long the snake is.
 
 Week 4: implement loss detection, score reporting, and a way to reset the game.
 */

Snake mySnake = new Snake();
Apple a;
int appleX = round(random(0, width));
int appleY = round(random(0, height));
int snakeX = round(random(0, width));
int snakeY = round(random(0, height));

void setup() {
  size(500, 500);
  a = new Apple();
}

void draw() {
  background(0);
  a.display();
  mySnake.drawSnake();
  mySnake.moveSnake();
  mySnake.checkEdges();
  eatApple();
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
    mySnake.addLength();
  }
}

void eatApple() {
  if (snakeX > appleX && snakeX < appleX+ 30 && snakeY > appleY && snakeY < appleY+ 30) {
    appleX = round(random(0, width));
    appleY = round(random(0, height));
    a.display();
    mySnake.addLength();
    println("eaten");
  }
}