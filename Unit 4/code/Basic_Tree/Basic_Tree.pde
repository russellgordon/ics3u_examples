void setup() {

  // canvas
  size(800, 800);
  
  // white background
  background(255, 255, 255);

  // start tree off...
  startTree();
}

// drawTree
// Purpose: Draws a tree with a certain number of levels of recursion
//
// Parameters:     depth          How many levels to recurse
void drawTree(int depth) {

  // Exit condition for recursion
  if (depth > 0) {
    // base - 100 pixels long
    stroke(0, 0, 255); // blue
    line(0, 0, 100, 0);

    // move to end of base to draw branches
    translate(100, 0);

    // draw left branch
    pushMatrix();
    rotate(radians(-30));
    stroke(255, 0, 0); // red
    line(0, 0, 100, 0); // draw branch
    translate(100, 0); // translate to end before drawing next Y
    drawTree(depth-1);
    popMatrix();

    // draw right branch
    pushMatrix();
    rotate(radians(30));
    stroke(0, 255, 0); // green
    line(0, 0, 100, 0); // draw branch
    translate(100, 0); // translate to end before drawing next Y
    drawTree(depth-1);
    popMatrix();
  }
}

void draw() {
  
}

// startTree
// Purpose: Refresh the screen and start a new tree
//
// Parameters:    none
void startTree() {

  // paint a white rectangle to cover up old tree
  fill(255, 255, 255);
  noStroke();
  rect(0, 0, width, height);

  // origin to middle of bottom of window
  translate(width/2, height);

  // draw tree starting upright
  rotate(radians(-90));

  // thicker branches
  strokeWeight(5);

  // start tree off...
  drawTree(3);
}

// Responds to key presses
void keyPressed() {

  // Refresh screen
  if (key == 'r') {
    startTree();
  }
  
  if (key == 's') {
    // Save current frame to disk
    saveFrame("output-####.png");
  }
  
}
