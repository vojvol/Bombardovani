import processing.sound.*; //Knihovna umožňující používat hudbu //<>//

LeBagette bageta; //Marcel Bloch MB.200 BN4
B17 pevnost; //Boeing B-17 Flying Fortress 
Dornier Do; //Dornier Do 217
bofors40 bofors; //Quick fire 40mm Mk.1 A.A. gun
flak88 osm;  //Flugzeugabwehrkanone 88
flak38 triosm; // Flugzeugabwehrkanone 38
menu menu; //Začáteční obrazovka + část st  arající se o soundtrack
hra hra; //Logická část samotné hry
upgrady up; //Vylepšování
cil cil; //Cíl (musíte zasáhnout)
Grafika grap; //Zobrazení grafických efektů (les,jezero,mraky,travnaté pole)
Timer t; //Časovač
Timer2 t2; //Časovač
Timer3 t3; //Časovač

ArrayList<Bomb> bomb; //Pumy
ArrayList<ParticleSystem> systems; //Efekt výbuchu granátu protiletadlového dělostřelectva
ArrayList<Bumsystem> bumsystems; //Efekt výbuch při dopadu pumy
int vyska; //Letvá hladina (3,2,1)
boolean upgrade; //Vylepšovací obrazovka
boolean options; //Začáteční obrazovka
boolean drop; //Je true pokud jsi shodil pumy "Bombs away"
boolean zasah; //Je true pokud jsi zasáhl cíl
boolean KIA; // KIA neboli Killed in Action určuje jestli byl/nebyl sestřelen
int let; //typ letadla
int bhm; // hmotnost pumy
int bcount; // počet pum
int hp; //životy
float xplane; //x souřadnice letadla
float yplane; //y souřadnice letadla
float promplane; //Něco letadla (hitbox) (používá se při detekci zásahu protiletadlovým dělostřelectvem)
float bombposun; //posun bomb v souřadnici y

