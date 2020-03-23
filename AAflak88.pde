class flak88 {
  float xvystrel; //x souřadnicec výstřelu (tuto souřadnici používá logická část hry)
  float yvystrel; //y souřadnicec výstřelu (tuto souřadnici používá logická část hry)
  float xvystrelefekt; //x souřadnice efektu výstřelu
  float yvystrelefekt; //y souřadnice efektu výstřelu
  PImage img; //Obrázek protiletadlového kanónu
  int tim; //Čas mezi výstřely
  boolean shot; //Vystřeleno
  flak88() {
    img = loadImage("Flak88.png");
    tim = 5;
    xvystrel = width+width;
    yvystrel = height+height;
    shot = false;
  }
  void display(float AAx) {
    image(img, AAx, height-60);
    if (shot==true) {
      fill(255, 0, 0);
      noStroke();
      noFill();
      circle(xvystrel, yvystrel, 20);
      fill(0);
      stroke(0);
      hra.updat(); 
      reset();
    }
  }
  void wrk() {
    if (t3.complete()==true) {
      shot = false;
      if (tim >0) {
        tim--;
        t3.start();
      } else {
        tim = 5;
        xvystrel = random(0, width);
        yvystrel = random(50, 0);
        shot = true;
      }
    }
  }
  void reset() {
    shot = false;
    xvystrelefekt = xvystrel;
    yvystrelefekt = yvystrel;
    systems.add(new ParticleSystem(50, new PVector(xvystrelefekt, yvystrelefekt), 5, 85));
    xvystrel = width+width;
    yvystrel= height+height;
  }
}
