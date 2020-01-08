// global variables
int x, y;      // will be used to pick random location on the canvas
float t;       // will be used to pick degree of transparency for blue clouds
float timeValue;  // for moving through time with the Perlin noise
float yOffset;       // offset for y values obtained through Perlin noise
float tOffset;       // offset for transparency values obtained through Perlin noise
float noiseValueX, noiseValueY, noiseValueT;  // keeps the noise values returned by Perlin noise generator

// this runs one
void setup() {
  
  // Small canvas to start
  size(400, 400);
  
  // Use HSB color model
  colorMode(HSB, 360, 100, 100, 100);
  
  // Set black stroke for points to be drawn
  fill(0, 0, 100);
  
  // background is blue
  background(220, 50, 80);
  
  // Faster animation
  frameRate(500);
  
  // Initial starting point for yOffset in Perlin noise space
  // Makes sure values returned by Perlin noise generator are distinct for x and y.
  yOffset = random(100, 150); 

  // Initial starting point for tOffset in Perlin noise space
  tOffset = random(500, 750); 
  
}

// this runs repeatedly
void draw() {
  
  // Increase point in time (smaller increments means random values will be closer together)
  timeValue += 0.005;
  
  // Get noise values for x and y positions
  noiseValueX = noise(timeValue);
  //println("noiseX " + noiseValueX);
  noiseValueY = noise(timeValue + yOffset);
  //println("noiseY " + noiseValueY);

  // Get noise values for blue transparency
  noiseValueT = noise(timeValue + tOffset);
  //println("noiseT " + noiseValueT);
  
  // Convert noise values to integer x, y positions
  x = int(map(noiseValueX, 0, 1, -1*width/4, width + width/4));
  //println("X " + x);
  y = int(map(noiseValueY, 0, 1, -1*height/4, height + height/4));
  //println("Y " + y);
  
  // Convert noise values to transparency value between 0 and 100%
  t = int(map(noiseValueT, 0, 1, 0, 30));
  //println("T " + t);
  
  // Draw a blue point at this location
  stroke(0, 0, 100, t); 
  point(x, y);
  
  // Every 10,000 iteration, save a snapshot
  if (frameCount % 10000 == 0) {
    saveFrame("clouds-#########.png"); 
  }
  
}
