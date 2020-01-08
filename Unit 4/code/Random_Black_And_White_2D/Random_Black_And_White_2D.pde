// global variables
int x, y;      // will be used to pick random location on the canvas

// this runs one
void setup() {
  
  // Small canvas to start
  size(400, 400);
  
  // Use HSB color model
  colorMode(HSB, 360, 100, 100);
  
  // Set black stroke for points to be drawn
  fill(0, 0, 100);
  
  // background is white
  background(0, 0, 100);
  
  // Faster animation
  frameRate(120);
    
}

// this runs repeatedly
void draw() {
  
  // Pick random column, or horizontal position
  x = int(random(0, width));
  
  // Pick random row, or vertical position
  y = int(random(0, height));
  
  // Draw a black point at this location 
  point(x, y);
  
}
