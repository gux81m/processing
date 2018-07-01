float zoff = 0;
float inc = 0.02;
float zinc = 0.001;
int scale = 1;
int cols, rows;
ArrayList<Particle> particles = new ArrayList();
int particleNumber = 10000;
float maxVelocity = 6;
float flowFieldMagnitude = 1;
int particleAlpha = 5;
int backgroundColor = 255;
int particleColor = 0;

void setup() {
  size(1200, 900, P2D);
  cols = floor(width / scale);
  rows = floor(height / scale);
  background(backgroundColor);
  noiseDetail(4);
  for(int i = 0; i < particleNumber; i++) {
    particles.add(new Particle());
  }
}

void draw() {
  zoff += zinc;
  for(Particle p : particles) {
    p.follow(zoff);
    p.update();
    p.show();
    p.edges();
  }
  println(frameRate);
}