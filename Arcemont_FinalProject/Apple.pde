class Apple {
  PImage img;

  Apple() {
    img = loadImage("apple.jpg");
  }
  void display () {
    image(img, appleX, appleY, 25, 25);
  }
}
//Clipart Source: http://wikiclipart.com/apple-clipart_449/