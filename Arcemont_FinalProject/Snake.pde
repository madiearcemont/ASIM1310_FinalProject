class Snake {
  float x = random(0, width);
  float y = random(0, height);
  float xSpeed = 2;
  float ySpeed = 2;
  boolean up = false;
  boolean down = false;
  boolean left = false;
  boolean right = false;
  int snakeSize = 20; //width of the snake
  float snakelength = snakeSize; //length of the snake

  //draw the snake (start with one square - appears randomly)
  void drawSnake() {
    fill(0, 225, 100);
    rect(x, y, snakeSize, snakeSize); //*come back and randomize location later*
    checkEdges();
    x = x+xSpeed;
    y = y+ySpeed;
    //increase snake length by score
    
    //for (int i = 0; i < snakelength; i=i+snakeSize) {
    //  rect(x, y, snakeSize, snakeSize);
    //  snakeSize=snakeSize+20;
    //}
  }
  //start snake moving (random direction)
  void moveSnake() {
    if (up == true) {
      ySpeed = 2;
      xSpeed = 0;
    } else if (down == true) {
      ySpeed = -2;
      xSpeed = 0;
    } else if (right == true) {
      xSpeed = 2;
      ySpeed = 0;
    } else if (left == true) {
      xSpeed = -2;
      ySpeed = 0;
    }
  }

  //edge detection
  void checkEdges() {
    if (leftCollision()) {
      xSpeed = -xSpeed;
    } else if (rightCollision()) {
      xSpeed = -xSpeed;
    }
    if (topCollision()) {
      ySpeed = -ySpeed;
    } else if (bottomCollision()) {
      ySpeed = -ySpeed;
    }
  }

  boolean leftCollision() {
    return x <= 0 && xSpeed < 0;
  }
  boolean rightCollision() {
    return x >= width - snakeSize && xSpeed > 0;
  }
  boolean topCollision() {
    return y <= 0 && ySpeed < 0;
  }
  boolean bottomCollision() {
    return y >= height - snakeSize && ySpeed > 0;
  }

  void keyPressed() {
    if (key == UP) {
      up = true;
      down = false;
      right = false;
      left = false;
    } else if (key == DOWN) {
      down = true;
      up = false;
      right = false;
      left = false;
    } else if (key == RIGHT) {
      right = true;
      left = false;
      up = false;
      down = false;
    } else if (key == LEFT) {
      left = true;
      right = false;
      up = false;
      down = false;
    }
  }
}