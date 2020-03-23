class LeBagette {
  float x; //x souřadnice letadla
  int y; //y souřadnice letadla
  float prom; //Něco ellipsy (hitbox) letadla (používá se při detekci zásahu protiletadlovým dělostřelectvem)
  PImage img; //Obrázek letadla
  LeBagette() {
    y = 50;
    x = 0-200;
    img = loadImage("bageta.png");
    prom = 200 + 15;
  }
  void wrk() {
    x+=1;
    if (vyska==3) {
      if (y!=50) {
        if (y<50) {
          y+=1.5;
        } else {
          y-=1.5;
        }
      }
    }
    if (vyska==2) { 
      if (y!=height/3) {
        if (y<height/3) {
          y+=1.5;
        } else {
          y-=1.5;
        }
      }
    }
    if (vyska==1) {
      if (y!=height/2+50) {
        if (y<height/2+50) {
          y+=1.5;
        } else {
          y-=1.5;
        }
      }
    }
  }
  void display() {
    image(img, x, y);
    noStroke();
    noFill();
    ellipse(x, y+2, 200, 15);
    fill(0);
    stroke(0);
  }
}
