class flak38 {
  float xvystrel; //x souřadnicec výstřelu (tuto souřadnici používá logická část hry)
  float yvystrel; //y souřadnicec výstřelu (tuto souřadnici používá logická část hry)
  float xvystrelefekt; //x souřadnice efektu výstřelu
  float yvystrelefekt; //y souřadnice efektu výstřelu
  PImage img; //Obrázek protiletadlového kanónu
  int tim; //Čas mezi výstřely
  boolean shot; //Vystřeleno
  flak38() {
    img = loadImage("Flak38.png");
    tim = 1;
    xvystrel = width+width;
    yvystrel= height+height;
    shot = false;
  }
  void display(float AAx) {
    image(img, AAx, height-60);
    if (shot==true) {
      fill(255, 0, 0);
      noStroke();
      noFill();
      circle(xvystrel, yvystrel, 5);
      fill(0);
      stroke(0);
      hra.updat();
      reset();
    }
  }
  void wrk(float planex) {
    if (t2.complete()==true) {
      shot = false;
      if (tim >0) {
        tim--;
        t2.start();
      } else {
        tim = 1;
        xvystrel = random(planex+110, planex-110);
        yvystrel = random(height/2+60, height/2+30);
        shot = true;
      }
    }
  }
  void reset() {
    shot = false;
    xvystrelefekt = xvystrel;
    yvystrelefekt = yvystrel;
    systems.add(new ParticleSystem(13, new PVector(xvystrelefekt, yvystrelefekt), 5, 85));
    xvystrel = width+width;
    yvystrel = height+height;
  }
}
