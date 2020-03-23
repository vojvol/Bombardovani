class bofors40 {
  float xvystrel; //x souřadnicec výstřelu (tuto souřadnici používá logická část hry)
  float yvystrel; //y souřadnicec výstřelu (tuto souřadnici používá logická část hry)
  float xvystrelefekt; //x souřadnice efektu výstřelu
  float yvystrelefekt; //y souřadnice efektu výstřelu
  PImage img; //Obrázek protiletadlového kanónu
  int tim; //Čas mezi výstřely
  boolean shot; //Vystřeleno
  bofors40() {
    img = loadImage("bofors.png");
    tim = 3;
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
      circle(xvystrel, yvystrel, 10);
      fill(0);
      stroke(0);
      hra.updat();
      reset();
    }
  }
  void wrk(float planex) {
    if (t.complete()==true) {
      shot = false;
      if (tim > 0) {
        tim--;
        t.start();
      } else {
        tim = 3;
        xvystrel = random(planex-200, planex+200);
        yvystrel= random(height/3-50, height/3+50);
        shot = true;
      }
    }
  }
  void reset() {
    shot = false;
    xvystrelefekt = xvystrel;
    yvystrelefekt = yvystrel;
    systems.add(new ParticleSystem(25, new PVector(xvystrelefekt, yvystrelefekt), 5, 85));
    xvystrel = width+width;
    yvystrel= height+height;
  }
}
