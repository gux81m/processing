float xstart = 0;
float xoffset = xstart;
float increment = 0.01;

void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  beginShape();
  xoffset = xstart;
  for(int x = 0; x < width; x++) {
    vertex(x, height*noise(xoffset));
    xoffset += increment;
  }
  xstart += increment;
  endShape();
}