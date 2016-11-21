class Snake {
  float x = random(0, width);
  float y = random(0, height);
  float xSpeed = 2;
  float ySpeed = 0;
  boolean up = false;
  boolean down = false;
  boolean left = false;
  boolean right = false;
  int snakeSize = 20; //width of the snake
  float snakelength = snakeSize; //length of the snake

  //draw the snake (start with one square - appears randomly)
  void drawSnake() {
    fill(0, 225, 100);
    rect(x, y, snakeSize, snakeSize);
    checkEdges();

    //increase snake length by score
    //for (int i = 0; i < snakelength; i=i+snakeSize) {
    //  rect(x, y, snakeSize, snakeSize);
    //  snakeSize=snakeSize+20;
    //}
  }

  void moveSnake() {
    x = x+xSpeed;
    y = y+ySpeed;
  }

  void checkDirection() {
    if (up == true) {
      ySpeed = -2;
      xSpeed = 0;
    } else if (down == true) {
      ySpeed = 2;
      xSpeed = 0;
    } else if (right == true) {
      xSpeed = 2;
      ySpeed = 0;
    } else if (left == true) {
      xSpeed = -2;
      ySpeed = 0;
    }
  }

  void checkEdges() {
    if (leftCollision()) {
      xSpeed = 0;
      ySpeed = -2;
    } else if (rightCollision()) {
      xSpeed = 0;
      ySpeed = 2;
    } else if (topCollision()) {
      ySpeed = 0;
      xSpeed = 2;
    } else if (bottomCollision()) {
      ySpeed = 0;
      xSpeed = -2;
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
}