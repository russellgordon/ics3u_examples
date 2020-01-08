void setup() {

  // Create the canvas
  size(500, 500);
  
  // No fill
  noFill();
  
  // Start drawing circles recursively
  drawCircles(height/2, 0);   
}

// drawCircles
//
// Purpose: Draws a series of circles from left to right
//          on the screen, starting large, getting smaller
void drawCircles(float radius, float x) {
  
  // Draw the circle
  //     (x, y, width, height)
  ellipse(x, height/2, radius, radius);
  
  // Set things up for the new circle
  // that will be drawn after the next call
  float newX = x + 15; // Shift left a bit
  float newRadius = radius - 5; // Reduce size a bit
  
  // Make another circle as long as radius remains more than 10
  if (newRadius > 10) {
     drawCircles(newRadius, newX);
  }
  
}
