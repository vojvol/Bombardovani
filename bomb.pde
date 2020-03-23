class Bomb {
  float x; //x souřadnice pumy
  float y; //y souřadnice pumy
  int bum; //Velikost výbuchu
  PImage img; //Obrázek pumy
  boolean explode; //Bouchni
  int excount; //Počet explozí (slouží k tomu, aby se efekt výchu ukázal jen jednou)
  boolean work; //Pracuj (pumy padá a ztrácí rychlost vpřed
  boolean zpozdeni; //Slouží k tomu, aby byl mezi pumamy vdálenostní rozdíl
  float xa; //Postupně odebraná rychlost vpřed
  Bomb(int typ) {
    xa = 0.5;
    x = 0-200;
    y = 0 -200;
    explode = false;
    work = true;
    zpozdeni = true;
    imageMode(CENTER);
    if (typ == 16) {
      img = loadImage("16lb.png");
      bum = 5;
    } else if (typ == 100) {
      img = loadImage("100lb.png");
      bum = 10;
    } else if (typ == 501) {
      img = loadImage("Fritz.png");
      bum = 50;
    }
  }
  void display() {
    if (explode == true) {
      //fill(255, 0, 0);
      //circle(x, y, bum);
      //fill(0);
      if (excount == 0) {
        bumsystems.add(new Bumsystem(bum, new PVector(x, y), 5, 85));
        excount +=1;
      }
    } else {
      image(img, x, y);
    }
  }
  void update(float xx, float yy) {
    x= xx;
    y = yy;
  }
  void wrk(float ypos, int i) {
    if (work == true) {
      if (zpozdeni == true) {
        x-=i*5;
        zpozdeni = false;
      } else
        if (xa>0)x +=xa-0.1;
        else x -=0.1;
      y += 1 + ypos;
      if (xa <= 0) xa=1;
    }
  }
  void wrkFritz() {
    if (work== true) {
      y += 1.5;
      if (mouseX<x) {
        x-=1;
      } else if (mouseX>x) {
        x+=1;
      }
    }
  }
  void bum() {
    if (y >= height-90) {
      explode = true;
      work = false;
      hra. hitcil(x, y, bum);
    } else {
      explode = false;
      work = true;
      excount = 0;
    }
  }
}
