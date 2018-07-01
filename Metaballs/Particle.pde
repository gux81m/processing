class Particle {
  PVector position;
  PVector velocity;
  float radius;
  
  Particle() {
    position = new PVector(random(width), random(height));
    velocity = PVector.random2D();
    velocity.mult(random(3, 5));
    radius = random(800, 1500);
  }
  
  void update() {
    position.add(velocity);
  }
  
  void edges() {
    if (position.x > width - 1 || position.x < 0) {
      velocity.x = - velocity.x;
      update();
    }
    if (position.y > height - 1 || position.y < 0) {
      velocity.y = - velocity.y;
      update();
    }
  }
  
  void show() {
    stroke(255);
    //ellipse(position.x, position.y, 1, 1);
  }
}