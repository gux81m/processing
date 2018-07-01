float zoff = 0;
float inc = 0.01;
float zinc = 0.0001;
int scale = 1;
int cols, rows;
ArrayList<Particle> particles = new ArrayList();
int particleNumber = 10000;
ArrayList<PVector> flowField = new ArrayList();

void setup() {
  size(1000, 1000, P2D);
  cols = floor(width / scale);
  rows = floor(height / scale);
  background(255);
  noiseDetail(4);
  for(int i = 0; i < particleNumber; i++) {
    particles.add(new Particle());
  }
}

void draw() {
  float yoff = 0;
  flowField.clear();
  for(int y = 0; y < rows; y++) {
    float xoff = 0;
    for(int x = 0; x < cols; x++) {
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 2;
      
      PVector vector = PVector.fromAngle(angle);
      vector.setMag(1);
      flowField.add(vector);
      
      //pushMatrix();
      //  translate(x * scale, y * scale);
      //  rotate(vector.heading());
      //  stroke(255, 100);
      //  strokeWeight(1);
      //  line(0, 0, scale, 0);
      //popMatrix();
      
      xoff += inc;
    }
    yoff += inc;
    zoff += zinc;
  }
  
  for(Particle p : particles) {
    p.follow(flowField);
    p.update();
    p.show();
    p.edges();
  }
  
  println(frameRate);
}