class Bumsystem {

  ArrayList<Bumparticle> bumparticles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are birthed

  Bumsystem(int num, PVector v, int big, float life) {
    bumparticles = new ArrayList<Bumparticle>();   // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      bumparticles.add(new Bumparticle(origin, big, life));    // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    for (int i = bumparticles.size()-1; i >= 0; i--) {
      Bumparticle b = bumparticles.get(i);
      b.run();
      if (b.isDead()) {
        bumparticles.remove(i);
      }
    }
  }

  void addParticle() {
    //particles.add(new Particle(origin));
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (bumparticles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}
