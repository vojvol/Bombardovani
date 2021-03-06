class B17 {
  float x; //x souřadnice letadla
  float xnepresnost; //x nepřesnost zaměřovače
  float xzamerovac; //x souřadnice zaměřovače
  int y; //y souřadnice letadla
  PImage img; //Obrázek letadla
  PImage imgzamerovac; //Záměrný kříž
  float prom; //Něco ellipsy (hitbox) letadla (používá se při detekci zásahu protiletadlovým dělostřelectvem)
  B17() {
    y = 0+50;
    x = 0-200;
    img = loadImage("b17.png");
    imgzamerovac = loadImage("aim.png");
    xnepresnost = random(-50, 50);
    prom = 200+15;
  }
  void wrk() {
    x+=1.5;
    xzamerovac = x+250 + xnepresnost;
    if (vyska==3) {
      if (y!=50) {
        if (y<0+50) {
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
    if (vyska==3)image(imgzamerovac, xzamerovac, height-100);
    else if (vyska==2)image(imgzamerovac, xzamerovac-80, height-100);
    else if (vyska==1)image(imgzamerovac, xzamerovac-140, height-100);
    noStroke();
    noFill();
    ellipse(x, y+10, 200, 15);
    fill(0);
    stroke(0);
  }
}
