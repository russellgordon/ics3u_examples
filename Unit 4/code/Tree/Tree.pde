boolean debug = false;
float rBase = 0;      // Rotation value for base of tree (tied to mouseX)
float rBranchMax = 0;    // Rotation value for branches (compared to base) (tied to mouseY)
PFont font;

// this runs once
void setup() {

  // create canvas
  size(800, 800);

  // use HSB colour model
  colorMode(HSB, 360, 100, 100);

  // tan background
  background(43, 35, 95);

  // dark green branches
  stroke(110, 84, 25);

  // smooth lines
  smooth();

  // move to middle of screen, make tree face up
  translate(width/2, height);
  rotate(radians(-90));

  // size for onscreen text
  textSize(24);
}

// this runs repeatedly
void draw() {

  // Tie the initation rotation value of the base of the
  // plant to the horizontal position of the mouse
  // See: http://www.processing.org/reference/map_.html
  rBase = map(mouseX, 0, width, -25, 25);

  // Tie the rotation value ceiling for branches to the vertical position of the mouse
  rBranchMax = map(mouseY, 0, height, 0, 50);
}

// runs when a key is pressed
void keyPressed() {

  if (key == 'd') {
    if (debug == false) {
      debug = true;
    }
    else {
      debug = false;
    }
    println(debug);
  }
  else { 

    // clear old drawing with a rectangle drawn on top of canvas
    if (debug == true) {
      fill(0, 0, 100);
    } 
    else {
      fill(43, 35, 95);  // tan background
    }
    noStroke();   
    rect(-1, -1, width+1, height+1);

    // Show values for rotation parameters, if debug mode is enabled.
    if (debug == true) {
      fill(0, 0, 0); // black text
      text("Base rotation: " + rBase, (width/10)*0.5, (height/10)*9); // Show text in lower left corner
      text("Branch range between: 0 and " + rBranchMax, (width/10)*0.5, (height/10)*9.5); // Show text in lower left corner
    }

    // draw new tree with green branches
    translate(width/2, height);
    rotate(radians(-90));
    stroke(110, 84, 25);
    drawBranch(100, 3, 0, 0 + rBranchMax, rBase, 10);
  }
}


// drawBranch
//
// Purpose: Draws a "Y" shape to start a tree branch
//
// Parameters:    baseLength    Length of base of the Y
//                branches      Number of branches per base line
//                min           Min value for rotation range of branches (degrees)
//                max           Max value for rotation range of branches (degrees)
//                rotation      Initial rotation value for base of image
//                stroke        Thickness of branches
void drawBranch(float baseLength, int branches, float min, float max, float rotation, float stroke) {

  // need something to track new width of branches
  float newStroke = stroke;
  
  // track random factor for branch length reductions
  float randomFactor = 0;

  /* 
   * 1. BASE OF Y...
   */
  
  // First, pick some amount of clockwise rotation
  rotate(radians(rotation));
  
  // Next, draw a line
  if (debug == true) {
    stroke(240, 80, 90);  // draw base in blue - DEBUG
  }
  strokeWeight(stroke);
  line(0, 0, baseLength, 0);

  /* 
   * LOOP FOR BRANCHES THAT WILL 'GROW' FROM THIS BRANCH
   */
  for (int i = 0; i < branches; i++) {

    // Move origin down branch a bit...
    // Left and right branches will draw from this point...
    translate(baseLength/branches, 0);


    /* 
     * LEFT BRANCH
     */
    // Save current rotation settings
    pushMatrix();
    
    // Pick some amount of counter-clockwise rotation
    rotate(radians(random(-1*max, -1*min)));
    
    // Next, draw a shorter and thinner line
    randomFactor = random(0.8, 1);
    float leftLength = baseLength*randomFactor;
    if (debug == true) {
      stroke(0, 80, 90); // draw left branch in red - DEBUG
    }
    newStroke = stroke*randomFactor*randomFactor*randomFactor*randomFactor*randomFactor;
    strokeWeight(newStroke); // thickness for this branch
    line(0, 0, leftLength, 0); // draw the branch
    
    // Translate down to end of branch, and recurse
    translate(leftLength, 0);
    if (leftLength > 70) {  // exit condition
      drawBranch(leftLength*random(0.9, 1), 1, min, max, rotation, newStroke);
    }

    // Restore old rotation settings
    popMatrix();


    /* 
     * RIGHT BRANCH
     */
    // Save current rotation settings
    pushMatrix();
    
    // Pick some amount of clockwise rotation
    rotate(radians(random(min, max)));
    
    // Next, draw a shorter and thinner line
    randomFactor = random(0.8, 1);
    float rightLength = baseLength*randomFactor;
    if (debug == true) {
      stroke(120, 80, 50); // draw left branch in green - DEBUG
    }
    newStroke = stroke*randomFactor*randomFactor*randomFactor*randomFactor*randomFactor;
    strokeWeight(newStroke); // thickness for this branch
    line(0, 0, rightLength, 0);  // draw the branch
    
    // Translate down to end of branch, and recurse
    translate(rightLength, 0);
    if (rightLength > 70) {  // exit condition
      drawBranch(rightLength*random(0.9, 1), 1, min, max, rotation, newStroke);
    }
    
    // Restore old rotation settings
    popMatrix();
  }
}
