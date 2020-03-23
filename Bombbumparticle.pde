class Bumparticle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int velikost;

  Bumparticle(PVector l, int big, float life) {
    acceleration = new PVector(0, 0.03);
    velocity = new PVector(random(-0.5, 0.5), random(-1, -5));
    location = l.get();
    lifespan = life;
    velikost = big;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    noStroke();
    fill(255, lifespan, 0);
    circle(location.x, location.y, velikost);
    stroke(0);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