void setup() {
  fullScreen(P2D);

  upgrade = false;
  zasah = false;
  KIA = false;
  options = true;
  drop = false;
  let = 1; 
  bhm = 16; 
  bcount =1; 
  vyska = 3;
  bombposun = 0;

  pevnost = new B17();
  Do = new Dornier();
  bageta = new LeBagette();
  bomb = new ArrayList();
  systems = new ArrayList<ParticleSystem>();
  bumsystems = new ArrayList<Bumsystem>();
  bofors = new bofors40();
  osm = new flak88();
  triosm = new flak38();
  menu = new menu();
  hra = new hra();
  up = new upgrady();
  cil = new cil();
  t = new Timer(1000);
  t2 = new Timer2(1000);
  t3 = new Timer3(1000);
  grap = new Grafika();
  menu.menusound = new SoundFile(this, "menu.wav"); //Načítání zvuků
  menu.hrasound = new SoundFile(this, "hra.wav");
  menu.startsound = new SoundFile(this, "start.wav");
}
void draw() {
  if (options == true) { //Úvodní obrazovka
    menu.display();
    if (menu.startsound.isPlaying()== false) { //Pokud soundtrack nehraje spustí se soundtrack
      menu.startsound();
    }
  } else if (upgrade == true) {//Vylepšovací obrazovka
    up.display();
    KIA = false;
    if (menu.menusound.isPlaying()== false) {
      menu.menusound();
    }
  } else { 
    if (menu.hrasound.isPlaying()== false) {
      menu.hrasound();
    }
    background(47, 179, 255);
    hra.updat();

    fill(59, 122, 87);
    noStroke();
    quad(0, height-100, width, height-100, width, height, 0, height);
    stroke(0);
    fill(0);
    if (zasah == true && KIA == false && xplane+10>width) { // přežil a zasáhl = bod
      up.point +=1;
      upgrade = true;
    }
    if (xplane>width) {
      text("Pokud jsi se netrefil, zmáčkni R pro návrat do vylepšení.", width/2, height/2);
    }

    if (KIA!=true) {//Samotná hra
      text("Životy: "+hp, 10, 30);
      grap.wrk();
      bofors.display(hra.xAA40);
      bofors.wrk(xplane);
      triosm.display(hra.xAA38);
      triosm.wrk(xplane);
      osm.display(hra.xAA88);
      osm.wrk();
      cil.display(hra.xcil, hra.typcil);
      if (let ==1) {
        bageta.wrk();
        bageta.display();
        xplane = bageta.x;
        yplane = bageta.y;
        promplane = bageta.prom;
      }
      if (let ==2) {
        pevnost.wrk();
        pevnost.display();
        xplane = pevnost.x;
        yplane = pevnost.y;
        promplane = pevnost.prom;
      }
      if (let ==3) {
        Do.wrk();
        Do.display();
        xplane = Do.x;
        yplane = Do.y;
        promplane = Do.prom;
      }
      for (ParticleSystem ps : systems) {
        ps.run();
      }
      for (Bumsystem bs : bumsystems) {
        bs.run();
      }
      for (int i = systems.size()-1; i >= 0; i--) {
        ParticleSystem p = systems.get(i);
        if (p.dead()) {
          systems.remove(i);
        }
      }
      for (int i = bumsystems.size()-1; i >= 0; i--) {
        Bumsystem b = bumsystems.get(i);
        if (b.dead()) {
          bumsystems.remove(i);
        }
      }
      if (drop == true) { //Odhození pum
        for (int i=0; i<bomb.size(); i++) {
          Bomb b = bomb.get(i);
          if (bhm != 501) {
            float bcount2 = bcount;
            b.display();
            b.wrk(bombposun, i);
            b.bum();
            bombposun +=0.1;
            hra.hitcil(b.x, b.y, b.bum);
            if (bombposun >= bcount2/10) bombposun = 0;
          } else {
            b.wrkFritz();
            b.bum();
            b.display();
          }
        }
      } else {
        for (int i=0; i<bomb.size(); i++) {
          Bomb b = bomb.get(i);
          b.update(xplane, yplane);
        }
      }
      hra.detect();
      grap.displaymrak();
    } else {
      text("Byl jsi sestřelen, zmáčkni R pro návrat do vylepšení.", width/2, height/2);
    }
  }
}
void mouseClicked() {
  if (options == true) {//Začátek hry z úvodní obrazovky
    float d = dist(mouseX, mouseY, menu.x, menu.y);
    if (d< 100) {
      options = false;
      hra.generate=true;
      grap.generate = true;
    }
  }
  if (upgrade == true) { //Restart hry po upgrade menu
    float d = dist(mouseX, mouseY, 150, height/2);
    if (d< 100) {
      hra.generate= true;
      grap.generate = true;
      upgrade = false;
      drop = false;
      KIA = false;
      zasah = false;
      if (let == 1) bageta.x=0-200;
      if (let == 2) pevnost.x=0-200;
      if (let == 3) Do.x=0-200;
      vyska = 3;
      for (int i = bomb.size()-1; i >= 0; i--) {
        Bomb b = bomb.get(i);
        b.x = 0-200;
        b.y = 0 -200;
        b.explode = false;
        b.work = true;
        bomb.remove(i);
      }
      for (int i = bumsystems.size()-1; i>=0; i--) {
        Bumsystem b = bumsystems.get(i);
        bumsystems.remove(i);
      }
    }
  }
  if (up.upgrad == true) { //Vylepšení letadla
    float d = dist(mouseX, mouseY, width/2-100, 100);
    if (d< 100) {
      up.uplet();
    }
  }
  if (up.show == true) { //Vylepšení hmotnosti pum (bhm)
    float d = dist(mouseX, mouseY, width/2-100, height/2);
    if (d< 100) {
      up.upshow();
    }
  }
  if (up.show2 == true) { //Vylepšení počtu pum (bcount)
    float d = dist(mouseX, mouseY, width/2-100, height-100);
    if (d< 100) {
      up.upshow2();
    }
  }
}
void keyReleased() {
  if (key == 'y' || key == 'Y') { //Letová hladina 1
    vyska = 1;
  } else if (key == 'a' || key == 'A') { //Letová hladina 2
    vyska = 2;
  } else if (key == 'q' || key == 'Q') { //letová hladina 3
    vyska = 3;
  }
  if (key == 'b' || key == 'B') { //Odhození pum
    drop = true;
  }
  if (key == 'r' || key == 'R') { //Návrat do upgrade menu
    upgrade = true;
  }
}
