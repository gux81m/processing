float xoffset = 0;
float yoffset = 0;
float increment = 0.01;

void setup() {
  size(600, 600);
  noiseDetail(4, 0.1);
}

void draw() {
  loadPixels();
  yoffset = 0;
  for(int y = 0; y < height - 1; y++) {
    xoffset = 0;
    for(int x = 0; x < width - 1; x++) {
      int index = x + y * height;
      int r = (int) (255*noise(xoffset, yoffset));
      color c = color(r, r, r);
      pixels[index] = c;
      xoffset += increment;
    }
    yoffset += increment;
  }
  updatePixels();
}