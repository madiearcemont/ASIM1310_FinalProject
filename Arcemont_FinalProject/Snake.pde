class Snake {
  int speed = 10;
  int xSpeed = speed;
  int ySpeed = 0;
  boolean up = false;
  boolean down = false;
  boolean left = false;
  boolean right = false;
  int snakeSize = 20; //width of the snake
  int snakeLength = 10; //length of the snake
  float[] snakeXs = new float[snakeLength];
  float[] snakeYs = new float[snakeLength];
  long time = 100;

  void shiftDown() {
    for (int i = snakeLength - 1; i > 0; i--) {
      snakeXs[i]= snakeXs[i-1];
      snakeYs[i]= snakeYs[i-1];
    }
  }

  void drawSnake() {
    for (int i = 0; i < snakeLength; i++) {
      fill(0, 225, 100);
      noStroke();
      rect(snakeXs[i], snakeYs[i], snakeSize, snakeSize);
      checkEdges();
    }
  }

  void moveSnake() {
    shiftDown();
    snakeXs[0] = snakeX;
    snakeYs[0] = snakeY;
    snakeX = snakeX+xSpeed;
    snakeY = snakeY+ySpeed;
    time += 100;
  }

  void checkDirection() {
    if (up == true) {
      ySpeed = -speed;
      xSpeed = 0;
    } else if (down == true) {
      ySpeed = speed;
      xSpeed = 0;
    } else if (right == true) {
      xSpeed = speed;
      ySpeed = 0;
    } else if (left == true) {
      xSpeed = -speed;
      ySpeed = 0;
    }
  }

  void checkEdges() {
    if (leftCollision()) {
      xSpeed = 0;
      ySpeed = -speed;
    } else if (rightCollision()) {
      xSpeed = 0;
      ySpeed = speed;
    } else if (topCollision()) {
      ySpeed = 0;
      xSpeed = speed;
    } else if (bottomCollision()) {
      ySpeed = 0;
      xSpeed = -speed;
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
    for (int i = oldsnakelength; i < snakeLength; i++) {
      snakeXs[i] = -100;
      snakeYs[i] = -100;
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