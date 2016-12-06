class Snake {
  int xSpeed = 2;
  int ySpeed = 0;
  boolean up = false;
  boolean down = false;
  boolean left = false;
  boolean right = false;
  int snakeSize = 20; //width of the snake
  int snakeLength = 20; //length of the snake
  float[] snakeXs = new float[snakeLength];
  float[] snakeYs = new float[snakeLength];

  //draw the snake (start with one square - appears randomly)
  void shiftDown() {
    for (int i = snakeLength - 1; i > 0; i--) {
      snakeXs[i]= snakeXs[i-1];
      snakeYs[i]= snakeYs[i-1];
    }
  }
  void drawSnake() {
    shiftDown();
    for (int i = 0; i < snakeLength; i++) {
      fill(0, 225, 100);
      noStroke();
      rect(snakeXs[i], snakeYs[i], snakeSize, snakeSize);
      checkEdges();
    }
  }

  void moveSnake() {
    snakeXs[0] = snakeX;
    snakeYs[0] = snakeY;
    snakeX = snakeX+xSpeed;
    snakeY = snakeY+ySpeed;
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
    return snakeX <= 0 && xSpeed < 0;
  }
  boolean rightCollision() {
    return snakeX >= width - snakeSize && xSpeed > 0;
  }
  boolean topCollision() {
    return snakeY <= 0 && ySpeed < 0;
  }
  boolean bottomCollision() {
    return snakeY >= height - snakeSize && ySpeed > 0;
  }

  void addLength() {
    float[] tempXs = new float[snakeLength];
    float[] tempYs = new float[snakeLength];
    for (int i=0; i<snakeLength; i++) {
      tempXs[i] = snakeXs[i];
    }
    for (int i=0; i<snakeLength; i++) {
      tempYs[i] = snakeYs[i];
    }  
    int oldsnakelength = snakeLength;
    snakeLength= snakeLength+7;
    snakeXs = new float [snakeLength];
    snakeYs = new float [snakeLength];
    for (int i=0; i<oldsnakelength; i++) {
      snakeXs[i] = tempXs[i];
    }
    for (int i=0; i<oldsnakelength; i++) {
      snakeYs[i] = tempYs[i] ;
    }
  }

  void gamelost() {
    for (int i=1; i<snakeLength; i++) {
      if ((snakeXs[i] == snakeX) && (snakeYs[i] == snakeY)) {
        println("lose");
        gamelost = true;
      }
    }
  }
}