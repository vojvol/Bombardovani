class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int velikost;

  Particle(PVector l, int big, float life) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 2));
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
    fill(127, lifespan);
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
