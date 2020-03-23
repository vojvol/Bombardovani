class Grafika {
  float treex; //x souřadnice lesa
  float treey; //y souřadnice lesa
  float pondx; //x souřadnice rybníku
  float pondy; //y souřadnice rybníku
  float grassx; //x souřadnice trávníku
  float grassy; //y souřadnice trávníku
  float mrak1x; //x souřadnice mraku1
  float mrak2x; //x souřadnice mraku2
  float mrak3x; //x souřadnice mraku3
  PImage tree; //Obrázek lesa
  PImage pond; //Obrázek rybníku
  PImage grass; //Obrázek trávníku
  PImage mrak1; //Obrázek mraku1
  PImage mrak2; //Obrázek mraku2
  PImage mrak3; //Obrázek mraku3
  boolean generate; //Generuj
  Grafika() {
    tree = loadImage("les.png");
    pond= loadImage("pond.png");
    grass = loadImage("grass.png");
    mrak1 = loadImage("mra.png");
    mrak2 = loadImage("mr.png");
    mrak3 = loadImage("mrk.png");   
    generate = false;
  }
  void wrk() { //souřadnice a samotná funkčnost
    if (generate == true) {
      treex = random(50, width-50);
      treey = random(height-75, height-25);
      pondx = random(50, width-50);
      pondy = random(height-75, height-25);
      grassx = random(50, width-50);
      grassy = random(height-75, height-25);
      mrak1x = random(0, width/3);
      mrak2x = random(width/3, width/1.5);
      mrak3x = random(width/1.5, width);
      generate = false;
    } else {
      // zobrazování
      image(pond, pondx, pondy); //rybník
      image(tree, treex, treey); //les
      image(grass, grassx, grassy); //trávník
    }
  }
  void displaymrak() {//tato část je kvůli průhlednosti mraků
    image(mrak1, mrak1x, height/3); //první mrak
    image(mrak2, mrak2x, height/3); //druhý mrak
    image(mrak3, mrak3x, height/3); //třetí mrak
  }
}
