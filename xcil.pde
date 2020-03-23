class cil {
  PImage img; //Obrázek cíle
  float y; //y souřadnice cíle
  float prom; //Něco ellipsy (hitbox) cíle (používá se při detekci zásahu pumou)
  cil() {
    y = height-100;
    prom = 100 + 10;
  }
  void display(float x, int imag) {
    if (imag==1) img = loadImage("maus.png");
    if (imag==2) img = loadImage("tovarna.png");
    if (imag==3) img = loadImage("sklad.png");
    if (imag==4) img = loadImage("tovarna.png");
    if (imag==5) img = loadImage("sklad.png");
    image(img, x, y);
    noFill();
    noStroke();
    stroke(255, 0, 0);
    ;
    //ellipse(x, y+19, 100, 10);
    stroke(0);
  }
}
