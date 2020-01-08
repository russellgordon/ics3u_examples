// Variables to control size of tree
int initialDepth = 0;
float initialWidth = 0;
float initialLength = 0;

// Variables to control movement through Perlin noise space
float xOffset = 0.0;
float yOffset = 0.0;
float zOffset = 0.0;
float xIncrement = 0.003;  // Will serve as movement through time (along each row)
float yIncrement = 0.02;  // Each angle assigned to a branch outgrowth will get it's own row in Perlin space
float zIncrement = 0.02;  // Will be used to control branch length & width (move along z axis in Perlin noise space)

// Color variables
color brown;
color skyBlue;
color red;
color green;
color blue;
color black;
color white;

// Whether to run in debug mode
boolean debug = false;

// Whether to draw clouds
boolean clouds = false;

// Variables to control appearance of clouds
float cloudIncrement = 0.005;
float cloudTimeIncrement = 0.008;
float cloudTimeOffset = 0;

void setup() {

  // canvas
  size(600, 600);

  // Use HSB color model
  colorMode(HSB, 360, 100, 100, 100);

  // Set up colors
  brown = color(41, 75, 53);
  red = color(0, 80, 90);
  green = color(120, 80, 90);
  blue = color(240, 80, 90);
  black = color(0, 0, 0);
  white = color(0, 0, 100);

  // white background
  background(white);

  // Set initial length of trunk
  initialLength = height/7;

  // Set initial width of branches
  initialWidth = map(width, 400, 800, 37, 75);

  // Set depth
  initialDepth = 10;
}

// This runs forever
void draw() {

  /*
   * Draw the clouds
   */
  drawClouds();

  /*
   * Draw the tree
   */
  noiseDetail(4, 0.5);
  xOffset += xIncrement;
  yOffset = 0;
  zOffset = 0;
  startTree(initialDepth, initialWidth, initialLength);
}

// drawClouds
//
// Purpose: Draws a cloudy sky background.
void drawClouds() {

  if (clouds) {
    // Manipulate pixels of canvas directly 
    loadPixels();

    // Used to make clouds "move" 
    cloudTimeOffset += cloudTimeIncrement;

    // Use mouse to pick a patch of X-axis that creates pleasing clouds
    float cloudXOffset = mouseX;

    // Adjust the level of detail based on the vertical position of the mouse
    float detail = map(mouseY, 0, height, 0.1, 0.6);
    noiseDetail(8, detail);

    // For every x,y coordinate on the canvas, calculate a noise value
    // and produce pixel that ranges between vibrant blue and white
    for (int x = 0; x < width; x++) {

      cloudXOffset += cloudIncrement;   // Increment xoff with each additional column 
      float cloudYOffset = 0.0;   // For every xoff, start yoff at 0 (OHH.. this is the KEY to a cloud like pattern.. stay in SAME PATCH of space on Y-axis as we move along X-axis in Perlin noise space)

      // Paint the pixels in this column of the canvas
      for (int y = 0; y < height; y++) {

        cloudYOffset += cloudIncrement; // Increment yoff

        // Calculate noise and scale by 100 to find a saturation value
        float saturation = noise(cloudXOffset, cloudYOffset, cloudTimeOffset) * 100;

        // Actually set the colour of the pixels on the screen
        pixels[y*width+x] = color(199, saturation, 90);
      }
    }

    // Now that we have set all the pixels, show the result on screen.
    updatePixels();
  }
}

