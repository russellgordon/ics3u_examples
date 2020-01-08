float lineHeight = 0;
float iterations = 0;
float timeValue = 0;

void setup() {
  
  // canvas
  size(800, 400);
  
  // white background
  background(255, 255, 255);
  
  // how fast the animation goes
  frameRate(30);
  
}

void draw() {
  
  // Increase the counter that tracks the number of iterations
  iterations++;
  println("iteration is: " + iterations);
  
  // Increase the time value for the Perlin noise generator
  timeValue += 0.001;
  println("timeValue is: " + timeValue);

  // translate origin to bottom left of screen
  translate(0, height);

  // flip axes (so y increases going upwards)
  scale(1, -1);

  // Get a random height between 0 and 1
  lineHeight = noise(timeValue);
  
  // Show line height in console
  println("raw value is: " + lineHeight);

  // Convert to height between 0 and 400
  lineHeight = map(lineHeight, 0, 1, 0, height);
  
  // Show line height in console
  println("scaled value is: " + lineHeight);

  // Draw a line with a fixed height
  // x1, y1, x2, y2
  line(iterations, 0, iterations, lineHeight);
  
  // When we've reached end of the width of the screen, stop animating
  if (frameCount > width) {
     noLoop(); 
  }
  
}
