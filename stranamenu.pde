class menu {
  float x; //x souřadnice obrázku
  float y; //y souřadnice obrázku
  PImage img; //Obrázek
  SoundFile menusound; //Zvukový soubor
  SoundFile hrasound;
  SoundFile startsound; 
  menu() {
    x = width/2;
    y = height/2;
    img = loadImage("loading.png");
  }
  void display() {
    background(160);
    imageMode(CENTER);
    image(img, x, y);
    imageMode(CORNERS);
    textSize(20);
    noFill();
    circle(x+50, y, 100);
    text("START", x+20, y+10);
  }
  void menusound() {
    hrasound.stop(); //Zastaví přehrávání hrasound
    menusound.amp(0.5); //Nastavá hlasitost menusound na 0.5
    menusound.play(); //Začne přehrávání menusound
  }
  void hrasound() {
    menusound.stop(); //Zastaví přehrávání menusound
    startsound.stop(); //Zastaví přehrávání startsound
    hrasound.amp(1); //Nastavá hlasitost hrasound na 1
    hrasound.play(); //Začne přehrávání hrasound
  }
  void startsound() {
    startsound.amp(0.5); //Nastavá hlasitost startsound na 0.5
    startsound.play(); //Začne přehrávání startsound
  }
}
