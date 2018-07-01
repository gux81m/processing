int cols, rows;
int scl = 20;
int w = 1600;
int h = 2000;
float flying = 0;

float[][] terrain;

void setup() {
  size(800, 800, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
}

void draw() {
  flying -= 0.1;
  float yoffset = flying;
  for(int y = 0; y< rows; y++) {
    float xoffset = 0;
    for(int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoffset, yoffset), 0, 1, -100, 100);
      xoffset += 0.2;
    }
    yoffset += 0.2;
  }
  
  
  background(0);
  noFill();
  stroke(255);
  translate(width/2, height/2-100);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for(int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y + 1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}