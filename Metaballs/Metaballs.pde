int numberOfParticles = 6;
ArrayList<Particle> particles = new ArrayList();

void setup() {
  size(640, 480);
  colorMode(HSB);
  background(0);
  for(int i = 0; i < numberOfParticles; i++) {
    particles.add(new Particle());
  }
}

void draw() {
  background(0);
  loadPixels();
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int index = x + y * width;
      float c = 0;
      for(Particle p : particles) {
        c += p.radius / dist(x, y, p.position.x, p.position.y);
      }
      pixels[index] = color(c, 255, 255);
    }
  }
  updatePixels();
  
  for(Particle p : particles) {
    p.update();
    p.edges();
    //p.show();
  }
}