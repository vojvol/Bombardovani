class hra {
  float xAA88; //x souřadnice Flaku 88
  float xAA38; //x souřadnice Flaku 38
  float xAA40; //x souřadnice Boforsu 40
  float xcil; //x souřadnice cíle
  int typcil; //Typ cíle
  boolean generate; //Generuj
  hra() {
    generate = false;
  }

  void updat() {
    if (generate==true) {
      xAA88 = random(0, width);
      xAA38 = random(0, width);
      xAA40 = random(0, width);  
      xcil = random(width/2, width-50);
      typcil = (int)random(1, 5);
      for (int i = 0; i != bcount; i ++) {
        bomb.add(new Bomb(bhm));
      }
      if (bhm == 501) bcount = 1;
      upgrade = false;
      options = false;
      generate = false;
      drop = false;
      if (let ==1) {
        hp=10;
      }
      if (let ==2) {
        hp=20;
      }
      if (let ==3) {
        hp =15;
      }
    }
  }
  void hitcil(float x, float y, int prumer) { //Detekce zásahu cíle
    float hitc = dist(x, y, xcil, cil.y+19);
    if (hitc < (prumer/2+ cil.prom/2)) {
      zasah = true;
    }
  }
  void detect() {
    float hit38 = dist( xplane, yplane, triosm.xvystrel, triosm.yvystrel); //Detekce zásahu Flakem 38
    if (hit38 < (promplane/2+ 5/2)) {
      hp-=1;
      triosm.reset();
    }
    float hit40 = dist(xplane, yplane, bofors.xvystrel, bofors.yvystrel); //Detekce zásahu Foforsem 40
    if (hit40 < (promplane/2+ 10/2)) {
      hp-=2;
      bofors.reset();
    }
    float hit88 = dist(xplane, yplane, osm.xvystrel, osm.yvystrel); //Detekce zásahu Flakem 88
    if (hit88 < (promplane/2+ 20/2)) {
      hp-=5;
      osm.reset();
    }
    if (hp==0||hp<0) KIA = true;
  }
}
