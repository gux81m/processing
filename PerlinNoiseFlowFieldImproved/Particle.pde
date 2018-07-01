class Particle {
  PVector position;
  PVector previousPosition;
  PVector velocity;
  PVector acceleration;
  
  Particle() {
    position = new PVector(random(width), random(height));
    previousPosition = position.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update() {
    previousPosition = position.copy();
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(maxVelocity);
    acceleration.set(new PVector(0, 0));
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void show() {
    stroke(particleColor, particleAlpha);
    line(previousPosition.x, previousPosition.y, position.x, position.y);
  }
  
  void edges() {
    if (position.x > width) position.x = 0;
    if (position.x < 0) position.x = width - 1;
    if (position.y > height) position.y = 0;
    if (position.y < 0) position.y = height - 1;
  }
  
  void follow(float zoff) {
    int x = floor(position.x / scale);
    int y = floor(position.y / scale); 
    float xoff = x * inc;
    float yoff = y * inc;
    float angle = noise(xoff, yoff, zoff) * TWO_PI * 2;
    PVector force = PVector.fromAngle(angle);
    force.setMag(flowFieldMagnitude);
    applyForce(force);
  }
  
}