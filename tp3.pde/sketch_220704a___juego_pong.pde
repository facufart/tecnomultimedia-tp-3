PImage img;
int px, py;
float posX;
float posY;
float velocidadX;
float velocidadY;
boolean gameOver=true;

void setup() {
  size (400, 400); 
  img= loadImage("fondo.jpg");
  rectMode(CENTER);
  posX = width/2;
  posY = height/2;
  velocidadX = (int)random(1, 9);
  velocidadY = (int)random(1, 9);
}

void draw () {
  background(255);
  fill (225);
  image(img, 0, 0);

  if (gameOver==true) {
    text("GAME OVER", 158, height/2, 300);
  } else {
    text("JUGAR", width/2, height/2);
    ellipse(posX, posY, 10, 10);
    ellipse(posX, posY, 10, 10);
    rect(mouseX, height*0.9, 80, 10);
    if (posX>width) {
      velocidadX = -1*velocidadX;
      posX = width;
    } else if (posX<0) {
      velocidadX = -1*velocidadX;
      posX = 0;
    } else if (posY<0) {
      velocidadY = -1*velocidadY;
      posY = 0;
    } else if (posY>height) {
      velocidadY = -1*velocidadY;
      posY = height;
    }
    if (posX > mouseX-30 && posX < mouseX+30
      && posY > 0.9*height-5
      && posY < 0.9*height+5) {
      velocidadY = -1*velocidadY;
    }
    if (posY==height) {
      posX = width/2;
      posY = height/2;
      gameOver = true;
    }

    

      posX = posX + velocidadX;
    posY = posY + velocidadY;
  }
}

void keyPressed() {

  if (gameOver==true) {
    gameOver = false;
  }
}
