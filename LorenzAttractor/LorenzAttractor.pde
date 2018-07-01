import peasy.*;

float x = 1;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
//float b = 15;
//float b = 14;
//float b = 13;
float c = 8.0/3.0;

float dt = 0.01;
float rotation = 0;

ArrayList<PVector> points = new ArrayList();

PeasyCam cam;

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 100);
}

void draw() {
  background(0);
  float dx = a * (y - x) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z) * dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;
  points.add(new PVector(x, y, z));
  
  noFill();
  translate(width/2, height/2);
  scale(3);
  //rotateY(rotation);
  beginShape();
  float hu = 0;
  for(PVector p : points) {
    //PVector rv = PVector.random3D();
    //rv.setMag(0.1);
    //p.add(rv);
    stroke(hu, 255, 255);
    vertex(p.x, p.y, p.z);
    hu += 0.1;
    if (hu == 255) {
      hu = 0;
    }
  }
  endShape();
  rotation += PI/200;
}