// drawTree
//
// Purpose: Draws a tree with a certain number of levels of recursion
//
// Parameters:     depth          How many levels to recurse
//                 branchWidth    How thick to draw branches 
//                 branchLength   How long to draw branches
void drawTree(int depth, float branchWidth, float branchLength) {


  // Exit condition for recursion
  if (depth > 0) {
    // base - 100 pixels long
    if (debug) {
      stroke(blue);
    } 
    else {
      stroke(brown);
    }
    strokeWeight(branchWidth);
    zOffset += zIncrement;
    float baseLength = map(noise(0, 0, zOffset), 0, 1, branchLength*0.95 - (branchLength*0.95/9)*5, branchLength*0.95 + (branchLength*0.95/9)*5); 
    line(0, 0, baseLength, 0);

    // move to end of base to draw branches
    translate(baseLength, 0);

    // draw left branch
    zOffset += zIncrement;
    if (noise(2, 0, zOffset*10) > 0.05*(initialDepth-depth)) {
      pushMatrix();
      yOffset += yIncrement;
      float leftNoiseValue = noise(xOffset, yOffset);
      rotate(radians(map(leftNoiseValue, 0, 1, -25, -15)));
      if (debug) {
        stroke(red);
      } 
      else {
        stroke(brown);
      }
      float leftBranchLength = map(noise(0, 0, zOffset), 0, 1, branchLength*0.9 - (branchLength*0.9/16), branchLength*0.9 + (branchLength*0.9/16));
      strokeWeight(branchWidth*map(noise(1, 0, zOffset), 0, 1, 0.618, 1));
      line(0, 0, leftBranchLength, 0); // draw branch
      translate(leftBranchLength, 0); // translate to end before drawing next Y
      drawTree(depth-1, branchWidth*.618, leftBranchLength);
      popMatrix();
    }

    // draw right branch
    zOffset += zIncrement;
    if (noise(2, 0, zOffset*10) > 0.05*(initialDepth-depth)) {
      pushMatrix();
      yOffset += yIncrement;
      float rightNoiseValue = noise(xOffset, yOffset);
      rotate(radians(map(rightNoiseValue, 0, 1, 15, 25)));
      if (debug) {
        stroke(green);
      } 
      else {
        stroke(brown);
      }
      zOffset += zIncrement;
      float rightBranchLength = map(noise(0, 0, zOffset), 0, 1, branchLength*0.9 - (branchLength*0.9/16), branchLength*0.9 + (branchLength*0.9/16));
      strokeWeight(branchWidth*map(noise(1, 0, zOffset), 0, 1, 0.618, 1));
      line(0, 0, rightBranchLength, 0); // draw branch
      translate(rightBranchLength, 0); // translate to end before drawing next Y
      drawTree(depth-1, branchWidth*.618, rightBranchLength);
      popMatrix();
    }
  }
}

// startTree
// Purpose: Refresh the screen and start a new tree
//
// Parameters:     depth          How many levels to recurse
//                 branchWidth    How wide the trunk should be (basis for thickness of remaining branches)
//                 initialLength  How long the trunk should be (basis for length of remaining branches)
void startTree(int depth, float branchWidth, float initialLength) {

  // paint a white rectangle to cover up old tree
  if (!clouds) {
    background(white);
  }

  // origin to middle of bottom of window
  translate(width/2, height);

  //scale(0.75, 0.75);

  // draw tree starting upright
  yOffset += yIncrement;
  float trunkNoiseValue = noise(xOffset, yOffset);
  rotate(radians(map(trunkNoiseValue, 0, 1, -95, -85)));

  // thicker branches
  strokeWeight(branchWidth);

  // trunk
  if (debug) {
    stroke(0, 0, 0); // black
  } 
  else {
    stroke(brown);
  }

  // Draw the trunk
  line(0, 0, initialLength, 0);

  // Translate to end of trunk
  translate(initialLength, 0);

  // start tree off...
  zOffset += zIncrement;
  drawTree(depth, branchWidth, map(noise(0, 0, zOffset), 0, 1, initialLength/3*2 - (initialLength/3*2)/2, initialLength/3*2 - (initialLength/3*2)/2));
}

// Responds to key presses
void keyPressed() {

  // Toggle debug mode
  if (key == 'd') {
    if (debug) {
      debug = false;
    } 
    else {
      debug = true;
    }
  }

  // Toggle drawing clouds
  if (key == 'c') {
    if (clouds) {
      clouds = false;
    } 
    else {
      clouds = true;
    }
  }

  // Save current frame
  if (key == 's') {
    saveFrame("output-########.png");
  }
}
