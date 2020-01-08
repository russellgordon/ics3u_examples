float lineHeight = 0;
float iterations = 0;

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
  println(iterations);
 
  // translate origin to bottom left of screen
  translate(0, height);

  // flip axes (so y increases going upwards)
  scale(1, -1);

  // Get a random height
  lineHeight = random(0, height);
  
  // Show line height in console
  println(lineHeight);

  // Draw a line with a fixed height
  // x1, y1, x2, y2
  line(iterations, 0, iterations, lineHeight);
  
  // When we've reached end of the width of the screen, stop animating
  if (frameCount > width) {
     noLoop(); 
  }
  
}
