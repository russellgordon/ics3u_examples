// global variables
int x, y;      // will be used to pick random location on the canvas
float timeValue;  // for moving through time with the Perlin noise
float yOffset;       // offset for y values obtained through Perlin noise 
float noiseValueX, noiseValueY;  // keeps the noise values returned by Perlin noise generator

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
  frameRate(240);
  
  // Initial starting point for yOffset in Perlin noise space
  // Makes sure values returned by Perlin noise generator are distinct for x and y.
  yOffset = random(100, 150); 
  
}

// this runs repeatedly
void draw() {
  
  // Increase point in time (smaller increments means random values will be closer together)
  timeValue += 0.005;
  
  // Get noise values for x and y positions
  noiseValueX = noise(timeValue);
  println("noiseX " + noiseValueX);
  noiseValueY = noise(timeValue + yOffset);
  println("noiseY " + noiseValueY);
  
  // Convert noise values to integer x, y positions
  x = int(map(noiseValueX, 0, 1, 0, width));
  println("X " + x);
  y = int(map(noiseValueY, 0, 1, 0, height));
  println("Y " + y);
  
  // Draw a black point at this location 
  point(x, y);
  
}
