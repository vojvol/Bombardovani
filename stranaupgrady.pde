class upgrady {
  int point; //Upgrade body
  PImage img; //Obrázek pumy
  PImage img2; //Obrázek letadla
  int name; //Typ pumy
  int maxbhm; //Maximální hmotnost pum co může letadlo nést
  int maxbcount; //Maximální počet pum co může letadlo nést
  boolean show; //Lze vylepšit hmotnost pumy
  boolean show2; //Lze vylepšit počet pum
  boolean upgrad; //Lze vylepšit letadlo
  upgrady() {
    point = 0;
    show = true;
    show2 = true;
  }
  void display() {
    if (bhm == 16) {
      img = loadImage("16lb.png");
      name = 1;
    } else if ( bhm == 100) {
      img = loadImage("100lb.png");
      name = 2;
    } else if (bhm == 501) {
      img = loadImage("Fritz.png");
      name = 3;
    }
    background(160);
    fill(0);
    if (let == 3) {
      maxbhm = 501;
      maxbcount = 10;
      img2 = loadImage("Dornier.png");
      if (name == 1) {
        text("Šestnáctiliberní puma", width/2, height/2-30);
      }
      if (name == 2) {
        text("Stoliberní puma", width/2, height/2-30);
      }
      if (name == 3) {
        text("Náváděná puma FritzX", width/2, height/2-30);
        maxbcount = 1;
      }
      text("Počet pum: " + bcount + " kus/ů.", width/2, height-30);
      text("Letadlo: \n Dornier Do 217", width/2, 30);
      text("Počet bodů: "+point, 10, 30);

      image(img, width/2, height/2);
      image(img2, width/2+100, 100);
      noFill();
      if (bcount==maxbcount) {
        show2 = false;
      } else show2 = true;
      if (bhm==maxbhm) {
        show = false;
      } else show = true;
      if (show2 == false && show == false) {
        upgrad = true;
      } else upgrad = false;
      circle(150, height/2, 100);
      text("START", 110, height/2+10);
      if (upgrad == true) {
        circle(width/2 - 100, 100, 100);
        text("Vylepšit", width/2-140, 100);
        show = false;
        show2 = false;
      }
      if (show == true) {
        circle(width/2 - 100, height/2, 100);
        text("Vylepšit", width/2-140, height/2);
      }
      if (show2 == true) {
        circle(width/2 - 100, height-100, 100);
        text("Vylepšit", width/2-140, height-100);
      }
    }
    if (let == 2) {
      maxbhm =100;
      maxbcount = 10;
      img2 = loadImage("b17.png");
      if (name == 1) {
        text("Šestnáctiliberní puma", width/2, height/2-30);
      }
      if (name == 2) {
        text("Stoliberní puma", width/2, height/2-30);
      }
      text("Počet pum: " + bcount + " kus/ů.", width/2, height-30);
      text("Letadlo: \n Boeing B-17", width/2, 30);
      text("Počet bodů: "+point, 10, 30);

      image(img, width/2, height/2);
      image(img2, width/2+100, 100);
      noFill();
      if (bcount==maxbcount) {
        show2 = false;
      } else show2 = true;
      if (bhm==maxbhm) {
        show = false;
      } else show = true;
      if (show2 == false && show == false) {
        upgrad = true;
      } else upgrad = false;
      circle(150, height/2, 100);
      text("START", 110, height/2+10);
      if (upgrad == true) {
        circle(width/2 - 100, 100, 100);
        text("Vylepšit", width/2-140, 100);
        show = false;
        show2 = false;
      }
      if (show == true) {
        circle(width/2 - 100, height/2, 100);
        text("Vylepšit", width/2-140, height/2);
      }
      if (show2 == true) {
        circle(width/2 - 100, height-100, 100);
        text("Vylepšit", width/2-140, height-100);
      }
    } else if (let == 1) {
      maxbhm = 16;
      maxbcount = 5;
      img2 = loadImage("bageta.png");
      if (name == 1) {
        text("Šestnáctiliberní puma", width/2, height/2-30);
      }
      text("Počet pum: " + bcount + " kus/ů.", width/2, height-30);
      text("Letadlo: \n Marcel Bloch MB.200 BN4", width/2, 30);
      text("Počet bodů: "+point, 10, 30);

      image(img, width/2, height/2);
      image(img2, width/2+100, 100);
      noFill();
      if (bcount==maxbcount) {
        show2 = false;
      } else show2 = true;
      if (bhm==maxbhm) {
        show = false;
      } else show = true;
      if (show2 == false && show == false) {
        upgrad = true;
      } else upgrad = false;
      circle(150, height/2, 100);
      text("START", 110, height/2+10);
      if (upgrad == true) {
        circle(width/2 - 100, 100, 100);
        text("Vylepšit", width/2-140, 100);
        show = false;
        show2 = false;
      }
      if (show == true) {
        circle(width/2 - 100, height/2, 100);
        text("Vylepšit", width/2-140, height/2);
      }
      if (show2 == true) {
        circle(width/2 - 100, height-100, 100);
        text("Vylepšit", width/2-140, height-100);
      }
    }
  }
  void uplet() {
    if (let<3) {
      if (point>0) {
        bhm = 16;
        bcount = 1;
        if (bcount!= 1 || bcount == 1) {
          bcount = 1;
        }
        let +=1;
        point-=1;
      }
    } else upgrad = false;
  }
  void upshow() {
    if (bhm<maxbhm) {
      if (point>0) {
        if (bhm == 16) {
          bhm = 100;
          point-=1;
        } else if (bhm == 100) {
          bhm = 501;
          point-=1;
          bcount = 1;
        } else show = false;
      }
    } else show = false;
  }
  void upshow2() {
    if (bcount<maxbcount) {
      if (point>0) {
        bcount +=1;
        point-=1;
      }
    } else show2 = false;
  }
}
